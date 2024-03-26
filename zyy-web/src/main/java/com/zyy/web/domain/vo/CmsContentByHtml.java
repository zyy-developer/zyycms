package com.zyy.web.domain.vo;

import java.util.Date;

import com.alibaba.fastjson2.JSONObject;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.zyy.common.annotation.Excel;
import com.zyy.common.core.domain.BaseEntity;

/**
 * 文章管理对象 cms_content
 *
 * @author hnzyy
 * @date 2023-06-20
 */
public class CmsContentByHtml extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 文章名字 */
    @Excel(name = "文章名字")
    private String title;

    /** 栏目id */
    @Excel(name = "栏目id")
    private Long channelId;

    /** 模型id */
    @Excel(name = "模型id")
    private Long modelId;

    /** 文章内容 */
    @Excel(name = "文章内容")
    private String text;

    /** 浏览量 */
    @Excel(name = "浏览量")
    private Long views;

    /** 0:已发布 1:下线 */
    @Excel(name = "0:已发布 1:下线")
    private String stage;

    /** 发布时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "发布时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date releaseTime;

    /* 栏目名称 **/
    private String channelName;

    /* 自定义属性 **/
    private JSONObject attr;

    /* 条数 **/
    private Integer count;

    /* 排序 **/
    private Integer order;

    /* 文章内容链接 **/
    private String url;

    /** 站点id */
    private Long siteId;

    public Long getSiteId() {
        return siteId;
    }

    public void setSiteId(Long siteId) {
        this.siteId = siteId;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getChannelName() {
        return channelName;
    }

    public void setChannelName(String channelName) {
        this.channelName = channelName;
    }

    public JSONObject getAttr() {
        return attr;
    }

    public void setAttr(JSONObject attr) {
        this.attr = attr;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getOrder() {
        return order;
    }

    public void setOrder(Integer order) {
        this.order = order;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setTitle(String title)
    {
        this.title = title;
    }

    public String getTitle()
    {
        return title;
    }
    public void setChannelId(Long channelId)
    {
        this.channelId = channelId;
    }

    public Long getChannelId()
    {
        return channelId;
    }
    public void setModelId(Long modelId)
    {
        this.modelId = modelId;
    }

    public Long getModelId()
    {
        return modelId;
    }
    public void setText(String text)
    {
        this.text = text;
    }

    public String getText()
    {
        return text;
    }
    public void setViews(Long views)
    {
        this.views = views;
    }

    public Long getViews()
    {
        return views;
    }
    public void setStage(String stage)
    {
        this.stage = stage;
    }

    public String getStage()
    {
        return stage;
    }
    public void setReleaseTime(Date releaseTime)
    {
        this.releaseTime = releaseTime;
    }

    public Date getReleaseTime()
    {
        return releaseTime;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("title", getTitle())
            .append("channelId", getChannelId())
            .append("modelId", getModelId())
            .append("text", getText())
            .append("views", getViews())
            .append("stage", getStage())
            .append("releaseTime", getReleaseTime())
            .append("createTime", getCreateTime())
            .toString();
    }
}
