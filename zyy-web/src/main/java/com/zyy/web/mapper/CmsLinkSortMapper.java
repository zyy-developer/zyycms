package com.zyy.web.mapper;

import java.util.List;
import com.zyy.web.domain.CmsLinkSort;

/**
 * 友情链接分类Mapper接口
 *
 * @author hnzyy sun
 * @date 2023-06-20
 */
public interface CmsLinkSortMapper
{
    /**
     * 查询友情链接分类
     *
     * @param id 友情链接分类主键
     * @return 友情链接分类
     */
    public CmsLinkSort selectCmsLinkSortById(Long id);

    /**
     * 查询友情链接分类列表
     *
     * @param cmsLinkSort 友情链接分类
     * @return 友情链接分类集合
     */
    public List<CmsLinkSort> selectCmsLinkSortList(CmsLinkSort cmsLinkSort);

    /**
     * 新增友情链接分类
     *
     * @param cmsLinkSort 友情链接分类
     * @return 结果
     */
    public int insertCmsLinkSort(CmsLinkSort cmsLinkSort);

    /**
     * 修改友情链接分类
     *
     * @param cmsLinkSort 友情链接分类
     * @return 结果
     */
    public int updateCmsLinkSort(CmsLinkSort cmsLinkSort);

    /**
     * 删除友情链接分类
     *
     * @param id 友情链接分类主键
     * @return 结果
     */
    public int deleteCmsLinkSortById(Long id);

    /**
     * 批量删除友情链接分类
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCmsLinkSortByIds(Long[] ids);
}
