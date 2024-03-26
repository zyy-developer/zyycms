package com.zyy.web.service;

import java.util.List;
import com.zyy.web.domain.CmsConfig;

/**
 * 系统配置Service接口
 *
 * @author hnzyy
 * @date 2023-11-10
 */
public interface ICmsConfigService
{
    /**
     * 查询系统配置
     *
     * @param id 系统配置主键
     * @return 系统配置
     */
    public CmsConfig selectCmsConfigById(Long id);

    /**
     * 查询系统配置列表
     *
     * @param cmsConfig 系统配置
     * @return 系统配置集合
     */
    public List<CmsConfig> selectCmsConfigList(CmsConfig cmsConfig);

    /**
     * 新增系统配置
     *
     * @param cmsConfig 系统配置
     * @return 结果
     */
    public int insertCmsConfig(CmsConfig cmsConfig);

    /**
     * 修改系统配置
     *
     * @param cmsConfig 系统配置
     * @return 结果
     */
    public int updateCmsConfig(CmsConfig cmsConfig);

    /**
     * 批量删除系统配置
     *
     * @param ids 需要删除的系统配置主键集合
     * @return 结果
     */
    public int deleteCmsConfigByIds(Long[] ids);

    /**
     * 删除系统配置信息
     *
     * @param id 系统配置主键
     * @return 结果
     */
    public int deleteCmsConfigById(Long id);

    /**
     * 修改配置文件
     * @param cmsConfig
     * @return
     */
    public int updateCmsConfigByConfigKey(CmsConfig cmsConfig);
}
