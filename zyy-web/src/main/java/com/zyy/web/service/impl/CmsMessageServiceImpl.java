package com.zyy.web.service.impl;

import java.util.List;

import com.zyy.common.core.domain.model.LoginUser;
import com.zyy.common.utils.DateUtils;
import com.zyy.common.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyy.web.mapper.CmsMessageMapper;
import com.zyy.web.domain.CmsMessage;
import com.zyy.web.service.ICmsMessageService;

/**
 * 消息内容Service业务层处理
 *
 * @author hnzyy
 * @date 2023-11-14
 */
@Service
public class CmsMessageServiceImpl implements ICmsMessageService
{
    @Autowired
    private CmsMessageMapper cmsMessageMapper;

    /**
     * 查询消息内容
     *
     * @param id 消息内容主键
     * @return 消息内容
     */
    @Override
    public CmsMessage selectCmsMessageById(Long id)
    {
        return cmsMessageMapper.selectCmsMessageById(id);
    }

    /**
     * 查询消息内容列表
     *
     * @param cmsMessage 消息内容
     * @return 消息内容
     */
    @Override
    public List<CmsMessage> selectCmsMessageList(CmsMessage cmsMessage)
    {
        LoginUser principal = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        cmsMessage.setUserId(principal.getUserId());
        return cmsMessageMapper.selectCmsMessageList(cmsMessage);
    }

    /**
     * 新增消息内容
     *
     * @param cmsMessage 消息内容
     * @return 结果
     */
    @Override
    public int insertCmsMessage(CmsMessage cmsMessage)
    {
        cmsMessage.setCreateTime(DateUtils.getNowDate());
        return cmsMessageMapper.insertCmsMessage(cmsMessage);
    }

    /**
     * 修改消息内容
     *
     * @param cmsMessage 消息内容
     * @return 结果
     */
    @Override
    public int updateCmsMessage(CmsMessage cmsMessage)
    {
        cmsMessage.setUpdateTime(DateUtils.getNowDate());
        return cmsMessageMapper.updateCmsMessage(cmsMessage);
    }

    /**
     * 批量删除消息内容
     *
     * @param ids 需要删除的消息内容主键
     * @return 结果
     */
    @Override
    public int deleteCmsMessageByIds(Long[] ids)
    {
        return cmsMessageMapper.deleteCmsMessageByIds(ids);
    }

    /**
     * 删除消息内容信息
     *
     * @param id 消息内容主键
     * @return 结果
     */
    @Override
    public int deleteCmsMessageById(Long id)
    {
        return cmsMessageMapper.deleteCmsMessageById(id);
    }
}
