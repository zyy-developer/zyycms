package com.zyy.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.util.List;
import java.util.Set;
import javax.servlet.http.HttpServletResponse;

import com.zyy.common.core.domain.model.LoginUser;
import com.zyy.common.core.redis.RedisCache;
import com.zyy.common.utils.SecurityUtils;
import com.zyy.web.domain.CmsSiteSetup;
import com.zyy.web.service.ICmsSiteSetupService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.zyy.common.annotation.Log;
import com.zyy.common.core.controller.BaseController;
import com.zyy.common.core.domain.AjaxResult;
import com.zyy.common.enums.BusinessType;
import com.zyy.web.domain.CmsSite;
import com.zyy.web.service.ICmsSiteService;
import com.zyy.common.utils.poi.ExcelUtil;
import com.zyy.common.core.page.TableDataInfo;

/**
 * 站点Controller
 *
 * @author hnzyy sun
 * @date 2023-07-03
 */
@RestController
@RequestMapping("/web/site")
public class CmsSiteController extends BaseController {
    @Autowired
    private ICmsSiteService cmsSiteService;

    @Autowired
    private ICmsSiteService siteService;

    @Autowired
    private ICmsSiteSetupService cmsSiteSetupService;

    @Value("${spring.thymeleaf.prefix}")
    private String tempUrl;

    @Autowired
    private RedisCache redisCache;

    /**
     * 查询站点列表
     */
    @PreAuthorize("@ss.hasPermi('web:site:list')")
    @GetMapping("/list")
    public TableDataInfo list(CmsSite cmsSite) {
        startPage();
        LoginUser principal = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        Set<Object> sitePermissions = principal.getSitePermissions();
        List<CmsSite> sites = null;
        if (sitePermissions.contains("**")) {
            sites = siteService.selectCmsSiteList(new CmsSite());
        } else {
            sites = siteService.selectCmsSiteListSet(sitePermissions);
        }
        return getDataTable(sites);
    }

    /**
     * 导出站点列表
     */
    @PreAuthorize("@ss.hasPermi('web:site:export')")
    @Log(title = "站点", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CmsSite cmsSite) {
        List<CmsSite> list = cmsSiteService.selectCmsSiteList(cmsSite);
        ExcelUtil<CmsSite> util = new ExcelUtil<CmsSite>(CmsSite.class);
        util.exportExcel(response, list, "站点数据");
    }

    /**
     * 获取站点详细信息
     */
//    @PreAuthorize("@ss.hasPermi('web:site:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id) {
        return success(cmsSiteService.selectCmsSiteById(id));
    }

    /**
     * 新增站点
     */
    @PreAuthorize("@ss.hasPermi('web:site:add')")
    @Log(title = "站点", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CmsSite cmsSite) throws IOException {
        String directory = cmsSite.getDirectory();
        String tempPath = tempUrl.substring("file:/".length(), tempUrl.length());
        String fromPath=tempPath+"www",toPath=tempPath+directory;
        copyDirectory(new File(fromPath),new File(toPath));
        AjaxResult ajax = toAjax(cmsSiteService.insertCmsSite(cmsSite));
        //更新缓存
        this.updateCache();
        return ajax;
    }

    /**
     * 修改站点
     */
    @PreAuthorize("@ss.hasPermi('web:site:edit')")
    @Log(title = "站点", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CmsSite cmsSite) {
        CmsSite cmsSite1 = cmsSiteService.selectCmsSiteById(cmsSite.getId());
        if (!cmsSite1.getDirectory().equals(cmsSite.getDirectory())) {
            String tempPath = "";
            tempPath = tempUrl.substring("file:/".length(), tempUrl.length());
            new File(tempPath + cmsSite1.getDirectory()).renameTo(new File(tempPath + cmsSite.getDirectory()));
        }
        AjaxResult ajax = toAjax(cmsSiteService.updateCmsSite(cmsSite));
        //更新缓存
        this.updateCache();
        return ajax;
    }

    /**
     * 删除站点
     */
    @PreAuthorize("@ss.hasPermi('web:site:remove')")
    @Log(title = "站点", businessType = BusinessType.DELETE)
    @DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids) {
        return toAjax(cmsSiteService.deleteCmsSiteByIds(ids));
    }


    //在copyDirectory()方法中，我们首先检查目标目录是否存在，如果不存在，则创建该目录。
    public void copyDirectory(File sourceDir, File destinationDir) throws IOException {
        if (!destinationDir.exists()) {
            destinationDir.mkdirs();
        }
        File[] files = sourceDir.listFiles();
        if (files != null) {
            for (File file : files) {
                File destinationFile = new File(destinationDir, file.getName());
                if (file.isDirectory()) {
                    copyDirectory(file, destinationFile);
                } else {
                    copyFile(file, destinationFile);
                }
            }
        }
    }

    //在copyFile()方法中，我们使用Files.copy()方法将源文件的内容复制到目标文件中。
    public void copyFile(File sourceFile, File destinationFile) throws IOException {
        Files.copy(sourceFile.toPath(), destinationFile.toPath(), StandardCopyOption.REPLACE_EXISTING);
    }

    /**
     * 更新缓存信息
     */
    public void updateCache(){
        List<CmsSite> cmsSites = cmsSiteService.selectCmsSiteList(new CmsSite());
        redisCache.setCacheObject("cmsSiteList",cmsSites);
        List<CmsSiteSetup> cmsSiteSetups = cmsSiteSetupService.selectCmsSiteSetupList(new CmsSiteSetup());
        redisCache.setCacheObject("cmsSiteSetUpList",cmsSiteSetups);
    }
}
