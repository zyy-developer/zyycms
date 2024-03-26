package com.zyy.system.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyy.system.mapper.SysRoleSiteMapper;
import com.zyy.system.domain.SysRoleSite;
import com.zyy.system.service.ISysRoleSiteService;

/**
 * 角色站点权限Service业务层处理
 *
 * @author hnzyy
 * @date 2023-07-10
 */
@Service
public class SysRoleSiteServiceImpl implements ISysRoleSiteService
{
    @Autowired
    private SysRoleSiteMapper sysRoleSiteMapper;

    /**
     * 查询角色站点权限
     *
     * @param roleId 角色站点权限主键
     * @return 角色站点权限
     */
    @Override
    public SysRoleSite selectSysRoleSiteByRoleId(Long roleId)
    {
        return sysRoleSiteMapper.selectSysRoleSiteByRoleId(roleId);
    }

    /**
     * 查询角色站点权限列表
     *
     * @param sysRoleSite 角色站点权限
     * @return 角色站点权限
     */
    @Override
    public List<SysRoleSite> selectSysRoleSiteList(SysRoleSite sysRoleSite)
    {
        return sysRoleSiteMapper.selectSysRoleSiteList(sysRoleSite);
    }

    /**
     * 新增角色站点权限
     *
     * @param sysRoleSite 角色站点权限
     * @return 结果
     */
    @Override
    public int insertSysRoleSite(SysRoleSite sysRoleSite)
    {
        return sysRoleSiteMapper.insertSysRoleSite(sysRoleSite);
    }

    /**
     * 修改角色站点权限
     *
     * @param sysRoleSite 角色站点权限
     * @return 结果
     */
    @Override
    public int updateSysRoleSite(SysRoleSite sysRoleSite)
    {
        return sysRoleSiteMapper.updateSysRoleSite(sysRoleSite);
    }

    /**
     * 批量删除角色站点权限
     *
     * @param roleIds 需要删除的角色站点权限主键
     * @return 结果
     */
    @Override
    public int deleteSysRoleSiteByRoleIds(Long[] roleIds)
    {
        return sysRoleSiteMapper.deleteSysRoleSiteByRoleIds(roleIds);
    }

    /**
     * 删除角色站点权限信息
     *
     * @param roleId 角色站点权限主键
     * @return 结果
     */
    @Override
    public int deleteSysRoleSiteByRoleId(Long roleId)
    {
        return sysRoleSiteMapper.deleteSysRoleSiteByRoleId(roleId);
    }
}
