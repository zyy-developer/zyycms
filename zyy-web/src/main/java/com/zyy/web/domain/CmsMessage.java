package com.zyy.web.domain;

import com.zyy.common.annotation.Excel;
import com.zyy.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 消息内容对象 cms_message
 *
 * @author hnzyy
 * @date 2023-11-14
 */
public class CmsMessage extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 标题 */
    @Excel(name = "标题")
    private String title;

    /** 内容 */
    @Excel(name = "内容")
    private String content;

    /** 接收人类型(1全部消息 2组织消息 3人员消息) */
    @Excel(name = "接收人类型(1全部消息 2组织消息 3人员消息)")
    private Long recipientType;

    /** 部门id */
    @Excel(name = "部门id")
    private Long orgId;

    /** 人员id */
    @Excel(name = "人员id")
    private Long userId;

    /** 发送人名称 */
    @Excel(name = "发送人名称")
    private String sendName;

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
    public void setContent(String content)
    {
        this.content = content;
    }

    public String getContent()
    {
        return content;
    }
    public void setRecipientType(Long recipientType)
    {
        this.recipientType = recipientType;
    }

    public Long getRecipientType()
    {
        return recipientType;
    }
    public void setOrgId(Long orgId)
    {
        this.orgId = orgId;
    }

    public Long getOrgId()
    {
        return orgId;
    }
    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }
    public void setSendName(String sendName)
    {
        this.sendName = sendName;
    }

    public String getSendName()
    {
        return sendName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("title", getTitle())
            .append("content", getContent())
            .append("recipientType", getRecipientType())
            .append("orgId", getOrgId())
            .append("userId", getUserId())
            .append("sendName", getSendName())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
