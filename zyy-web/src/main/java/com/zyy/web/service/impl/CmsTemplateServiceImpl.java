package com.zyy.web.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyy.web.mapper.CmsTemplateMapper;
import com.zyy.web.domain.CmsTemplate;
import com.zyy.web.service.ICmsTemplateService;

/**
 * 模板Service业务层处理
 *
 * @author hnzyy sun
 * @date 2023-06-20
 */
@Service
public class CmsTemplateServiceImpl implements ICmsTemplateService
{
    @Autowired
    private CmsTemplateMapper cmsTemplateMapper;

    /**
     * 查询模板
     *
     * @param id 模板主键
     * @return 模板
     */
    @Override
    public CmsTemplate selectCmsTemplateById(Long id)
    {
        return cmsTemplateMapper.selectCmsTemplateById(id);
    }

    /**
     * 查询模板列表
     *
     * @param cmsTemplate 模板
     * @return 模板
     */
    @Override
    public List<CmsTemplate> selectCmsTemplateList(CmsTemplate cmsTemplate)
    {
        return cmsTemplateMapper.selectCmsTemplateList(cmsTemplate);
    }

    /**
     * 新增模板
     *
     * @param cmsTemplate 模板
     * @return 结果
     */
    @Override
    public int insertCmsTemplate(CmsTemplate cmsTemplate)
    {
        return cmsTemplateMapper.insertCmsTemplate(cmsTemplate);
    }

    /**
     * 修改模板
     *
     * @param cmsTemplate 模板
     * @return 结果
     */
    @Override
    public int updateCmsTemplate(CmsTemplate cmsTemplate)
    {
        return cmsTemplateMapper.updateCmsTemplate(cmsTemplate);
    }

    /**
     * 批量删除模板
     *
     * @param ids 需要删除的模板主键
     * @return 结果
     */
    @Override
    public int deleteCmsTemplateByIds(Long[] ids)
    {
        return cmsTemplateMapper.deleteCmsTemplateByIds(ids);
    }

    /**
     * 删除模板信息
     *
     * @param id 模板主键
     * @return 结果
     */
    @Override
    public int deleteCmsTemplateById(Long id)
    {
        return cmsTemplateMapper.deleteCmsTemplateById(id);
    }
}
