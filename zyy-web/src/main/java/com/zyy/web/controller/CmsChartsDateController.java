package com.zyy.web.controller;

import com.alibaba.fastjson2.JSON;
import com.zyy.common.core.controller.BaseController;
import com.zyy.common.core.domain.AjaxResult;
import com.zyy.common.core.domain.model.LoginUser;
import com.zyy.common.core.page.TableDataInfo;
import com.zyy.common.utils.SecurityUtils;
import com.zyy.web.domain.CmsChannel;
import com.zyy.web.domain.CmsContent;
import com.zyy.web.domain.CmsVisitorLog;
import com.zyy.web.domain.vo.CmsPageViewVo;
import com.zyy.web.domain.vo.CmsVisitorLogVo;
import com.zyy.web.service.ICmsChannelService;
import com.zyy.web.service.ICmsContentService;
import com.zyy.web.service.ICmsVisitorLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 报表数据Controller
 *
 * @author hnzyy sun
 * @date 2023-08-11
 */
@RestController
@RequestMapping("/web/charts")
public class CmsChartsDateController extends BaseController {

    @Autowired
    private ICmsContentService cmsContentService;

    @Autowired
    private ICmsChannelService cmsChannelService;

    @Autowired
    private ICmsVisitorLogService cmsVisitorLogService;

    /**
     * 获取网站概况数据
     * @return
     */
    @RequestMapping("/getWebOverviewData")
    public AjaxResult getWebOverviewData(){
        LoginUser principal = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        CmsContent cmsContent = new CmsContent();
        cmsContent.setSiteId(principal.getSiteId());
        int todayInsertCounts = cmsContentService.selectTodayInsertNums(cmsContent);
        CmsVisitorLogVo cmsVisitorLogVo = new CmsVisitorLogVo();
        cmsVisitorLogVo.setSiteId(principal.getSiteId());
        int viewPv = cmsVisitorLogService.selectViewPvToday(cmsVisitorLogVo);
        int ip = cmsVisitorLogService.selectViewIpToday(cmsVisitorLogVo);
        int viewUv = cmsVisitorLogService.selectViewUvToday(cmsVisitorLogVo);

        CmsVisitorLog oldUserVisitorLog = new CmsVisitorLog();
        oldUserVisitorLog.setSiteId(principal.getSiteId());
        int oldPvCount = cmsVisitorLogService.selectByOldUserNum(oldUserVisitorLog);
        oldUserVisitorLog.setCookie("1");
        int oldUvCount = cmsVisitorLogService.selectByOldUserNum(oldUserVisitorLog);
        Map<String, Object> oldUserMap = new HashMap<>();
        oldUserMap.put("pv",oldPvCount);
        oldUserMap.put("uv",oldUvCount);
        Map<String, Object> newUserMap = new HashMap<>();
        newUserMap.put("pv",viewPv-oldPvCount);
        newUserMap.put("uv",viewUv-oldUvCount);
        AjaxResult ajaxResult=AjaxResult.success();
        ajaxResult.put("oldUserData",oldUserMap);
        ajaxResult.put("newUserData",newUserMap);
        ajaxResult.put("toDayInsertCount",todayInsertCounts);
        ajaxResult.put("toDayPvCount",viewPv);
        ajaxResult.put("toDayUvCount",viewUv);
        ajaxResult.put("toDayIpCount",ip);
        return ajaxResult;
    }

    /**
     * 获取访问量（每日小时段统计）
     * @return
     */
    @RequestMapping("/getViewsCount")
    public AjaxResult getViewsCount(@RequestParam(value = "date",required = false) String date,@RequestParam("type") String type){
        LoginUser principal = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        AjaxResult ajaxResult=AjaxResult.success();
        CmsVisitorLogVo cmsVisitorLogVo = new CmsVisitorLogVo();
        cmsVisitorLogVo.setSiteId(principal.getSiteId());
        if(date==null){
            cmsVisitorLogVo.setDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
        }else{
            cmsVisitorLogVo.setDate(date);
        }
        List<Map<String, Integer>> mapList=null;
        if(type.equals("pv")) {
            mapList = cmsVisitorLogService.selectViewCountByDay(cmsVisitorLogVo);
        }else if(type.equals("uv")){
            mapList = cmsVisitorLogService.selectViewUvByDay(cmsVisitorLogVo);
        }else if(type.equals("ip")){
            mapList = cmsVisitorLogService.selectViewIpByDay(cmsVisitorLogVo);
        }
        ajaxResult.put("views",mapList);
        return ajaxResult;
    }

    /**
     * 查询来源页面数据
     * @return
     */
    @RequestMapping("/getPageViewList")
    public TableDataInfo getViewsCount(CmsPageViewVo cmsPageViewVo){
        LoginUser principal = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        startPage();
        cmsPageViewVo.setSiteId(principal.getSiteId());
        return getDataTable(cmsVisitorLogService.selectPageViewList(cmsPageViewVo));
    }

    /**
     * 查询地域数据
     * @return
     */
    @RequestMapping("/getRegionViewList")
    public AjaxResult getRegionCount(CmsPageViewVo cmsPageViewVo){
        LoginUser principal = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        cmsPageViewVo.setSiteId(principal.getSiteId());
        AjaxResult ajaxResult = new AjaxResult();
        List<Map<String, Object>> regionList= cmsVisitorLogService.selectRegionInfoList(cmsPageViewVo);
        List<Map<String, Object>> cityList = cmsVisitorLogService.selectCityInfoList(cmsPageViewVo);
        for (Map<String,Object> region:regionList) {
            List<Object> children = new ArrayList<>();
            for (Map<String,Object> city:cityList) {
                if (city.get("region")!=null&&city.get("region").equals(region.get("region"))) {
                    city.put("region",city.get("city"));
                    children.add(city);
                }
            }
            region.put("children",children);
        }
        ajaxResult.put("regionList",regionList);
        return ajaxResult;
    }
}
