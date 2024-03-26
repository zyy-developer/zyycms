package com.zyy.web.domain;

import java.util.Date;
import java.util.List;

import com.alibaba.fastjson2.JSONObject;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.zyy.system.domain.SysRoleCms;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.zyy.common.annotation.Excel;
import com.zyy.common.core.domain.BaseEntity;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * 文章管理对象 cms_content
 *
 * @author hnzyy
 * @date 2023-06-20
 */
public class CmsContent extends BaseEntity
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
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "发布时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date releaseTime;

    /* 栏目名称 **/
    private String channelName;

    /* 自定义属性 **/
    private JSONObject attr;

    /** 第n页 */
    private Integer pageNo;

    /* 条数 **/
    private Integer count;

    /* 排序 **/
    private Integer order;

    /* 文章内容链接 **/
    private String url;

    /** 站点id */
    private Long siteId;

    /** 作者 */
    private String author;

    /** 来源 */
    private String source;

    /** 描述 */
    private String profile;

    /** 排序 */
    private Integer orderNum;

    /** 流程id */
    private String flowId;

    /** 是否删除 */
    private String isDelete;

    /** 删除人 */
    private String deleteBy;

    /** 删除时间 */
    private Date deleteTime;

    /** 内容类型数组 */
    private List<CmsContentType> contentTypeList;

    /** 内容类型字符串 */
    private String contentType;

    /** 查询文章列表时是否查询内容 */
    private boolean isTextShow;

    /** 置顶 */
    private String topping;

    /** 外部链接 */
    private String externalLink;

    /** 封面图 */
    private String cover;


    public String getExternalLink() {
        return externalLink;
    }

    public void setExternalLink(String externalLink) {
        this.externalLink = externalLink;
    }

    public String getCover() {
        return cover;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public String getTopping() {
        return topping;
    }

    public void setTopping(String topping) {
        this.topping = topping;
    }

    public String getDeleteBy() {
        return deleteBy;
    }

    public void setDeleteBy(String deleteBy) {
        this.deleteBy = deleteBy;
    }

    public Date getDeleteTime() {
        return deleteTime;
    }

    public void setDeleteTime(Date deleteTime) {
        this.deleteTime = deleteTime;
    }

    /** 根据角色权限id查询栏目 */
    private List<SysRoleCms> roleCmsList;

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }

    public List<SysRoleCms> getRoleCmsList() {
        return roleCmsList;
    }

    public void setRoleCmsList(List<SysRoleCms> roleCmsList) {
        this.roleCmsList = roleCmsList;
    }

    public boolean isTextShow() {
        return isTextShow;
    }

    public void setTextShow(boolean textShow) {
        isTextShow = textShow;
    }

    public List<CmsContentType> getContentTypeList() {
        return contentTypeList;
    }

    public void setContentTypeList(List<CmsContentType> contentTypeList) {
        this.contentTypeList = contentTypeList;
    }

    public String getContentType() {
        return contentType;
    }

    public void setContentType(String contentType) {
        this.contentType = contentType;
    }

    public String getFlowId() {
        return flowId;
    }

    public void setFlowId(String flowId) {
        this.flowId = flowId;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }


    public Integer getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(Integer orderNum) {
        this.orderNum = orderNum;
    }

    public Integer getPageNo() {
        return pageNo;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

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
