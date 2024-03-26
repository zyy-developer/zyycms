package com.zyy.web.controller;

import com.alibaba.fastjson.JSON;
import com.zyy.common.core.redis.RedisCache;
import com.zyy.common.utils.ServletUtils;
import com.zyy.common.utils.ip.AddressUtils;
import com.zyy.common.utils.uuid.IdUtils;
import com.zyy.web.domain.*;
import com.zyy.web.domain.vo.CmsWebVo;
import com.zyy.web.service.*;
import com.zyy.web.utils.*;

import com.zyy.web.utils.OsUtils;
import eu.bitwalker.useragentutils.UserAgent;
import org.checkerframework.checker.units.qual.C;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.PostConstruct;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

//网页跳转 Controller
@Controller
public class CmsWebController {

    @Autowired
    private ICmsChannelService cmsChannelService;

    @Autowired
    private ICmsContentService cmsContentService;

    @Autowired
    private ICmsSiteService cmsSiteService;

    @Autowired
    private ICmsModelService cmsModelService;

    @Autowired
    private ICmsVisitorLogService cmsVisitorLogService;

    @Autowired
    private CmsService cmsService;

    @Autowired
    private SiteUtils siteUtils;

    @Autowired
    private ChannelUtils channelUtils;

//    @Autowired
//    private RedisCache redisCache;

    //首页
    @RequestMapping(value = {"/","/c/{dire}"})
    public String toPage(@PathVariable(value = "dire",required = false) String dire,@RequestParam(value = "from",required = false,defaultValue = "false") String from,
                         ModelMap map,HttpServletRequest request,HttpServletResponse response) throws Exception {
        CmsSite siteInfoByDomain = siteUtils.getSiteInfoByDomain(request,response);
        CmsWebVo cmsWebVo=new CmsWebVo();
        cmsWebVo.setDireName("www");
        cmsWebVo.setTemplateScheme("");
        cmsWebVo.setTemplate("");
        if(dire!=null){
            cmsWebVo.setDireName(dire);
            siteInfoByDomain = siteUtils.getSiteInfoByDirectory(cmsWebVo.getDireName());
        }else if(siteInfoByDomain!=null){
            cmsWebVo.setDireName(siteInfoByDomain.getDirectory());
        }
        //判断是否静态化
        if(from.equals("false")) {
            if (siteInfoByDomain.getSetup().getSiteStatic().equals("0")) {
                return "redirect:/html/"+cmsWebVo.getDireName()+"/index.html";
            }
        }
        cmsWebVo = this.mainSystem(request, response, siteInfoByDomain, cmsWebVo);
        map.put("ctx",PathAddress(cmsWebVo.getTemplateScheme(),siteInfoByDomain));
        map.put("res",cmsWebVo.getDireName()+File.separator+cmsWebVo.getTemplateScheme());
        map.put("cms",cmsService);
        map.put("site",siteInfoByDomain);
        this.addVisitorLog(siteInfoByDomain.getId(),null,null,request,response);
        return cmsWebVo.getDireName()+File.separator+cmsWebVo.getTemplateScheme()+File.separator+"index"+File.separator+cmsWebVo.getTemplate();
    }

    //栏目页
    @RequestMapping(value = {"/{channel}.jhtml","/c/{dire}/{channel}.jhtml"})
    public String toMenu(@PathVariable(value = "dire",required = false) String dire, @PathVariable("channel") String channelPath,
                         ModelMap map,HttpServletRequest request,HttpServletResponse response) throws Exception {
        CmsSite siteInfoByDomain = siteUtils.getSiteInfoByDomain(request,response);
        CmsWebVo cmsWebVo=new CmsWebVo();
        cmsWebVo.setDireName("www");
        cmsWebVo.setTemplateScheme("");
        cmsWebVo.setTemplate("");
        if(dire!=null){
            cmsWebVo.setDireName(dire);
            siteInfoByDomain = siteUtils.getSiteInfoByDirectory(cmsWebVo.getDireName());
        }else if(siteInfoByDomain!=null){
            cmsWebVo.setDireName(siteInfoByDomain.getDirectory());
        }
        String page="1";
        int pageIndex = channelPath.indexOf("_");
        if(pageIndex!=-1){
            page=channelPath.substring(pageIndex+1,channelPath.length());
            channelPath=channelPath.substring(0,pageIndex);
        }
        cmsWebVo = this.mainSystem(request, response, siteInfoByDomain, cmsWebVo);

        CmsChannel cmsChannelInfo = channelUtils.getChannelInfoByPath(siteInfoByDomain.getId(), channelPath);
        if(cmsChannelInfo!=null){
            cmsWebVo.setTemplate(cmsChannelInfo.getTempId());
            //判断该栏目是否有指定模板 否则跳转至栏目模型指定的模板
            if(cmsWebVo.getTemplate()!=null&&!cmsWebVo.getTemplate().equals("")) {
                if (cmsWebVo.getTemplateScheme().equals("mobile")&&cmsChannelInfo.getTempMobile()!=null&&!cmsChannelInfo.getTempMobile().equals("")) {
                    cmsWebVo.setTemplate(cmsChannelInfo.getTempMobile());
                }
                cmsWebVo.setTemplate(cmsWebVo.getTemplate().substring(0,cmsWebVo.getTemplate().lastIndexOf(".")));
            }else{
                CmsModel cmsModel = cmsModelService.selectCmsModelByModelId(cmsChannelInfo.getChannelModel());
                if(cmsWebVo.getTemplateScheme().equals("mobile")){
                    cmsWebVo.setTemplate(cmsModel.getTempMobile());
                }else{
                    cmsWebVo.setTemplate(cmsModel.getTempDefault());
                }
                cmsWebVo.getTemplate().substring(0,cmsWebVo.getTemplate().lastIndexOf("."));
            }
            //站点风格
            if(siteInfoByDomain.getSetup().getSiteTempStyle()!=null&&!siteInfoByDomain.getSetup().getSiteTempStyle().equals("")){
                cmsWebVo.setTemplate(cmsWebVo.getTemplate()+"_"+siteInfoByDomain.getSetup().getSiteTempStyle());
            }
        }else{
            response.sendError(403,"非法请求");
        }

        map.put("channel",cmsChannelInfo);
        map.put("site",siteInfoByDomain);
        map.put("ctx",PathAddress(cmsWebVo.getTemplateScheme(),siteInfoByDomain));
        map.put("res",cmsWebVo.getDireName()+"/"+cmsWebVo.getTemplateScheme());
        map.put("cms",cmsService);
        map.put("page", page);
        this.addVisitorLog(siteInfoByDomain.getId(),cmsChannelInfo.getChannelId(), null,request,response);
        String tempUrl=cmsWebVo.getDireName()+File.separator+cmsWebVo.getTemplateScheme()+File.separator+"channel"+File.separator+cmsWebVo.getTemplate();
        return tempUrl;
    }

