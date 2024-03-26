package com.zyy.web.mapper;

import java.util.List;
import com.zyy.web.domain.CmsMessage;

/**
 * 消息内容Mapper接口
 * 
 * @author hnzyy
 * @date 2023-11-14
 */
public interface CmsMessageMapper 
{
    /**
     * 查询消息内容
     * 
     * @param id 消息内容主键
     * @return 消息内容
     */
    public CmsMessage selectCmsMessageById(Long id);

    /**
     * 查询消息内容列表
     * 
     * @param cmsMessage 消息内容
     * @return 消息内容集合
     */
    public List<CmsMessage> selectCmsMessageList(CmsMessage cmsMessage);

    /**
     * 新增消息内容
     * 
     * @param cmsMessage 消息内容
     * @return 结果
     */
    public int insertCmsMessage(CmsMessage cmsMessage);

    /**
     * 修改消息内容
     * 
     * @param cmsMessage 消息内容
     * @return 结果
     */
    public int updateCmsMessage(CmsMessage cmsMessage);

    /**
     * 删除消息内容
     * 
     * @param id 消息内容主键
     * @return 结果
     */
    public int deleteCmsMessageById(Long id);

    /**
     * 批量删除消息内容
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCmsMessageByIds(Long[] ids);
}
