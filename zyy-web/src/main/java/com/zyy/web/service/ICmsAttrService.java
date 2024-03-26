package com.zyy.web.service;

import java.util.List;
import com.zyy.web.domain.CmsAttr;

/**
 * 自定义属性Service接口
 *
 * @author hnzyy sun
 * @date 2023-06-20
 */
public interface ICmsAttrService
{
    /**
     * 查询自定义属性
     *
     * @param id 自定义属性主键
     * @return 自定义属性
     */
    public CmsAttr selectCmsAttrById(Long id);

    /**
     * 查询自定义属性列表
     *
     * @param cmsAttr 自定义属性
     * @return 自定义属性集合
     */
    public List<CmsAttr> selectCmsAttrList(CmsAttr cmsAttr);

    /**
     * 新增自定义属性
     *
     * @param cmsAttr 自定义属性
     * @return 结果
     */
    public int insertCmsAttr(CmsAttr cmsAttr);

    /**
     * 修改自定义属性
     *
     * @param cmsAttr 自定义属性
     * @return 结果
     */
    public int updateCmsAttr(CmsAttr cmsAttr);

    /**
     * 批量删除自定义属性
     *
     * @param ids 需要删除的自定义属性主键集合
     * @return 结果
     */
    public int deleteCmsAttrByIds(Long[] ids);

    /**
     * 删除自定义属性信息
     *
     * @param id 自定义属性主键
     * @return 结果
     */
    public int deleteCmsAttrById(Long id);


    /**
     * 通过文章id删除属性id
     * @param id
     * @return
     */
    public int deleteCmsAttrByContentId(Long id);


    /**
     * 通过栏目id删除属性
     * @param id
     * @return
     */
    public int deleteCmsAttrByChannelId(Long id);
}
