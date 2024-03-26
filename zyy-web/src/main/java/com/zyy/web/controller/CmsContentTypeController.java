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
import com.zyy.web.domain.CmsContentType;
import com.zyy.web.service.ICmsContentTypeService;
import com.zyy.common.utils.poi.ExcelUtil;
import com.zyy.common.core.page.TableDataInfo;

/**
 * 内容类型Controller
 *
 * @author hnzyy sun
 * @date 2023-09-05
 */
@RestController
@RequestMapping("/web/contentType")
public class CmsContentTypeController extends BaseController
{
    @Autowired
    private ICmsContentTypeService cmsContentTypeService;

    /**
     * 查询内容类型列表
     */
//    @PreAuthorize("@ss.hasPermi('web:contentType:list')")
    @GetMapping("/list")
    public TableDataInfo list(CmsContentType cmsContentType)
    {
        startPage();
        List<CmsContentType> list = cmsContentTypeService.selectCmsContentTypeList(cmsContentType);
        return getDataTable(list);
    }

    /**
     * 导出内容类型列表
     */
    @PreAuthorize("@ss.hasPermi('web:contentType:export')")
    @Log(title = "内容类型", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CmsContentType cmsContentType)
    {
        List<CmsContentType> list = cmsContentTypeService.selectCmsContentTypeList(cmsContentType);
        ExcelUtil<CmsContentType> util = new ExcelUtil<CmsContentType>(CmsContentType.class);
        util.exportExcel(response, list, "内容类型数据");
    }

    /**
     * 获取内容类型详细信息
     */
    @PreAuthorize("@ss.hasPermi('web:contentType:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(cmsContentTypeService.selectCmsContentTypeById(id));
    }

    /**
     * 新增内容类型
     */
    @PreAuthorize("@ss.hasPermi('web:contentType:add')")
    @Log(title = "内容类型", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CmsContentType cmsContentType)
    {
        return toAjax(cmsContentTypeService.insertCmsContentType(cmsContentType));
    }

    /**
     * 修改内容类型
     */
    @PreAuthorize("@ss.hasPermi('web:contentType:edit')")
    @Log(title = "内容类型", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CmsContentType cmsContentType)
    {
        return toAjax(cmsContentTypeService.updateCmsContentType(cmsContentType));
    }

    /**
     * 删除内容类型
     */
    @PreAuthorize("@ss.hasPermi('web:contentType:remove')")
    @Log(title = "内容类型", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(cmsContentTypeService.deleteCmsContentTypeByIds(ids));
    }
}
