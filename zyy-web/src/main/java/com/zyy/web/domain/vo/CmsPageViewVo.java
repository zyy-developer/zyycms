package com.zyy.web.domain.vo;

import com.zyy.common.core.domain.BaseEntity;

public class CmsPageViewVo extends BaseEntity {
    //页面URL
    private String pageName;
    //访问量
    private Integer pvCount;
    //访客量
    private Integer uvCount;
    //开始日期
    private String startDate;
    //结束日期
    private String endDate;
    //站点id
    private Long siteId;

    public Long getSiteId() {
        return siteId;
    }

    public void setSiteId(Long siteId) {
        this.siteId = siteId;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    public String getPageName() {
        return pageName;
    }

    public void setPageName(String pageName) {
        this.pageName = pageName;
    }

    public Integer getPvCount() {
        return pvCount;
    }

    public void setPvCount(Integer pvCount) {
        this.pvCount = pvCount;
    }

    public Integer getUvCount() {
        return uvCount;
    }

    public void setUvCount(Integer uvCount) {
        this.uvCount = uvCount;
    }
}
