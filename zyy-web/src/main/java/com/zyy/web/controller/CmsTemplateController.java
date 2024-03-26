package com.zyy.web.controller;

import java.io.*;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson2.JSON;
import com.zyy.common.constant.Constants;
import com.zyy.common.core.domain.model.LoginUser;
import com.zyy.common.utils.SecurityUtils;
import com.zyy.common.utils.StringUtils;
import com.zyy.web.domain.CmsSite;
import com.zyy.web.domain.vo.TemplateVo;
import com.zyy.web.domain.vo.UnzipFileVo;
import com.zyy.web.service.ICmsSiteService;
import com.zyy.web.utils.CodeUtils;
import com.zyy.web.utils.ZipFileUtils;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.MediaType;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.zyy.common.annotation.Log;
import com.zyy.common.core.controller.BaseController;
import com.zyy.common.core.domain.AjaxResult;
import com.zyy.common.enums.BusinessType;
import com.zyy.web.domain.CmsTemplate;
import com.zyy.web.service.ICmsTemplateService;
import com.zyy.common.utils.poi.ExcelUtil;
import com.zyy.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

import static org.apache.commons.io.FileUtils.copyDirectory;

/**
 * 模板Controller
 *
 * @author hnzyy sun
 * @date 2023-06-20
 */
@RestController
@RequestMapping("/web/template")
public class CmsTemplateController extends BaseController
{

    @Autowired
    private ICmsTemplateService cmsTemplateService;

    @Autowired
    private ICmsSiteService cmsSiteService;

    @Value("${spring.thymeleaf.prefix}")
    private String tempUrl;

    /**
     * 查询模板列表
     */
    @PreAuthorize("@ss.hasPermi('web:template:list')")
    @GetMapping("/list")
    public TableDataInfo list(CmsTemplate cmsTemplate)
    {
        startPage();
        List<CmsTemplate> list = cmsTemplateService.selectCmsTemplateList(cmsTemplate);
        return getDataTable(list);
    }

    /**
     * 导出模板列表
     */
    @PreAuthorize("@ss.hasPermi('web:template:export')")
    @Log(title = "模板", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CmsTemplate cmsTemplate)
    {
        List<CmsTemplate> list = cmsTemplateService.selectCmsTemplateList(cmsTemplate);
        ExcelUtil<CmsTemplate> util = new ExcelUtil<CmsTemplate>(CmsTemplate.class);
        util.exportExcel(response, list, "模板数据");
    }

    /**
     * 获取模板详细信息
     */
    @PreAuthorize("@ss.hasPermi('web:template:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(cmsTemplateService.selectCmsTemplateById(id));
    }

    /**
     * 新增模板
     */
    @PreAuthorize("@ss.hasPermi('web:template:add')")
    @Log(title = "模板", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CmsTemplate cmsTemplate)
    {
        return toAjax(cmsTemplateService.insertCmsTemplate(cmsTemplate));
    }

    /**
     * 修改模板
     */
    @PreAuthorize("@ss.hasPermi('web:template:edit')")
    @Log(title = "模板", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CmsTemplate cmsTemplate)
    {
        return toAjax(cmsTemplateService.updateCmsTemplate(cmsTemplate));
    }

    /**
     * 删除模板
     */
    @PreAuthorize("@ss.hasPermi('web:template:remove')")
    @Log(title = "模板", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(cmsTemplateService.deleteCmsTemplateByIds(ids));
    }


    //模板及静态资源列表
    @RequestMapping("/fileList")
    public String tempListPage(@RequestParam(value = "filePath",required = false) String filePath,@RequestParam(value = "type") String type){
        String tempPath = getTempPath();
        Map<Object, Object> map = new HashMap<>();
        String lastFilePath=tempPath;
        File[] files=null;
        if(filePath!=null){
            tempPath=tempPath+CodeUtils.decode(filePath);
        }
        files = new File(tempPath).listFiles();
        String lastPathStr = StringUtils.substringAfter(tempPath, lastFilePath);
        map.put("filePath",lastPathStr);
        List<Object> fileList = new ArrayList<>();
        for (File file:files) {
            Map fileMap= new HashMap<>();
            fileMap.put("fileName",file.getName());
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            fileMap.put("filePath",lastPathStr+File.separator+file.getName());
            fileMap.put("lastUpdateTime",sdf.format(file.lastModified()));
            fileMap.put("fileSize",file.length());
            fileMap.put("fileType",file.isFile());
            fileList.add(fileMap);
        }
        map.put("file",fileList);
        return JSON.toJSONString(map);
    }

