package com.zyy.web.service.impl;

import java.util.List;
import com.zyy.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyy.web.mapper.CmsFilesMapper;
import com.zyy.web.domain.CmsFiles;
import com.zyy.web.service.ICmsFilesService;

/**
 * 资源库Service业务层处理
 *
 * @author hnzyy
 * @date 2023-12-19
 */
@Service
public class CmsFilesServiceImpl implements ICmsFilesService
{
    @Autowired
    private CmsFilesMapper cmsFilesMapper;

    /**
     * 查询资源库
     *
     * @param id 资源库主键
     * @return 资源库
     */
    @Override
    public CmsFiles selectCmsFilesById(Long id)
    {
        return cmsFilesMapper.selectCmsFilesById(id);
    }

    /**
     * 查询资源库列表
     *
     * @param cmsFiles 资源库
     * @return 资源库
     */
    @Override
    public List<CmsFiles> selectCmsFilesList(CmsFiles cmsFiles)
    {
        return cmsFilesMapper.selectCmsFilesList(cmsFiles);
    }

    /**
     * 新增资源库
     *
     * @param cmsFiles 资源库
     * @return 结果
     */
    @Override
    public int insertCmsFiles(CmsFiles cmsFiles)
    {
        cmsFiles.setCreateTime(DateUtils.getNowDate());
        return cmsFilesMapper.insertCmsFiles(cmsFiles);
    }

    /**
     * 修改资源库
     *
     * @param cmsFiles 资源库
     * @return 结果
     */
    @Override
    public int updateCmsFiles(CmsFiles cmsFiles)
    {
        return cmsFilesMapper.updateCmsFiles(cmsFiles);
    }

    /**
     * 批量删除资源库
     *
     * @param ids 需要删除的资源库主键
     * @return 结果
     */
    @Override
    public int deleteCmsFilesByIds(Long[] ids)
    {
        return cmsFilesMapper.deleteCmsFilesByIds(ids);
    }

    /**
     * 删除资源库信息
     *
     * @param id 资源库主键
     * @return 结果
     */
    @Override
    public int deleteCmsFilesById(Long id)
    {
        return cmsFilesMapper.deleteCmsFilesById(id);
    }
}
