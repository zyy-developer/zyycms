package com.zyy.web.service.impl;

import java.util.*;
import java.util.stream.Collectors;


import com.alibaba.fastjson2.JSONObject;
import com.zyy.common.utils.DateUtils;
import com.zyy.common.utils.StringUtils;
import com.zyy.web.domain.CmsAttr;
import com.zyy.web.domain.TreeSelectWeb;
import com.zyy.web.mapper.CmsAttrMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyy.web.mapper.CmsChannelMapper;
import com.zyy.web.domain.CmsChannel;
import com.zyy.web.service.ICmsChannelService;

/**
 * 栏目Service业务层处理
 *
 * @author hnzyy sun
 * @date 2023-06-20
 */
@Service
public class CmsChannelServiceImpl implements ICmsChannelService
{
    @Autowired
    private CmsChannelMapper cmsChannelMapper;

    @Autowired
    private CmsAttrMapper cmsAttrMapper;

    /**
     * 查询栏目
     *
     * @param channelId 栏目主键
     * @return 栏目
     */
    @Override
    public CmsChannel selectCmsChannelByChannelId(Long channelId)
    {
        CmsChannel channel = cmsChannelMapper.selectCmsChannelByChannelId(channelId);
        getAttr(channel);
        return channel;
    }

    @Override
    public CmsChannel selectCmsChannelByIdAndTemp(Long id) {
        CmsChannel channel = cmsChannelMapper.selectCmsChannelByChannelId(id);
        getAttrByCms(channel);
        return channel;
    }

    /**
     * 查询栏目列表
     *
     * @param cmsChannel 栏目
     * @return 栏目
     */
    @Override
    public List<CmsChannel> selectCmsChannelList(CmsChannel cmsChannel)
    {
        List<CmsChannel> cmsChannels = cmsChannelMapper.selectCmsChannelList(cmsChannel);
        getAttrs(cmsChannels);
        return cmsChannels;
    }

    @Override
    public List<CmsChannel> selectCmsChannelListByTemp(CmsChannel cmsChannel) {
        List<CmsChannel> cmsChannels = cmsChannelMapper.selectCmsChannelList(cmsChannel);
        getAttrsByCms(cmsChannels);
        return cmsChannels;
    }

    /**
     * 新增栏目
     *
     * @param cmsChannel 栏目
     * @return 结果
     */
    @Override
    public int insertCmsChannel(CmsChannel cmsChannel)
    {

        cmsChannel.setCreateTime(DateUtils.getNowDate());
        return cmsChannelMapper.insertCmsChannel(cmsChannel);
    }

    /**
     * 修改栏目
     *
     * @param cmsChannel 栏目
     * @return 结果
     */
    @Override
    public int updateCmsChannel(CmsChannel cmsChannel)
    {
        return cmsChannelMapper.updateCmsChannel(cmsChannel);
    }

    /**
     * 批量删除栏目
     *
     * @param channelIds 需要删除的栏目主键
     * @return 结果
     */
    @Override
    public int deleteCmsChannelByChannelIds(Long[] channelIds)
    {
        return cmsChannelMapper.deleteCmsChannelByChannelIds(channelIds);
    }

    /**
     * 删除栏目信息
     *
     * @param channelId 栏目主键
     * @return 结果
     */
    @Override
    public int deleteCmsChannelByChannelId(Long channelId)
    {
        return cmsChannelMapper.deleteCmsChannelByChannelId(channelId);
    }

    @Override
    public List<CmsChannel> selectParentChannelList(Long channelId) {
        return cmsChannelMapper.selectParentChannelList(channelId);
    }

    @Override
    public List<TreeSelectWeb> selectDeptTreeList(CmsChannel cmsChannel) {
        List<CmsChannel> depts = cmsChannelMapper.selectCmsChannelList(cmsChannel);
        return buildDeptTreeSelect(depts);
    }

    @Override
    public List<CmsChannel> buildDeptTree(List<CmsChannel> cmsChannels) {
        List<CmsChannel> returnList = new ArrayList<CmsChannel>();
        List<Long> tempList = cmsChannels.stream().map(CmsChannel::getChannelId).collect(Collectors.toList());
        for (CmsChannel dept : cmsChannels)
        {
            // 如果是顶级节点, 遍历该父节点的所有子节点
            if (!tempList.contains(dept.getParentId()))
            {
                recursionFn(cmsChannels, dept);
                returnList.add(dept);
            }
        }
        if (returnList.isEmpty())
        {
            returnList = cmsChannels;
        }
        return returnList;
    }

    @Override
    public List<TreeSelectWeb> buildDeptTreeSelect(List<CmsChannel> cmsChannels) {
        List<CmsChannel> deptTrees = buildDeptTree(cmsChannels);
        return deptTrees.stream().map(TreeSelectWeb::new).collect(Collectors.toList());
    }

