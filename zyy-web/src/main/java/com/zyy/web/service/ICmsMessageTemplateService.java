package com.zyy.web.service;

import java.util.List;
import com.zyy.web.domain.CmsMessageTemplate;

/**
 * 消息通知模板Service接口
 *
 * @author hnzyy
 * @date 2023-11-14
 */
public interface ICmsMessageTemplateService
{
    /**
     * 查询消息通知模板
     *
     * @param id 消息通知模板主键
     * @return 消息通知模板
     */
    public CmsMessageTemplate selectCmsMessageTemplateById(Long id);

    /**
     * 查询消息通知模板列表
     *
     * @param cmsMessageTemplate 消息通知模板
     * @return 消息通知模板集合
     */
    public List<CmsMessageTemplate> selectCmsMessageTemplateList(CmsMessageTemplate cmsMessageTemplate);

    /**
     * 新增消息通知模板
     *
     * @param cmsMessageTemplate 消息通知模板
     * @return 结果
     */
    public int insertCmsMessageTemplate(CmsMessageTemplate cmsMessageTemplate);

    /**
     * 修改消息通知模板
     *
     * @param cmsMessageTemplate 消息通知模板
     * @return 结果
     */
    public int updateCmsMessageTemplate(CmsMessageTemplate cmsMessageTemplate);

    /**
     * 批量删除消息通知模板
     *
     * @param ids 需要删除的消息通知模板主键集合
     * @return 结果
     */
    public int deleteCmsMessageTemplateByIds(Long[] ids);

    /**
     * 删除消息通知模板信息
     *
     * @param id 消息通知模板主键
     * @return 结果
     */
    public int deleteCmsMessageTemplateById(Long id);

    /**
     * 通过编码查询消息模板
     * @return 结果
     */
    public CmsMessageTemplate selectCmsTemplateByTempCode(String tempCode);
}
