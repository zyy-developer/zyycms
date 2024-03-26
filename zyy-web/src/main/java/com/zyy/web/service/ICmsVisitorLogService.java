package com.zyy.web.service;

import java.util.List;
import java.util.Map;

import com.zyy.web.domain.CmsVisitorLog;
import com.zyy.web.domain.vo.CmsPageViewVo;
import com.zyy.web.domain.vo.CmsVisitorLogVo;

/**
 * 访客记录Service接口
 *
 * @author hnzyy sun
 * @date 2023-08-18
 */
public interface ICmsVisitorLogService
{
    /**
     * 查询访客记录
     *
     * @param id visitorLog主键
     * @return visitorLog
     */
    public CmsVisitorLog selectCmsVisitorLogById(Long id);

    /**
     * 查询访客记录列表
     *
     * @param cmsVisitorLog visitorLog
     * @return visitorLog集合
     */
    public List<CmsVisitorLog> selectCmsVisitorLogList(CmsVisitorLog cmsVisitorLog);

    /**
     * 新增访客记录
     *
     * @param cmsVisitorLog visitorLog
     * @return 结果
     */
    public int insertCmsVisitorLog(CmsVisitorLog cmsVisitorLog);

    /**
     * 修改访客记录
     *
     * @param cmsVisitorLog visitorLog
     * @return 结果
     */
    public int updateCmsVisitorLog(CmsVisitorLog cmsVisitorLog);

    /**
     * 批量删除访客记录
     *
     * @param ids 需要删除的visitorLog主键集合
     * @return 结果
     */
    public int deleteCmsVisitorLogByIds(Long[] ids);

    /**
     * 删除访客记录信息
     *
     * @param id visitorLog主键
     * @return 结果
     */
    public int deleteCmsVisitorLogById(Long id);


    /**
     * 按小时查询访问量
     * @param cmsVisitorLogVo
     * @return
     */
    public List<Map<String,Integer>> selectViewCountByDay(CmsVisitorLogVo cmsVisitorLogVo);

    /**
     * 按小时查询访客数
     * @param cmsVisitorLogVo
     * @return
     */
    public List<Map<String,Integer>> selectViewUvByDay(CmsVisitorLogVo cmsVisitorLogVo);

    /**
     * 按小时查询Ip数
     * @param cmsVisitorLogVo
     * @return
     */
    public List<Map<String,Integer>> selectViewIpByDay(CmsVisitorLogVo cmsVisitorLogVo);

    /**
     * 查询今日PV访问量
     * @return
     */
    public int selectViewPvToday(CmsVisitorLogVo cmsVisitorLogVo);

    /**
     * 查询今日UV访问量
     * @return
     */
    public int selectViewUvToday(CmsVisitorLogVo cmsVisitorLogVo);

    /**
     * 查询今日IP数
     * @return
     */
    public int selectViewIpToday(CmsVisitorLogVo cmsVisitorLogVo);

    /**
     * 查询老客户访问数据
     * @return
     */
    public int selectByOldUserNum(CmsVisitorLog cmsVisitorLog);


    /**
     * 查询受访页面数据
     * @param cmsPageViewVo
     * @return
     */
    public List<CmsPageViewVo> selectPageViewList(CmsPageViewVo cmsPageViewVo);


    /**
     * 查询地域统计（省份）
     * @return
     */
    public List<Map<String,Object>> selectRegionInfoList(CmsPageViewVo cmsPageViewVo);

    /**
     * 查询地域统计（城市）
     * @return
     */
    public List<Map<String,Object>> selectCityInfoList(CmsPageViewVo cmsPageViewVo);
}
