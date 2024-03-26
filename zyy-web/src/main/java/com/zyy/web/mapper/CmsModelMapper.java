package com.zyy.web.mapper;

import java.util.List;
import com.zyy.web.domain.CmsModel;

/**
 * 模型Mapper接口
 *
 * @author hnzyy sun
 * @date 2023-06-20
 */
public interface CmsModelMapper
{
    /**
     * 查询模型
     *
     * @param modelId 模型主键
     * @return 模型
     */
    public CmsModel selectCmsModelByModelId(Long modelId);

    /**
     * 查询模型列表
     *
     * @param cmsModel 模型
     * @return 模型集合
     */
    public List<CmsModel> selectCmsModelList(CmsModel cmsModel);

    /**
     * 新增模型
     *
     * @param cmsModel 模型
     * @return 结果
     */
    public int insertCmsModel(CmsModel cmsModel);

    /**
     * 修改模型
     *
     * @param cmsModel 模型
     * @return 结果
     */
    public int updateCmsModel(CmsModel cmsModel);

    /**
     * 删除模型
     *
     * @param modelId 模型主键
     * @return 结果
     */
    public int deleteCmsModelByModelId(Long modelId);

    /**
     * 批量删除模型
     *
     * @param modelIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCmsModelByModelIds(Long[] modelIds);

    /**
     * 批量查询模型信息
     * @param modelIds
     * @return
     */
    public List<CmsModel> selectCmsModelByModelIds(Long[] modelIds);
}
