package com.zyy.web.service;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.zyy.common.core.controller.BaseController;
import com.zyy.common.core.page.TableDataInfo;
import com.zyy.common.core.redis.RedisCache;
import com.zyy.common.utils.PageUtils;
import com.zyy.web.domain.CmsChannel;
import com.zyy.web.domain.CmsContent;
import com.zyy.web.domain.CmsLinks;
import com.zyy.web.utils.LinkUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
public class CmsService extends BaseController {

    @Autowired
    private ICmsContentService iCmsContentService;

    @Autowired
    private ICmsChannelService iCmsChannelService;

    @Autowired
    private ICmsLinksService iCmsLinksService;

    @Autowired
    private RedisCache redisCache;

    @Autowired
    private LinkUtils linkUtils;

    /**
     * 前端获取文章列表
     *
     * @param
     * @return 参数键值
     */
    public List<CmsContent> getContentList(String json)
    {
        JSONObject jsonObject = JSONObject.parseObject("{"+json+"}");
        CmsContent cmsContent = JSON.toJavaObject(jsonObject, CmsContent.class);
        cmsContent.setStage("0");
        cmsContent.setIsDelete("0");
        List<CmsContent> cmsContents = iCmsContentService.selectCmsContentListByTemp(cmsContent);
        return cmsContents;
    }

    /**
     * 前端获取文章列表(分页)
     *
     * @param
     * @return 参数键值
     */
    public TableDataInfo getContentPage(String json)
    {
        JSONObject jsonObject = JSONObject.parseObject("{"+json+"}");
        CmsContent cmsContent = JSON.toJavaObject(jsonObject, CmsContent.class);
        cmsContent.setStage("0");
        cmsContent.setIsDelete("0");
        PageUtils.startCmsPage(cmsContent.getPageNo(),cmsContent.getCount());
        cmsContent.setCount(null);
        List<CmsContent> cmsContents = iCmsContentService.selectCmsContentListByTemp(cmsContent);
        TableDataInfo dataTable = getDataTable(cmsContents);
        return dataTable;
    }

    /**
     * 获取栏目信息
     * @return
     */
    public CmsChannel getChannel(String json){
        JSONObject jsonObject = JSONObject.parseObject("{"+json+"}");
        CmsChannel cmsContent = JSON.toJavaObject(jsonObject, CmsChannel.class);
        CmsChannel cmsChannel = iCmsChannelService.selectCmsChannelByIdAndTemp(cmsContent.getChannelId());
        return cmsChannel;
    }

    /**
     * 获取文章信息
     * @return
     */
    public CmsContent getContent(String json){
        JSONObject jsonObject = JSONObject.parseObject("{"+json+"}");
        CmsContent cmsContent = JSON.toJavaObject(jsonObject, CmsContent.class);
        CmsContent cmsContent1 = iCmsContentService.selectCmsContentByContent(cmsContent);
        return cmsContent1;
    }

    /**
     * 前端获取栏目列表
     * @param json
     * @return
     */
    public List<CmsChannel> getChannelList(String json){
        JSONObject jsonObject = JSONObject.parseObject("{"+json+"}");
        CmsChannel cmsChannel = JSON.toJavaObject(jsonObject, CmsChannel.class);
//        cmsChannel.setStage("0");
//        cmsChannel.setIsDelete("0");
        List<CmsChannel>  cmsChannels =  redisCache.getCacheObject("cmsChannelList");
        List<CmsChannel> channels = cmsChannels.stream().filter(i -> queryChannel(i,cmsChannel)).collect(Collectors.toList());
//        List<CmsChannel> cmsChannels = iCmsChannelService.selectCmsChannelListByTemp(cmsChannel);
        return channels;
    }

    /**
     * 文章增加访问量
     */
    public String addView(Long contentId){
        CmsContent cmsContent = new CmsContent();
        cmsContent.setId(contentId);
        cmsContent.setViews(1L);
        iCmsContentService.addViews(cmsContent);
        return "0";
    }

    /**
     * 根据栏目id查询父级栏目信息
     * @param channelId
     * @return
     */
    public List<CmsChannel> getParentChannelList(Long channelId){
        return iCmsChannelService.selectParentChannelList(channelId);
    }

    /**
     * 获取友情链接列表
     * @param json
     * @return
     */
    public List<CmsLinks> getLinksList(String json){
        JSONObject jsonObject = JSONObject.parseObject("{"+json+"}");
        CmsLinks cmsLinks = JSON.toJavaObject(jsonObject, CmsLinks.class);
        List<CmsLinks> linkList = linkUtils.getLinkListBySortId(cmsLinks.getLinkSortId());
        return linkList;
    }

    private boolean queryChannel(CmsChannel item,CmsChannel channel){
        if(channel.getSiteId()!=null&&channel.getParentId()!=null){
            if(channel.getParentId().equals(item.getParentId())&&channel.getSiteId().equals(item.getSiteId())){
                return true;
            }
        }else if(channel.getSiteId()==null&&channel.getParentId()!=null){
            if(channel.getParentId().equals(item.getParentId())){
                return true;
            }
        }else if(channel.getSiteId()!=null&&channel.getParentId()==null){
            if(channel.getSiteId().equals(item.getSiteId())){
                return true;
            }
        }
        return false;
    }
}
