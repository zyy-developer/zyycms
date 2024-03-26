package com.zyy.web.mapper;

import java.util.List;
import com.zyy.web.domain.CmsSensitive;
import com.zyy.web.domain.CmsSensitiveLog;

/**
 * 敏感词Mapper接口
 *
 * @author hnzyy sun
 * @date 2023-07-06
 */
public interface CmsSensitiveMapper
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
     * 删除敏感词
     *
     * @param id 敏感词主键
     * @return 结果
     */
    public int deleteCmsSensitiveById(Long id);

    /**
     * 批量删除敏感词
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteCmsSensitiveByIds(Long[] ids);

    /**
     * 新增敏感词
     */
    public int insertCmsSensitiveLog(CmsSensitiveLog cmsSensitiveLog);
}
