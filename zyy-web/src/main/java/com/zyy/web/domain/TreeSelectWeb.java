package com.zyy.web.domain;

import java.io.Serializable;
import java.util.List;
import java.util.stream.Collectors;
import com.fasterxml.jackson.annotation.JsonInclude;

/**
 * Treeselect树结构实体类
 *
 * @author hnzyy
 */
public class TreeSelectWeb implements Serializable
{
    private static final long serialVersionUID = 1L;

    /** 节点ID */
    private Long id;

    /** 节点名称 */
    private String label;

    /** 子节点 */
    @JsonInclude(JsonInclude.Include.NON_EMPTY)
    private List<TreeSelectWeb> children;

    public TreeSelectWeb()
    {

    }


    public TreeSelectWeb(CmsChannel cmsChannel) {
        this.id = cmsChannel.getChannelId();
        this.label = cmsChannel.getChannelName();
        this.children = cmsChannel.getChildren().stream().map(TreeSelectWeb::new).collect(Collectors.toList());
    }
    public TreeSelectWeb(CmsSite cmsSite) {
        this.id = cmsSite.getId();
        this.label = cmsSite.getName();
        this.children = cmsSite.getChildren().stream().map(TreeSelectWeb::new).collect(Collectors.toList());
    }

    public Long getId()
    {
        return id;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public String getLabel()
    {
        return label;
    }

    public void setLabel(String label)
    {
        this.label = label;
    }

    public List<TreeSelectWeb> getChildren()
    {
        return children;
    }

    public void setChildren(List<TreeSelectWeb> children)
    {
        this.children = children;
    }
}
