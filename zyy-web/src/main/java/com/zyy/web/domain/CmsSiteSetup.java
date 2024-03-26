package com.zyy.web.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.zyy.common.annotation.Excel;
import com.zyy.common.core.domain.BaseEntity;

/**
 * 站点设置对象 cms_site_setup
 *
 * @author hnzyy sun
 * @date 2023-08-03
 */
public class CmsSiteSetup extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 站点id */
    @Excel(name = "站点id")
    private Long siteId;

    /** 站点静态化 */
    @Excel(name = "站点静态化")
    private String siteStatic;

    /** 站点ico */
    @Excel(name = "站点ico")
    private String siteFavicon;

    /** 站点logo */
    @Excel(name = "站点logo")
    private String siteLogo;

    /** 网站灰度 */
    @Excel(name = "网站灰度")
    private String siteGrayscale;

    /** 屏幕自适应 */
    @Excel(name = "屏幕自适应")
    private String siteAdaption;

    /** 站点状态 */
    @Excel(name = "站点状态")
    private String siteStop;

    /** 首页模板路径 */
    @Excel(name = "首页模板路径")
    private String siteHomePath;

    /** seo标题 */
    @Excel(name = "seo标题")
    private String siteSeoTitle;

    /** seo描述 */
    @Excel(name = "seo描述")
    private String siteSeoDesc;

    /** seo关键字 */
    @Excel(name = "seo关键字")
    private String siteSeoKeywords;

    /** PC端模板方案 */
    private String siteTempSchemePc;

    /** 移动端模板方案 */
    private String siteTempSchemeMobile;

    /** 网站风格 */
    private String siteTempStyle;

    public String getSiteTempStyle() {
        return siteTempStyle;
    }

    public void setSiteTempStyle(String siteTempStyle) {
        this.siteTempStyle = siteTempStyle;
    }

    public String getSiteTempSchemePc() {
        return siteTempSchemePc;
    }

    public void setSiteTempSchemePc(String siteTempSchemePc) {
        this.siteTempSchemePc = siteTempSchemePc;
    }

    public String getSiteTempSchemeMobile() {
        return siteTempSchemeMobile;
    }

    public void setSiteTempSchemeMobile(String siteTempSchemeMobile) {
        this.siteTempSchemeMobile = siteTempSchemeMobile;
    }

    public void setSiteId(Long siteId)
    {
        this.siteId = siteId;
    }

    public Long getSiteId()
    {
        return siteId;
    }

    public void setSiteFavicon(String siteFavicon)
    {
        this.siteFavicon = siteFavicon;
    }

    public String getSiteFavicon()
    {
        return siteFavicon;
    }
    public void setSiteLogo(String siteLogo)
    {
        this.siteLogo = siteLogo;
    }

    public String getSiteLogo()
    {
        return siteLogo;
    }

    public String getSiteStatic() {
        return siteStatic;
    }

    public void setSiteStatic(String siteStatic) {
        this.siteStatic = siteStatic;
    }

    public String getSiteGrayscale() {
        return siteGrayscale;
    }

    public void setSiteGrayscale(String siteGrayscale) {
        this.siteGrayscale = siteGrayscale;
    }

    public String getSiteAdaption() {
        return siteAdaption;
    }

    public void setSiteAdaption(String siteAdaption) {
        this.siteAdaption = siteAdaption;
    }

    public String getSiteStop() {
        return siteStop;
    }

    public void setSiteStop(String siteStop) {
        this.siteStop = siteStop;
    }

    public void setSiteHomePath(String siteHomePath)
    {
        this.siteHomePath = siteHomePath;
    }

    public String getSiteSeoTitle() {
        return siteSeoTitle;
    }

    public void setSiteSeoTitle(String siteSeoTitle) {
        this.siteSeoTitle = siteSeoTitle;
    }

    public String getSiteHomePath() {
        return siteHomePath;
    }

    public void setSiteSeoDesc(String siteSeoDesc) {
        this.siteSeoDesc = siteSeoDesc;
    }

    public String getSiteSeoDesc()
    {
        return siteSeoDesc;
    }
    public void setSiteSeoKeywords(String siteSeoKeywords)
    {
        this.siteSeoKeywords = siteSeoKeywords;
    }

    public String getSiteSeoKeywords()
    {
        return siteSeoKeywords;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("siteId", getSiteId())
            .append("siteStatic", getSiteStatic())
            .append("siteFavicon", getSiteFavicon())
            .append("siteLogo", getSiteLogo())
            .append("siteGrayscale", getSiteGrayscale())
            .append("siteAdaption", getSiteAdaption())
            .append("siteStop", getSiteStop())
            .append("siteHomePath", getSiteHomePath())
            .append("siteSeoTitle", getSiteSeoTitle())
            .append("siteSeoDesc", getSiteSeoDesc())
            .append("siteSeoKeywords", getSiteSeoKeywords())
            .toString();
    }
}
