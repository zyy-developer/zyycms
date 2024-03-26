package com.zyy.web.controller.system;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.zyy.web.domain.CmsSite;
import com.zyy.web.service.ICmsSiteService;
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
import com.zyy.system.domain.SysRoleCms;
import com.zyy.system.service.ISysRoleCmsService;
import com.zyy.common.utils.poi.ExcelUtil;
import com.zyy.common.core.page.TableDataInfo;

/**
 * cms角色权限Controller
 *
 * @author hnzyy sun
 * @date 2023-08-04
 */
@RestController
@RequestMapping("/system/cms")
public class SysRoleCmsController extends BaseController
{
    @Autowired
    private ISysRoleCmsService sysRoleCmsService;

    @Autowired
    private ICmsSiteService cmsSiteService;


    /**
     * 查询cms角色权限列表
     */
    @PreAuthorize("@ss.hasPermi('system:cms:list')")
    @GetMapping("/list")
    public TableDataInfo list(SysRoleCms sysRoleCms)
    {
        startPage();
        List<SysRoleCms> list = sysRoleCmsService.selectSysRoleCmsList(sysRoleCms);
        return getDataTable(list);
    }

    /**
     * 导出cms角色权限列表
     */
    @PreAuthorize("@ss.hasPermi('system:cms:export')")
    @Log(title = "cms角色权限", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SysRoleCms sysRoleCms)
    {
        List<SysRoleCms> list = sysRoleCmsService.selectSysRoleCmsList(sysRoleCms);
        ExcelUtil<SysRoleCms> util = new ExcelUtil<SysRoleCms>(SysRoleCms.class);
        util.exportExcel(response, list, "cms角色权限数据");
    }

    /**
     * 获取cms角色权限详细信息
     */
    @PreAuthorize("@ss.hasPermi('system:cms:query')")
    @GetMapping(value = "/{roleId}")
    public AjaxResult getInfo(@PathVariable("roleId") Long roleId)
    {
        return success(sysRoleCmsService.selectSysRoleCmsByRoleId(roleId));
    }

    /**
     * 新增cms角色权限
     */
    @PreAuthorize("@ss.hasPermi('system:cms:add')")
    @Log(title = "cms角色权限", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SysRoleCms sysRoleCms)
    {
        return toAjax(sysRoleCmsService.insertSysRoleCms(sysRoleCms));
    }

    /**
     * 修改cms角色权限
     */
    @PreAuthorize("@ss.hasPermi('system:cms:edit')")
    @Log(title = "cms角色权限", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SysRoleCms sysRoleCms)
    {
        return toAjax(sysRoleCmsService.updateSysRoleCms(sysRoleCms));
    }

    /**
     * 删除cms角色权限
     */
    @PreAuthorize("@ss.hasPermi('system:cms:remove')")
    @Log(title = "cms角色权限", businessType = BusinessType.DELETE)
	@DeleteMapping("/{roleIds}")
    public AjaxResult remove(@PathVariable Long[] roleIds)
    {
        return toAjax(sysRoleCmsService.deleteSysRoleCmsByRoleIds(roleIds));
    }

    /**
     * 获取下拉树列表
     */
    @GetMapping("/treeselect")
    public AjaxResult treeselect(CmsSite cmsSite)
    {
        List<CmsSite> sites = cmsSiteService.selectCmsSiteList(cmsSite);
        return success(cmsSiteService.buildDeptTreeSelect(sites));
    }

    @GetMapping("/getCheckedKeys/{roleId}")
    public AjaxResult selectCheckedKeys(@PathVariable("roleId") Long roleId){
        SysRoleCms sysRoleCms = new SysRoleCms();
        sysRoleCms.setRoleId(roleId);
        sysRoleCms.setPropertyType("channel");
        List<SysRoleCms> sysRoleCmsList = sysRoleCmsService.selectSysRoleCmsList(sysRoleCms);
        AjaxResult ajax = AjaxResult.success();
        ajax.put("checkedKeysByChannel",sysRoleCmsList);
        return ajax;
    }

    /**
     * 通过角色id查询站点列表
     * @return
     */
    @GetMapping("/getSiteList/{roleId}")
    public AjaxResult selectSiteListByRoleId(@PathVariable("roleId") Long roleId){
        SysRoleCms sysRoleCms = new SysRoleCms();
        sysRoleCms.setRoleId(roleId);
        sysRoleCms.setPropertyType("site");
        List<SysRoleCms> sysRoleCmsList = sysRoleCmsService.selectSysRoleCmsList(sysRoleCms);
        for (SysRoleCms roleCms:sysRoleCmsList) {
            CmsSite cmsSite = cmsSiteService.selectCmsSiteById(roleCms.getPropertyId());
            if(cmsSite!=null){
                roleCms.setPropertyName(cmsSite.getName());
            }
        }
        return AjaxResult.success(sysRoleCmsList);
    }
}
