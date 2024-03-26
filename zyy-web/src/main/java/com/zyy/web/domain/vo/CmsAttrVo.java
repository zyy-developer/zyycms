package com.zyy.web.domain.vo;

import com.zyy.common.annotation.Excel;
import com.zyy.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 自定义属性对象 cms_attr
 *
 * @author hnzyy sun
 * @date 2023-06-20
 */
public class CmsAttrVo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 属性名称 */
    @Excel(name = "属性名称")
    private String attrName;

    /** 属性值 */
    @Excel(name = "属性值")
    private String attrValue;

    /** 内容id */
    @Excel(name = "内容id")
    private Long contentId;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setAttrName(String attrName)
    {
        this.attrName = attrName;
    }

    public String getAttrName()
    {
        return attrName;
    }
    public void setAttrValue(String attrValue)
    {
        this.attrValue = attrValue;
    }

    public String getAttrValue()
    {
        return attrValue;
    }
    public void setContentId(Long contentId)
    {
        this.contentId = contentId;
    }

    public Long getContentId()
    {
        return contentId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("attrName", getAttrName())
            .append("attrValue", getAttrValue())
            .append("contentId", getContentId())
            .toString();
    }
}
