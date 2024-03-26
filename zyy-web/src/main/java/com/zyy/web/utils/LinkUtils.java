package com.zyy.web.utils;

import com.zyy.common.core.redis.RedisCache;
import com.zyy.web.domain.CmsLinks;
import com.zyy.web.service.ICmsLinksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class LinkUtils {
    @Autowired
    private RedisCache redisCache;

    @Autowired
    private ICmsLinksService iCmsLinksService;

    public List<CmsLinks> getLinkListBySortId(Long linkSortId){
        List<CmsLinks> cmsLinks = redisCache.getCacheObject("cmsLinkList");
        List<CmsLinks> cmsLinksList = cmsLinks.stream().filter(i -> i.getLinkSortId().equals(linkSortId)).collect(Collectors.toList());
        return cmsLinksList;
    }


    /**将友情链接添加到缓存 */
    @PostConstruct
    public void addLinksCache(){
        CmsLinks links=new CmsLinks();
        List<CmsLinks> cmsLinks = iCmsLinksService.selectCmsLinksList(links);
        redisCache.setCacheObject("cmsLinkList",cmsLinks);
    }
}
