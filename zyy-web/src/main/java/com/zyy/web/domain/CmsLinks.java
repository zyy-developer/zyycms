package com.zyy.web.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.zyy.common.annotation.Excel;
import com.zyy.common.core.domain.BaseEntity;

/**
 * 友情链接对象 cms_links
 *
 * @author hnzyy sun
 * @date 2023-06-20
 */
public class CmsLinks extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 友情链接名称 */
    @Excel(name = "友情链接名称")
    private String linkName;

    /** 友情链接图片 */
    @Excel(name = "友情链接图片")
    private String linkSrc;

    /** 友情链接地址 */
    @Excel(name = "友情链接地址")
    private String linkUrl;

    /** 站点id */
    @Excel(name = "站点id")
    private Long siteId;

    /** 分类id */
    @Excel(name = "分类id")
    private Long linkSortId;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setLinkName(String linkName)
    {
        this.linkName = linkName;
    }

    public String getLinkName()
    {
        return linkName;
    }
    public void setLinkSrc(String linkSrc)
    {
        this.linkSrc = linkSrc;
    }

    public String getLinkSrc()
    {
        return linkSrc;
    }
    public void setLinkUrl(String linkUrl)
    {
        this.linkUrl = linkUrl;
    }

    public String getLinkUrl()
    {
        return linkUrl;
    }
    public void setSiteId(Long siteId)
    {
        this.siteId = siteId;
    }

    public Long getSiteId()
    {
        return siteId;
    }
    public void setLinkSortId(Long linkSortId)
    {
        this.linkSortId = linkSortId;
    }

    public Long getLinkSortId()
    {
        return linkSortId;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("linkName", getLinkName())
            .append("linkSrc", getLinkSrc())
            .append("linkUrl", getLinkUrl())
            .append("createTime", getCreateTime())
            .append("siteId", getSiteId())
            .append("linkSortId", getLinkSortId())
            .toString();
    }
}
