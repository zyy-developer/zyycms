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
import com.zyy.web.domain.CmsMessage;
import com.zyy.web.service.ICmsMessageService;
import com.zyy.common.utils.poi.ExcelUtil;
import com.zyy.common.core.page.TableDataInfo;

/**
 * 消息内容Controller
 *
 * @author hnzyy
 * @date 2023-11-14
 */
@RestController
@RequestMapping("/web/message")
public class CmsMessageController extends BaseController
{
    @Autowired
    private ICmsMessageService cmsMessageService;

    /**
     * 查询消息内容列表
     */
    @PreAuthorize("@ss.hasPermi('web:message:list')")
    @GetMapping("/list")
    public TableDataInfo list(CmsMessage cmsMessage)
    {
        startPage();
        LoginUser principal = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        cmsMessage.setUserId(principal.getUserId());
        List<CmsMessage> list = cmsMessageService.selectCmsMessageList(cmsMessage);
        return getDataTable(list);
    }

    /**
     * 导出消息内容列表
     */
    @PreAuthorize("@ss.hasPermi('web:message:export')")
    @Log(title = "消息内容", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CmsMessage cmsMessage)
    {
        List<CmsMessage> list = cmsMessageService.selectCmsMessageList(cmsMessage);
        ExcelUtil<CmsMessage> util = new ExcelUtil<CmsMessage>(CmsMessage.class);
        util.exportExcel(response, list, "消息内容数据");
    }

    /**
     * 获取消息内容详细信息
     */
    @PreAuthorize("@ss.hasPermi('web:message:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(cmsMessageService.selectCmsMessageById(id));
    }

    /**
     * 新增消息内容
     */
    @PreAuthorize("@ss.hasPermi('web:message:add')")
    @Log(title = "消息内容", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CmsMessage cmsMessage)
    {
        return toAjax(cmsMessageService.insertCmsMessage(cmsMessage));
    }

    /**
     * 修改消息内容
     */
    @PreAuthorize("@ss.hasPermi('web:message:edit')")
    @Log(title = "消息内容", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CmsMessage cmsMessage)
    {
        return toAjax(cmsMessageService.updateCmsMessage(cmsMessage));
    }

    /**
     * 删除消息内容
     */
    @PreAuthorize("@ss.hasPermi('web:message:remove')")
    @Log(title = "消息内容", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(cmsMessageService.deleteCmsMessageByIds(ids));
    }
}
