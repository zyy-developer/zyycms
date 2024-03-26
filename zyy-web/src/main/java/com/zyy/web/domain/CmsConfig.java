package com.zyy.web.domain;

import com.zyy.common.annotation.Excel;
import com.zyy.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 系统配置对象 cms_config
 *
 * @author hnzyy
 * @date 2023-11-10
 */
public class CmsConfig extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 键 */
    @Excel(name = "键")
    private String configKey;

    /** 值 */
    @Excel(name = "值")
    private String configValue;

    /** 分类 */
    @Excel(name = "分类")
    private String category;

    /** 排序 */
    @Excel(name = "排序")
    private Long sort;

    /** 是否删除 */
    @Excel(name = "是否删除")
    private Long deleteFlag;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setConfigKey(String configKey)
    {
        this.configKey = configKey;
    }

    public String getConfigKey()
    {
        return configKey;
    }
    public void setConfigValue(String configValue)
    {
        this.configValue = configValue;
    }

    public String getConfigValue()
    {
        return configValue;
    }
    public void setCategory(String category)
    {
        this.category = category;
    }

    public String getCategory()
    {
        return category;
    }
    public void setSort(Long sort)
    {
        this.sort = sort;
    }

    public Long getSort()
    {
        return sort;
    }
    public void setDeleteFlag(Long deleteFlag)
    {
        this.deleteFlag = deleteFlag;
    }

    public Long getDeleteFlag()
    {
        return deleteFlag;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("configKey", getConfigKey())
            .append("configValue", getConfigValue())
            .append("category", getCategory())
            .append("remark", getRemark())
            .append("sort", getSort())
            .append("deleteFlag", getDeleteFlag())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
