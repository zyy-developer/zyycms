package com.zyy.web.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.zyy.common.annotation.Excel;
import com.zyy.common.core.domain.BaseEntity;

/**
 * 模板对象 cms_template
 *
 * @author hnzyy sun
 * @date 2023-06-20
 */
public class CmsTemplate extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** $column.columnComment */
    private Long id;

    /** 模板名称 */
    @Excel(name = "模板名称")
    private String tempName;

    /** 模板内容 */
    @Excel(name = "模板内容")
    private String tempText;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date createDate;

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setTempName(String tempName)
    {
        this.tempName = tempName;
    }

    public String getTempName()
    {
        return tempName;
    }
    public void setTempText(String tempText)
    {
        this.tempText = tempText;
    }

    public String getTempText()
    {
        return tempText;
    }
    public void setCreateDate(Date createDate)
    {
        this.createDate = createDate;
    }

    public Date getCreateDate()
    {
        return createDate;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("tempName", getTempName())
            .append("tempText", getTempText())
            .append("createDate", getCreateDate())
            .toString();
    }
}
