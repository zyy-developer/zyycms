package com.zyy.web.controller;

import com.zyy.common.core.controller.BaseController;
import com.zyy.common.core.domain.AjaxResult;
import com.zyy.common.core.domain.model.LoginUser;
import com.zyy.common.core.redis.RedisCache;
import com.zyy.common.utils.SecurityUtils;
import com.zyy.web.domain.CmsChannel;
import com.zyy.web.domain.CmsContent;
import com.zyy.web.domain.CmsModel;
import com.zyy.web.domain.CmsSite;
import com.zyy.web.service.*;
import com.zyy.web.utils.OsUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 生成静态页面Controller
 * @author hnzyy sun
 */
@RestController
@RequestMapping("/web/staicPage")
public class CmsStaticPageController extends BaseController {

    @Autowired
    private ICmsChannelService cmsChannelService;

    @Autowired
    private ICmsSiteService cmsSiteService;

    @Autowired
    private TemplateEngine templateEngine;

    @Autowired
    private ICmsModelService cmsModelService;

    @Autowired
    private ICmsContentService cmsContentService;

    @Autowired
    private CmsService cmsService;

    @Autowired
    private RedisCache redisCache;

    @Value("${zyy.staticHtml}")
    private String staticHtml;

    @PostMapping("/createAllPage")
    public AjaxResult createAllPage(HttpServletRequest request) throws IOException {
        //生成首页
        this.toIndexPage(request);
        //生成栏目页
        this.toChannelPage(request);
        //生成内容页
        this.toContentPage(request);
        return AjaxResult.success();
    }

    /**
     * 首页
     * @return
     * @throws IOException
     */
    @PostMapping("/index")
    public AjaxResult toIndexPage(HttpServletRequest request) throws IOException {
        makeHtml(templateEngine,toIndexHtml(request));
        return AjaxResult.success();
    }

    /**
     * 栏目页
     * @return
     * @throws IOException
     */
    @PostMapping("/channel")
    public AjaxResult toChannelPage(HttpServletRequest request) throws IOException {
        LoginUser principal = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        CmsChannel cmsChannel = new CmsChannel();
        cmsChannel.setStage("0");
        cmsChannel.setSiteId(principal.getSiteId());
        List<CmsChannel> cmsChannels = cmsChannelService.selectCmsChannelList(cmsChannel);
        for (CmsChannel channel:cmsChannels) {
            makeHtml(templateEngine,toChannelHtml(channel.getPath(),null,request));
            File file=new File(staticHtml+File.separator+getSiteDirectory(channel.getSiteId())+File.separator+channel.getPath()+".html");
            if(file.exists()) {
                //创建BufferedReader读取文件内容
                BufferedReader br = new BufferedReader(new FileReader(file));
                StringBuffer buffer = new StringBuffer();
                String line;
                while ((line = br.readLine()) != null) {
                    buffer.append(line);
                }
                br.close();
                //生成分页
                int pagesNum = buffer.indexOf("totalPageNum=");
                if (pagesNum != -1) {
                    String pageNum = buffer.substring(pagesNum + "totalPageNum=".length(), buffer.length());
                    pageNum = pageNum.substring(0, pageNum.indexOf(";"));
                    for (int i = 1; i <=Integer.parseInt(pageNum); i++) {
                        makeHtml(templateEngine,toChannelHtml(channel.getPath()+"_"+i,i,request));
                    }
                }
            }
        }
        return AjaxResult.success();
    }

    /**
     * 内容页
     * @return
     * @throws IOException
     */
    @PostMapping("/content")
    public AjaxResult toContentPage(HttpServletRequest request) throws IOException {
        LoginUser principal = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        CmsChannel cmsChannel = new CmsChannel();
        cmsChannel.setStage("0");
        cmsChannel.setSiteId(principal.getSiteId());
        List<CmsChannel> cmsChannels = cmsChannelService.selectCmsChannelList(cmsChannel);
        for (CmsChannel channel:cmsChannels) {
            CmsContent cmsContent = new CmsContent();
            cmsContent.setChannelId(channel.getChannelId());
            cmsContent.setStage("0");
            List<CmsContent> cmsContents = cmsContentService.selectCmsContentList(cmsContent);
            for (CmsContent content:cmsContents) {
                makeHtml(templateEngine,toContentDetails(content.getId(),request));
            }
        }
        return AjaxResult.success();
    }

