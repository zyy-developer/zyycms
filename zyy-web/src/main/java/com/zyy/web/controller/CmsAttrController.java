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
import com.zyy.web.domain.CmsAttr;
import com.zyy.web.service.ICmsAttrService;
import com.zyy.common.utils.poi.ExcelUtil;
import com.zyy.common.core.page.TableDataInfo;

/**
 * 自定义属性Controller
 *
 * @author hnzyy sun
 * @date 2023-06-20
 */
@RestController
@RequestMapping("/web/attr")
public class CmsAttrController extends BaseController
{
    @Autowired
    private ICmsAttrService cmsAttrService;

    /**
     * 查询自定义属性列表
     */
    @PreAuthorize("@ss.hasPermi('web:attr:list')")
    @GetMapping("/list")
    public TableDataInfo list(CmsAttr cmsAttr)
    {
        startPage();
        List<CmsAttr> list = cmsAttrService.selectCmsAttrList(cmsAttr);
        return getDataTable(list);
    }

    /**
     * 导出自定义属性列表
     */
    @PreAuthorize("@ss.hasPermi('web:attr:export')")
    @Log(title = "自定义属性", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CmsAttr cmsAttr)
    {
        List<CmsAttr> list = cmsAttrService.selectCmsAttrList(cmsAttr);
        ExcelUtil<CmsAttr> util = new ExcelUtil<CmsAttr>(CmsAttr.class);
        util.exportExcel(response, list, "自定义属性数据");
    }

    /**
     * 获取自定义属性详细信息
     */
    @PreAuthorize("@ss.hasPermi('web:attr:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(cmsAttrService.selectCmsAttrById(id));
    }

    /**
     * 新增自定义属性
     */
    @PreAuthorize("@ss.hasPermi('web:attr:add')")
    @Log(title = "自定义属性", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CmsAttr cmsAttr)
    {
        return toAjax(cmsAttrService.insertCmsAttr(cmsAttr));
    }

    /**
     * 修改自定义属性
     */
    @PreAuthorize("@ss.hasPermi('web:attr:edit')")
    @Log(title = "自定义属性", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CmsAttr cmsAttr)
    {
        return toAjax(cmsAttrService.updateCmsAttr(cmsAttr));
    }

    /**
     * 删除自定义属性
     */
    @PreAuthorize("@ss.hasPermi('web:attr:remove')")
    @Log(title = "自定义属性", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(cmsAttrService.deleteCmsAttrByIds(ids));
    }
}
