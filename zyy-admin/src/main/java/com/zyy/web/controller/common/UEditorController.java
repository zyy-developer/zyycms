package com.zyy.web.controller.common;

import com.alibaba.fastjson.JSONArray;
import com.zyy.common.config.ZyyCmsConfig;
import com.zyy.common.core.domain.AjaxResult;
import com.zyy.common.core.domain.model.LoginUser;
import com.zyy.common.core.redis.RedisCache;
import com.zyy.common.utils.SecurityUtils;
import com.zyy.common.utils.file.FileUploadUtils;
import com.zyy.common.utils.file.FileUtils;
import com.zyy.framework.config.ServerConfig;
import com.zyy.web.domain.CmsSiteSetup;
import com.zyy.web.service.ICmsSiteSetupService;
import com.zyy.web.utils.GrabUtis;
import com.zyy.web.utils.ImageUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * UEditor编辑器配置
 *
 * @author hnzyy
 */
@RestController
@RequestMapping("/UEditor")
public class UEditorController {

    @Autowired
    private ServerConfig serverConfig;

    @Autowired
    private ICmsSiteSetupService cmsSiteSetupService;

    @Autowired
    private RedisCache redisCache;

    /**
     * 初始化配置
     * @return
     */
    @RequestMapping()
    public AjaxResult init(@RequestParam(value = "action",required = false) String action,@RequestParam(value = "source[]",required = false) String[] source,
                           @RequestParam(value = "file",required = false) MultipartFile file){
        if(action.equals("upload")){
            try {
                return uploadFile(file);
            } catch (Exception exception) {
                exception.printStackTrace();
            }
        }else if(action.equals("catchimage")){
            return catchImageFile(source);
        }
        AjaxResult ajaxResult = new AjaxResult();
        // 执行上传图片的action名称，默认值：uploadimage
        ajaxResult.put("imageActionName","upload");
        // 提交的图片表单名称，默认值：upfile
        ajaxResult.put("imageFieldName","file");
        // 上传大小限制，单位B，默认值：2048000
        ajaxResult.put("imageMaxSize",10485760);
        // 上传图片格式显示，默认值：[".png", ".jpg", ".jpeg", ".gif", ".bmp"]
        ajaxResult.put("imageAllowFiles",new String[]{".jpg",".png",".jpeg",".gif",".bmp"});
        // 是否压缩图片,默认是true
        ajaxResult.put("imageCompressEnable",true);
        // 图片压缩最长边限制，默认值：1600
        ajaxResult.put("imageCompressBorder",1600);
        // 插入的图片浮动方式，默认值：none
        ajaxResult.put("imageInsertAlign","none");
        // 图片访问路径前缀，默认值：空
        ajaxResult.put("imageUrlPrefix","");
        // word导入action名称
        ajaxResult.put("wordActionName","wordupload");
        // word导入的表单名称，默认值：upfile
        ajaxResult.put("wordFieldName","file");
        // 执行上传涂鸦的action名称，默认值：uploadscrawl
        ajaxResult.put("scrawlActionName","upload");
        // 提交的图片表单名称，默认值：upfile
        ajaxResult.put("scrawlFieldName","file");
        // 上传大小限制，单位B，默认值：2048000
        ajaxResult.put("scrawlMaxSize",10485760);
        // 图片访问路径前缀，默认值：空
        ajaxResult.put("scrawlUrlPrefix","");
        // 插入的图片浮动方式，默认值：none
        ajaxResult.put("scrawlInsertAlign","none");
        // 执行上传截图的action名称，默认值：uploadimage
        ajaxResult.put("snapscreenActionName","upload");
        // 图片访问路径前缀
        ajaxResult.put("snapscreenUrlPrefix","");
        // 插入的图片浮动方式，默认值：none
        ajaxResult.put("snapscreenInsertAlign","none");
        // 例外的图片抓取域名
        ajaxResult.put("catcherLocalDomain",new String[]{"127.0.0.1","localhost"});
        // 执行抓取远程图片的action名称，默认值：catchimage
        ajaxResult.put("catcherActionName","catchimage");
        // 提交的图片列表表单名称，默认值：source
        ajaxResult.put("catcherFieldName","source");
        // 图片访问路径前缀，默认值：空
        ajaxResult.put("catcherUrlPrefix","");
        // 上传保存路径,可以自定义保存路径和文件名格式，默认值：{filename}{rand:6}
        ajaxResult.put("catcherMaxSize",10485760);
        // 抓取图片格式显示，默认值：[".png", ".jpg", ".jpeg", ".gif", ".bmp"]
        ajaxResult.put("catcherAllowFiles",new String[]{".jpg",".png",".jpeg", ".gif", ".bmp"});
        // 执行上传视频的action名称，默认值：uploadvideo
        ajaxResult.put("videoActionName","upload");
        // 提交的视频表单名称，默认值：upfile
        ajaxResult.put("videoFieldName","file");
        // 视频访问路径前缀
        ajaxResult.put("videoUrlPrefix","");
        // 上传大小限制，单位B，默认值：102400000
        ajaxResult.put("videoMaxSize",999857600);
        // 上传视频格式显示
        ajaxResult.put("videoAllowFiles",new String[]{".mp4"});
        // 执行上传文件的action名称，默认值：uploadfile
        ajaxResult.put("fileActionName","upload");
        // 提交的文件表单名称，默认值：upfile
        ajaxResult.put("fileFieldName","file");
        // 文件访问路径前缀
        ajaxResult.put("fileUrlPrefix","");
        // 上传保存路径,可以自定义保存路径和文件名格式，默认值：{filename}{rand:6}
        ajaxResult.put("fileMaxSize",104857600);
        // 上传文件格式显示
        ajaxResult.put("fileAllowFiles",new String[]{".zip",".pdf",".doc",".docx",".xls",".xlsx",".txt",".ppt",".pptx"});
        // 执行图片管理的action名称，默认值：listimage
        ajaxResult.put("imageManagerActionName","listImage");
        // 每次列出文件数量
        ajaxResult.put("imageManagerListSize",20);
        // 图片访问路径前缀
        ajaxResult.put("imageManagerUrlPrefix","");
        // 插入的图片浮动方式，默认值：none
        ajaxResult.put("imageManagerInsertAlign","none");
        // 列出的文件类型
        ajaxResult.put("imageManagerAllowFiles",new String[]{ ".jpg",".png",".jpeg"});
        // 执行文件管理的action名称，默认值：listfile
        ajaxResult.put("fileManagerActionName","listFile");
        // 指定要列出文件的目录
        ajaxResult.put("fileManagerUrlPrefix","");
        // 每次列出文件数量
        ajaxResult.put("fileManagerListSize",20);
        // 列出的文件类型
        ajaxResult.put("fileManagerAllowFiles",new String[]{".zip",".pdf",".doc",".docx",".xls",".xlsx",".txt",".ppt",".pptx"});
        // 公式配置
        ajaxResult.put("formulaConfig",new HashMap<>().put("imageUrlTemplate","https://latex.codecogs.com/svg.image?{}"));
        return ajaxResult;
    }

