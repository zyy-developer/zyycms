package com.zyy.web.service.impl;

import java.util.List;
import com.zyy.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyy.web.mapper.CmsModelItemMapper;
import com.zyy.web.domain.CmsModelItem;
import com.zyy.web.service.ICmsModelItemService;

/**
 * 自定义模型字段Service业务层处理
 *
 * @author hnzyy sun
 * @date 2023-06-26
 */
@Service
public class CmsModelItemServiceImpl implements ICmsModelItemService
{
    @Autowired
    private CmsModelItemMapper cmsModelItemMapper;

    /**
     * 查询自定义模型字段
     *
     * @param id 自定义模型字段主键
     * @return 自定义模型字段
     */
    @Override
    public CmsModelItem selectCmsModelItemById(Long id)
    {
        return cmsModelItemMapper.selectCmsModelItemById(id);
    }

    /**
     * 查询自定义模型字段列表
     *
     * @param cmsModelItem 自定义模型字段
     * @return 自定义模型字段
     */
    @Override
    public List<CmsModelItem> selectCmsModelItemList(CmsModelItem cmsModelItem)
    {
        return cmsModelItemMapper.selectCmsModelItemList(cmsModelItem);
    }

    /**
     * 新增自定义模型字段
     *
     * @param cmsModelItem 自定义模型字段
     * @return 结果
     */
    @Override
    public int insertCmsModelItem(CmsModelItem cmsModelItem)
    {
        cmsModelItem.setCreateTime(DateUtils.getNowDate());
        return cmsModelItemMapper.insertCmsModelItem(cmsModelItem);
    }

    /**
     * 修改自定义模型字段
     *
     * @param cmsModelItem 自定义模型字段
     * @return 结果
     */
    @Override
    public int updateCmsModelItem(CmsModelItem cmsModelItem)
    {
        cmsModelItem.setUpdateTime(DateUtils.getNowDate());
        return cmsModelItemMapper.updateCmsModelItem(cmsModelItem);
    }

    /**
     * 批量删除自定义模型字段
     *
     * @param ids 需要删除的自定义模型字段主键
     * @return 结果
     */
    @Override
    public int deleteCmsModelItemByIds(Long[] ids)
    {
        return cmsModelItemMapper.deleteCmsModelItemByIds(ids);
    }

    /**
     * 删除自定义模型字段信息
     *
     * @param id 自定义模型字段主键
     * @return 结果
     */
    @Override
    public int deleteCmsModelItemById(Long id)
    {
        return cmsModelItemMapper.deleteCmsModelItemById(id);
    }
}
