package com.zyy.web.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyy.web.mapper.CmsContentTxtMapper;
import com.zyy.web.domain.CmsContentTxt;
import com.zyy.web.service.ICmsContentTxtService;

/**
 * 文章内容Service业务层处理
 *
 * @author hnzyy sun
 * @date 2023-07-20
 */
@Service
public class CmsContentTxtServiceImpl implements ICmsContentTxtService
{
    @Autowired
    private CmsContentTxtMapper cmsContentTxtMapper;

    /**
     * 查询文章内容
     *
     * @param id 文章内容主键
     * @return 文章内容
     */
    @Override
    public CmsContentTxt selectCmsContentTxtById(Long id)
    {
        return cmsContentTxtMapper.selectCmsContentTxtById(id);
    }

    /**
     * 查询文章内容列表
     *
     * @param cmsContentTxt 文章内容
     * @return 文章内容
     */
    @Override
    public List<CmsContentTxt> selectCmsContentTxtList(CmsContentTxt cmsContentTxt)
    {
        return cmsContentTxtMapper.selectCmsContentTxtList(cmsContentTxt);
    }

    /**
     * 新增文章内容
     *
     * @param cmsContentTxt 文章内容
     * @return 结果
     */
    @Override
    public int insertCmsContentTxt(CmsContentTxt cmsContentTxt)
    {
        return cmsContentTxtMapper.insertCmsContentTxt(cmsContentTxt);
    }

    /**
     * 修改文章内容
     *
     * @param cmsContentTxt 文章内容
     * @return 结果
     */
    @Override
    public int updateCmsContentTxt(CmsContentTxt cmsContentTxt)
    {
        return cmsContentTxtMapper.updateCmsContentTxt(cmsContentTxt);
    }

    /**
     * 批量删除文章内容
     *
     * @param ids 需要删除的文章内容主键
     * @return 结果
     */
    @Override
    public int deleteCmsContentTxtByIds(Long[] ids)
    {
        return cmsContentTxtMapper.deleteCmsContentTxtByIds(ids);
    }

    /**
     * 删除文章内容信息
     *
     * @param id 文章内容主键
     * @return 结果
     */
    @Override
    public int deleteCmsContentTxtById(Long id)
    {
        return cmsContentTxtMapper.deleteCmsContentTxtById(id);
    }
}
