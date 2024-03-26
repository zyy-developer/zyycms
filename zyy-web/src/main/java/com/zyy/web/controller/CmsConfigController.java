package com.zyy.web.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONObject;
import com.zyy.web.config.AlipayConfig;
import com.zyy.web.utils.ConfigUtils;
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
import com.zyy.web.domain.CmsConfig;
import com.zyy.web.service.ICmsConfigService;
import com.zyy.common.utils.poi.ExcelUtil;
import com.zyy.common.core.page.TableDataInfo;

/**
 * 系统配置Controller
 *
 * @author hnzyy
 * @date 2023-11-10
 */
@RestController
@RequestMapping("/web/config")
public class CmsConfigController extends BaseController
{
    @Autowired
    private ICmsConfigService cmsConfigService;

    @Autowired
    private AlipayConfig alipayConfig;

    @Autowired
    private ConfigUtils configUtils;

    /**
     * 查询系统配置列表
     */
    @PreAuthorize("@ss.hasPermi('web:config:list')")
    @GetMapping("/list")
    public TableDataInfo list(CmsConfig cmsConfig)
    {
        startPage();
        List<CmsConfig> list = cmsConfigService.selectCmsConfigList(cmsConfig);
        return getDataTable(list);
    }

    /**
     * 导出系统配置列表
     */
    @PreAuthorize("@ss.hasPermi('web:config:export')")
    @Log(title = "系统配置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CmsConfig cmsConfig)
    {
        List<CmsConfig> list = cmsConfigService.selectCmsConfigList(cmsConfig);
        ExcelUtil<CmsConfig> util = new ExcelUtil<CmsConfig>(CmsConfig.class);
        util.exportExcel(response, list, "系统配置数据");
    }

    /**
     * 获取系统配置详细信息
     */
    @PreAuthorize("@ss.hasPermi('web:config:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(cmsConfigService.selectCmsConfigById(id));
    }

    /**
     * 新增系统配置
     */
    @PreAuthorize("@ss.hasPermi('web:config:add')")
    @Log(title = "系统配置", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CmsConfig cmsConfig)
    {
        return toAjax(cmsConfigService.insertCmsConfig(cmsConfig));
    }

    /**
     * 修改系统配置
     */
    @PreAuthorize("@ss.hasPermi('web:config:edit')")
    @Log(title = "系统配置", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody JSONObject configAttrs)
    {
        Iterator iterator = configAttrs.entrySet().iterator();
        while (iterator.hasNext()) {
            Map.Entry item = (Map.Entry) iterator.next();
            CmsConfig cmsConfig = new CmsConfig();
            cmsConfig.setConfigKey(item.getKey().toString());
            cmsConfig.setConfigValue(item.getValue().toString());
            cmsConfigService.updateCmsConfigByConfigKey(cmsConfig);
        }
        //缓存更新
        configUtils.setConfig();
        return toAjax(1);
    }

    /**
     * 删除系统配置
     */
    @PreAuthorize("@ss.hasPermi('web:config:remove')")
    @Log(title = "系统配置", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(cmsConfigService.deleteCmsConfigByIds(ids));
    }
}
