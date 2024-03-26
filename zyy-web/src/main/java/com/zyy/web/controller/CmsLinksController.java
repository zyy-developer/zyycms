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
import com.zyy.web.domain.CmsLinks;
import com.zyy.web.service.ICmsLinksService;
import com.zyy.common.utils.poi.ExcelUtil;
import com.zyy.common.core.page.TableDataInfo;

/**
 * 友情链接Controller
 *
 * @author hnzyy sun
 * @date 2023-06-20
 */
@RestController
@RequestMapping("/web/links")
public class CmsLinksController extends BaseController
{
    @Autowired
    private ICmsLinksService cmsLinksService;

    /**
     * 查询友情链接列表
     */
    @PreAuthorize("@ss.hasPermi('web:links:list')")
    @GetMapping("/list")
    public TableDataInfo list(CmsLinks cmsLinks)
    {
        startPage();
        List<CmsLinks> list = cmsLinksService.selectCmsLinksList(cmsLinks);
        return getDataTable(list);
    }

    /**
     * 导出友情链接列表
     */
    @PreAuthorize("@ss.hasPermi('web:links:export')")
    @Log(title = "友情链接", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CmsLinks cmsLinks)
    {
        List<CmsLinks> list = cmsLinksService.selectCmsLinksList(cmsLinks);
        ExcelUtil<CmsLinks> util = new ExcelUtil<CmsLinks>(CmsLinks.class);
        util.exportExcel(response, list, "友情链接数据");
    }

    /**
     * 获取友情链接详细信息
     */
    @PreAuthorize("@ss.hasPermi('web:links:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(cmsLinksService.selectCmsLinksById(id));
    }

    /**
     * 新增友情链接
     */
    @PreAuthorize("@ss.hasPermi('web:links:add')")
    @Log(title = "友情链接", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CmsLinks cmsLinks)
    {
        return toAjax(cmsLinksService.insertCmsLinks(cmsLinks));
    }

    /**
     * 修改友情链接
     */
    @PreAuthorize("@ss.hasPermi('web:links:edit')")
    @Log(title = "友情链接", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CmsLinks cmsLinks)
    {
        return toAjax(cmsLinksService.updateCmsLinks(cmsLinks));
    }

    /**
     * 删除友情链接
     */
    @PreAuthorize("@ss.hasPermi('web:links:remove')")
    @Log(title = "友情链接", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(cmsLinksService.deleteCmsLinksByIds(ids));
    }
}
