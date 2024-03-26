package com.zyy.web.service;

import java.util.List;
import com.zyy.web.domain.CmsFiles;

/**
 * 资源库Service接口
 * 
 * @author hnzyy
 * @date 2023-12-19
 */
public interface ICmsFilesService 
{
    /**
     * 查询资源库
     * 
     * @param id 资源库主键
     * @return 资源库
     */
    public CmsFiles selectCmsFilesById(Long id);

    /**
     * 查询资源库列表
     * 
     * @param cmsFiles 资源库
     * @return 资源库集合
     */
    public List<CmsFiles> selectCmsFilesList(CmsFiles cmsFiles);

    /**
     * 新增资源库
     * 
     * @param cmsFiles 资源库
     * @return 结果
     */
    public int insertCmsFiles(CmsFiles cmsFiles);

    /**
     * 修改资源库
     * 
     * @param cmsFiles 资源库
     * @return 结果
     */
    public int updateCmsFiles(CmsFiles cmsFiles);

    /**
     * 批量删除资源库
     * 
     * @param ids 需要删除的资源库主键集合
     * @return 结果
     */
    public int deleteCmsFilesByIds(Long[] ids);

    /**
     * 删除资源库信息
     * 
     * @param id 资源库主键
     * @return 结果
     */
    public int deleteCmsFilesById(Long id);
}