    @Override
    public CmsChannel selectChannelByPath(CmsChannel channel) {
        CmsChannel cmsChannel = cmsChannelMapper.selectChannelByPath(channel);
        getAttrByCms(cmsChannel);
        return cmsChannel;
    }


    /**
     * 递归列表
     */
    private void recursionFn(List<CmsChannel> list, CmsChannel t)
    {
        // 得到子节点列表
        List<CmsChannel> childList = getChildList(list, t);
        t.setChildren(childList);
        for (CmsChannel tChild : childList)
        {
            if (hasChild(list, tChild))
            {
                recursionFn(list, tChild);
            }
        }
    }

    /**
     * 得到子节点列表
     */
    private List<CmsChannel> getChildList(List<CmsChannel> list, CmsChannel t)
    {
        List<CmsChannel> tlist = new ArrayList<CmsChannel>();
        Iterator<CmsChannel> it = list.iterator();
        while (it.hasNext())
        {
            CmsChannel n = (CmsChannel) it.next();
            if (StringUtils.isNotNull(n.getParentId()) && n.getParentId().longValue() == t.getChannelId().longValue())
            {
                tlist.add(n);
            }
        }
        return tlist;
    }

    /**
     * 判断是否有子节点
     */
    private boolean hasChild(List<CmsChannel> list, CmsChannel t)
    {
        return getChildList(list, t).size() > 0;
    }


    public void getAttr(CmsChannel channel){
        if(channel==null){
            return;
        }
        List<CmsChannel> list = new ArrayList<>();
        list.add(channel);
        List<CmsAttr> cmsAttrs = cmsAttrMapper.selectCmsAttrListByChannelIds(list);
        Map<String, Object> map = new HashMap<>();
        for (CmsAttr attr : cmsAttrs) {
            if (channel.getChannelId().equals(attr.getContentId())) {
                map.put(attr.getAttrName(), attr.getAttrValue());
                continue;
            }
        }
        channel.setAttr(new JSONObject(map));
    }

    public void getAttrs(List<CmsChannel> cmsChannels){
        if(cmsChannels==null||cmsChannels.size()==0){
            return;
        }
        List<CmsAttr> cmsAttrs = cmsAttrMapper.selectCmsAttrListByChannelIds(cmsChannels);
        for (CmsChannel channel:cmsChannels){
            Map<String,Object> map=new HashMap<>();
            for (CmsAttr attr: cmsAttrs) {
                if(channel.getChannelId().equals(attr.getChannelId())){
                    map.put(attr.getAttrName(), attr.getAttrValue());
                    continue;
                }
            }
            channel.setAttr(new JSONObject(map));
        }
    }

    public void getAttrByCms(CmsChannel channel){
        if(channel==null){
            return;
        }
        List<CmsChannel> list = new ArrayList<>();
        list.add(channel);
        List<CmsAttr> cmsAttrs = cmsAttrMapper.selectCmsAttrListByChannelIds(list);
        Map<String, Object> map = new HashMap<>();
        for (CmsAttr attr : cmsAttrs) {
            if(channel.getChannelId().equals(attr.getChannelId())) {
                if (attr.getAttrValue().indexOf("[") != -1 && attr.getAttrValue().indexOf("]") != -1) {
                    List jsonObjectList = JSONObject.parseObject(attr.getAttrValue(), List.class);
                    if (jsonObjectList.size() == 0) {
                        JSONObject json = new JSONObject();
                        json.put("url", "");
                        jsonObjectList.add(json);
                    }
                    map.put(attr.getAttrName(), jsonObjectList);
                } else {
                    map.put(attr.getAttrName(), attr.getAttrValue());
                }
                continue;
            }
        }
        channel.setAttr(new JSONObject(map));
    }

    public void getAttrsByCms(List<CmsChannel> cmsChannels){
        if(cmsChannels==null||cmsChannels.size()==0){
            return;
        }
        List<CmsAttr> cmsAttrs = cmsAttrMapper.selectCmsAttrListByChannelIds(cmsChannels);
        for (CmsChannel channel:cmsChannels) {
            Map<String, Object> map = new HashMap<>();
            for (CmsAttr attr : cmsAttrs) {
                if(channel.getChannelId().equals(attr.getChannelId())) {
                    if (attr.getAttrValue().indexOf("[") != -1 && attr.getAttrValue().indexOf("]") != -1) {
                        List jsonObjectList = JSONObject.parseObject(attr.getAttrValue(), List.class);
                        if (jsonObjectList.size() == 0) {
                            JSONObject json = new JSONObject();
                            json.put("url", "");
                            jsonObjectList.add(json);
                        }
                        map.put(attr.getAttrName(), jsonObjectList);
                    } else {
                        map.put(attr.getAttrName(), attr.getAttrValue());
                    }
                    continue;
                }
            }
            channel.setAttr(new JSONObject(map));
        }
    }
}
