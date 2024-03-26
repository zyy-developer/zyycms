package com.zyy.system.service.impl;

import java.util.List;
import java.util.Objects;

import cn.hutool.core.lang.Assert;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.zyy.common.core.domain.entity.SysUser;
import com.zyy.common.core.redis.RedisCache;
import com.zyy.common.utils.DateUtils;
import com.zyy.common.utils.StringUtils;
import com.zyy.system.fixed.dict.PasswordRule;
import com.zyy.system.fixed.dict.PasswordSensitive;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyy.system.mapper.SysSecurityConfigMapper;
import com.zyy.system.domain.SysSecurityConfig;
import com.zyy.system.service.ISysSecurityConfigService;
import org.springframework.transaction.annotation.Transactional;

/**
 * 安全配置Service业务层处理
 *
 * @author hnzyy
 * @date 2023-12-13
 */
@Service
public class SysSecurityConfigServiceImpl implements ISysSecurityConfigService
{
    @Autowired
    private SysSecurityConfigMapper sysSecurityConfigMapper;

    @Autowired
    private RedisCache redisCache;

    private final static String CACHE_KEY_CONFIG = "sys:security:config";

    /**
     * 查询安全配置
     *
     * @param id 安全配置主键
     * @return 安全配置
     */
    @Override
    public SysSecurityConfig selectSysSecurityConfigById(Long id)
    {
        SysSecurityConfig config = sysSecurityConfigMapper.selectSysSecurityConfigById(id);
        String[] strings = JSON.parseObject(config.getPasswordSensitive(), new TypeReference<String[]>() {
        });
        config.setPasswordSensitiveList(strings);
        return config;
    }

    /**
     * 查询安全配置列表
     *
     * @param sysSecurityConfig 安全配置
     * @return 安全配置
     */
    @Override
    public List<SysSecurityConfig> selectSysSecurityConfigList(SysSecurityConfig sysSecurityConfig)
    {
        return sysSecurityConfigMapper.selectSysSecurityConfigList(sysSecurityConfig);
    }

    /**
     * 新增安全配置
     *
     * @param sysSecurityConfig 安全配置
     * @return 结果
     */
    @Override
    public int insertSysSecurityConfig(SysSecurityConfig sysSecurityConfig)
    {
        sysSecurityConfig.setPasswordSensitive(JSON.toJSONString(sysSecurityConfig.getPasswordSensitiveList()));
        sysSecurityConfig.setCreateTime(DateUtils.getNowDate());
        return sysSecurityConfigMapper.insertSysSecurityConfig(sysSecurityConfig);
    }

    /**
     * 修改安全配置
     *
     * @param sysSecurityConfig 安全配置
     * @return 结果
     */
    @Override
    public int updateSysSecurityConfig(SysSecurityConfig sysSecurityConfig)
    {
        sysSecurityConfig.setUpdateTime(DateUtils.getNowDate());
        return sysSecurityConfigMapper.updateSysSecurityConfig(sysSecurityConfig);
    }

    @Override
    @Transactional
    public int updateSysSecurityStage(Long id) {
        SysSecurityConfig config = sysSecurityConfigMapper.selectSysSecurityConfigById(id);
        if(config!=null) {
            sysSecurityConfigMapper.updateSysSecurityStage();
            if (config.getStage().equals("1")) {
                SysSecurityConfig securityConfig = new SysSecurityConfig();
                securityConfig.setStage("0");
                securityConfig.setId(id);
                sysSecurityConfigMapper.updateSysSecurityConfig(securityConfig);
            }
        }
        return 1;
    }

    /**
     * 批量删除安全配置
     *
     * @param ids 需要删除的安全配置主键
     * @return 结果
     */
    @Override
    public int deleteSysSecurityConfigByIds(Long[] ids)
    {
        return sysSecurityConfigMapper.deleteSysSecurityConfigByIds(ids);
    }

    /**
     * 删除安全配置信息
     *
     * @param id 安全配置主键
     * @return 结果
     */
    @Override
    public int deleteSysSecurityConfigById(Long id)
    {
        return sysSecurityConfigMapper.deleteSysSecurityConfigById(id);
    }

    @Override
    public void validPassword(SysUser user) {
        SysSecurityConfig securityConfig = this.getSecurityConfig();
        if (Objects.nonNull(securityConfig) && securityConfig.getStage().equals("0")) {
            // 最大长度
            boolean valid = securityConfig.getPasswordLenMax() > 0
                    && user.getPassword().length() <= securityConfig.getPasswordLenMax();
            Assert.isTrue(valid, "密码不符合安全校验规则");
            // 最小长度
            valid = securityConfig.getPasswordLenMin() > 0 && user.getPassword().length() >= securityConfig.getPasswordLenMin();
            Assert.isTrue(valid, "密码不符合安全校验规则");
            // 校验规则检查
            valid = PasswordRule.match(securityConfig.getPasswordRule(), user.getPassword());
            Assert.isTrue(valid, "密码不符合安全校验规则");
            // 敏感字符检查
            valid = PasswordSensitive.check(securityConfig.getPasswordSensitiveList(), user.getPassword(), user);
            Assert.isTrue(valid, "密码不符合安全校验规则");
            // 弱密码检查
            String[] weakPasswords = securityConfig.getWeakPasswords().split("\n");
            valid = StringUtils.isEmpty(weakPasswords) || !StringUtils.equalsAny(user.getPassword(), weakPasswords);
            Assert.isTrue(valid, "密码不符合安全校验规则");
        }
    }

    @Override
    public SysSecurityConfig getSecurityConfig() {
        SysSecurityConfig config = redisCache.getCacheObject(CACHE_KEY_CONFIG);
        if (Objects.isNull(config)) {
            config = sysSecurityConfigMapper.selectSysSecurityConfigByStage();
            if (Objects.nonNull(config)) {
                this.redisCache.setCacheObject(CACHE_KEY_CONFIG, config);
            }
        }
        return config;
    }
}
