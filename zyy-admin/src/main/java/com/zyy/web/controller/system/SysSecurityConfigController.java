package com.zyy.web.controller.system;

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
import com.zyy.system.domain.SysSecurityConfig;
import com.zyy.system.service.ISysSecurityConfigService;
import com.zyy.common.utils.poi.ExcelUtil;
import com.zyy.common.core.page.TableDataInfo;

/**
 * 安全配置Controller
 *
 * @author hnzyy
 * @date 2023-12-13
 */
@RestController
@RequestMapping("/system/securitConfig")
public class SysSecurityConfigController extends BaseController
{
    @Autowired
    private ISysSecurityConfigService sysSecurityConfigService;

    /**
     * 查询安全配置列表
     */
    @PreAuthorize("@ss.hasPermi('system:securitConfig:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysSecurityConfig sysSecurityConfig)
    {
        startPage();
        List<SysSecurityConfig> list = sysSecurityConfigService.selectSysSecurityConfigList(sysSecurityConfig);
        return getDataTable(list);
    }

    /**
     * 导出安全配置列表
     */
    @PreAuthorize("@ss.hasPermi('system:securitConfig:export')")
    @Log(title = "安全配置", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysSecurityConfig sysSecurityConfig)
    {
        List<SysSecurityConfig> list = sysSecurityConfigService.selectSysSecurityConfigList(sysSecurityConfig);
        ExcelUtil<SysSecurityConfig> util = new ExcelUtil<SysSecurityConfig>(SysSecurityConfig.class);
        util.exportExcel(response, list, "安全配置数据");
    }

    /**
     * 获取安全配置详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:securitConfig:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sysSecurityConfigService.selectSysSecurityConfigById(id));
    }

    /**
     * 新增安全配置
     */
    @PreAuthorize("@ss.hasPermi('system:securitConfig:add')")
    @Log(title = "安全配置", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysSecurityConfig sysSecurityConfig)
    {
        return toAjax(sysSecurityConfigService.insertSysSecurityConfig(sysSecurityConfig));
    }

    /**
     * 修改安全配置
     */
    @PreAuthorize("@ss.hasPermi('system:securitConfig:edit')")
    @Log(title = "安全配置", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysSecurityConfig sysSecurityConfig)
    {
        return toAjax(sysSecurityConfigService.updateSysSecurityConfig(sysSecurityConfig));
    }

    /**
     * 删除安全配置
     */
    @PreAuthorize("@ss.hasPermi('system:securitConfig:remove')")
    @Log(title = "安全配置", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(sysSecurityConfigService.deleteSysSecurityConfigByIds(ids));
    }

    /**
     * 修改状态
     * @return
     */
    @PreAuthorize("@ss.hasPermi('system:securitConfig:edit')")
    @Log(title = "安全配置", businessType = BusinessType.UPDATE)
    @PutMapping("/updateStage/{id}")
    public AjaxResult updateSysSecurityStage(@PathVariable("id") Long id){
        return toAjax(sysSecurityConfigService.updateSysSecurityStage(id));
    }
}