    /**
     * 通用上传请求（单个）
     */
    public AjaxResult uploadFile(MultipartFile file) throws Exception
    {
        try
        {
            // 上传文件路径
            String filePath = ZyyCmsConfig.getUploadPath();
            // 上传并返回新文件名称
            String fileName = FileUploadUtils.upload(filePath, file);
            String url = serverConfig.getUrl() + fileName;
            AjaxResult ajax = AjaxResult.success();
            ajax.put("state","SUCCESS");
            ajax.put("url", fileName);
            ajax.put("title",file.getOriginalFilename());
            ajax.put("original",file.getOriginalFilename());
            return ajax;
        }
        catch (Exception e)
        {
            return AjaxResult.error(e.getMessage());
        }
    }

    /**
     * 转存图片
     * @return
     */
    public AjaxResult catchImageFile(String[] urls){
        AjaxResult ajaxResult = new AjaxResult();
        ajaxResult.put("state","SUCCESS");
        List<Map> images = GrabUtis.catchImage(urls);
        ajaxResult.put("list",images);
        return ajaxResult;
    }

    /**
     * 获取网站设置
     * @param siteId
     * @return
     */
    public CmsSiteSetup getSiteInfo(Long siteId){
        List<CmsSiteSetup> cmsSiteSetUpList = redisCache.getCacheObject("cmsSiteSetUpList");
        for(CmsSiteSetup cmsSiteSetup:cmsSiteSetUpList){
            if(cmsSiteSetup.getSiteId().equals(siteId)){
                return cmsSiteSetup;
            }
        }
        return null;
    }

}
