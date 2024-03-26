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
import com.zyy.web.domain.CmsMessageUser;
import com.zyy.web.service.ICmsMessageUserService;
import com.zyy.common.utils.poi.ExcelUtil;
import com.zyy.common.core.page.TableDataInfo;

/**
 * 人员消息状态Controller
 *
 * @author hnzyy
 * @date 2023-11-14
 */
@RestController
@RequestMapping("/web/messageUser")
public class CmsMessageUserController extends BaseController
{
    @Autowired
    private ICmsMessageUserService cmsMessageUserService;

    /**
     * 查询人员消息状态列表
     */
    @PreAuthorize("@ss.hasPermi('web:messageUser:list')")
    @GetMapping("/list")
    public TableDataInfo list(CmsMessageUser cmsMessageUser)
    {
        startPage();
        List<CmsMessageUser> list = cmsMessageUserService.selectCmsMessageUserList(cmsMessageUser);
        return getDataTable(list);
    }

    /**
     * 导出人员消息状态列表
     */
    @PreAuthorize("@ss.hasPermi('web:messageUser:export')")
    @Log(title = "人员消息状态", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CmsMessageUser cmsMessageUser)
    {
        List<CmsMessageUser> list = cmsMessageUserService.selectCmsMessageUserList(cmsMessageUser);
        ExcelUtil<CmsMessageUser> util = new ExcelUtil<CmsMessageUser>(CmsMessageUser.class);
        util.exportExcel(response, list, "人员消息状态数据");
    }

    /**
     * 获取人员消息状态详细信息
     */
    @PreAuthorize("@ss.hasPermi('web:messageUser:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(cmsMessageUserService.selectCmsMessageUserById(id));
    }

    /**
     * 新增人员消息状态
     */
    @PreAuthorize("@ss.hasPermi('web:messageUser:add')")
    @Log(title = "人员消息状态", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CmsMessageUser cmsMessageUser)
    {
        return toAjax(cmsMessageUserService.insertCmsMessageUser(cmsMessageUser));
    }

    /**
     * 修改人员消息状态
     */
    @PreAuthorize("@ss.hasPermi('web:messageUser:edit')")
    @Log(title = "人员消息状态", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CmsMessageUser cmsMessageUser)
    {
        return toAjax(cmsMessageUserService.updateCmsMessageUser(cmsMessageUser));
    }

    /**
     * 删除人员消息状态
     */
    @PreAuthorize("@ss.hasPermi('web:messageUser:remove')")
    @Log(title = "人员消息状态", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(cmsMessageUserService.deleteCmsMessageUserByIds(ids));
    }
}
