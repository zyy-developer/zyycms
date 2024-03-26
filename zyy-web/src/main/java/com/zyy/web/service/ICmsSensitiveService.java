package com.zyy.web.service;

import java.util.List;
import com.zyy.web.domain.CmsSensitive;

/**
 * 敏感词Service接口
 *
 * @author hnzyy sun
 * @date 2023-07-06
 */
public interface ICmsSensitiveService
{
    /**
     * 查询敏感词
     *
     * @param id 敏感词主键
     * @return 敏感词
     */
    public CmsSensitive selectCmsSensitiveById(Long id);

    /**
     * 查询敏感词列表
     *
     * @param cmsSensitive 敏感词
     * @return 敏感词集合
     */
    public List<CmsSensitive> selectCmsSensitiveList(CmsSensitive cmsSensitive);

    /**
     * 新增敏感词
     *
     * @param cmsSensitive 敏感词
     * @return 结果
     */
    public int insertCmsSensitive(CmsSensitive cmsSensitive);

    /**
     * 修改敏感词
     *
     * @param cmsSensitive 敏感词
     * @return 结果
     */
    public int updateCmsSensitive(CmsSensitive cmsSensitive);

    /**
     * 批量删除敏感词
     *
     * @param ids 需要删除的敏感词主键集合
     * @return 结果
     */
    public int deleteCmsSensitiveByIds(Long[] ids);

    /**
     * 删除敏感词信息
     *
     * @param id 敏感词主键
     * @return 结果
     */
    public int deleteCmsSensitiveById(Long id);
}