    //内容页
    @RequestMapping(value = {"/{channel}/{content}.jhtml","/c/{dire}/{channel}/{content}.jhtml"})
    public String toNewsDeatails(@PathVariable(value = "dire",required = false) String dire,@PathVariable("channel") String channelPath,
                                 @PathVariable("content") Long contentId,@RequestParam(value = "preview",required = false,defaultValue = "false") String preview,
                                 ModelMap map,HttpServletRequest request,HttpServletResponse response) throws Exception {
        CmsSite siteInfoByDomain = siteUtils.getSiteInfoByDomain(request,response);
        CmsWebVo cmsWebVo=new CmsWebVo();
        cmsWebVo.setDireName("www");
        cmsWebVo.setTemplateScheme("");
        cmsWebVo.setTemplate("");
        CmsContent cmsContent = cmsContentService.selectCmsContentByIdAndTemp(contentId);
        if ((cmsContent == null || !cmsContent.getStage().equals("0")) && preview.equals("false")) {
            response.sendError(403,"非法请求");
        }
        //镜像引用展示内容
//        if(cmsContent.getQuoteType()!=null&&cmsContent.getQuoteId()!=null&&cmsContent.getQuoteType().equals("1")){
//            CmsContent content = cmsContentService.selectCmsContentByIdAndTemp(cmsContent.getQuoteId());
//            cmsContent=content;
//        }
        if(dire!=null){
            cmsWebVo.setDireName(dire);
            siteInfoByDomain = siteUtils.getSiteInfoByDirectory(cmsWebVo.getDireName());
        }else if(siteInfoByDomain!=null){
            cmsWebVo.setDireName(siteInfoByDomain.getDirectory());
        }
        cmsWebVo = this.mainSystem(request, response, siteInfoByDomain, cmsWebVo);
        CmsChannel cmsChannelInfo = channelUtils.getChannelInfoByPath(siteInfoByDomain.getId(),channelPath);
        if(cmsChannelInfo==null||cmsContent==null){
            response.sendError(403,"非法请求");
        }
        CmsModel cmsModel = cmsModelService.selectCmsModelByModelId(cmsContent.getModelId());
        String tempName="";
        if (cmsWebVo.getTemplateScheme().equals("mobile")) {
            tempName=cmsModel.getTempMobile();
        }else{
            tempName=cmsModel.getTempDefault();
        }
        tempName = tempName.substring(0, tempName.lastIndexOf("."));

        //站点风格
        if(siteInfoByDomain.getSetup().getSiteTempStyle()!=null&&!siteInfoByDomain.getSetup().getSiteTempStyle().equals("")){
            tempName+="_"+siteInfoByDomain.getSetup().getSiteTempStyle();
        }
        map.put("content",cmsContent);
        map.put("ctx",PathAddress(cmsWebVo.getTemplateScheme(),siteInfoByDomain));
        map.put("res",cmsWebVo.getDireName()+"/"+cmsWebVo.getTemplateScheme());
        map.put("cms",cmsService);
        map.put("channel",cmsChannelInfo);
        map.put("site",siteInfoByDomain);
        if(preview.equals("false")) {
            this.addVisitorLog(siteInfoByDomain.getId(),null, contentId, request, response);
        }
        return cmsWebVo.getDireName()+File.separator+cmsWebVo.getTemplateScheme()+File.separator+"content"+File.separator+tempName;
    }

