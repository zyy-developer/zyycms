package com.zyy.web.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.logging.SimpleFormatter;

import com.zyy.common.utils.DateUtils;
import com.zyy.web.domain.vo.CmsPageViewVo;
import com.zyy.web.domain.vo.CmsVisitorLogVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyy.web.mapper.CmsVisitorLogMapper;
import com.zyy.web.domain.CmsVisitorLog;
import com.zyy.web.service.ICmsVisitorLogService;

/**
 * visitorLogService业务层处理
 *
 * @author hnzyy sun
 * @date 2023-08-18
 */
@Service
public class CmsVisitorLogServiceImpl implements ICmsVisitorLogService
{
    @Autowired
    private CmsVisitorLogMapper cmsVisitorLogMapper;

    /**
     * 查询visitorLog
     *
     * @param id visitorLog主键
     * @return visitorLog
     */
    @Override
    public CmsVisitorLog selectCmsVisitorLogById(Long id)
    {
        return cmsVisitorLogMapper.selectCmsVisitorLogById(id);
    }

    /**
     * 查询visitorLog列表
     *
     * @param cmsVisitorLog visitorLog
     * @return visitorLog
     */
    @Override
    public List<CmsVisitorLog> selectCmsVisitorLogList(CmsVisitorLog cmsVisitorLog)
    {
        return cmsVisitorLogMapper.selectCmsVisitorLogList(cmsVisitorLog);
    }

    /**
     * 新增visitorLog
     *
     * @param cmsVisitorLog visitorLog
     * @return 结果
     */
    @Override
    public int insertCmsVisitorLog(CmsVisitorLog cmsVisitorLog)
    {
        cmsVisitorLog.setCreateTime(DateUtils.getNowDate());
        return cmsVisitorLogMapper.insertCmsVisitorLog(cmsVisitorLog);
    }

    /**
     * 修改visitorLog
     *
     * @param cmsVisitorLog visitorLog
     * @return 结果
     */
    @Override
    public int updateCmsVisitorLog(CmsVisitorLog cmsVisitorLog)
    {
        return cmsVisitorLogMapper.updateCmsVisitorLog(cmsVisitorLog);
    }

    /**
     * 批量删除visitorLog
     *
     * @param ids 需要删除的visitorLog主键
     * @return 结果
     */
    @Override
    public int deleteCmsVisitorLogByIds(Long[] ids)
    {
        return cmsVisitorLogMapper.deleteCmsVisitorLogByIds(ids);
    }

    /**
     * 删除visitorLog信息
     *
     * @param id visitorLog主键
     * @return 结果
     */
    @Override
    public int deleteCmsVisitorLogById(Long id)
    {
        return cmsVisitorLogMapper.deleteCmsVisitorLogById(id);
    }

    @Override
    public List<Map<String, Integer>> selectViewCountByDay(CmsVisitorLogVo cmsVisitorLogVo) {
        return cmsVisitorLogMapper.selectViewCountByDay(cmsVisitorLogVo);
    }

    @Override
    public List<Map<String, Integer>> selectViewUvByDay(CmsVisitorLogVo cmsVisitorLogVo) {
        return cmsVisitorLogMapper.selectViewUvByDay(cmsVisitorLogVo);
    }

    @Override
    public List<Map<String, Integer>> selectViewIpByDay(CmsVisitorLogVo cmsVisitorLogVo) {
        return cmsVisitorLogMapper.selectViewIpByDay(cmsVisitorLogVo);
    }

    @Override
    public int selectViewPvToday(CmsVisitorLogVo cmsVisitorLogVo) {
        return cmsVisitorLogMapper.selectViewPvToday(cmsVisitorLogVo);
    }

    @Override
    public int selectViewUvToday(CmsVisitorLogVo cmsVisitorLogVo) {
        return cmsVisitorLogMapper.selectViewUvToday(cmsVisitorLogVo);
    }

    @Override
    public int selectViewIpToday(CmsVisitorLogVo cmsVisitorLogVo) {
        return cmsVisitorLogMapper.selectViewIpToday(cmsVisitorLogVo);
    }

    @Override
    public int selectByOldUserNum(CmsVisitorLog cmsVisitorLog) {
        return cmsVisitorLogMapper.selectByOldUserNum(cmsVisitorLog);
    }

    @Override
    public List<CmsPageViewVo> selectPageViewList(CmsPageViewVo cmsPageViewVo) {
        return cmsVisitorLogMapper.selectPageViewList(cmsPageViewVo);
    }

    @Override
    public List<Map<String, Object>> selectRegionInfoList(CmsPageViewVo cmsPageViewVo) {
        return cmsVisitorLogMapper.selectRegionInfoList(cmsPageViewVo);
    }

    @Override
    public List<Map<String, Object>> selectCityInfoList(CmsPageViewVo cmsPageViewVo) {
        return cmsVisitorLogMapper.selectCityInfoList(cmsPageViewVo);
    }
}
