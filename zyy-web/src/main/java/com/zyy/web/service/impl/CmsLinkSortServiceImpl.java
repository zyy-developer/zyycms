package com.zyy.web.service.impl;

import java.util.List;
import com.zyy.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyy.web.mapper.CmsLinkSortMapper;
import com.zyy.web.domain.CmsLinkSort;
import com.zyy.web.service.ICmsLinkSortService;

/**
 * 友情链接分类Service业务层处理
 *
 * @author hnzyy sun
 * @date 2023-06-20
 */
@Service
public class CmsLinkSortServiceImpl implements ICmsLinkSortService
{
    @Autowired
    private CmsLinkSortMapper cmsLinkSortMapper;

    /**
     * 查询友情链接分类
     *
     * @param id 友情链接分类主键
     * @return 友情链接分类
     */
    @Override
    public CmsLinkSort selectCmsLinkSortById(Long id)
    {
        return cmsLinkSortMapper.selectCmsLinkSortById(id);
    }

    /**
     * 查询友情链接分类列表
     *
     * @param cmsLinkSort 友情链接分类
     * @return 友情链接分类
     */
    @Override
    public List<CmsLinkSort> selectCmsLinkSortList(CmsLinkSort cmsLinkSort)
    {
        return cmsLinkSortMapper.selectCmsLinkSortList(cmsLinkSort);
    }

    /**
     * 新增友情链接分类
     *
     * @param cmsLinkSort 友情链接分类
     * @return 结果
     */
    @Override
    public int insertCmsLinkSort(CmsLinkSort cmsLinkSort)
    {
        cmsLinkSort.setCreateTime(DateUtils.getNowDate());
        return cmsLinkSortMapper.insertCmsLinkSort(cmsLinkSort);
    }

    /**
     * 修改友情链接分类
     *
     * @param cmsLinkSort 友情链接分类
     * @return 结果
     */
    @Override
    public int updateCmsLinkSort(CmsLinkSort cmsLinkSort)
    {
        return cmsLinkSortMapper.updateCmsLinkSort(cmsLinkSort);
    }

    /**
     * 批量删除友情链接分类
     *
     * @param ids 需要删除的友情链接分类主键
     * @return 结果
     */
    @Override
    public int deleteCmsLinkSortByIds(Long[] ids)
    {
        return cmsLinkSortMapper.deleteCmsLinkSortByIds(ids);
    }

    /**
     * 删除友情链接分类信息
     *
     * @param id 友情链接分类主键
     * @return 结果
     */
    @Override
    public int deleteCmsLinkSortById(Long id)
    {
        return cmsLinkSortMapper.deleteCmsLinkSortById(id);
    }
}
