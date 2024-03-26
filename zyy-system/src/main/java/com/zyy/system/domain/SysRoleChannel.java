package com.zyy.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.zyy.common.annotation.Excel;
import com.zyy.common.core.domain.BaseEntity;

/**
 * 角色栏目权限对象 sys_role_channel
 *
 * @author hnzyy
 * @date 2023-07-10
 */
public class SysRoleChannel extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 角色id */
    @Excel(name = "角色id")
    private Long roleId;

    /** 栏目id */
    @Excel(name = "栏目id")
    private Long channelId;

    public void setRoleId(Long roleId)
    {
        this.roleId = roleId;
    }

    public Long getRoleId()
    {
        return roleId;
    }
    public void setChannelId(Long channelId)
    {
        this.channelId = channelId;
    }

    public Long getChannelId()
    {
        return channelId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("roleId", getRoleId())
            .append("channelId", getChannelId())
            .toString();
    }
}
