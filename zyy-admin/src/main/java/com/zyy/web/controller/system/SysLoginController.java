package com.zyy.web.controller.system;

import java.util.List;
import java.util.Set;

import com.zyy.common.core.domain.model.LoginUser;
import com.zyy.framework.web.service.TokenService;
import com.zyy.system.service.ISysRoleCmsService;
import com.zyy.system.service.ISysUserService;
import com.zyy.web.service.ICmsSiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.zyy.common.constant.Constants;
import com.zyy.common.core.domain.AjaxResult;
import com.zyy.common.core.domain.entity.SysMenu;
import com.zyy.common.core.domain.entity.SysUser;
import com.zyy.common.core.domain.model.LoginBody;
import com.zyy.common.utils.SecurityUtils;
import com.zyy.framework.web.service.SysLoginService;
import com.zyy.framework.web.service.SysPermissionService;
import com.zyy.system.service.ISysMenuService;

import javax.servlet.http.HttpServletRequest;

import static com.zyy.common.core.domain.AjaxResult.success;

/**
 * 登录验证
 *
 * @author hnzyy
 */
@RestController
public class SysLoginController
{
    @Autowired
    private SysLoginService loginService;

    @Autowired
    private ISysMenuService menuService;

    @Autowired
    private SysPermissionService permissionService;

    @Autowired
    private ICmsSiteService siteService;

    @Autowired
    private TokenService tokenService;

    @Autowired
    private ISysRoleCmsService cmsService;

    @Autowired
    private ISysUserService userService;

    /**
     * 登录方法
     *
     * @param loginBody 登录信息
     * @return 结果
     */
    @PostMapping("/login")
    public AjaxResult login(@RequestBody LoginBody loginBody)
    {
//        AjaxResult ajax = success();
        // 生成令牌
        AjaxResult token = loginService.login(loginBody.getUsername(), loginBody.getPassword(), loginBody.getCode(),
                loginBody.getUuid());
//        ajax.put(Constants.TOKEN, token);

        return token;
    }

    /**
     * 切换站点
     * @return
     */
    @PostMapping("/toSite/{siteId}")
    public AjaxResult toSite(@PathVariable("siteId") Long siteId, HttpServletRequest request){
        LoginUser principal = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        principal.setSiteId(siteId);
        AjaxResult ajax = success();
        String token = tokenService.createToken(principal);
        ajax.put(Constants.TOKEN, token);
        ajax.put("siteId",siteId);
        return ajax;
    }


    /**
     * 获取用户信息
     *
     * @return 用户信息
     */
    @GetMapping("getInfo")
    public AjaxResult getInfo()
    {
        SysUser user = SecurityUtils.getLoginUser().getUser();
        // 角色集合
        Set<String> roles = permissionService.getRolePermission(user);
        // 权限集合
        Set<String> permissions = permissionService.getMenuPermission(user);
        AjaxResult ajax = success();
        ajax.put("user", user);
        ajax.put("roles", roles);
        ajax.put("permissions", permissions);
        return ajax;
    }

    /**
     * 获取路由信息
     *
     * @return 路由信息
     */
    @GetMapping("getRouters")
    public AjaxResult getRouters()
    {
        Long userId = SecurityUtils.getUserId();
        List<SysMenu> menus = menuService.selectMenuTreeByUserId(userId);
        return success(menuService.buildMenus(menus));
    }
}
