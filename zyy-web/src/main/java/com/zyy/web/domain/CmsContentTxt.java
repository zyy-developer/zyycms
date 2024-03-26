package com.zyy.web.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.zyy.common.annotation.Excel;
import com.zyy.common.core.domain.BaseEntity;

/**
 * 文章内容对象 cms_content_txt
 *
 * @author hnzyy sun
 * @date 2023-07-20
 */
public class CmsContentTxt extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 文章表id */
    @Excel(name = "文章表id")
    private Long contentId;

    /** 内容 */
    @Excel(name = "内容")
    private String text;

    /** 字段 */
    @Excel(name = "字段")
    private String attrKey;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setContentId(Long contentId)
    {
        this.contentId = contentId;
    }

    public Long getContentId()
    {
        return contentId;
    }
    public void setText(String text)
    {
        this.text = text;
    }

    public String getText()
    {
        return text;
    }
    public void setAttrKey(String attrKey)
    {
        this.attrKey = attrKey;
    }

    public String getAttrKey()
    {
        return attrKey;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("contentId", getContentId())
            .append("text", getText())
            .append("attrKey", getAttrKey())
            .toString();
    }
}
