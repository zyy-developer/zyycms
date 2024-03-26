package com.zyy.web.service;

import java.util.List;
import com.zyy.web.domain.CmsLinks;

/**
 * 友情链接Service接口
 *
 * @author hnzyy sun
 * @date 2023-06-20
 */
public interface ICmsLinksService
{
    /**
     * 查询友情链接
     *
     * @param id 友情链接主键
     * @return 友情链接
     */
    public CmsLinks selectCmsLinksById(Long id);

    /**
     * 查询友情链接列表
     *
     * @param cmsLinks 友情链接
     * @return 友情链接集合
     */
    public List<CmsLinks> selectCmsLinksList(CmsLinks cmsLinks);

    /**
     * 新增友情链接
     *
     * @param cmsLinks 友情链接
     * @return 结果
     */
    public int insertCmsLinks(CmsLinks cmsLinks);

    /**
     * 修改友情链接
     *
     * @param cmsLinks 友情链接
     * @return 结果
     */
    public int updateCmsLinks(CmsLinks cmsLinks);

    /**
     * 批量删除友情链接
     *
     * @param ids 需要删除的友情链接主键集合
     * @return 结果
     */
    public int deleteCmsLinksByIds(Long[] ids);

    /**
     * 删除友情链接信息
     *
     * @param id 友情链接主键
     * @return 结果
     */
    public int deleteCmsLinksById(Long id);
}