    //获取文件内容
    @RequestMapping("/getFile")
    public String openFile(@RequestParam("filePath") String filePath) throws IOException {
        String tempPath = getTempPath();
        tempPath=tempPath+CodeUtils.decode(filePath);
        StringBuffer sb=new StringBuffer();
        InputStreamReader fReader = new InputStreamReader(new FileInputStream(tempPath),"UTF-8");
        BufferedReader reader = new BufferedReader(fReader);
        String str;
        while ((str = reader.readLine()) != null) {
            sb.append(str + "\n");
        }
        reader.close();
        return sb.toString();
    }

    /** 保存模板 */
    @RequestMapping("/updateTemp")
    public String updateTemp(@RequestBody TemplateVo templateVo) throws IOException {
        String tempPath = getTempPath();
        templateVo.setFilePath(tempPath+CodeUtils.decode(templateVo.getFilePath()));
        String decode = CodeUtils.decode(templateVo.getFile()).replaceAll("@@","%");
        decode=decode.replaceAll("~~","+");
        OutputStreamWriter fileOutputStream=new OutputStreamWriter(new FileOutputStream(new File(templateVo.getFilePath())),"utf-8");
        fileOutputStream.append(decode);
        fileOutputStream.close();
        return "ok";
    }

    /**
     * 文件上传
     * @return
     */
    @PostMapping("/uploadFile")
    public String uploadFile(@RequestParam("path")String path, @RequestParam(value = "file",required = false) MultipartFile[] files) throws IOException {
        String tempPath = getTempPath();
        File file = new File(tempPath+CodeUtils.decode(path));
        for (MultipartFile multipartFile:files) {
            FileOutputStream fileOutputStream=new FileOutputStream(file.getPath()+File.separator+multipartFile.getOriginalFilename());
            fileOutputStream.write(multipartFile.getBytes());
            fileOutputStream.close();
        }
        return "ok";
    }

    /**删除文件*/
    @DeleteMapping ("/deleteFile")
    public String deleteFile(@RequestParam("path") String path){
        String tempPath = getTempPath();
        File file = new File(tempPath+CodeUtils.decode(path));
        if(file.exists()){
            file.delete();
        }
        return "ok";
    }

    /**新建目录或文件*/
    @PostMapping("/addFile")
    public String addFile(@RequestParam("path") String path,@RequestParam("dirName") String dirName) throws IOException {
        String tempPath = getTempPath();
        File file = new File(tempPath+CodeUtils.decode(path),dirName);
        if(dirName.indexOf(".")!=-1){
            file.createNewFile();
        }else {
            file.mkdir();
        }
        return "ok";
    }

    /** 重命名文件 */
    @PostMapping("/renameFile")
    public String renameFile(@RequestParam("path") String path,@RequestParam("oldFileName") String oldFileName,@RequestParam("newFileName")String newFileName){
        String tempPath = getTempPath();
        File file = new File(tempPath+CodeUtils.decode(path));
        File oldFile=new File(file+File.separator+oldFileName);
        File newFile=new File(file+File.separator+newFileName);
        if (oldFile.exists() && oldFile.isFile()) {
            oldFile.renameTo(newFile);
        }
        return "ok";
    }

    //下载文件
    @RequestMapping("/download")
    public void downloadFile(@RequestParam("path") String path,@RequestParam("fileName") String fileName,HttpServletResponse response) throws IOException {
        String tempPath = getTempPath();
        File file = new File(tempPath+CodeUtils.decode(path));
        FileInputStream is = new FileInputStream(new File(file, fileName));
//        response.setContentType("text/plain;charset=UTF-8");
        response.setContentType(MediaType.APPLICATION_OCTET_STREAM_VALUE);
        response.setHeader("content-disposition", "inline" + ";fileName=" + URLEncoder.encode(fileName, "UTF-8"));
        ServletOutputStream os = response.getOutputStream();
        IOUtils.copy(is, os);
        IOUtils.closeQuietly(is);
        IOUtils.closeQuietly(os);
    }


