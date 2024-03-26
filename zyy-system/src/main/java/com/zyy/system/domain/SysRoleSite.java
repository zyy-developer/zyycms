package com.zyy.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.zyy.common.annotation.Excel;
import com.zyy.common.core.domain.BaseEntity;

/**
 * 角色站点权限对象 sys_role_site
 *
 * @author hnzyy
 * @date 2023-07-10
 */
public class SysRoleSite extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 角色id */
    @Excel(name = "角色id")
    private Long roleId;

    /** 站点id */
    @Excel(name = "站点id")
    private Long siteId;

    public void setRoleId(Long roleId)
    {
        this.roleId = roleId;
    }

    public Long getRoleId()
    {
        return roleId;
    }
    public void setSiteId(Long siteId)
    {
        this.siteId = siteId;
    }

    public Long getSiteId()
    {
        return siteId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("roleId", getRoleId())
            .append("siteId", getSiteId())
            .toString();
    }
}
