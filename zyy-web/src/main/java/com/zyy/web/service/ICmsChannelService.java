package com.zyy.web.service;

import java.util.List;

import com.zyy.web.domain.CmsChannel;
import com.zyy.web.domain.TreeSelectWeb;

/**
 * 栏目Service接口
 *
 * @author hnzyy sun
 * @date 2023-06-20
 */
public interface ICmsChannelService
{
    /**
     * 查询栏目
     *
     * @param channelId 栏目主键
     * @return 栏目
     */
    public CmsChannel selectCmsChannelByChannelId(Long channelId);

    /**
     * 查询栏目（模板）
     *
     * @param id 文章管理主键
     * @return 文章管理
     */
    public CmsChannel selectCmsChannelByIdAndTemp(Long id);

    /**
     * 查询栏目列表
     *
     * @param cmsChannel 栏目
     * @return 栏目集合
     */
    public List<CmsChannel> selectCmsChannelList(CmsChannel cmsChannel);

    /**
     * 查询文章管理列表(模板展示列表)
     *
     * @param cmsChannel 文章管理
     * @return 文章管理集合
     */
    public List<CmsChannel> selectCmsChannelListByTemp(CmsChannel cmsChannel);

    /**
     * 新增栏目
     *
     * @param cmsChannel 栏目
     * @return 结果
     */
    public int insertCmsChannel(CmsChannel cmsChannel);

    /**
     * 修改栏目
     *
     * @param cmsChannel 栏目
     * @return 结果
     */
    public int updateCmsChannel(CmsChannel cmsChannel);

    /**
     * 批量删除栏目
     *
     * @param channelIds 需要删除的栏目主键集合
     * @return 结果
     */
    public int deleteCmsChannelByChannelIds(Long[] channelIds);

    /**
     * 删除栏目信息
     *
     * @param channelId 栏目主键
     * @return 结果
     */
    public int deleteCmsChannelByChannelId(Long channelId);

    /**
     * 通过当前栏目id获取所有父级栏目信息
     * @param channelId
     * @return
     */
    public List<CmsChannel> selectParentChannelList(Long channelId);


    /**
     * 查询栏目树结构信息
     *
     * @param cmsChannel 栏目信息
     * @return 栏目树信息集合
     */
    public List<TreeSelectWeb> selectDeptTreeList(CmsChannel cmsChannel);

    /**
     * 构建前端所需要树结构
     *
     * @param cmsChannels 栏目列表
     * @return 树结构列表
     */
    public List<CmsChannel> buildDeptTree(List<CmsChannel> cmsChannels);

    /**
     * 构建前端所需要下拉树结构
     *
     * @param cmsChannels 栏目列表
     * @return 下拉树结构列表
     */
    public List<TreeSelectWeb> buildDeptTreeSelect(List<CmsChannel> cmsChannels);

    /**
     * 根据链接名称查询栏目信息
     * @return
     */
    public CmsChannel selectChannelByPath(CmsChannel channel);
}
