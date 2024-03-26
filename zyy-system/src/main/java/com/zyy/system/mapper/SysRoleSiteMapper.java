package com.zyy.system.mapper;

import java.util.List;
import com.zyy.system.domain.SysRoleSite;

/**
 * 角色站点权限Mapper接口
 *
 * @author hnzyy
 * @date 2023-07-10
 */
public interface SysRoleSiteMapper
{
    /**
     * 查询角色站点权限
     *
     * @param roleId 角色站点权限主键
     * @return 角色站点权限
     */
    public SysRoleSite selectSysRoleSiteByRoleId(Long roleId);

    /**
     * 查询角色站点权限列表
     *
     * @param sysRoleSite 角色站点权限
     * @return 角色站点权限集合
     */
    public List<SysRoleSite> selectSysRoleSiteList(SysRoleSite sysRoleSite);

    /**
     * 新增角色站点权限
     *
     * @param sysRoleSite 角色站点权限
     * @return 结果
     */
    public int insertSysRoleSite(SysRoleSite sysRoleSite);

    /**
     * 修改角色站点权限
     *
     * @param sysRoleSite 角色站点权限
     * @return 结果
     */
    public int updateSysRoleSite(SysRoleSite sysRoleSite);

    /**
     * 删除角色站点权限
     *
     * @param roleId 角色站点权限主键
     * @return 结果
     */
    public int deleteSysRoleSiteByRoleId(Long roleId);

    /**
     * 批量删除角色站点权限
     *
     * @param roleIds 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteSysRoleSiteByRoleIds(Long[] roleIds);
}
