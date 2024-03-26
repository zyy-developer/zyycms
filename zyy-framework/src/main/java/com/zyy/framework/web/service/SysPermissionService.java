package com.zyy.framework.web.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.zyy.system.domain.SysRoleCms;
import com.zyy.system.service.ISysRoleCmsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import com.zyy.common.core.domain.entity.SysRole;
import com.zyy.common.core.domain.entity.SysUser;
import com.zyy.system.service.ISysMenuService;
import com.zyy.system.service.ISysRoleService;

/**
 * 用户权限处理
 *
 * @author hnzyy
 */
@Component
public class SysPermissionService
{
    @Autowired
    private ISysRoleService roleService;

    @Autowired
    private ISysMenuService menuService;

    @Autowired
    private ISysRoleCmsService cmsService;

    /**
     * 获取角色数据权限
     *
     * @param user 用户信息
     * @return 角色权限信息
     */
    public Set<String> getRolePermission(SysUser user)
    {
        Set<String> roles = new HashSet<String>();
        // 管理员拥有所有权限
        if (user.isAdmin())
        {
            roles.add("admin");
        }
        else
        {
            roles.addAll(roleService.selectRolePermissionByUserId(user.getUserId()));
        }
        return roles;
    }

    /**
     * 获取菜单数据权限
     *
     * @param user 用户信息
     * @return 菜单权限信息
     */
    public Set<String> getMenuPermission(SysUser user)
    {
        Set<String> perms = new HashSet<String>();
        // 管理员拥有所有权限
        if (user.isAdmin())
        {
            perms.add("*:*:*");
        }
        else
        {
            List<SysRole> roles = user.getRoles();
            if (!roles.isEmpty() && roles.size() > 1)
            {
                // 多角色设置permissions属性，以便数据权限匹配权限
                for (SysRole role : roles)
                {
                    Set<String> rolePerms = menuService.selectMenuPermsByRoleId(role.getRoleId());
                    role.setPermissions(rolePerms);
                    perms.addAll(rolePerms);
                }
            }
            else
            {
                perms.addAll(menuService.selectMenuPermsByUserId(user.getUserId()));
            }
        }
        return perms;
    }

    /**
     * 获取站点数据权限
     *
     * @param user 用户信息
     * @return CMS站点权限信息
     */
    public Set<Object> getCmsSitePermission(SysUser user)
    {
        Set<Object> perms = new HashSet<Object>();
        // 管理员拥有所有权限
        if (user.isAdmin())
        {
            perms.add("**");
        }
        else
        {
            List<SysRole> roles = user.getRoles();
            if (!roles.isEmpty() && roles.size() > 0)
            {
                // 多角色设置permissions属性，以便数据权限匹配权限
                for (SysRole role : roles)
                {
                    SysRoleCms sysRoleCms = new SysRoleCms();
                    sysRoleCms.setRoleId(role.getRoleId());
                    List rolePerms = cmsService.selectSysRoleCmsList(sysRoleCms);
                    role.setSitePermissions(rolePerms);
                    perms.addAll(rolePerms);
                }
            }
            else
            {
//                perms.addAll(cmsService.s(user.getUserId()));
            }
        }
        return perms;
    }
}
