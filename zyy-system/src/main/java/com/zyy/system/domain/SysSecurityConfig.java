package com.zyy.system.domain;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.zyy.common.annotation.Excel;
import com.zyy.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.apache.ibatis.type.BaseTypeHandler;

/**
 * 安全配置对象 sys_security_config
 *
 * @author hnzyy
 * @date 2023-12-13
 */
public class SysSecurityConfig extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 状态 */
    @Excel(name = "状态")
    private String stage;

    /** 密码最小长度 */
    @Excel(name = "密码最小长度")
    private Long passwordLenMin;

    /** 密码最大长度 */
    @Excel(name = "密码最大长度")
    private Long passwordLenMax;

    /** 密码校验规则 */
    @Excel(name = "密码校验规则")
    private String passwordRule;

    /** 密码不可包含的敏感信息 */
    private String[] passwordSensitiveList;

    /** 密码不可包含的敏感信息 */
    @Excel(name = "密码不可包含的敏感信息")
    private String passwordSensitive;

    /** 弱密码集合 */
    @Excel(name = "弱密码集合")
    private String weakPasswords;

    /** 后台添加的用户首次登陆是否需要强制修改密码 */
    @Excel(name = "后台添加的用户首次登陆是否需要强制修改密码")
    private String forceModifyPwdAfterAdd;

    /** 后台重置密码后首次登陆是否需要强制修改密码 */
    @Excel(name = "后台重置密码后首次登陆是否需要强制修改密码")
    private String forceModifyPwdAfterReset;

    /** 密码有效期（单位：秒） */
    @Excel(name = "密码有效期", readConverterExp = "单=位：秒")
    private Long passwordExpireSeconds;

    /** 密码错误次数阈值 */
    @Excel(name = "密码错误次数阈值")
    private Long passwordRetryLimit;

    /** 密码错误次数阈值触发后的处理策略 */
    @Excel(name = "密码错误次数阈值触发后的处理策略")
    private String passwordRetryStrategy;

    /** 密码错误阈值触发锁定账号时长，单位：秒 */
    @Excel(name = "密码错误阈值触发锁定账号时长，单位：秒")
    private Long passwordRetryLockSeconds;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setStage(String stage)
    {
        this.stage = stage;
    }

    public String getStage()
    {
        return stage;
    }
    public void setPasswordLenMin(Long passwordLenMin)
    {
        this.passwordLenMin = passwordLenMin;
    }

    public Long getPasswordLenMin()
    {
        return passwordLenMin;
    }
    public void setPasswordLenMax(Long passwordLenMax)
    {
        this.passwordLenMax = passwordLenMax;
    }

    public Long getPasswordLenMax()
    {
        return passwordLenMax;
    }
    public void setPasswordRule(String passwordRule)
    {
        this.passwordRule = passwordRule;
    }

    public String getPasswordRule()
    {
        return passwordRule;
    }

    public String[] getPasswordSensitiveList() {
        return passwordSensitiveList;
    }

    public void setPasswordSensitiveList(String[] passwordSensitiveList) {
        this.passwordSensitiveList = passwordSensitiveList;
    }

    public void setPasswordSensitive(String passwordSensitive)
    {
        this.passwordSensitive = passwordSensitive;
    }

    public String getPasswordSensitive()
    {
        return passwordSensitive;
    }
    public void setWeakPasswords(String weakPasswords)
    {
        this.weakPasswords = weakPasswords;
    }

    public String getWeakPasswords()
    {
        return weakPasswords;
    }
    public void setForceModifyPwdAfterAdd(String forceModifyPwdAfterAdd)
    {
        this.forceModifyPwdAfterAdd = forceModifyPwdAfterAdd;
    }

    public String getForceModifyPwdAfterAdd()
    {
        return forceModifyPwdAfterAdd;
    }
    public void setForceModifyPwdAfterReset(String forceModifyPwdAfterReset)
    {
        this.forceModifyPwdAfterReset = forceModifyPwdAfterReset;
    }

    public String getForceModifyPwdAfterReset()
    {
        return forceModifyPwdAfterReset;
    }
    public void setPasswordExpireSeconds(Long passwordExpireSeconds)
    {
        this.passwordExpireSeconds = passwordExpireSeconds;
    }

    public Long getPasswordExpireSeconds()
    {
        return passwordExpireSeconds;
    }
    public void setPasswordRetryLimit(Long passwordRetryLimit)
    {
        this.passwordRetryLimit = passwordRetryLimit;
    }

    public Long getPasswordRetryLimit()
    {
        return passwordRetryLimit;
    }
    public void setPasswordRetryStrategy(String passwordRetryStrategy)
    {
        this.passwordRetryStrategy = passwordRetryStrategy;
    }

    public String getPasswordRetryStrategy()
    {
        return passwordRetryStrategy;
    }
    public void setPasswordRetryLockSeconds(Long passwordRetryLockSeconds)
    {
        this.passwordRetryLockSeconds = passwordRetryLockSeconds;
    }

    public Long getPasswordRetryLockSeconds()
    {
        return passwordRetryLockSeconds;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("stage", getStage())
            .append("passwordLenMin", getPasswordLenMin())
            .append("passwordLenMax", getPasswordLenMax())
            .append("passwordRule", getPasswordRule())
            .append("passwordSensitive", getPasswordSensitive())
            .append("weakPasswords", getWeakPasswords())
            .append("forceModifyPwdAfterAdd", getForceModifyPwdAfterAdd())
            .append("forceModifyPwdAfterReset", getForceModifyPwdAfterReset())
            .append("passwordExpireSeconds", getPasswordExpireSeconds())
            .append("passwordRetryLimit", getPasswordRetryLimit())
            .append("passwordRetryStrategy", getPasswordRetryStrategy())
            .append("passwordRetryLockSeconds", getPasswordRetryLockSeconds())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
