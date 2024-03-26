package com.zyy.web.service;

import java.util.List;
import com.zyy.web.domain.CmsMessageUser;

/**
 * 人员消息状态Service接口
 * 
 * @author hnzyy
 * @date 2023-11-14
 */
public interface ICmsMessageUserService 
{
    /**
     * 查询人员消息状态
     * 
     * @param id 人员消息状态主键
     * @return 人员消息状态
     */
    public CmsMessageUser selectCmsMessageUserById(Long id);

    /**
     * 查询人员消息状态列表
     * 
     * @param cmsMessageUser 人员消息状态
     * @return 人员消息状态集合
     */
    public List<CmsMessageUser> selectCmsMessageUserList(CmsMessageUser cmsMessageUser);

    /**
     * 新增人员消息状态
     * 
     * @param cmsMessageUser 人员消息状态
     * @return 结果
     */
    public int insertCmsMessageUser(CmsMessageUser cmsMessageUser);

    /**
     * 修改人员消息状态
     * 
     * @param cmsMessageUser 人员消息状态
     * @return 结果
     */
    public int updateCmsMessageUser(CmsMessageUser cmsMessageUser);

    /**
     * 批量删除人员消息状态
     * 
     * @param ids 需要删除的人员消息状态主键集合
     * @return 结果
     */
    public int deleteCmsMessageUserByIds(Long[] ids);

    /**
     * 删除人员消息状态信息
     * 
     * @param id 人员消息状态主键
     * @return 结果
     */
    public int deleteCmsMessageUserById(Long id);
}
