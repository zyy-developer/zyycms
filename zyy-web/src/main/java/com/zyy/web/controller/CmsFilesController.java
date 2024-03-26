package com.zyy.web.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

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
import com.zyy.web.domain.CmsFiles;
import com.zyy.web.service.ICmsFilesService;
import com.zyy.common.utils.poi.ExcelUtil;
import com.zyy.common.core.page.TableDataInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * 资源库Controller
 *
 * @author hnzyy
 * @date 2023-12-19
 */
@RestController
@RequestMapping("/web/files")
public class CmsFilesController extends BaseController
{
    @Autowired
    private ICmsFilesService cmsFilesService;

    /**
     * 查询资源库列表
     */
    @PreAuthorize("@ss.hasPermi('web:files:list')")
    @GetMapping("/list")
    public TableDataInfo list(CmsFiles cmsFiles)
    {
        startPage();
        List<CmsFiles> list = cmsFilesService.selectCmsFilesList(cmsFiles);
        return getDataTable(list);
    }

    /**
     * 导出资源库列表
     */
    @PreAuthorize("@ss.hasPermi('web:files:export')")
    @Log(title = "资源库", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CmsFiles cmsFiles)
    {
        List<CmsFiles> list = cmsFilesService.selectCmsFilesList(cmsFiles);
        ExcelUtil<CmsFiles> util = new ExcelUtil<CmsFiles>(CmsFiles.class);
        util.exportExcel(response, list, "资源库数据");
    }

    /**
     * 获取资源库详细信息
     */
    @PreAuthorize("@ss.hasPermi('web:files:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(cmsFilesService.selectCmsFilesById(id));
    }

    /**
     * 新增资源库
     */
    @PreAuthorize("@ss.hasPermi('web:files:add')")
    @Log(title = "资源库", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CmsFiles cmsFiles)
    {
        return toAjax(cmsFilesService.insertCmsFiles(cmsFiles));
    }

    /**
     * 修改资源库
     */
    @PreAuthorize("@ss.hasPermi('web:files:edit')")
    @Log(title = "资源库", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CmsFiles cmsFiles)
    {
        return toAjax(cmsFilesService.updateCmsFiles(cmsFiles));
    }

    /**
     * 删除资源库
     */
    @PreAuthorize("@ss.hasPermi('web:files:remove')")
    @Log(title = "资源库", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(cmsFilesService.deleteCmsFilesByIds(ids));
    }




}
