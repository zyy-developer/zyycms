package com.zyy.web.service.impl;

import java.util.List;
import com.zyy.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyy.web.mapper.CmsConfigMapper;
import com.zyy.web.domain.CmsConfig;
import com.zyy.web.service.ICmsConfigService;

/**
 * 系统配置Service业务层处理
 *
 * @author hnzyy
 * @date 2023-11-10
 */
@Service
public class CmsConfigServiceImpl implements ICmsConfigService
{
    @Autowired
    private CmsConfigMapper cmsConfigMapper;

    /**
     * 查询系统配置
     *
     * @param id 系统配置主键
     * @return 系统配置
     */
    @Override
    public CmsConfig selectCmsConfigById(Long id)
    {
        return cmsConfigMapper.selectCmsConfigById(id);
    }

    /**
     * 查询系统配置列表
     *
     * @param cmsConfig 系统配置
     * @return 系统配置
     */
    @Override
    public List<CmsConfig> selectCmsConfigList(CmsConfig cmsConfig)
    {
        return cmsConfigMapper.selectCmsConfigList(cmsConfig);
    }

    /**
     * 新增系统配置
     *
     * @param cmsConfig 系统配置
     * @return 结果
     */
    @Override
    public int insertCmsConfig(CmsConfig cmsConfig)
    {
        cmsConfig.setCreateTime(DateUtils.getNowDate());
        return cmsConfigMapper.insertCmsConfig(cmsConfig);
    }

    /**
     * 修改系统配置
     *
     * @param cmsConfig 系统配置
     * @return 结果
     */
    @Override
    public int updateCmsConfig(CmsConfig cmsConfig)
    {
        cmsConfig.setUpdateTime(DateUtils.getNowDate());
        return cmsConfigMapper.updateCmsConfig(cmsConfig);
    }

    /**
     * 批量删除系统配置
     *
     * @param ids 需要删除的系统配置主键
     * @return 结果
     */
    @Override
    public int deleteCmsConfigByIds(Long[] ids)
    {
        return cmsConfigMapper.deleteCmsConfigByIds(ids);
    }

    /**
     * 删除系统配置信息
     *
     * @param id 系统配置主键
     * @return 结果
     */
    @Override
    public int deleteCmsConfigById(Long id)
    {
        return cmsConfigMapper.deleteCmsConfigById(id);
    }

    @Override
    public int updateCmsConfigByConfigKey(CmsConfig cmsConfig) {
        return cmsConfigMapper.updateCmsConfigByConfigKey(cmsConfig);
    }
}
