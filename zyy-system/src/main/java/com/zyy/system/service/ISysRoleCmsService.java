package com.zyy.system.service;

import java.util.List;

import com.zyy.common.core.domain.entity.SysRole;
import com.zyy.system.domain.SysRoleCms;

/**
 * cms角色权限Service接口
 *
 * @author hnzyy sun
 * @date 2023-08-04
 */
public interface ISysRoleCmsService
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
     * 批量删除cms角色权限
     *
     * @param roleIds 需要删除的cms角色权限主键集合
     * @return 结果
     */
    public int deleteSysRoleCmsByRoleIds(Long[] roleIds);

    /**
     * 删除cms角色权限信息
     *
     * @param roleId cms角色权限主键
     * @return 结果
     */
    public int deleteSysRoleCmsByRoleId(Long roleId);

    /**
     * 批量新增权限(站点)
     * @return
     */
    public int insertCmsRole(SysRole sysRole);

    /**
     * 批量新增权限(栏目)
     * @return
     */
    public int insertCmsRoleByChannel(SysRole sysRole);
}
