package com.zyy.web.domain;

import com.zyy.common.annotation.Excel;
import com.zyy.common.core.domain.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

/**
 * 人员消息状态对象 cms_message_user
 *
 * @author hnzyy
 * @date 2023-11-14
 */
public class CmsMessageUser extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 消息ID */
    @Excel(name = "消息ID")
    private Long msgId;

    /** 用户id */
    @Excel(name = "用户id")
    private Long userId;

    /** 状态(0已读 1删除) */
    @Excel(name = "状态(0已读 1删除)")
    private Long state;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setMsgId(Long msgId)
    {
        this.msgId = msgId;
    }

    public Long getMsgId()
    {
        return msgId;
    }
    public void setUserId(Long userId)
    {
        this.userId = userId;
    }

    public Long getUserId()
    {
        return userId;
    }
    public void setState(Long state)
    {
        this.state = state;
    }

    public Long getState()
    {
        return state;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("msgId", getMsgId())
            .append("userId", getUserId())
            .append("state", getState())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
