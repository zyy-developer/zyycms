package com.zyy.web.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyy.web.mapper.CmsSiteSetupMapper;
import com.zyy.web.domain.CmsSiteSetup;
import com.zyy.web.service.ICmsSiteSetupService;

/**
 * 站点设置Service业务层处理
 *
 * @author hnzyy sun
 * @date 2023-08-03
 */
@Service
public class CmsSiteSetupServiceImpl implements ICmsSiteSetupService
{
    @Autowired
    private CmsSiteSetupMapper cmsSiteSetupMapper;

    /**
     * 查询站点设置
     *
     * @param siteId 站点设置主键
     * @return 站点设置
     */
    @Override
    public CmsSiteSetup selectCmsSiteSetupBySiteId(Long siteId)
    {
        return cmsSiteSetupMapper.selectCmsSiteSetupBySiteId(siteId);
    }

    /**
     * 查询站点设置列表
     *
     * @param cmsSiteSetup 站点设置
     * @return 站点设置
     */
    @Override
    public List<CmsSiteSetup> selectCmsSiteSetupList(CmsSiteSetup cmsSiteSetup)
    {
        return cmsSiteSetupMapper.selectCmsSiteSetupList(cmsSiteSetup);
    }

    /**
     * 新增站点设置
     *
     * @param cmsSiteSetup 站点设置
     * @return 结果
     */
    @Override
    public int insertCmsSiteSetup(CmsSiteSetup cmsSiteSetup)
    {
        return cmsSiteSetupMapper.insertCmsSiteSetup(cmsSiteSetup);
    }

    /**
     * 修改站点设置
     *
     * @param cmsSiteSetup 站点设置
     * @return 结果
     */
    @Override
    public int updateCmsSiteSetup(CmsSiteSetup cmsSiteSetup)
    {
        return cmsSiteSetupMapper.updateCmsSiteSetup(cmsSiteSetup);
    }

    /**
     * 批量删除站点设置
     *
     * @param siteIds 需要删除的站点设置主键
     * @return 结果
     */
    @Override
    public int deleteCmsSiteSetupBySiteIds(Long[] siteIds)
    {
        return cmsSiteSetupMapper.deleteCmsSiteSetupBySiteIds(siteIds);
    }

    /**
     * 删除站点设置信息
     *
     * @param siteId 站点设置主键
     * @return 结果
     */
    @Override
    public int deleteCmsSiteSetupBySiteId(Long siteId)
    {
        return cmsSiteSetupMapper.deleteCmsSiteSetupBySiteId(siteId);
    }
}
