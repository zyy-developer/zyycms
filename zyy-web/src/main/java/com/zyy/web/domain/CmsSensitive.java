package com.zyy.web.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.zyy.common.annotation.Excel;
import com.zyy.common.core.domain.BaseEntity;

/**
 * 敏感词对象 cms_sensitive
 *
 * @author hnzyy sun
 * @date 2023-07-06
 */
public class CmsSensitive extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 敏感词 */
    @Excel(name = "敏感词")
    private String sensitiveWord;

    /** 替换词 */
    @Excel(name = "替换词")
    private String replaceWord;

    /** 0启用 1取消 */
    @Excel(name = "0启用 1取消")
    private String state;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setSensitiveWord(String sensitiveWord)
    {
        this.sensitiveWord = sensitiveWord;
    }

    public String getSensitiveWord()
    {
        return sensitiveWord;
    }
    public void setReplaceWord(String replaceWord)
    {
        this.replaceWord = replaceWord;
    }

    public String getReplaceWord()
    {
        return replaceWord;
    }
    public void setState(String state)
    {
        this.state = state;
    }

    public String getState()
    {
        return state;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("sensitiveWord", getSensitiveWord())
            .append("replaceWord", getReplaceWord())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("state", getState())
            .toString();
    }
}
