package com.zyy.web.service;

import java.util.List;
import com.zyy.web.domain.CmsTemplate;

/**
 * 模板Service接口
 *
 * @author hnzyy sun
 * @date 2023-06-20
 */
public interface ICmsTemplateService
{
    /**
     * 查询模板
     *
     * @param id 模板主键
     * @return 模板
     */
    public CmsTemplate selectCmsTemplateById(Long id);

    /**
     * 查询模板列表
     *
     * @param cmsTemplate 模板
     * @return 模板集合
     */
    public List<CmsTemplate> selectCmsTemplateList(CmsTemplate cmsTemplate);

    /**
     * 新增模板
     *
     * @param cmsTemplate 模板
     * @return 结果
     */
    public int insertCmsTemplate(CmsTemplate cmsTemplate);

    /**
     * 修改模板
     *
     * @param cmsTemplate 模板
     * @return 结果
     */
    public int updateCmsTemplate(CmsTemplate cmsTemplate);

    /**
     * 批量删除模板
     *
     * @param ids 需要删除的模板主键集合
     * @return 结果
     */
    public int deleteCmsTemplateByIds(Long[] ids);

    /**
     * 删除模板信息
     *
     * @param id 模板主键
     * @return 结果
     */
    public int deleteCmsTemplateById(Long id);
}
