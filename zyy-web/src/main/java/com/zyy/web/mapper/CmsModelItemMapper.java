package com.zyy.web.mapper;

import java.util.List;
import com.zyy.web.domain.CmsModelItem;

/**
 * 自定义模型字段Mapper接口
 *
 * @author hnzyy sun
 * @date 2023-06-26
 */
public interface CmsModelItemMapper
{
    /**
     * 查询自定义模型字段
     *
     * @param id 自定义模型字段主键
     * @return 自定义模型字段
     */
    public CmsModelItem selectCmsModelItemById(Long id);

    /**
     * 查询自定义模型字段列表
     *
     * @param cmsModelItem 自定义模型字段
     * @return 自定义模型字段集合
     */
    public List<CmsModelItem> selectCmsModelItemList(CmsModelItem cmsModelItem);

    /**
     * 新增自定义模型字段
     *
     * @param cmsModelItem 自定义模型字段
     * @return 结果
     */
    public int insertCmsModelItem(CmsModelItem cmsModelItem);

    /**
     * 修改自定义模型字段
     *
     * @param cmsModelItem 自定义模型字段
     * @return 结果
     */
    public int updateCmsModelItem(CmsModelItem cmsModelItem);

    /**
     * 删除自定义模型字段
     *
     * @param id 自定义模型字段主键
     * @return 结果
     */
    public int deleteCmsModelItemById(Long id);

    /**
     * 批量删除自定义模型字段
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCmsModelItemByIds(Long[] ids);
}
