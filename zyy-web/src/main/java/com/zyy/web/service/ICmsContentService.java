package com.zyy.web.service;

import java.util.List;
import com.zyy.web.domain.CmsContent;

/**
 * 文章管理Service接口
 *
 * @author hnzyy
 * @date 2023-06-20
 */
public interface ICmsContentService
{
    /**
     * 查询文章管理
     *
     * @param id 文章管理主键
     * @return 文章管理
     */
    public CmsContent selectCmsContentById(Long id);

    /**
     * 查询文章管理
     *
     * @param id 文章管理主键
     * @return 文章管理
     */
    public CmsContent selectCmsContentByIdAndTemp(Long id);

    /**
     * 查询文章管理列表
     *
     * @param cmsContent 文章管理
     * @return 文章管理集合
     */
    public List<CmsContent> selectCmsContentList(CmsContent cmsContent);

    /**
     * 查询文章管理列表(模板展示列表)
     *
     * @param cmsContent 文章管理
     * @return 文章管理集合
     */
    public List<CmsContent> selectCmsContentListByTemp(CmsContent cmsContent);

    /**
     * 新增文章管理
     *
     * @param cmsContent 文章管理
     * @return 结果
     */
    public int insertCmsContent(CmsContent cmsContent);

    /**
     * 修改文章管理
     *
     * @param cmsContent 文章管理
     * @return 结果
     */
    public int updateCmsContent(CmsContent cmsContent);

    /**
     * 批量删除文章管理
     *
     * @param ids 需要删除的文章管理主键集合
     * @return 结果
     */
    public int deleteCmsContentByIds(Long[] ids);

    /**
     * 删除文章管理信息
     *
     * @param id 文章管理主键
     * @return 结果
     */
    public int deleteCmsContentById(Long id);

    /**
     * 通过cms信息查询cms内容
     * @return
     */
    public CmsContent selectCmsContentByContent(CmsContent cmsContent);

    /**
     * 文章增加访问量
     * @param cmsContent
     * @return
     */
    public int addViews(CmsContent cmsContent);


    /**
     * 获取今日发布文章数量
     * @return
     */
    public int selectTodayInsertNums(CmsContent cmsContent);


    /**
     * 通过工作流Id查询文章
     * @return
     */
    public CmsContent selectCmsContentByFlowId(String flowId);

    /**
     * 查询该栏目下最大的排序值
     * @return
     */
    public Integer selectCmsContentMaxNum(CmsContent cmsContent);
}
