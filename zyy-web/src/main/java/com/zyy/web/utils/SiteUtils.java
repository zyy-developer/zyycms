package com.zyy.web.utils;

import com.zyy.common.core.redis.RedisCache;
import com.zyy.web.domain.CmsSite;
import com.zyy.web.domain.CmsSiteSetup;
import com.zyy.web.service.ICmsSiteService;
import com.zyy.web.service.ICmsSiteSetupService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Component
public class SiteUtils {

    @Autowired
    private ICmsSiteService cmsSiteService;

    @Autowired
    private RedisCache redisCache;

    @Autowired
    private ICmsSiteSetupService cmsSiteSetupService;


    /**
     * 通过域名查询站点
     * @param request
     * @return
     */
    public CmsSite getSiteInfoByDomain(HttpServletRequest request, HttpServletResponse response){
        String serverName = request.getServerName();
        List<CmsSite> cmsSiteList = redisCache.getCacheObject("cmsSiteList");
        CmsSite cmsSite = cmsSiteList.stream().filter(i -> i.getDomainName().indexOf(serverName)!=-1).findFirst().get();
        cmsSite.setSetup(this.getSiteSetUpInfo(cmsSite.getId()));
        return cmsSite;
    }
    /**
     * 通过站点Id查询站点
     * @param siteId
     * @return
     */
    public CmsSite getSiteInfoBySiteId(Long siteId){
        List<CmsSite> cmsSiteList = redisCache.getCacheObject("cmsSiteList");
        for(CmsSite cmsSite:cmsSiteList){
            if(cmsSite.getId()!=null&&cmsSite.getId().equals(siteId)){
                return cmsSite;
            }
        }
        return null;
    }

    /**
     * 通过站点路径查询站点
     * @param directory
     * @return
     */
    public CmsSite getSiteInfoByDirectory(String directory){
        List<CmsSite> cmsSiteList = redisCache.getCacheObject("cmsSiteList");
        CmsSite cmsSite = cmsSiteList.stream().filter(i -> i.getDirectory().equals(directory)).findFirst().get();
        cmsSite.setSetup(this.getSiteSetUpInfo(cmsSite.getId()));
        return cmsSite;
    }


    /**
     * 获取站点设置
     * @param siteId
     * @return
     */
    public CmsSiteSetup getSiteSetUpInfo(Long siteId){
        List<CmsSiteSetup> cmsSiteSetUpList = redisCache.getCacheObject("cmsSiteSetUpList");
        CmsSiteSetup siteSetup = cmsSiteSetUpList.stream().filter(i -> i.getSiteId().equals(siteId)).findFirst().get();
        return siteSetup;
    }


    /**
     * 将站点设置列表添加到缓存
     */
    @PostConstruct
    public void getIpRegion(){
        List<CmsSiteSetup> cmsSites = cmsSiteSetupService.selectCmsSiteSetupList(new CmsSiteSetup());
        redisCache.setCacheObject("cmsSiteSetUpList",cmsSites);
    }


    /**
     * 将站点列表添加到缓存
     */
    @PostConstruct
    public void setSiteListToCache(){
        List<CmsSite> cmsSites = cmsSiteService.selectCmsSiteList(new CmsSite());
        redisCache.setCacheObject("cmsSiteList",cmsSites);
    }
}
