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
import com.zyy.web.domain.CmsModelItem;
import com.zyy.web.service.ICmsModelItemService;
import com.zyy.common.utils.poi.ExcelUtil;

/**
 * 自定义模型字段Controller
 *
 * @author hnzyy sun
 * @date 2023-06-26
 */
@RestController
@RequestMapping("/model/modelItem")
public class CmsModelItemController extends BaseController
{
    @Autowired
    private ICmsModelItemService cmsModelItemService;

    /**
     * 查询自定义模型字段列表
     */
    @PreAuthorize("@ss.hasPermi('model:modelItem:list')")
    @GetMapping("/list")
    public AjaxResult list(CmsModelItem cmsModelItem)
    {
//        startPage();
        List<CmsModelItem> list = cmsModelItemService.selectCmsModelItemList(cmsModelItem);
        return success(list);
    }

    /**
     * 导出自定义模型字段列表
     */
    @PreAuthorize("@ss.hasPermi('model:modelItem:export')")
    @Log(title = "自定义模型字段", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CmsModelItem cmsModelItem)
    {
        List<CmsModelItem> list = cmsModelItemService.selectCmsModelItemList(cmsModelItem);
        ExcelUtil<CmsModelItem> util = new ExcelUtil<CmsModelItem>(CmsModelItem.class);
        util.exportExcel(response, list, "自定义模型字段数据");
    }

    /**
     * 获取自定义模型字段详细信息
     */
    @PreAuthorize("@ss.hasPermi('model:modelItem:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(cmsModelItemService.selectCmsModelItemById(id));
    }

    /**
     * 新增自定义模型字段
     */
    @PreAuthorize("@ss.hasPermi('model:modelItem:add')")
    @Log(title = "自定义模型字段", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CmsModelItem cmsModelItem)
    {
        return toAjax(cmsModelItemService.insertCmsModelItem(cmsModelItem));
    }

    /**
     * 修改自定义模型字段
     */
    @PreAuthorize("@ss.hasPermi('model:modelItem:edit')")
    @Log(title = "自定义模型字段", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CmsModelItem cmsModelItem)
    {
        return toAjax(cmsModelItemService.updateCmsModelItem(cmsModelItem));
    }

    /**
     * 删除自定义模型字段
     */
    @PreAuthorize("@ss.hasPermi('model:modelItem:remove')")
    @Log(title = "自定义模型字段", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(cmsModelItemService.deleteCmsModelItemByIds(ids));
    }
}
