package com.zyy.web.domain;

import com.zyy.common.annotation.Excel;
import com.zyy.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 访客日志对象 cms_visitor_log
 *
 * @author hnzyy sun
 * @date 2023-08-18
 */
public class CmsVisitorLog extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** ip地址 */
    @Excel(name = "ip地址")
    private String ip;

    /** 操作系统 */
    @Excel(name = "操作系统")
    private String os;

    /** cookie */
    private String cookie;

    /** 站点id */
    private Long siteId;

    /** 页面路径 */
    private String pagePath;

    /** 省份 */
    private String region;

    /** 城市 */
    private String city;

    /** 文章id */
    private Long contentId;

    /** 栏目id */
    private Long channelId;

    public Long getContentId() {
        return contentId;
    }

    public void setContentId(Long contentId) {
        this.contentId = contentId;
    }

    public Long getChannelId() {
        return channelId;
    }

    public void setChannelId(Long channelId) {
        this.channelId = channelId;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCookie() {
        return cookie;
    }

    public void setCookie(String cookie) {
        this.cookie = cookie;
    }

    public String getPagePath() {
        return pagePath;
    }

    public void setPagePath(String pagePath) {
        this.pagePath = pagePath;
    }

    public Long getSiteId() {
        return siteId;
    }

    public void setSiteId(Long siteId) {
        this.siteId = siteId;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setIp(String ip)
    {
        this.ip = ip;
    }

    public String getIp()
    {
        return ip;
    }
    public void setOs(String os)
    {
        this.os = os;
    }

    public String getOs()
    {
        return os;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("ip", getIp())
            .append("os", getOs())
            .append("createTime", getCreateTime())
            .toString();
    }
}
