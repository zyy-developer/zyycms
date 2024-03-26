package com.zyy.web.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.zyy.common.annotation.Excel;
import com.zyy.common.core.domain.BaseEntity;

/**
 * 自定义模型字段对象 cms_model_item
 *
 * @author hnzyy sun
 * @date 2023-06-26
 */
public class CmsModelItem extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 标签名字 */
    @Excel(name = "标签名字")
    private String labelName;

    /** 组件类型 */
    @Excel(name = "组件类型")
    private String attrType;

    /** 模型id */
    @Excel(name = "模型id")
    private Long modelId;

    /** 提示 */
    @Excel(name = "提示")
    private String placeHolder;

    /** 字段名称 */
    @Excel(name = "字段名称")
    private String field;

    /** 排序字段 */
    @Excel(name = "排序字段")
    private Long sortNum;

    /** 属性详情 */
    @Excel(name = "属性详情")
    private String content;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setLabelName(String labelName)
    {
        this.labelName = labelName;
    }

    public String getLabelName()
    {
        return labelName;
    }
    public void setAttrType(String attrType)
    {
        this.attrType = attrType;
    }

    public String getAttrType()
    {
        return attrType;
    }
    public void setModelId(Long modelId)
    {
        this.modelId = modelId;
    }

    public Long getModelId()
    {
        return modelId;
    }
    public void setPlaceHolder(String placeHolder)
    {
        this.placeHolder = placeHolder;
    }

    public String getPlaceHolder()
    {
        return placeHolder;
    }
    public void setField(String field)
    {
        this.field = field;
    }

    public String getField()
    {
        return field;
    }
    public void setSortNum(Long sortNum)
    {
        this.sortNum = sortNum;
    }

    public Long getSortNum()
    {
        return sortNum;
    }
    public void setContent(String content)
    {
        this.content = content;
    }

    public String getContent() {
        return content;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("labelName", getLabelName())
            .append("attrType", getAttrType())
            .append("modelId", getModelId())
            .append("placeHolder", getPlaceHolder())
            .append("field", getField())
            .append("sortNum", getSortNum())
            .append("content", getContent())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
