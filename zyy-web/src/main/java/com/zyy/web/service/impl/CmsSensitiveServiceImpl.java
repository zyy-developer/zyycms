package com.zyy.web.service.impl;

import java.util.List;
import com.zyy.common.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyy.web.mapper.CmsSensitiveMapper;
import com.zyy.web.domain.CmsSensitive;
import com.zyy.web.service.ICmsSensitiveService;

/**
 * 敏感词Service业务层处理
 *
 * @author hnzyy sun
 * @date 2023-07-06
 */
@Service
public class CmsSensitiveServiceImpl implements ICmsSensitiveService
{
    @Autowired
    private CmsSensitiveMapper cmsSensitiveMapper;

    /**
     * 查询敏感词
     *
     * @param id 敏感词主键
     * @return 敏感词
     */
    @Override
    public CmsSensitive selectCmsSensitiveById(Long id)
    {
        return cmsSensitiveMapper.selectCmsSensitiveById(id);
    }

    /**
     * 查询敏感词列表
     *
     * @param cmsSensitive 敏感词
     * @return 敏感词
     */
    @Override
    public List<CmsSensitive> selectCmsSensitiveList(CmsSensitive cmsSensitive)
    {
        return cmsSensitiveMapper.selectCmsSensitiveList(cmsSensitive);
    }

    /**
     * 新增敏感词
     *
     * @param cmsSensitive 敏感词
     * @return 结果
     */
    @Override
    public int insertCmsSensitive(CmsSensitive cmsSensitive)
    {
        cmsSensitive.setCreateTime(DateUtils.getNowDate());
        return cmsSensitiveMapper.insertCmsSensitive(cmsSensitive);
    }

    /**
     * 修改敏感词
     *
     * @param cmsSensitive 敏感词
     * @return 结果
     */
    @Override
    public int updateCmsSensitive(CmsSensitive cmsSensitive)
    {
        cmsSensitive.setUpdateTime(DateUtils.getNowDate());
        return cmsSensitiveMapper.updateCmsSensitive(cmsSensitive);
    }

    /**
     * 批量删除敏感词
     *
     * @param ids 需要删除的敏感词主键
     * @return 结果
     */
    @Override
    public int deleteCmsSensitiveByIds(Long[] ids)
    {
        return cmsSensitiveMapper.deleteCmsSensitiveByIds(ids);
    }

    /**
     * 删除敏感词信息
     *
     * @param id 敏感词主键
     * @return 结果
     */
    @Override
    public int deleteCmsSensitiveById(Long id)
    {
        return cmsSensitiveMapper.deleteCmsSensitiveById(id);
    }
}
