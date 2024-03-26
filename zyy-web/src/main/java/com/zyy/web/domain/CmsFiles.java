package com.zyy.web.domain;

import com.zyy.common.annotation.Excel;
import com.zyy.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 资源库对象 cms_files
 *
 * @author hnzyy
 * @date 2023-12-19
 */
public class CmsFiles extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 共享状态（0已分享 1未分享） */
    @Excel(name = "共享状态", readConverterExp = "0=已分享,1=未分享")
    private String shareStatus;

    /** 文件大小 */
    @Excel(name = "文件大小")
    private Long resourceSize;

    /** 文件类型 */
    @Excel(name = "文件类型")
    private String resourceType;

    /** 文件路径 */
    @Excel(name = "文件路径")
    private String resourceUrl;

    /** 图片尺寸 */
    @Excel(name = "图片尺寸")
    private String resourceDimensions;

    /** 视频时长（单位/秒） */
    @Excel(name = "视频时长", readConverterExp = "单=位/秒")
    private Long resourceDate;

    /** 文件别名 */
    @Excel(name = "文件别名")
    private String resourceAlias;

    /** 上传云存储ID */
    @Excel(name = "上传云存储ID")
    private Long uploadOssId;

    /** 后缀名 */
    @Excel(name = "后缀名")
    private String suffix;

    /** 视频抽帧id */
    @Excel(name = "视频抽帧id")
    private Long videoCoverId;

    /** 是否显示在资源库 */
    @Excel(name = "是否显示在资源库")
    private String isDisplay;

    /** 是否删除（0未删除 1已删除） */
    @Excel(name = "是否删除", readConverterExp = "0=未删除,1=已删除")
    private String isDelete;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }
    public void setShareStatus(String shareStatus)
    {
        this.shareStatus = shareStatus;
    }

    public String getShareStatus()
    {
        return shareStatus;
    }
    public void setResourceSize(Long resourceSize)
    {
        this.resourceSize = resourceSize;
    }

    public Long getResourceSize()
    {
        return resourceSize;
    }
    public void setResourceType(String resourceType)
    {
        this.resourceType = resourceType;
    }

    public String getResourceType()
    {
        return resourceType;
    }
    public void setResourceUrl(String resourceUrl)
    {
        this.resourceUrl = resourceUrl;
    }

    public String getResourceUrl()
    {
        return resourceUrl;
    }
    public void setResourceDimensions(String resourceDimensions)
    {
        this.resourceDimensions = resourceDimensions;
    }

    public String getResourceDimensions()
    {
        return resourceDimensions;
    }
    public void setResourceDate(Long resourceDate)
    {
        this.resourceDate = resourceDate;
    }

    public Long getResourceDate()
    {
        return resourceDate;
    }
    public void setResourceAlias(String resourceAlias)
    {
        this.resourceAlias = resourceAlias;
    }

    public String getResourceAlias()
    {
        return resourceAlias;
    }
    public void setUploadOssId(Long uploadOssId)
    {
        this.uploadOssId = uploadOssId;
    }

    public Long getUploadOssId()
    {
        return uploadOssId;
    }
    public void setSuffix(String suffix)
    {
        this.suffix = suffix;
    }

    public String getSuffix()
    {
        return suffix;
    }
    public void setVideoCoverId(Long videoCoverId)
    {
        this.videoCoverId = videoCoverId;
    }

    public Long getVideoCoverId()
    {
        return videoCoverId;
    }
    public void setIsDisplay(String isDisplay)
    {
        this.isDisplay = isDisplay;
    }

    public String getIsDisplay()
    {
        return isDisplay;
    }
    public void setIsDelete(String isDelete)
    {
        this.isDelete = isDelete;
    }

    public String getIsDelete()
    {
        return isDelete;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("userId", getUserId())
            .append("shareStatus", getShareStatus())
            .append("resourceSize", getResourceSize())
            .append("resourceType", getResourceType())
            .append("resourceUrl", getResourceUrl())
            .append("resourceDimensions", getResourceDimensions())
            .append("resourceDate", getResourceDate())
            .append("resourceAlias", getResourceAlias())
            .append("uploadOssId", getUploadOssId())
            .append("suffix", getSuffix())
            .append("videoCoverId", getVideoCoverId())
            .append("isDisplay", getIsDisplay())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("isDelete", getIsDelete())
            .toString();
    }
}
