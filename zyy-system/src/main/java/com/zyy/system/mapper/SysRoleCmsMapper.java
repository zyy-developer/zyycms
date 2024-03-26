package com.zyy.system.mapper;

import java.util.List;
import com.zyy.system.domain.SysRoleCms;

/**
 * cms角色权限Mapper接口
 *
 * @author hnzyy sun
 * @date 2023-08-04
 */
public interface SysRoleCmsMapper
{
    /**
     * 查询cms角色权限
     *
     * @param roleId cms角色权限主键
     * @return cms角色权限
     */
    public SysRoleCms selectSysRoleCmsByRoleId(Long roleId);

    /**
     * 查询cms角色权限列表
     *
     * @param sysRoleCms cms角色权限
     * @return cms角色权限集合
     */
    public List<SysRoleCms> selectSysRoleCmsList(SysRoleCms sysRoleCms);

    /**
     * 新增cms角色权限
     *
     * @param sysRoleCms cms角色权限
     * @return 结果
     */
    public int insertSysRoleCms(SysRoleCms sysRoleCms);

    /**
     * 修改cms角色权限
     *
     * @param sysRoleCms cms角色权限
     * @return 结果
     */
    public int updateSysRoleCms(SysRoleCms sysRoleCms);

    /**
     * 删除cms角色权限
     *
     * @param roleId cms角色权限主键
     * @return 结果
     */
    public int deleteSysRoleCmsByRoleId(Long roleId);

    /**
     * 批量删除cms角色权限
     *
     * @param roleIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysRoleCmsByRoleIds(Long[] roleIds);

    /**
     * 批量新增cms站点权限
     * @return
     */
    public int batchRoleByCms(List<SysRoleCms> cmsList);

    /**
     * 通过权限id和类型删除记录
     * @param sysRoleCms
     * @return
     */
    public int deleteSysRoleCmsByRoleIdAndType(SysRoleCms sysRoleCms);
}