    //生成首页
    public Map<String, Object> toIndexHtml(HttpServletRequest request){
        Map<String, Object> map = new HashMap<>();
        String direName="www";
        LoginUser principal = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        CmsSite cmsSite = cmsSiteService.selectCmsSiteById(principal.getSiteId());
        if(cmsSite!=null){
            direName=cmsSite.getDirectory();
            map.put("site",cmsSite);
        }
        String osName = OsUtils.getOsName(request);
        String posit = "";
        if((osName.equals("Android")||osName.equals("IPhone"))&&cmsSite.getSetup().getSiteAdaption().equals("1")){
            posit=cmsSite.getSetup().getSiteTempSchemeMobile();
        }else {
            posit=cmsSite.getSetup().getSiteTempSchemePc();
        }
        File siteDir = new File(staticHtml + File.separator + direName);
        if(!siteDir.exists()){
            siteDir.mkdirs();
        }

        String homePath=cmsSite.getSetup().getSiteHomePath();
        String tempId=homePath!=null?homePath.substring(0,homePath.lastIndexOf(".html")):"index";
        map.put("ctx",PathAddress(posit,cmsSite));
        map.put("res",direName+ File.separator+posit);
        map.put("cms",cmsService);
        String tempPath = direName+File.separator+posit+File.separator+"index"+File.separator+tempId;
        map.put("tempPath",tempPath);
        map.put("fileName","index");
        map.put("direName",direName);
        return map;
    }

    //生成栏目页
    public Map<String, Object> toChannelHtml(String channelPath,Integer page,HttpServletRequest request){
        Map<String, Object> map = new HashMap<>();
        LoginUser principal = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        CmsSite cmsSite = cmsSiteService.selectCmsSiteById(principal.getSiteId());
        String direName="www";
        if(cmsSite!=null){
            direName=cmsSite.getDirectory();
            map.put("site",cmsSite);
        }
        String osName = OsUtils.getOsName(request);
        String posit = "";
        String mode = "";
        if((osName.equals("Android")||osName.equals("IPhone"))&&cmsSite.getSetup().getSiteAdaption().equals("1")){
            posit=cmsSite.getSetup().getSiteTempSchemeMobile();
            mode = "mobile";
        }else {
            posit=cmsSite.getSetup().getSiteTempSchemePc();
            mode = "default";
        }
        int pageIndex = channelPath.indexOf("_");
        String path=channelPath;
        if(pageIndex!=-1){
            path=channelPath.substring(0,pageIndex);
        }
        CmsChannel cmsChannel = new CmsChannel();
        cmsChannel.setSiteId(cmsSite.getId());
        cmsChannel.setPath(path);
        CmsChannel cmsChannelInfo = cmsChannelService.selectChannelByPath(cmsChannel);
        if(cmsChannelInfo!=null){
            if(cmsChannelInfo.getExternalLink()!=null){
                return null;
            }
            String tempId = cmsChannelInfo.getTempId();
            //判断该栏目是否有指定模板 否则跳转至栏目模型指定的模板
            if(tempId!=null&&!tempId.equals("")&&cmsChannelInfo.getTempMobile()!=null&&!cmsChannelInfo.getTempMobile().equals("")) {
                if (mode.equals("mobile")) {
                    tempId = cmsChannelInfo.getTempMobile();
                }
                tempId = tempId.substring(0, tempId.lastIndexOf("."));
            }else{
                CmsModel cmsModel = cmsModelService.selectCmsModelByModelId(cmsChannelInfo.getChannelModel());
                if (mode.equals("mobile")) {
                    tempId=cmsModel.getTempMobile();
                }else{
                    tempId=cmsModel.getTempDefault();
                }
                tempId = tempId.substring(0, tempId.lastIndexOf("."));
            }
            map.put("channel",cmsChannelInfo);
            map.put("ctx",PathAddress(posit,cmsSite));
            map.put("res",direName+"/"+posit);
            map.put("cms",cmsService);
            map.put("page", page!=null?page:1);
            String tempPath = direName+File.separator+posit+File.separator+"channel"+File.separator+tempId;
            map.put("tempPath",tempPath);
            map.put("fileName",channelPath);
            map.put("direName",direName);
            return map;
        }
        return null;
    }

