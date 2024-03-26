package com.zyy.system.mapper;

import java.util.List;
import com.zyy.system.domain.SysSecurityConfig;

/**
 * 安全配置Mapper接口
 *
 * @author hnzyy
 * @date 2023-12-13
 */
public interface SysSecurityConfigMapper
{
    /**
     * 查询安全配置
     *
     * @param id 安全配置主键
     * @return 安全配置
     */
    public SysSecurityConfig selectSysSecurityConfigById(Long id);

    /**
     * 查询安全配置列表
     *
     * @param sysSecurityConfig 安全配置
     * @return 安全配置集合
     */
    public List<SysSecurityConfig> selectSysSecurityConfigList(SysSecurityConfig sysSecurityConfig);

    /**
     * 新增安全配置
     *
     * @param sysSecurityConfig 安全配置
     * @return 结果
     */
    public int insertSysSecurityConfig(SysSecurityConfig sysSecurityConfig);

    /**
     * 修改安全配置
     *
     * @param sysSecurityConfig 安全配置
     * @return 结果
     */
    public int updateSysSecurityConfig(SysSecurityConfig sysSecurityConfig);

    /**
     * 修改状态
     * @return
     */
    public int updateSysSecurityStage();

    /**
     * 删除安全配置
     *
     * @param id 安全配置主键
     * @return 结果
     */
    public int deleteSysSecurityConfigById(Long id);

    /**
     * 批量删除安全配置
     *
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysSecurityConfigByIds(Long[] ids);

    /**
     * 查询选中的一条安全配置
     * @return
     */
    public SysSecurityConfig selectSysSecurityConfigByStage();
}
