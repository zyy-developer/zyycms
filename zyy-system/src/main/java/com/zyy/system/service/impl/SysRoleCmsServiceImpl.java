package com.zyy.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.zyy.common.core.domain.entity.SysRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyy.system.mapper.SysRoleCmsMapper;
import com.zyy.system.domain.SysRoleCms;
import com.zyy.system.service.ISysRoleCmsService;

/**
 * cms角色权限Service业务层处理
 *
 * @author hnzyy sun
 * @date 2023-08-04
 */
@Service
public class SysRoleCmsServiceImpl implements ISysRoleCmsService
{
    @Autowired
    private SysRoleCmsMapper sysRoleCmsMapper;

    /**
     * 查询cms角色权限
     *
     * @param roleId cms角色权限主键
     * @return cms角色权限
     */
    @Override
    public SysRoleCms selectSysRoleCmsByRoleId(Long roleId)
    {
        return sysRoleCmsMapper.selectSysRoleCmsByRoleId(roleId);
    }

    /**
     * 查询cms角色权限列表
     *
     * @param sysRoleCms cms角色权限
     * @return cms角色权限
     */
    @Override
    public List<SysRoleCms> selectSysRoleCmsList(SysRoleCms sysRoleCms)
    {
        return sysRoleCmsMapper.selectSysRoleCmsList(sysRoleCms);
    }

    /**
     * 新增cms角色权限
     *
     * @param sysRoleCms cms角色权限
     * @return 结果
     */
    @Override
    public int insertSysRoleCms(SysRoleCms sysRoleCms)
    {
        return sysRoleCmsMapper.insertSysRoleCms(sysRoleCms);
    }

    /**
     * 修改cms角色权限
     *
     * @param sysRoleCms cms角色权限
     * @return 结果
     */
    @Override
    public int updateSysRoleCms(SysRoleCms sysRoleCms)
    {
        return sysRoleCmsMapper.updateSysRoleCms(sysRoleCms);
    }

    /**
     * 批量删除cms角色权限
     *
     * @param roleIds 需要删除的cms角色权限主键
     * @return 结果
     */
    @Override
    public int deleteSysRoleCmsByRoleIds(Long[] roleIds)
    {
        return sysRoleCmsMapper.deleteSysRoleCmsByRoleIds(roleIds);
    }

    /**
     * 删除cms角色权限信息
     *
     * @param roleId cms角色权限主键
     * @return 结果
     */
    @Override
    public int deleteSysRoleCmsByRoleId(Long roleId)
    {
        return sysRoleCmsMapper.deleteSysRoleCmsByRoleId(roleId);
    }

    /**
     * 批量新增权限(站点)
     * @return
     */
    @Override
    public int insertCmsRole(SysRole sysRole) {
        SysRoleCms deleteSysRoleCms = new SysRoleCms();
        deleteSysRoleCms.setRoleId(sysRole.getRoleId());
        deleteSysRoleCms.setPropertyType("site");
        sysRoleCmsMapper.deleteSysRoleCmsByRoleIdAndType(deleteSysRoleCms);
        List<SysRoleCms> list = new ArrayList<>();
        for (Long siteId:sysRole.getSiteIds()) {
            SysRoleCms sysRoleCms = new SysRoleCms();
            sysRoleCms.setRoleId(sysRole.getRoleId());
            sysRoleCms.setPropertyId(siteId);
            sysRoleCms.setPropertyType("site");
            list.add(sysRoleCms);
        }
        sysRoleCmsMapper.batchRoleByCms(list);
        return 0;
    }

    @Override
    public int insertCmsRoleByChannel(SysRole sysRole) {
        SysRoleCms deleteSysRoleCms = new SysRoleCms();
        deleteSysRoleCms.setRoleId(sysRole.getRoleId());
        deleteSysRoleCms.setPropertyType("channel");
        sysRoleCmsMapper.deleteSysRoleCmsByRoleIdAndType(deleteSysRoleCms);
        List<SysRoleCms> list = new ArrayList<>();
        for (Long siteId:sysRole.getChannelIds()) {
            SysRoleCms sysRoleCms = new SysRoleCms();
            sysRoleCms.setRoleId(sysRole.getRoleId());
            sysRoleCms.setPropertyId(siteId);
            sysRoleCms.setPropertyType("channel");
            list.add(sysRoleCms);
        }
        if(list.size()>0) {
            sysRoleCmsMapper.batchRoleByCms(list);
        }
        return 1;
    }
}
