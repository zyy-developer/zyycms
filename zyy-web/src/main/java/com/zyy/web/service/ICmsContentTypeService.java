package com.zyy.web.service;

import java.util.List;
import com.zyy.web.domain.CmsContentType;

/**
 * 内容类型Service接口
 * 
 * @author hnzyy sun
 * @date 2023-09-05
 */
public interface ICmsContentTypeService 
{
    /**
     * 查询内容类型
     * 
     * @param id 内容类型主键
     * @return 内容类型
     */
    public CmsContentType selectCmsContentTypeById(Long id);

    /**
     * 查询内容类型列表
     * 
     * @param cmsContentType 内容类型
     * @return 内容类型集合
     */
    public List<CmsContentType> selectCmsContentTypeList(CmsContentType cmsContentType);

    /**
     * 新增内容类型
     * 
     * @param cmsContentType 内容类型
     * @return 结果
     */
    public int insertCmsContentType(CmsContentType cmsContentType);

    /**
     * 修改内容类型
     * 
     * @param cmsContentType 内容类型
     * @return 结果
     */
    public int updateCmsContentType(CmsContentType cmsContentType);

    /**
     * 批量删除内容类型
     * 
     * @param ids 需要删除的内容类型主键集合
     * @return 结果
     */
    public int deleteCmsContentTypeByIds(Long[] ids);

    /**
     * 删除内容类型信息
     * 
     * @param id 内容类型主键
     * @return 结果
     */
    public int deleteCmsContentTypeById(Long id);
}