    /** 导入模板文件 */
    @RequestMapping("/importTemplate")
    public String importTemplate(@RequestParam("file") MultipartFile file){
        String tempPath = getTempPath();
        List<UnzipFileVo> unzip = ZipFileUtils.unzip(file);
        for (UnzipFileVo unzipFileVo:unzip) {
            try {
                File file1 = new File(tempPath + File.separator + unzipFileVo.getPath());
                if(unzipFileVo.getType()==1){
                    FileOutputStream fileOutputStream = new FileOutputStream(file1);
                    fileOutputStream.write(unzipFileVo.getBytes());
                    fileOutputStream.close();
                }else if(unzipFileVo.getType()==0){
                    if(!file1.exists()){
                        file1.mkdirs();
                    }
                }
            } catch (IOException ioException) {
                ioException.printStackTrace();
            }
        }
        return "ok";
    }

    /** 导出模板文件 */
    @RequestMapping("/exportTemplate")
    public void exportTemplate(HttpServletResponse response){
        String tempPath = getTempPath();
        try {
            String A = "cms-template";
            // 创建临时文件夹
            File tempDir = new File(A);
            tempDir.mkdir();
            // 把B文件夹复制到A文件夹
            File sourceDir = new File(tempPath);
            File destinationDir = new File(tempDir, "");
            copyDirectory(sourceDir, destinationDir);
            //把A文件夹压缩成zip包
            String AZIP = A + ".zip";
            ZipFileUtils.zipFolder(A, AZIP);
            // 删除临时文件夹
            FileUtils.deleteDirectory(tempDir);
            FileInputStream fileInputStream = new FileInputStream(new File(AZIP));
            genCode(response,fileInputStream.readAllBytes());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /** 获取pc端链接和移动端模板列表 */
    @GetMapping("/getTempList/{name}")
    public String selectPCAndMobileTempList(@PathVariable("name") String name){
        LoginUser principal = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        CmsSite cmsSite = cmsSiteService.selectCmsSiteById(principal.getSiteId());
        String pcScheme=cmsSite.getSetup().getSiteTempSchemePc(),mobileScheme=cmsSite.getSetup().getSiteTempSchemeMobile();
        String pcTemps=tempUrl.substring(("file:").length(),tempUrl.length())+File.separator+cmsSite.getDirectory()+File.separator+pcScheme+File.separator+name;
        String mobileTemps=tempUrl.substring(("file:").length(),tempUrl.length())+File.separator+cmsSite.getDirectory()+File.separator+mobileScheme+File.separator+name;
        HashMap<Object, Object> map = new HashMap<>();
        File[] pcTempsFiles = new File(pcTemps).listFiles();
        File[] mobileTempsFiles = new File(mobileTemps).listFiles();
        map.put("pcTemps",pcTempsFiles);
        map.put("mobileTemps",mobileTempsFiles);
        return JSON.toJSONString(map);
    }

    public String getTempPath(){
        LoginUser principal = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        CmsSite cmsSite = cmsSiteService.selectCmsSiteById(principal.getSiteId());
        String siteName="/"+cmsSite.getDirectory();
        String tempPath=tempUrl.substring(("file:"+File.separator).length(),tempUrl.length()-1)+siteName;
        return tempPath;
    }


    /**
     * 生成zip文件
     */
    private void genCode(HttpServletResponse response, byte[] data) throws IOException
    {
        response.reset();
        response.addHeader("Access-Control-Allow-Origin", "*");
        response.addHeader("Access-Control-Expose-Headers", "Content-Disposition");
        response.setHeader("Content-Disposition", "attachment; filename=\"zyycms.zip\"");
        response.addHeader("Content-Length", "" + data.length);
        response.setContentType("application/octet-stream; charset=UTF-8");
        IOUtils.write(data, response.getOutputStream());
    }

}