    //全站搜索
    @RequestMapping({"/search.htm","/c/{dire}/search.htm"})
    public String toSearchPage(@PathVariable(value = "dire",required = false) String dire,ModelMap map,HttpServletRequest request,HttpServletResponse response){
        CmsSite siteInfoByDomain = siteUtils.getSiteInfoByDomain(request,response);
        String direName="www";
        if(dire!=null){
            direName=dire;
            siteInfoByDomain = siteUtils.getSiteInfoByDirectory(direName);
        }
        String posit="default";
        map.put("ctx",PathAddress(posit,siteInfoByDomain));
        map.put("res",direName+File.separator+posit);
        map.put("cms",cmsService);
        map.put("site",siteInfoByDomain);
        return direName+File.separator+posit+File.separator+"search";
    }

    //获取静态资源路径
    public String PathAddress(String os, CmsSite site) {
        String strResult = "";
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes()).getRequest();
        StringBuffer strBuf = new StringBuffer();
        strBuf.append(site.getRequestMethod() + "://");
        strBuf.append(request.getServerName());
        if(request.getServerPort()!=80) {
            strBuf.append(":" + request.getServerPort() + "");
        }
        strBuf.append(request.getContextPath());
        strResult = strBuf.toString()+"/"+site.getDirectory()+"/"+os+"/static";
        return strResult;
    }


    /**
     * 增加访客记录
     */
    public void addVisitorLog(Long siteId,Long channelId, Long contentId, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String ipAddr = IpUtil.getIpAddr(request);
        StringBuffer requestURL = request.getRequestURL();
        UserAgent userAgent = UserAgent.parseUserAgentString(ServletUtils.getRequest().getHeader("User-Agent"));
        CmsVisitorLog cmsVisitorLog = new CmsVisitorLog();
        cmsVisitorLog.setIp(ipAddr);
        cmsVisitorLog.setOs(userAgent.getOperatingSystem().getName());
        cmsVisitorLog.setChannelId(channelId);
        cmsVisitorLog.setContentId(contentId);
        cmsVisitorLog.setSiteId(siteId);
        cmsVisitorLog.setPagePath(requestURL.toString());
        String address=IpUtil.getIpRegion(ipAddr);
        if(address!=null&&!address.equals("")){
            String[] IpRegions = address.split("\\|");
            cmsVisitorLog.setRegion(IpRegions[0]);
            if(IpRegions.length>1){
                cmsVisitorLog.setCity(IpRegions[1]);
            }
        }
        Cookie[] cookies = request.getCookies();
        if(cookies !=null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("zyyCmsKey")) {
                    if(cookie.getValue()!=null) {
                        cmsVisitorLog.setCookie(cookie.getValue());
                        break;
                    }
                }
            }
        }
        if(cmsVisitorLog.getCookie()==null){
            String uuid=IdUtils.randomUUID();
            Cookie cookie = new Cookie("zyyCmsKey", uuid);
            cookie.setMaxAge(60 * 60 * 24 * 30);
            cookie.setPath("/");
            response.addCookie(cookie);
            cmsVisitorLog.setCookie(uuid);
        }
        cmsVisitorLogService.insertCmsVisitorLog(cmsVisitorLog);
    }

    /**
     * 跳转错误页面
     */
    public String toErrorPage(ModelMap map, CmsSite site){
        String direName="";
        map.put("ctx",PathAddress("default",site));
        map.put("res",site.getDirectory()+"/"+"default");
        CmsSite cmsSite = cmsSiteService.selectCmsSiteByDirectory(site.getDirectory());
        map.put("cms",cmsService);
        if(cmsSite!=null){
            direName=cmsSite.getDirectory();
            map.put("site",cmsSite);
        }
        return direName+File.separator+"default"+File.separator+"error"+File.separator+"404";
    }

    //判断站点是否关停
    public CmsWebVo mainSystem(HttpServletRequest request,HttpServletResponse response,CmsSite cmsSite,CmsWebVo cmsWebVo){
        if(cmsSite!=null&&cmsSite.getSetup().getSiteStop().equals("1")){
            try {
                response.sendError(403,"非法请求");
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        //模板方案
        String osName = OsUtils.getOsName(request);
        if((osName.equals("Android")||osName.equals("IPhone"))&&cmsSite.getSetup().getSiteAdaption().equals("1")){
            cmsWebVo.setTemplateScheme(cmsSite.getSetup().getSiteTempSchemeMobile());
        }else {
            cmsWebVo.setTemplateScheme(cmsSite.getSetup().getSiteTempSchemePc());
        }
        //网站风格
        if(cmsSite.getSetup().getSiteTempStyle()!=null&&!cmsSite.getSetup().getSiteTempStyle().equals("")){
            cmsWebVo.setTemplate("index_"+cmsSite.getSetup().getSiteTempStyle());
        }else {
            cmsWebVo.setTemplate("index");
        }
        return cmsWebVo;
    }


}
