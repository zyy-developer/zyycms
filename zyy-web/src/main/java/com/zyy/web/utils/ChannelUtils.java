package com.zyy.web.utils;

import com.zyy.common.core.redis.RedisCache;
import com.zyy.web.domain.CmsChannel;
import com.zyy.web.service.ICmsChannelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.List;

/**
 * 栏目缓存工具类
 */
@Component
public class ChannelUtils {

    @Autowired
    private RedisCache redisCache;

    @Autowired
    private ICmsChannelService iCmsChannelService;

    /** 根据栏目路径查询栏目信息 */
    public CmsChannel getChannelInfoByPath(Long siteId,String path){
        List<CmsChannel> channels = redisCache.getCacheObject("cmsChannelList");
        CmsChannel cmsChannel = channels.stream().filter(i -> i.getPath().equals(path) && i.getSiteId().equals(siteId)).findFirst().get();
        return cmsChannel;
    }


    /**将栏目添加到缓存 */
    @PostConstruct
    public void addChannelCache(){
        CmsChannel channel = new CmsChannel();
        channel.setStage("0");
        channel.setIsDelete("0");
        List<CmsChannel> cmsChannels = iCmsChannelService.selectCmsChannelListByTemp(channel);
        redisCache.setCacheObject("cmsChannelList",cmsChannels);
    }
}
