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
import com.zyy.web.domain.CmsSensitive;
import com.zyy.web.service.ICmsSensitiveService;
import com.zyy.common.utils.poi.ExcelUtil;
import com.zyy.common.core.page.TableDataInfo;

/**
 * 敏感词Controller
 *
 * @author hnzyy sun
 * @date 2023-07-06
 */
@RestController
@RequestMapping("/web/sensitive")
public class CmsSensitiveController extends BaseController
{
    @Autowired
    private ICmsSensitiveService cmsSensitiveService;

    /**
     * 查询敏感词列表
     */
    @PreAuthorize("@ss.hasPermi('web:sensitive:list')")
    @GetMapping("/list")
    public TableDataInfo list(CmsSensitive cmsSensitive)
    {
        startPage();
        List<CmsSensitive> list = cmsSensitiveService.selectCmsSensitiveList(cmsSensitive);
        return getDataTable(list);
    }

    /**
     * 导出敏感词列表
     */
    @PreAuthorize("@ss.hasPermi('web:sensitive:export')")
    @Log(title = "敏感词", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CmsSensitive cmsSensitive)
    {
        List<CmsSensitive> list = cmsSensitiveService.selectCmsSensitiveList(cmsSensitive);
        ExcelUtil<CmsSensitive> util = new ExcelUtil<CmsSensitive>(CmsSensitive.class);
        util.exportExcel(response, list, "敏感词数据");
    }

    /**
     * 获取敏感词详细信息
     */
    @PreAuthorize("@ss.hasPermi('web:sensitive:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(cmsSensitiveService.selectCmsSensitiveById(id));
    }

    /**
     * 新增敏感词
     */
    @PreAuthorize("@ss.hasPermi('web:sensitive:add')")
    @Log(title = "敏感词", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CmsSensitive cmsSensitive)
    {
        return toAjax(cmsSensitiveService.insertCmsSensitive(cmsSensitive));
    }

    /**
     * 修改敏感词
     */
    @PreAuthorize("@ss.hasPermi('web:sensitive:edit')")
    @Log(title = "敏感词", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CmsSensitive cmsSensitive)
    {
        return toAjax(cmsSensitiveService.updateCmsSensitive(cmsSensitive));
    }

    /**
     * 删除敏感词
     */
    @PreAuthorize("@ss.hasPermi('web:sensitive:remove')")
    @Log(title = "敏感词", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(cmsSensitiveService.deleteCmsSensitiveByIds(ids));
    }
}
