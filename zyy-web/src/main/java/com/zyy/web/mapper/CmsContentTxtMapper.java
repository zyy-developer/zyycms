package com.zyy.web.mapper;

import java.util.List;
import com.zyy.web.domain.CmsContentTxt;

/**
 * 文章内容Mapper接口
 *
 * @author hnzyy sun
 * @date 2023-07-20
 */
public interface CmsContentTxtMapper
{
    /**
     * 查询文章内容
     *
     * @param id 文章内容主键
     * @return 文章内容
     */
    public CmsContentTxt selectCmsContentTxtById(Long id);

    /**
     * 通过文章id查询文章内容
     * @return
     */
    public CmsContentTxt selectCmsContentTxtByContentId(Long contentId);

    /**
     * 查询文章内容列表
     *
     * @param cmsContentTxt 文章内容
     * @return 文章内容集合
     */
    public List<CmsContentTxt> selectCmsContentTxtList(CmsContentTxt cmsContentTxt);

    /**
     * 新增文章内容
     *
     * @param cmsContentTxt 文章内容
     * @return 结果
     */
    public int insertCmsContentTxt(CmsContentTxt cmsContentTxt);

    /**
     * 修改文章内容
     *
     * @param cmsContentTxt 文章内容
     * @return 结果
     */
    public int updateCmsContentTxt(CmsContentTxt cmsContentTxt);

    /**
     * 删除文章内容
     *
     * @param id 文章内容主键
     * @return 结果
     */
    public int deleteCmsContentTxtById(Long id);

    /**
     * 批量删除文章内容
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCmsContentTxtByIds(Long[] ids);

    /**
     * 通过文章id删除文章富文本内容
     * @return
     */
    public int deleteCmsContentTxtByContentId(Long contentId);
}
