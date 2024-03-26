package com.zyy.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.zyy.common.annotation.Excel;
import com.zyy.common.core.domain.BaseEntity;

/**
 * cms角色权限对象 sys_role_cms
 *
 * @author hnzyy sun
 * @date 2023-08-04
 */
public class SysRoleCms extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 角色id */
    @Excel(name = "角色id")
    private Long roleId;

    /** 属性id */
    @Excel(name = "属性id")
    private Long propertyId;

    /** 属性类型 */
    @Excel(name = "属性类型")
    private String propertyType;

    /** 属性名称 */
    private String propertyName;


    public String getPropertyName() {
        return propertyName;
    }

    public void setPropertyName(String propertyName) {
        this.propertyName = propertyName;
    }

    public void setRoleId(Long roleId)
    {
        this.roleId = roleId;
    }

    public Long getRoleId()
    {
        return roleId;
    }
    public void setPropertyId(Long propertyId)
    {
        this.propertyId = propertyId;
    }

    public Long getPropertyId()
    {
        return propertyId;
    }
    public void setPropertyType(String propertyType)
    {
        this.propertyType = propertyType;
    }

    public String getPropertyType()
    {
        return propertyType;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("roleId", getRoleId())
            .append("propertyId", getPropertyId())
            .append("propertyType", getPropertyType())
            .toString();
    }
}
