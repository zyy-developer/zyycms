package com.zyy.web.service.impl;

import java.util.List;
import com.zyy.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyy.web.mapper.CmsLinksMapper;
import com.zyy.web.domain.CmsLinks;
import com.zyy.web.service.ICmsLinksService;

/**
 * 友情链接Service业务层处理
 *
 * @author hnzyy sun
 * @date 2023-06-20
 */
@Service
public class CmsLinksServiceImpl implements ICmsLinksService
{
    @Autowired
    private CmsLinksMapper cmsLinksMapper;

    /**
     * 查询友情链接
     *
     * @param id 友情链接主键
     * @return 友情链接
     */
    @Override
    public CmsLinks selectCmsLinksById(Long id)
    {
        return cmsLinksMapper.selectCmsLinksById(id);
    }

    /**
     * 查询友情链接列表
     *
     * @param cmsLinks 友情链接
     * @return 友情链接
     */
    @Override
    public List<CmsLinks> selectCmsLinksList(CmsLinks cmsLinks)
    {
        return cmsLinksMapper.selectCmsLinksList(cmsLinks);
    }

    /**
     * 新增友情链接
     *
     * @param cmsLinks 友情链接
     * @return 结果
     */
    @Override
    public int insertCmsLinks(CmsLinks cmsLinks)
    {
        cmsLinks.setCreateTime(DateUtils.getNowDate());
        return cmsLinksMapper.insertCmsLinks(cmsLinks);
    }

    /**
     * 修改友情链接
     *
     * @param cmsLinks 友情链接
     * @return 结果
     */
    @Override
    public int updateCmsLinks(CmsLinks cmsLinks)
    {
        return cmsLinksMapper.updateCmsLinks(cmsLinks);
    }

    /**
     * 批量删除友情链接
     *
     * @param ids 需要删除的友情链接主键
     * @return 结果
     */
    @Override
    public int deleteCmsLinksByIds(Long[] ids)
    {
        return cmsLinksMapper.deleteCmsLinksByIds(ids);
    }

    /**
     * 删除友情链接信息
     *
     * @param id 友情链接主键
     * @return 结果
     */
    @Override
    public int deleteCmsLinksById(Long id)
    {
        return cmsLinksMapper.deleteCmsLinksById(id);
    }
}
