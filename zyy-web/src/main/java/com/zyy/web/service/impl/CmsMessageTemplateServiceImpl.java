package com.zyy.web.service.impl;

import java.util.List;
import com.zyy.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyy.web.mapper.CmsMessageTemplateMapper;
import com.zyy.web.domain.CmsMessageTemplate;
import com.zyy.web.service.ICmsMessageTemplateService;

/**
 * 消息通知模板Service业务层处理
 *
 * @author hnzyy
 * @date 2023-11-14
 */
@Service
public class CmsMessageTemplateServiceImpl implements ICmsMessageTemplateService
{
    @Autowired
    private CmsMessageTemplateMapper cmsMessageTemplateMapper;

    /**
     * 查询消息通知模板
     *
     * @param id 消息通知模板主键
     * @return 消息通知模板
     */
    @Override
    public CmsMessageTemplate selectCmsMessageTemplateById(Long id)
    {
        return cmsMessageTemplateMapper.selectCmsMessageTemplateById(id);
    }

    /**
     * 查询消息通知模板列表
     *
     * @param cmsMessageTemplate 消息通知模板
     * @return 消息通知模板
     */
    @Override
    public List<CmsMessageTemplate> selectCmsMessageTemplateList(CmsMessageTemplate cmsMessageTemplate)
    {
        return cmsMessageTemplateMapper.selectCmsMessageTemplateList(cmsMessageTemplate);
    }

    /**
     * 新增消息通知模板
     *
     * @param cmsMessageTemplate 消息通知模板
     * @return 结果
     */
    @Override
    public int insertCmsMessageTemplate(CmsMessageTemplate cmsMessageTemplate)
    {
        cmsMessageTemplate.setCreateTime(DateUtils.getNowDate());
        return cmsMessageTemplateMapper.insertCmsMessageTemplate(cmsMessageTemplate);
    }

    /**
     * 修改消息通知模板
     *
     * @param cmsMessageTemplate 消息通知模板
     * @return 结果
     */
    @Override
    public int updateCmsMessageTemplate(CmsMessageTemplate cmsMessageTemplate)
    {
        cmsMessageTemplate.setUpdateTime(DateUtils.getNowDate());
        return cmsMessageTemplateMapper.updateCmsMessageTemplate(cmsMessageTemplate);
    }

    /**
     * 批量删除消息通知模板
     *
     * @param ids 需要删除的消息通知模板主键
     * @return 结果
     */
    @Override
    public int deleteCmsMessageTemplateByIds(Long[] ids)
    {
        return cmsMessageTemplateMapper.deleteCmsMessageTemplateByIds(ids);
    }

    /**
     * 删除消息通知模板信息
     *
     * @param id 消息通知模板主键
     * @return 结果
     */
    @Override
    public int deleteCmsMessageTemplateById(Long id)
    {
        return cmsMessageTemplateMapper.deleteCmsMessageTemplateById(id);
    }

    /**
     * 通过编码查询消息模板
     * @param tempCode
     * @return
     */
    @Override
    public CmsMessageTemplate selectCmsTemplateByTempCode(String tempCode) {
        return cmsMessageTemplateMapper.selectCmsTemplateByTempCode(tempCode);
    }
}
