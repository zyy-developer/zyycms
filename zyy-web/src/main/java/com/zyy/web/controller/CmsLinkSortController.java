package com.zyy.web.controller;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;

import com.zyy.common.core.domain.model.LoginUser;
import com.zyy.common.utils.SecurityUtils;
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
import com.zyy.web.domain.CmsLinkSort;
import com.zyy.web.service.ICmsLinkSortService;
import com.zyy.common.utils.poi.ExcelUtil;
import com.zyy.common.core.page.TableDataInfo;

/**
 * 友情链接分类Controller
 *
 * @author hnzyy sun
 * @date 2023-06-20
 */
@RestController
@RequestMapping("/web/sort")
public class CmsLinkSortController extends BaseController
{
    @Autowired
    private ICmsLinkSortService cmsLinkSortService;

    /**
     * 查询友情链接分类列表
     */
    @PreAuthorize("@ss.hasPermi('web:sort:list')")
    @GetMapping("/list")
    public TableDataInfo list(CmsLinkSort cmsLinkSort)
    {
        LoginUser principal = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        startPage();
        cmsLinkSort.setSiteId(principal.getSiteId());
        List<CmsLinkSort> list = cmsLinkSortService.selectCmsLinkSortList(cmsLinkSort);
        return getDataTable(list);
    }

    /**
     * 导出友情链接分类列表
     */
    @PreAuthorize("@ss.hasPermi('web:sort:export')")
    @Log(title = "友情链接分类", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CmsLinkSort cmsLinkSort)
    {
        List<CmsLinkSort> list = cmsLinkSortService.selectCmsLinkSortList(cmsLinkSort);
        ExcelUtil<CmsLinkSort> util = new ExcelUtil<CmsLinkSort>(CmsLinkSort.class);
        util.exportExcel(response, list, "友情链接分类数据");
    }

    /**
     * 获取友情链接分类详细信息
     */
    @PreAuthorize("@ss.hasPermi('web:sort:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(cmsLinkSortService.selectCmsLinkSortById(id));
    }

    /**
     * 新增友情链接分类
     */
    @PreAuthorize("@ss.hasPermi('web:sort:add')")
    @Log(title = "友情链接分类", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CmsLinkSort cmsLinkSort)
    {
        LoginUser principal = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        cmsLinkSort.setSiteId(principal.getSiteId());
        return toAjax(cmsLinkSortService.insertCmsLinkSort(cmsLinkSort));
    }

    /**
     * 修改友情链接分类
     */
    @PreAuthorize("@ss.hasPermi('web:sort:edit')")
    @Log(title = "友情链接分类", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CmsLinkSort cmsLinkSort)
    {
        return toAjax(cmsLinkSortService.updateCmsLinkSort(cmsLinkSort));
    }

    /**
     * 删除友情链接分类
     */
    @PreAuthorize("@ss.hasPermi('web:sort:remove')")
    @Log(title = "友情链接分类", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(cmsLinkSortService.deleteCmsLinkSortByIds(ids));
    }
}
