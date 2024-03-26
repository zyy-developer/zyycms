package com.zyy.system.service;

import java.util.List;
import com.zyy.system.domain.SysRoleChannel;

/**
 * 角色栏目权限Service接口
 *
 * @author hnzyy
 * @date 2023-07-10
 */
public interface ISysRoleChannelService
{
    /**
     * 查询角色栏目权限
     *
     * @param roleId 角色栏目权限主键
     * @return 角色栏目权限
     */
    public SysRoleChannel selectSysRoleChannelByRoleId(Long roleId);

    /**
     * 查询角色栏目权限列表
     *
     * @param sysRoleChannel 角色栏目权限
     * @return 角色栏目权限集合
     */
    public List<SysRoleChannel> selectSysRoleChannelList(SysRoleChannel sysRoleChannel);

    /**
     * 新增角色栏目权限
     *
     * @param sysRoleChannel 角色栏目权限
     * @return 结果
     */
    public int insertSysRoleChannel(SysRoleChannel sysRoleChannel);

    /**
     * 修改角色栏目权限
     *
     * @param sysRoleChannel 角色栏目权限
     * @return 结果
     */
    public int updateSysRoleChannel(SysRoleChannel sysRoleChannel);

    /**
     * 批量删除角色栏目权限
     *
     * @param roleIds 需要删除的角色栏目权限主键集合
     * @return 结果
     */
    public int deleteSysRoleChannelByRoleIds(Long[] roleIds);

    /**
     * 删除角色栏目权限信息
     *
     * @param roleId 角色栏目权限主键
     * @return 结果
     */
    public int deleteSysRoleChannelByRoleId(Long roleId);
}
