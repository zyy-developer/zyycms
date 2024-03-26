package com.zyy.web.domain;

import com.zyy.common.annotation.Excel;
import com.zyy.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 消息通知模板对象 cms_message_template
 *
 * @author hnzyy
 * @date 2023-11-14
 */
public class CmsMessageTemplate extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 消息模板唯一编码 */
    @Excel(name = "消息模板唯一编码")
    private String msgCode;

    /** 消息模板标题 */
    @Excel(name = "消息模板标题")
    private String msgName;

    /** 消息模板描述 */
    @Excel(name = "消息模板描述")
    private String msgDesc;

    /** 站点id */
    @Excel(name = "站点id")
    private Long siteId;

    /** 邮件通知开关 */
    @Excel(name = "邮件通知开关")
    private String mailOpen;

    /** 邮件名称 */
    @Excel(name = "邮件名称")
    private String mailTitle;

    /** 邮件内容 */
    @Excel(name = "邮件内容")
    private String mailText;

    /** 站内信开关 */
    @Excel(name = "站内信开关")
    private String msgOpen;

    /** 站内信标题 */
    @Excel(name = "站内信标题")
    private String msgTitle;

    /** 站内信内容 */
    @Excel(name = "站内信内容")
    private String msgText;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setMsgCode(String msgCode)
    {
        this.msgCode = msgCode;
    }

    public String getMsgCode()
    {
        return msgCode;
    }
    public void setMsgName(String msgName)
    {
        this.msgName = msgName;
    }

    public String getMsgName()
    {
        return msgName;
    }
    public void setMsgDesc(String msgDesc)
    {
        this.msgDesc = msgDesc;
    }

    public String getMsgDesc()
    {
        return msgDesc;
    }
    public void setSiteId(Long siteId)
    {
        this.siteId = siteId;
    }

    public Long getSiteId()
    {
        return siteId;
    }
    public void setMailOpen(String mailOpen)
    {
        this.mailOpen = mailOpen;
    }

    public String getMailOpen()
    {
        return mailOpen;
    }
    public void setMailTitle(String mailTitle)
    {
        this.mailTitle = mailTitle;
    }

    public String getMailTitle()
    {
        return mailTitle;
    }
    public void setMailText(String mailText)
    {
        this.mailText = mailText;
    }

    public String getMailText()
    {
        return mailText;
    }
    public void setMsgOpen(String msgOpen)
    {
        this.msgOpen = msgOpen;
    }

    public String getMsgOpen()
    {
        return msgOpen;
    }
    public void setMsgTitle(String msgTitle)
    {
        this.msgTitle = msgTitle;
    }

    public String getMsgTitle()
    {
        return msgTitle;
    }
    public void setMsgText(String msgText)
    {
        this.msgText = msgText;
    }

    public String getMsgText()
    {
        return msgText;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("msgCode", getMsgCode())
            .append("msgName", getMsgName())
            .append("msgDesc", getMsgDesc())
            .append("siteId", getSiteId())
            .append("mailOpen", getMailOpen())
            .append("mailTitle", getMailTitle())
            .append("mailText", getMailText())
            .append("msgOpen", getMsgOpen())
            .append("msgTitle", getMsgTitle())
            .append("msgText", getMsgText())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
