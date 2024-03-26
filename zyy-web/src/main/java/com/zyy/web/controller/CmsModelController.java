package com.zyy.web.controller;

import java.util.List;
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
import com.zyy.web.domain.CmsModel;
import com.zyy.web.service.ICmsModelService;
import com.zyy.common.utils.poi.ExcelUtil;
import com.zyy.common.core.page.TableDataInfo;

/**
 * 模型Controller
 *
 * @author hnzyy sun
 * @date 2023-06-20
 */
@RestController
@RequestMapping("/web/model")
public class CmsModelController extends BaseController
{
    @Autowired
    private ICmsModelService cmsModelService;

    /**
     * 查询模型列表
     */
//    @PreAuthorize("@ss.hasPermi('web:model:list')")
    @GetMapping("/list")
    public TableDataInfo list(CmsModel cmsModel)
    {
        LoginUser principal = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        startPage();
        cmsModel.setSiteId(principal.getSiteId());
        cmsModel.setIsPublic("0");
        List<CmsModel> list = cmsModelService.selectCmsModelList(cmsModel);
        return getDataTable(list);
    }

    /**
     * 导出模型列表
     */
    @PreAuthorize("@ss.hasPermi('web:model:export')")
    @Log(title = "模型", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CmsModel cmsModel)
    {
        List<CmsModel> list = cmsModelService.selectCmsModelList(cmsModel);
        ExcelUtil<CmsModel> util = new ExcelUtil<CmsModel>(CmsModel.class);
        util.exportExcel(response, list, "模型数据");
    }

    /**
     * 获取模型详细信息
     */
//    @PreAuthorize("@ss.hasPermi('web:model:query')")
    @GetMapping(value = "/{modelId}")
    public AjaxResult getInfo(@PathVariable("modelId") Long modelId)
    {
        return success(cmsModelService.selectCmsModelByModelId(modelId));
    }

    /**
     * 新增模型
     */
    @PreAuthorize("@ss.hasPermi('web:model:add')")
    @Log(title = "模型", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CmsModel cmsModel)
    {
        LoginUser principal = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        cmsModel.setSiteId(principal.getSiteId());
        return toAjax(cmsModelService.insertCmsModel(cmsModel));
    }

    /**
     * 修改模型
     */
    @PreAuthorize("@ss.hasPermi('web:model:edit')")
    @Log(title = "模型", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CmsModel cmsModel)
    {
        return toAjax(cmsModelService.updateCmsModel(cmsModel));
    }

    /**
     * 删除模型
     */
    @PreAuthorize("@ss.hasPermi('web:model:remove')")
    @Log(title = "模型", businessType = BusinessType.DELETE)
	@DeleteMapping("/{modelIds}")
    public AjaxResult remove(@PathVariable Long[] modelIds)
    {
        return toAjax(cmsModelService.deleteCmsModelByModelIds(modelIds));
    }

    //获取模型id及名称
    @GetMapping("/getModels/{modelIds}")
    public AjaxResult getModelsInfo(@PathVariable Long[] modelIds){
       return success(cmsModelService.selectCmsModelByModelIds(modelIds));
    }
}
