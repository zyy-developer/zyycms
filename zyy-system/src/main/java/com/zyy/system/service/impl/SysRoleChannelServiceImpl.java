package com.zyy.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyy.system.mapper.SysRoleChannelMapper;
import com.zyy.system.domain.SysRoleChannel;
import com.zyy.system.service.ISysRoleChannelService;

/**
 * 角色栏目权限Service业务层处理
 *
 * @author hnzyy
 * @date 2023-07-10
 */
@Service
public class SysRoleChannelServiceImpl implements ISysRoleChannelService
{
    @Autowired
    private SysRoleChannelMapper sysRoleChannelMapper;

    /**
     * 查询角色栏目权限
     *
     * @param roleId 角色栏目权限主键
     * @return 角色栏目权限
     */
    @Override
    public SysRoleChannel selectSysRoleChannelByRoleId(Long roleId)
    {
        return sysRoleChannelMapper.selectSysRoleChannelByRoleId(roleId);
    }

    /**
     * 查询角色栏目权限列表
     *
     * @param sysRoleChannel 角色栏目权限
     * @return 角色栏目权限
     */
    @Override
    public List<SysRoleChannel> selectSysRoleChannelList(SysRoleChannel sysRoleChannel)
    {
        return sysRoleChannelMapper.selectSysRoleChannelList(sysRoleChannel);
    }

    /**
     * 新增角色栏目权限
     *
     * @param sysRoleChannel 角色栏目权限
     * @return 结果
     */
    @Override
    public int insertSysRoleChannel(SysRoleChannel sysRoleChannel)
    {
        return sysRoleChannelMapper.insertSysRoleChannel(sysRoleChannel);
    }

    /**
     * 修改角色栏目权限
     *
     * @param sysRoleChannel 角色栏目权限
     * @return 结果
     */
    @Override
    public int updateSysRoleChannel(SysRoleChannel sysRoleChannel)
    {
        return sysRoleChannelMapper.updateSysRoleChannel(sysRoleChannel);
    }

    /**
     * 批量删除角色栏目权限
     *
     * @param roleIds 需要删除的角色栏目权限主键
     * @return 结果
     */
    @Override
    public int deleteSysRoleChannelByRoleIds(Long[] roleIds)
    {
        return sysRoleChannelMapper.deleteSysRoleChannelByRoleIds(roleIds);
    }

    /**
     * 删除角色栏目权限信息
     *
     * @param roleId 角色栏目权限主键
     * @return 结果
     */
    @Override
    public int deleteSysRoleChannelByRoleId(Long roleId)
    {
        return sysRoleChannelMapper.deleteSysRoleChannelByRoleId(roleId);
    }
}