    //生成内容页
    public Map<String, Object> toContentDetails(Long contentId, HttpServletRequest request){
        Map<String, Object> map = new HashMap<>();
        LoginUser principal = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        CmsContent cmsContent = cmsContentService.selectCmsContentByIdAndTemp(contentId);
        String direName="www";
        if(cmsContent==null||!cmsContent.getStage().equals("0")){
            return null;
        }
        CmsSite cmsSite = cmsSiteService.selectCmsSiteById(principal.getSiteId());
        if(cmsSite!=null){
            direName=cmsSite.getDirectory();
            map.put("site",cmsSite);
        }else{
            return null;
        }
        String osName = OsUtils.getOsName(request);
        String posit = "";
        String mode = "";
        if((osName.equals("Android")||osName.equals("IPhone"))&&cmsSite.getSetup().getSiteAdaption().equals("1")){
            posit=cmsSite.getSetup().getSiteTempSchemeMobile();
            mode = "mobile";
        }else {
            posit=cmsSite.getSetup().getSiteTempSchemePc();
            mode = "default";
        }
        CmsChannel cmsChannelInfo = cmsChannelService.selectCmsChannelByChannelId(cmsContent.getChannelId());
        if(cmsChannelInfo==null){
            return null;
        }
        File file=new File(staticHtml+File.separator+direName+File.separator+cmsChannelInfo.getPath());
        if(!file.exists()){
            file.mkdirs();
        }
        CmsModel cmsModel = cmsModelService.selectCmsModelByModelId(cmsContent.getModelId());
        String tempName="";
        if (mode.equals("mobile")) {
            tempName=cmsModel.getTempMobile();
        }else{
            tempName=cmsModel.getTempDefault();
        }
        tempName = tempName.substring(0, tempName.lastIndexOf("."));
        map.put("content",cmsContent);
        map.put("ctx",PathAddress(posit,cmsSite));
        map.put("res",direName+"/"+posit);
        map.put("cms",cmsService);
        map.put("channel",cmsChannelInfo);
        String tempPath=direName+File.separator+posit+File.separator+"content"+File.separator+tempName;
        map.put("tempPath",tempPath);
        map.put("fileName",cmsChannelInfo.getPath()+File.separator+cmsContent.getId());
        map.put("direName",direName);
        return map;
    }



    //获取静态资源路径
    public String PathAddress(String os,CmsSite site) {
        String strResult = "";
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes()).getRequest();
        StringBuffer strBuf = new StringBuffer();
        strBuf.append(site.getRequestMethod() + "://");
        strBuf.append(request.getServerName());
        if(request.getServerPort()!=80) {
            strBuf.append(":" + request.getServerPort() + "");
        }
        strBuf.append(request.getContextPath() );
        strResult = strBuf.toString()+"/"+site.getDirectory()+"/"+os+"/static";
        return strResult;
    }


    //生成html页面
    public void makeHtml(TemplateEngine templateEngine,Map<String, Object> model){
        if(model==null){
            return;
        }
        FileWriter writer = null;
        String fileName = (String) model.get("fileName");
        String direName = (String) model.get("direName");
        File file = new File(staticHtml+File.separator+direName+File.separator+fileName+".html");
        try {
            writer = new FileWriter(file, Charset.forName("UTF-8"));
        } catch (IOException ioException) {
            ioException.printStackTrace();
        }
        //创建Context对象(存放Model)
        Context context = new Context();
        //放入数据
        context.setVariables(model);
        //创建静态文件,"text"是模板html名字
        String tempPath = (String) model.get("tempPath");
        try {
            templateEngine.process(tempPath,context,writer);
            writer.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /**
     * 通过缓存查询站点路径
     * @param id
     * @return
     */
    public String getSiteDirectory(Long id){
        List<CmsSite> cmsSiteList = redisCache.getCacheObject("cmsSiteList");
        for(CmsSite cmsSite:cmsSiteList){
            if(cmsSite.getId().equals(id)){
                return cmsSite.getDirectory();
            }
        }
        return null;
    }
}
