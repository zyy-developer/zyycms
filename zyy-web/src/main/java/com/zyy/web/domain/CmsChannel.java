package com.zyy.web.domain;

import com.alibaba.fastjson2.JSONObject;
import com.zyy.system.domain.SysRoleCms;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.zyy.common.annotation.Excel;
import com.zyy.common.core.domain.BaseEntity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 栏目对象 cms_channel
 *
 * @author hnzyy sun
 * @date 2023-06-20
 */
public class CmsChannel extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long channelId;

    /** 父级id */
    @Excel(name = "父级id")
    private Long parentId;

    /** 栏目名称 */
    @Excel(name = "栏目名称")
    private String channelName;

    /** 访问链接 */
    @Excel(name = "访问链接")
    private String path;

    /** 外部链接 */
    @Excel(name = "外部链接")
    private String externalLink;

    /** 排序 */
    @Excel(name = "排序")
    private Long orderNum;

    /** pc端模板 */
    @Excel(name = "模板")
    private String tempId;

    /** 移动端模板 */
    private String tempMobile;

    /** 状态 */
    @Excel(name = "状态")
    private String stage;

    /** 栏目链接 */
    private String url;

    /** 站点id */
    private Long siteId;

    /** 子栏目 */
    private List<CmsChannel> children = new ArrayList<CmsChannel>();

    /** 内容模型 */
//    private Integer[] contentModelIds;

    /** 内容模型列表 */
    private List<CmsModel> contentModelList;

    /** 内容模型字符串 */
    private String contentModel;

    /** 栏目模型 */
    private Long channelModel;

    /** 模型名称 */
    private String modelName;

    /* 自定义属性 **/
    private JSONObject attr;

    /** 审核模板id */
    private String examineTempId;

    /** 根据角色权限id查询栏目 */
    private List<SysRoleCms> roleCmsList;

    /** 是否删除 */
    private String isDelete;

    /** 删除人 */
    private String deleteBy;

    /** 删除时间 */
    private Date deleteTime;

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
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

    public List<SysRoleCms> getRoleCmsList() {
        return roleCmsList;
    }

    public void setRoleCmsList(List<SysRoleCms> roleCmsList) {
        this.roleCmsList = roleCmsList;
    }

    public String getExamineTempId() {
        return examineTempId;
    }

    public void setExamineTempId(String examineTempId) {
        this.examineTempId = examineTempId;
    }

    public List<CmsModel> getContentModelList() {
        return contentModelList;
    }

    public void setContentModelList(List<CmsModel> contentModelList) {
        this.contentModelList = contentModelList;
    }

    public String getModelName() {
        return modelName;
    }

    public void setModelName(String modelName) {
        this.modelName = modelName;
    }

    public JSONObject getAttr() {
        return attr;
    }

    public void setAttr(JSONObject attr) {
        this.attr = attr;
    }

    public Long getChannelModel() {
        return channelModel;
    }

    public void setChannelModel(Long channelModel) {
        this.channelModel = channelModel;
    }

    public String getTempMobile() {
        return tempMobile;
    }

    public void setTempMobile(String tempMobile) {
        this.tempMobile = tempMobile;
    }

    public Long getSiteId() {
        return siteId;
    }

    public void setSiteId(Long siteId) {
        this.siteId = siteId;
    }

    public String getContentModel() {
        return contentModel;
    }

    public void setContentModel(String contentModel) {
        this.contentModel = contentModel;
    }

//    public Integer[] getContentModelIds() {
//        return contentModelIds;
//    }

//    public void setContentModelIds(Integer[] contentModelIds) {
//        this.contentModelIds = contentModelIds;
//    }

    public List<CmsChannel> getChildren() {
        return children;
    }

    public void setChildren(List<CmsChannel> children) {
        this.children = children;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public void setChannelId(Long channelId)
    {
        this.channelId = channelId;
    }

    public Long getChannelId()
    {
        return channelId;
    }
    public void setParentId(Long parentId)
    {
        this.parentId = parentId;
    }

    public Long getParentId()
    {
        return parentId;
    }
    public void setChannelName(String channelName)
    {
        this.channelName = channelName;
    }

    public String getChannelName()
    {
        return channelName;
    }
    public void setPath(String path)
    {
        this.path = path;
    }

    public String getPath()
    {
        return path;
    }
    public void setExternalLink(String externalLink)
    {
        this.externalLink = externalLink;
    }

    public String getExternalLink()
    {
        return externalLink;
    }
    public void setOrderNum(Long orderNum)
    {
        this.orderNum = orderNum;
    }

    public Long getOrderNum()
    {
        return orderNum;
    }
    public void setTempId(String tempId)
    {
        this.tempId = tempId;
    }

    public String getTempId()
    {
        return tempId;
    }
    public void setStage(String stage)
    {
        this.stage = stage;
    }

    public String getStage()
    {
        return stage;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("channelId", getChannelId())
            .append("parentId", getParentId())
            .append("channelName", getChannelName())
            .append("path", getPath())
            .append("externalLink", getExternalLink())
            .append("orderNum", getOrderNum())
            .append("tempId", getTempId())
            .append("stage", getStage())
            .append("createTime", getCreateTime())
            .toString();
    }
}
