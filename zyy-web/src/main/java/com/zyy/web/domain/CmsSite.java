package com.zyy.web.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.zyy.common.annotation.Excel;
import com.zyy.common.core.domain.BaseEntity;

import java.util.ArrayList;
import java.util.List;

/**
 * 站点对象 cms_site
 *
 * @author hnzyy sun
 * @date 2023-07-03
 */
public class CmsSite extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 站点名称 */
    @Excel(name = "站点名称")
    private String name;

    /** 父级站点 */
    private Long parentId;

    /** 站点目录 */
    @Excel(name = "站点目录")
    private String directory;

    /** 域名 */
    @Excel(name = "域名")
    private String domainName;

    /** 域名请求协议 */
    private String requestMethod;

    /** 站点设置 */
    private CmsSiteSetup setup;

    /** 子栏目 */
    private List<CmsSite> children = new ArrayList<CmsSite>();

    /** 站点url */
    private String url;

    public String getRequestMethod() {
        return requestMethod;
    }

    public void setRequestMethod(String requestMethod) {
        this.requestMethod = requestMethod;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public List<CmsSite> getChildren() {
        return children;
    }

    public void setChildren(List<CmsSite> children) {
        this.children = children;
    }

    public CmsSiteSetup getSetup() {
        return setup;
    }

    public void setSetup(CmsSiteSetup setup) {
        this.setup = setup;
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId()
    {
        return id;
    }
    public void setName(String name)
    {
        this.name = name;
    }

    public String getName()
    {
        return name;
    }
    public void setDirectory(String directory)
    {
        this.directory = directory;
    }

    public String getDirectory()
    {
        return directory;
    }
    public void setDomainName(String domainName)
    {
        this.domainName = domainName;
    }

    public String getDomainName()
    {
        return domainName;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("name", getName())
            .append("directory", getDirectory())
            .append("domainName", getDomainName())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .toString();
    }
}
