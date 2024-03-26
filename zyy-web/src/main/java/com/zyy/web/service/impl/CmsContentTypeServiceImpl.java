package com.zyy.web.service.impl;

import java.util.List;
import com.zyy.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyy.web.mapper.CmsContentTypeMapper;
import com.zyy.web.domain.CmsContentType;
import com.zyy.web.service.ICmsContentTypeService;

/**
 * 内容类型Service业务层处理
 *
 * @author hnzyy sun
 * @date 2023-09-05
 */
@Service
public class CmsContentTypeServiceImpl implements ICmsContentTypeService
{
    @Autowired
    private CmsContentTypeMapper cmsContentTypeMapper;

    /**
     * 查询内容类型
     *
     * @param id 内容类型主键
     * @return 内容类型
     */
    @Override
    public CmsContentType selectCmsContentTypeById(Long id)
    {
        return cmsContentTypeMapper.selectCmsContentTypeById(id);
    }

    /**
     * 查询内容类型列表
     *
     * @param cmsContentType 内容类型
     * @return 内容类型
     */
    @Override
    public List<CmsContentType> selectCmsContentTypeList(CmsContentType cmsContentType)
    {
        return cmsContentTypeMapper.selectCmsContentTypeList(cmsContentType);
    }

    /**
     * 新增内容类型
     *
     * @param cmsContentType 内容类型
     * @return 结果
     */
    @Override
    public int insertCmsContentType(CmsContentType cmsContentType)
    {
        cmsContentType.setCreateTime(DateUtils.getNowDate());
        return cmsContentTypeMapper.insertCmsContentType(cmsContentType);
    }

    /**
     * 修改内容类型
     *
     * @param cmsContentType 内容类型
     * @return 结果
     */
    @Override
    public int updateCmsContentType(CmsContentType cmsContentType)
    {
        cmsContentType.setUpdateTime(DateUtils.getNowDate());
        return cmsContentTypeMapper.updateCmsContentType(cmsContentType);
    }

    /**
     * 批量删除内容类型
     *
     * @param ids 需要删除的内容类型主键
     * @return 结果
     */
    @Override
    public int deleteCmsContentTypeByIds(Long[] ids)
    {
        return cmsContentTypeMapper.deleteCmsContentTypeByIds(ids);
    }

    /**
     * 删除内容类型信息
     *
     * @param id 内容类型主键
     * @return 结果
     */
    @Override
    public int deleteCmsContentTypeById(Long id)
    {
        return cmsContentTypeMapper.deleteCmsContentTypeById(id);
    }
}
