package com.zyy.web.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

import com.zyy.common.utils.DateUtils;
import com.zyy.common.utils.StringUtils;
import com.zyy.web.domain.CmsSiteSetup;
import com.zyy.web.domain.TreeSelectWeb;
import com.zyy.web.mapper.CmsSiteSetupMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyy.web.mapper.CmsSiteMapper;
import com.zyy.web.domain.CmsSite;
import com.zyy.web.service.ICmsSiteService;

/**
 * 站点Service业务层处理
 *
 * @author hnzyy sun
 * @date 2023-07-03
 */
@Service
public class CmsSiteServiceImpl implements ICmsSiteService
{
    @Autowired
    private CmsSiteMapper cmsSiteMapper;

    @Autowired
    private CmsSiteSetupMapper cmsSiteSetupMapper;

    /**
     * 查询站点
     *
     * @param id 站点主键
     * @return 站点
     */
    @Override
    public CmsSite selectCmsSiteById(Long id)
    {
        CmsSite cmsSite = cmsSiteMapper.selectCmsSiteById(id);
        CmsSiteSetup cmsSiteSetup = cmsSiteSetupMapper.selectCmsSiteSetupBySiteId(id);
        cmsSite.setSetup(cmsSiteSetup);
        return cmsSite;
    }

    @Override
    public CmsSite selectCmsSiteByDirectory(String directory) {
        CmsSite cmsSite = cmsSiteMapper.selectCmsSiteByDirectory(directory);
        CmsSiteSetup cmsSiteSetup = cmsSiteSetupMapper.selectCmsSiteSetupBySiteId(cmsSite.getId());
        cmsSite.setSetup(cmsSiteSetup);
        return cmsSite;
    }

    /**
     * 查询站点列表
     *
     * @param cmsSite 站点
     * @return 站点
     */
    @Override
    public List<CmsSite> selectCmsSiteList(CmsSite cmsSite)
    {
        return cmsSiteMapper.selectCmsSiteList(cmsSite);
    }

    @Override
    public List<CmsSite> selectCmsSiteListSet(Set<Object> cmsSite) {
        return cmsSiteMapper.selectCmsSiteListSet(cmsSite);
    }

    /**
     * 新增站点
     *
     * @param cmsSite 站点
     * @return 结果
     */
    @Override
    public int insertCmsSite(CmsSite cmsSite)
    {
        cmsSite.setCreateTime(DateUtils.getNowDate());
        int insertCmsSite = cmsSiteMapper.insertCmsSite(cmsSite);
        if(insertCmsSite>0){
            CmsSiteSetup cmsSiteSetup = new CmsSiteSetup();
            cmsSiteSetup.setSiteId(cmsSite.getId());
            cmsSiteSetupMapper.insertCmsSiteSetup(cmsSiteSetup);
        }
        return insertCmsSite;
    }

    /**
     * 修改站点
     *
     * @param cmsSite 站点
     * @return 结果
     */
    @Override
    public int updateCmsSite(CmsSite cmsSite)
    {
        cmsSite.setUpdateTime(DateUtils.getNowDate());
        cmsSiteSetupMapper.updateCmsSiteSetup(cmsSite.getSetup());
        return cmsSiteMapper.updateCmsSite(cmsSite);
    }

    /**
     * 批量删除站点
     *
     * @param ids 需要删除的站点主键
     * @return 结果
     */
    @Override
    public int deleteCmsSiteByIds(Long[] ids)
    {
        return cmsSiteMapper.deleteCmsSiteByIds(ids);
    }

    /**
     * 删除站点信息
     *
     * @param id 站点主键
     * @return 结果
     */
    @Override
    public int deleteCmsSiteById(Long id)
    {
        return cmsSiteMapper.deleteCmsSiteById(id);
    }


    @Override
    public List<TreeSelectWeb> selectDeptTreeList(CmsSite cmsSite) {
        List<CmsSite> depts = cmsSiteMapper.selectCmsSiteList(cmsSite);
        return buildDeptTreeSelect(depts);
    }

    @Override
    public List<CmsSite> buildDeptTree(List<CmsSite> cmsChannels) {
        List<CmsSite> returnList = new ArrayList<CmsSite>();
        List<Long> tempList = cmsChannels.stream().map(CmsSite::getId).collect(Collectors.toList());
        for (CmsSite dept : cmsChannels)
        {
            // 如果是顶级节点, 遍历该父节点的所有子节点
            if (!tempList.contains(dept.getParentId()))
            {
                recursionFn(cmsChannels, dept);
                returnList.add(dept);
            }
        }
        if (returnList.isEmpty())
        {
            returnList = cmsChannels;
        }
        return returnList;
    }

    @Override
    public List<TreeSelectWeb> buildDeptTreeSelect(List<CmsSite> cmsSites) {
        List<CmsSite> deptTrees = buildDeptTree(cmsSites);
        return deptTrees.stream().map(TreeSelectWeb::new).collect(Collectors.toList());
    }



    /**
     * 递归列表
     */
    private void recursionFn(List<CmsSite> list, CmsSite t)
    {
        // 得到子节点列表
        List<CmsSite> childList = getChildList(list, t);
        t.setChildren(childList);
        for (CmsSite tChild : childList)
        {
            if (hasChild(list, tChild))
            {
                recursionFn(list, tChild);
            }
        }
    }

    /**
     * 得到子节点列表
     */
    private List<CmsSite> getChildList(List<CmsSite> list, CmsSite t)
    {
        List<CmsSite> tlist = new ArrayList<CmsSite>();
        Iterator<CmsSite> it = list.iterator();
        while (it.hasNext())
        {
            CmsSite n = (CmsSite) it.next();
            if (StringUtils.isNotNull(n.getParentId()) && n.getParentId().longValue() == t.getId().longValue())
            {
                tlist.add(n);
            }
        }
        return tlist;
    }

    /**
     * 判断是否有子节点
     */
    private boolean hasChild(List<CmsSite> list, CmsSite t)
    {
        return getChildList(list, t).size() > 0;
    }
}
