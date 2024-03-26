package com.zyy.web.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.zyy.common.annotation.Excel;
import com.zyy.common.core.domain.BaseEntity;

/**
 * 模型对象 cms_model
 *
 * @author hnzyy sun
 * @date 2023-06-20
 */
public class CmsModel extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long modelId;

    /** 模型名称 */
    @Excel(name = "模型名称")
    private String modelName;

    /** 自定义模型代码(前台) */
    @Excel(name = "自定义模型代码(前台)")
    private String modelCode;

    /** 自定义模型代码(后台) */
    @Excel(name = "自定义模型代码(后台)")
    private String modelCodeAdmin;

    /** 模型类型 */
    private String modelType;

    /** 状态 */
    private String stage;

    /** PC端模板 */
    private String tempDefault;

    /** 移动端模板 */
    private String tempMobile;

    /** 站点id */
    private Long siteId;

    /** 是否为全站模型 */
    private String isPublic;

    public String getIsPublic() {
        return isPublic;
    }

    public void setIsPublic(String isPublic) {
        this.isPublic = isPublic;
    }

    public String getModelType() {
        return modelType;
    }

    public void setModelType(String modelType) {
        this.modelType = modelType;
    }

    public String getStage() {
        return stage;
    }

    public void setStage(String stage) {
        this.stage = stage;
    }

    public String getTempDefault() {
        return tempDefault;
    }

    public void setTempDefault(String tempDefault) {
        this.tempDefault = tempDefault;
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

    public void setModelId(Long modelId)
    {
        this.modelId = modelId;
    }

    public Long getModelId()
    {
        return modelId;
    }
    public void setModelName(String modelName)
    {
        this.modelName = modelName;
    }

    public String getModelName()
    {
        return modelName;
    }
    public void setModelCode(String modelCode)
    {
        this.modelCode = modelCode;
    }

    public String getModelCode()
    {
        return modelCode;
    }
    public void setModelCodeAdmin(String modelCodeAdmin)
    {
        this.modelCodeAdmin = modelCodeAdmin;
    }

    public String getModelCodeAdmin()
    {
        return modelCodeAdmin;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("modelId", getModelId())
            .append("modelName", getModelName())
            .append("modelCode", getModelCode())
            .append("modelCodeAdmin", getModelCodeAdmin())
            .append("createTime", getCreateTime())
            .toString();
    }
}
