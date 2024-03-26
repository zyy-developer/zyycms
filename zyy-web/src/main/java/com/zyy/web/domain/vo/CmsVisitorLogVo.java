package com.zyy.web.domain.vo;

/**
 * 浏览记录表 传参
 */
public class CmsVisitorLogVo {

    /** 站点id */
    private Long siteId;

    /** 日期 */
    private String date;

    /** 多少小时 */
    private Integer num;

    /** 类型 */
    private String type;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Long getSiteId() {
        return siteId;
    }

    public void setSiteId(Long siteId) {
        this.siteId = siteId;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }
}
