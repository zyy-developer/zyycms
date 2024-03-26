package com.zyy.web.service;

import java.util.List;
import java.util.Set;

import com.zyy.web.domain.CmsSite;
import com.zyy.web.domain.TreeSelectWeb;

/**
 * 站点Service接口
 *
 * @author hnzyy sun
 * @date 2023-07-03
 */
public interface ICmsSiteService
{
    /**
     * 查询站点
     *
     * @param id 站点主键
     * @return 站点
     */
    public CmsSite selectCmsSiteById(Long id);

    /**
     * 查询站点
     *
     * @param directory 站点目录
     * @return 站点
     */
    public CmsSite selectCmsSiteByDirectory(String directory);

    /**
     * 查询站点列表
     *
     * @param cmsSite 站点
     * @return 站点集合
     */
    public List<CmsSite> selectCmsSiteList(CmsSite cmsSite);

    /**
     * 通过set集合查询站点列表
     *
     * @param cmsSite 站点
     * @return 站点集合
     */
    public List<CmsSite> selectCmsSiteListSet(Set<Object> cmsSite);

    /**
     * 新增站点
     *
     * @param cmsSite 站点
     * @return 结果
     */
    public int insertCmsSite(CmsSite cmsSite);

    /**
     * 修改站点
     *
     * @param cmsSite 站点
     * @return 结果
     */
    public int updateCmsSite(CmsSite cmsSite);

    /**
     * 批量删除站点
     *
     * @param ids 需要删除的站点主键集合
     * @return 结果
     */
    public int deleteCmsSiteByIds(Long[] ids);

    /**
     * 删除站点信息
     *
     * @param id 站点主键
     * @return 结果
     */
    public int deleteCmsSiteById(Long id);



    /**
     * 查询栏目树结构信息
     *
     * @param cmsSite 站点信息
     * @return 栏目树信息集合
     */
    public List<TreeSelectWeb> selectDeptTreeList(CmsSite cmsSite);

    /**
     * 构建前端所需要树结构
     *
     * @param cmsChannels 站点列表
     * @return 树结构列表
     */
    public List<CmsSite> buildDeptTree(List<CmsSite> cmsChannels);

    /**
     * 构建前端所需要下拉树结构
     *
     * @param cmsChannels 站点列表
     * @return 下拉树结构列表
     */
    public List<TreeSelectWeb> buildDeptTreeSelect(List<CmsSite> cmsChannels);
}
