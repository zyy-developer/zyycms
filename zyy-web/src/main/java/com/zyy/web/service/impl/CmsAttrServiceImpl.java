package com.zyy.web.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyy.web.mapper.CmsAttrMapper;
import com.zyy.web.domain.CmsAttr;
import com.zyy.web.service.ICmsAttrService;

/**
 * 自定义属性Service业务层处理
 *
 * @author hnzyy sun
 * @date 2023-06-20
 */
@Service
public class CmsAttrServiceImpl implements ICmsAttrService
{
    @Autowired
    private CmsAttrMapper cmsAttrMapper;

    /**
     * 查询自定义属性
     *
     * @param id 自定义属性主键
     * @return 自定义属性
     */
    @Override
    public CmsAttr selectCmsAttrById(Long id)
    {
        return cmsAttrMapper.selectCmsAttrById(id);
    }

    /**
     * 查询自定义属性列表
     *
     * @param cmsAttr 自定义属性
     * @return 自定义属性
     */
    @Override
    public List<CmsAttr> selectCmsAttrList(CmsAttr cmsAttr)
    {
        return cmsAttrMapper.selectCmsAttrList(cmsAttr);
    }

    /**
     * 新增自定义属性
     *
     * @param cmsAttr 自定义属性
     * @return 结果
     */
    @Override
    public int insertCmsAttr(CmsAttr cmsAttr)
    {
        return cmsAttrMapper.insertCmsAttr(cmsAttr);
    }

    /**
     * 修改自定义属性
     *
     * @param cmsAttr 自定义属性
     * @return 结果
     */
    @Override
    public int updateCmsAttr(CmsAttr cmsAttr)
    {
        return cmsAttrMapper.updateCmsAttr(cmsAttr);
    }

    /**
     * 批量删除自定义属性
     *
     * @param ids 需要删除的自定义属性主键
     * @return 结果
     */
    @Override
    public int deleteCmsAttrByIds(Long[] ids)
    {
        return cmsAttrMapper.deleteCmsAttrByIds(ids);
    }

    /**
     * 删除自定义属性信息
     *
     * @param id 自定义属性主键
     * @return 结果
     */
    @Override
    public int deleteCmsAttrById(Long id)
    {
        return cmsAttrMapper.deleteCmsAttrById(id);
    }

    @Override
    public int deleteCmsAttrByContentId(Long id) {
        return cmsAttrMapper.deleteCmsAttrByContentId(id);
    }

    @Override
    public int deleteCmsAttrByChannelId(Long id) {
        return cmsAttrMapper.deleteCmsAttrByChannelId(id);
    }
}
