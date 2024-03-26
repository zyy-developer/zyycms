package com.zyy.web.mapper;

import java.util.List;
import com.zyy.web.domain.CmsSiteSetup;

/**
 * 站点设置Mapper接口
 *
 * @author hnzyy sun
 * @date 2023-08-03
 */
public interface CmsSiteSetupMapper
{
    /**
     * 查询站点设置
     *
     * @param siteId 站点设置主键
     * @return 站点设置
     */
    public CmsSiteSetup selectCmsSiteSetupBySiteId(Long siteId);

    /**
     * 查询站点设置列表
     *
     * @param cmsSiteSetup 站点设置
     * @return 站点设置集合
     */
    public List<CmsSiteSetup> selectCmsSiteSetupList(CmsSiteSetup cmsSiteSetup);

    /**
     * 新增站点设置
     *
     * @param cmsSiteSetup 站点设置
     * @return 结果
     */
    public int insertCmsSiteSetup(CmsSiteSetup cmsSiteSetup);

    /**
     * 修改站点设置
     *
     * @param cmsSiteSetup 站点设置
     * @return 结果
     */
    public int updateCmsSiteSetup(CmsSiteSetup cmsSiteSetup);

    /**
     * 删除站点设置
     *
     * @param siteId 站点设置主键
     * @return 结果
     */
    public int deleteCmsSiteSetupBySiteId(Long siteId);

    /**
     * 批量删除站点设置
     *
     * @param siteIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCmsSiteSetupBySiteIds(Long[] siteIds);
}
