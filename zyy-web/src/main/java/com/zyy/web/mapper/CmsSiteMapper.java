package com.zyy.web.mapper;

import java.util.List;
import java.util.Set;

import com.zyy.web.domain.CmsSite;

/**
 * 站点Mapper接口
 *
 * @author hnzyy sun
 * @date 2023-07-03
 */
public interface CmsSiteMapper
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
     * 删除站点
     *
     * @param id 站点主键
     * @return 结果
     */
    public int deleteCmsSiteById(Long id);

    /**
     * 批量删除站点
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCmsSiteByIds(Long[] ids);
}
