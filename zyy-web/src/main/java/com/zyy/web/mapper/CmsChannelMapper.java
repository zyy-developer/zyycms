package com.zyy.web.mapper;

import java.util.List;

import com.zyy.web.domain.CmsChannel;

/**
 * 栏目Mapper接口
 *
 * @author hnzyy sun
 * @date 2023-06-20
 */
public interface CmsChannelMapper
{
    /**
     * 查询栏目
     *
     * @param channelId 栏目主键
     * @return 栏目
     */
    public CmsChannel selectCmsChannelByChannelId(Long channelId);

    /**
     * 查询栏目列表
     *
     * @param cmsChannel 栏目
     * @return 栏目集合
     */
    public List<CmsChannel> selectCmsChannelList(CmsChannel cmsChannel);

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
     * 删除栏目
     *
     * @param channelId 栏目主键
     * @return 结果
     */
    public int deleteCmsChannelByChannelId(Long channelId);

    /**
     * 批量删除栏目
     *
     * @param channelIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCmsChannelByChannelIds(Long[] channelIds);

    /**
     * 通过当前栏目id获取所有父级栏目信息
     * @param channelId
     * @return
     */
    public List<CmsChannel> selectParentChannelList(Long channelId);


    /**
     * 根据链接名称查询栏目信息
     * @return
     */
    public CmsChannel selectChannelByPath(CmsChannel channel);
}
