package com.zyy.web.domain;

import com.zyy.common.annotation.Excel;
import com.zyy.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 内容类型对象 cms_content_type
 *
 * @author hnzyy sun
 * @date 2023-09-05
 */
public class CmsContentType extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 内容类型名称 */
    @Excel(name = "内容类型名称")
    private String name;

    /** 类型图标 */
    @Excel(name = "类型图标")
    private String ico;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setName(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }
    public void setIco(String ico)
    {
        this.ico = ico;
    }

    public String getIco()
    {
        return ico;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("ico", getIco())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
