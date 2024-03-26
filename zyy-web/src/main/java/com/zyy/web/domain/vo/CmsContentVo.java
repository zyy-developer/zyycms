package com.zyy.web.domain.vo;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.zyy.common.annotation.Excel;

import java.util.Date;

public class CmsContentVo {
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

    /** 站点id */
    private Long siteId;

    /** 违禁词id */
    private Long sensitiveId;

    private String sensitiveWord;

    private String replaceWord;

    public Long getSiteId() {
        return siteId;
    }

    public void setSiteId(Long siteId) {
        this.siteId = siteId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Long getChannelId() {
        return channelId;
    }

    public void setChannelId(Long channelId) {
        this.channelId = channelId;
    }

    public Long getModelId() {
        return modelId;
    }

    public void setModelId(Long modelId) {
        this.modelId = modelId;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Long getViews() {
        return views;
    }

    public void setViews(Long views) {
        this.views = views;
    }

    public String getStage() {
        return stage;
    }

    public void setStage(String stage) {
        this.stage = stage;
    }

    public Date getReleaseTime() {
        return releaseTime;
    }

    public void setReleaseTime(Date releaseTime) {
        this.releaseTime = releaseTime;
    }

    public Long getSensitiveId() {
        return sensitiveId;
    }

    public void setSensitiveId(Long sensitiveId) {
        this.sensitiveId = sensitiveId;
    }

    public String getSensitiveWord() {
        return sensitiveWord;
    }

    public void setSensitiveWord(String sensitiveWord) {
        this.sensitiveWord = sensitiveWord;
    }

    public String getReplaceWord() {
        return replaceWord;
    }

    public void setReplaceWord(String replaceWord) {
        this.replaceWord = replaceWord;
    }
}
