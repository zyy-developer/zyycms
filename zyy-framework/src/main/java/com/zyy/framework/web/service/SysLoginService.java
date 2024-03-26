package com.zyy.framework.web.service;

import javax.annotation.Resource;

import com.zyy.common.core.domain.AjaxResult;
import com.zyy.common.decryptor.RsaUtils;
import com.zyy.web.domain.CmsSite;
import com.zyy.web.service.ICmsSiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;
import com.zyy.common.constant.CacheConstants;
import com.zyy.common.constant.Constants;
import com.zyy.common.constant.UserConstants;
import com.zyy.common.core.domain.entity.SysUser;
import com.zyy.common.core.domain.model.LoginUser;
import com.zyy.common.core.redis.RedisCache;
import com.zyy.common.exception.ServiceException;
import com.zyy.common.exception.user.BlackListException;
import com.zyy.common.exception.user.CaptchaException;
import com.zyy.common.exception.user.CaptchaExpireException;
import com.zyy.common.exception.user.UserNotExistsException;
import com.zyy.common.exception.user.UserPasswordNotMatchException;
import com.zyy.common.utils.DateUtils;
import com.zyy.common.utils.MessageUtils;
import com.zyy.common.utils.StringUtils;
import com.zyy.common.utils.ip.IpUtils;
import com.zyy.framework.manager.AsyncManager;
import com.zyy.framework.manager.factory.AsyncFactory;
import com.zyy.framework.security.context.AuthenticationContextHolder;
import com.zyy.system.service.ISysConfigService;
import com.zyy.system.service.ISysUserService;

import java.util.List;
import java.util.Set;

import static com.zyy.common.core.domain.AjaxResult.success;

/**
 * 登录校验方法
 *
 * @author hnzyy
 */
@Component
public class SysLoginService
{
    @Autowired
    private TokenService tokenService;

    @Resource
    private AuthenticationManager authenticationManager;

    @Autowired
    private RedisCache redisCache;

    @Autowired
    private ISysUserService userService;

    @Autowired
    private ISysConfigService configService;

    @Autowired
    private SysPermissionService permissionService;

    @Autowired
    private ICmsSiteService siteService;

    /**
     * 登录验证
     *
     * @param username 用户名
     * @param password 密码
     * @param code 验证码
     * @param uuid 唯一标识
     * @return 结果
     */
    public AjaxResult login(String username, String password, String code, String uuid)
    {
        // 验证码校验
        validateCaptcha(username, code, uuid);
        String pass = null;
        try {
            pass = RsaUtils.decryptByPrivateKey(password);
        } catch (Exception exception) {
            exception.printStackTrace();
        }
        // 登录前置校验
        loginPreCheck(username, pass);
        // 用户验证
        Authentication authentication = null;
        try
        {
            UsernamePasswordAuthenticationToken authenticationToken = new UsernamePasswordAuthenticationToken(username, pass);
            AuthenticationContextHolder.setContext(authenticationToken);
            // 该方法会去调用UserDetailsServiceImpl.loadUserByUsername
            authentication = authenticationManager.authenticate(authenticationToken);
        }
        catch (Exception e)
        {
            if (e instanceof BadCredentialsException)
            {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.password.not.match")));
                throw new UserPasswordNotMatchException();
            }
            else
            {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, e.getMessage()));
                throw new ServiceException(e.getMessage());
            }
        }
        finally
        {
            AuthenticationContextHolder.clearContext();
        }
        AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_SUCCESS, MessageUtils.message("user.login.success")));
        LoginUser loginUser = (LoginUser) authentication.getPrincipal();

        //获取站点列表
        SysUser sysUser = userService.selectUserByUserName(loginUser.getUsername());
        Set<Object> permissions =  permissionService.getCmsSitePermission(sysUser);
        List<CmsSite> sites = null;
        if(permissions.contains("**")){
            sites = siteService.selectCmsSiteList(new CmsSite());
        }else{
            sites = siteService.selectCmsSiteListSet(permissions);
        }
        loginUser.setSitePermissions(permissions);
        loginUser.setSiteId(sites.get(0).getId());
        recordLoginInfo(loginUser.getUserId());
        // 生成token
        String token = tokenService.createToken(loginUser);
        AjaxResult ajax = success();
        ajax.put(Constants.TOKEN, token);
        ajax.put("siteList",sites);
        ajax.put("siteId",sites.get(0).getId());
        return ajax;
    }

    /**
     * 校验验证码
     *
     * @param username 用户名
     * @param code 验证码
     * @param uuid 唯一标识
     * @return 结果
     */
    public void validateCaptcha(String username, String code, String uuid)
    {
        boolean captchaEnabled = configService.selectCaptchaEnabled();
        if (captchaEnabled)
        {
            String verifyKey = CacheConstants.CAPTCHA_CODE_KEY + StringUtils.nvl(uuid, "");
            String captcha = redisCache.getCacheObject(verifyKey);
            redisCache.deleteObject(verifyKey);
            if (captcha == null)
            {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.jcaptcha.expire")));
                throw new CaptchaExpireException();
            }
            if (!code.equalsIgnoreCase(captcha))
            {
                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.jcaptcha.error")));
                throw new CaptchaException();
            }
        }
    }

    /**
     * 登录前置校验
     * @param username 用户名
     * @param password 用户密码
     */
    public void loginPreCheck(String username, String password)
    {
        // 用户名或密码为空 错误
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password))
        {
            AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("not.null")));
            throw new UserNotExistsException();
        }
        // 密码如果不在指定范围内 错误
        if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
                || password.length() > UserConstants.PASSWORD_MAX_LENGTH)
        {
            AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.password.not.match")));
            throw new UserPasswordNotMatchException();
        }
        // 用户名不在指定范围内 错误
        if (username.length() < UserConstants.USERNAME_MIN_LENGTH
                || username.length() > UserConstants.USERNAME_MAX_LENGTH)
        {
            AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.password.not.match")));
            throw new UserPasswordNotMatchException();
        }
        // IP黑名单校验
        String blackStr = configService.selectConfigByKey("sys.login.blackIPList");
        if (IpUtils.isMatchedIp(blackStr, IpUtils.getIpAddr()))
        {
            AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("login.blocked")));
            throw new BlackListException();
        }
    }

    /**
     * 记录登录信息
     *
     * @param userId 用户ID
     */
    public void recordLoginInfo(Long userId)
    {
        SysUser sysUser = new SysUser();
        sysUser.setUserId(userId);
        sysUser.setLoginIp(IpUtils.getIpAddr());
        sysUser.setLoginDate(DateUtils.getNowDate());
        userService.updateUserProfile(sysUser);
    }
}
