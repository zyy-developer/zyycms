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
import com.zyy.web.domain.CmsMessageTemplate;
import com.zyy.web.service.ICmsMessageTemplateService;
import com.zyy.common.utils.poi.ExcelUtil;
import com.zyy.common.core.page.TableDataInfo;

/**
 * 消息通知模板Controller
 *
 * @author hnzyy
 * @date 2023-11-14
 */
@RestController
@RequestMapping("/web/messageTemplate")
public class CmsMessageTemplateController extends BaseController
{
    @Autowired
    private ICmsMessageTemplateService cmsMessageTemplateService;

    /**
     * 查询消息通知模板列表
     */
    @PreAuthorize("@ss.hasPermi('web:messageTemplate:list')")
    @GetMapping("/list")
    public TableDataInfo list(CmsMessageTemplate cmsMessageTemplate)
    {
        startPage();
        List<CmsMessageTemplate> list = cmsMessageTemplateService.selectCmsMessageTemplateList(cmsMessageTemplate);
        return getDataTable(list);
    }

    /**
     * 导出消息通知模板列表
     */
    @PreAuthorize("@ss.hasPermi('web:messageTemplate:export')")
    @Log(title = "消息通知模板", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CmsMessageTemplate cmsMessageTemplate)
    {
        List<CmsMessageTemplate> list = cmsMessageTemplateService.selectCmsMessageTemplateList(cmsMessageTemplate);
        ExcelUtil<CmsMessageTemplate> util = new ExcelUtil<CmsMessageTemplate>(CmsMessageTemplate.class);
        util.exportExcel(response, list, "消息通知模板数据");
    }

    /**
     * 获取消息通知模板详细信息
     */
    @PreAuthorize("@ss.hasPermi('web:messageTemplate:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(cmsMessageTemplateService.selectCmsMessageTemplateById(id));
    }

    /**
     * 新增消息通知模板
     */
    @PreAuthorize("@ss.hasPermi('web:messageTemplate:add')")
    @Log(title = "消息通知模板", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CmsMessageTemplate cmsMessageTemplate)
    {
        return toAjax(cmsMessageTemplateService.insertCmsMessageTemplate(cmsMessageTemplate));
    }

    /**
     * 修改消息通知模板
     */
    @PreAuthorize("@ss.hasPermi('web:messageTemplate:edit')")
    @Log(title = "消息通知模板", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CmsMessageTemplate cmsMessageTemplate)
    {
        return toAjax(cmsMessageTemplateService.updateCmsMessageTemplate(cmsMessageTemplate));
    }

    /**
     * 删除消息通知模板
     */
    @PreAuthorize("@ss.hasPermi('web:messageTemplate:remove')")
    @Log(title = "消息通知模板", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(cmsMessageTemplateService.deleteCmsMessageTemplateByIds(ids));
    }
}
