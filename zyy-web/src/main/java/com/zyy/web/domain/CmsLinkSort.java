package com.zyy.web.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.zyy.common.annotation.Excel;
import com.zyy.common.core.domain.BaseEntity;

/**
 * 友情链接分类对象 cms_link_sort
 *
 * @author hnzyy sun
 * @date 2023-06-20
 */
public class CmsLinkSort extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 友情链接分类id */
    private Long id;

    /** 分类名称 */
    @Excel(name = "分类名称")
    private String name;

    /** 分类类型(1文字 2图片) */
    @Excel(name = "分类类型(1文字 2图片)")
    private String type;

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
    public void setType(String type)
    {
        this.type = type;
    }

    public String getType()
    {
        return type;
    }

    /** 站点id */
    private Long siteId;

    public Long getSiteId() {
        return siteId;
    }

    public void setSiteId(Long siteId) {
        this.siteId = siteId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("type", getType())
            .append("createTime", getCreateTime())
            .toString();
    }
}
