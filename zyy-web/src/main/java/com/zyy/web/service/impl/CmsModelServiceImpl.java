package com.zyy.web.service.impl;

import java.util.List;
import com.zyy.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyy.web.mapper.CmsModelMapper;
import com.zyy.web.domain.CmsModel;
import com.zyy.web.service.ICmsModelService;

/**
 * 模型Service业务层处理
 *
 * @author hnzyy sun
 * @date 2023-06-20
 */
@Service
public class CmsModelServiceImpl implements ICmsModelService
{
    @Autowired
    private CmsModelMapper cmsModelMapper;

    /**
     * 查询模型
     *
     * @param modelId 模型主键
     * @return 模型
     */
    @Override
    public CmsModel selectCmsModelByModelId(Long modelId)
    {
        return cmsModelMapper.selectCmsModelByModelId(modelId);
    }

    /**
     * 查询模型列表
     *
     * @param cmsModel 模型
     * @return 模型
     */
    @Override
    public List<CmsModel> selectCmsModelList(CmsModel cmsModel)
    {
        return cmsModelMapper.selectCmsModelList(cmsModel);
    }

    /**
     * 新增模型
     *
     * @param cmsModel 模型
     * @return 结果
     */
    @Override
    public int insertCmsModel(CmsModel cmsModel)
    {
        cmsModel.setCreateTime(DateUtils.getNowDate());
        return cmsModelMapper.insertCmsModel(cmsModel);
    }

    /**
     * 修改模型
     *
     * @param cmsModel 模型
     * @return 结果
     */
    @Override
    public int updateCmsModel(CmsModel cmsModel)
    {
        return cmsModelMapper.updateCmsModel(cmsModel);
    }

    /**
     * 批量删除模型
     *
     * @param modelIds 需要删除的模型主键
     * @return 结果
     */
    @Override
    public int deleteCmsModelByModelIds(Long[] modelIds)
    {
        return cmsModelMapper.deleteCmsModelByModelIds(modelIds);
    }

    /**
     * 删除模型信息
     *
     * @param modelId 模型主键
     * @return 结果
     */
    @Override
    public int deleteCmsModelByModelId(Long modelId)
    {
        return cmsModelMapper.deleteCmsModelByModelId(modelId);
    }

    @Override
    public List<CmsModel> selectCmsModelByModelIds(Long[] modelIds) {
        return cmsModelMapper.selectCmsModelByModelIds(modelIds);
    }
}
