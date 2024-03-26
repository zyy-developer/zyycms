package com.zyy.web.service.impl;

import java.util.List;
import com.zyy.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyy.web.mapper.CmsMessageUserMapper;
import com.zyy.web.domain.CmsMessageUser;
import com.zyy.web.service.ICmsMessageUserService;

/**
 * 人员消息状态Service业务层处理
 *
 * @author hnzyy
 * @date 2023-11-14
 */
@Service
public class CmsMessageUserServiceImpl implements ICmsMessageUserService
{
    @Autowired
    private CmsMessageUserMapper cmsMessageUserMapper;

    /**
     * 查询人员消息状态
     *
     * @param id 人员消息状态主键
     * @return 人员消息状态
     */
    @Override
    public CmsMessageUser selectCmsMessageUserById(Long id)
    {
        return cmsMessageUserMapper.selectCmsMessageUserById(id);
    }

    /**
     * 查询人员消息状态列表
     *
     * @param cmsMessageUser 人员消息状态
     * @return 人员消息状态
     */
    @Override
    public List<CmsMessageUser> selectCmsMessageUserList(CmsMessageUser cmsMessageUser)
    {
        return cmsMessageUserMapper.selectCmsMessageUserList(cmsMessageUser);
    }

    /**
     * 新增人员消息状态
     *
     * @param cmsMessageUser 人员消息状态
     * @return 结果
     */
    @Override
    public int insertCmsMessageUser(CmsMessageUser cmsMessageUser)
    {
        cmsMessageUser.setCreateTime(DateUtils.getNowDate());
        return cmsMessageUserMapper.insertCmsMessageUser(cmsMessageUser);
    }

    /**
     * 修改人员消息状态
     *
     * @param cmsMessageUser 人员消息状态
     * @return 结果
     */
    @Override
    public int updateCmsMessageUser(CmsMessageUser cmsMessageUser)
    {
        cmsMessageUser.setUpdateTime(DateUtils.getNowDate());
        return cmsMessageUserMapper.updateCmsMessageUser(cmsMessageUser);
    }

    /**
     * 批量删除人员消息状态
     *
     * @param ids 需要删除的人员消息状态主键
     * @return 结果
     */
    @Override
    public int deleteCmsMessageUserByIds(Long[] ids)
    {
        return cmsMessageUserMapper.deleteCmsMessageUserByIds(ids);
    }

    /**
     * 删除人员消息状态信息
     *
     * @param id 人员消息状态主键
     * @return 结果
     */
    @Override
    public int deleteCmsMessageUserById(Long id)
    {
        return cmsMessageUserMapper.deleteCmsMessageUserById(id);
    }
}
