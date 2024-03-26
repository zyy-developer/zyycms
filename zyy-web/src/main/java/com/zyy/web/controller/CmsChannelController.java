package com.zyy.web.controller;

import java.io.*;
import java.util.*;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.alibaba.fastjson2.JSONObject;
import com.zyy.common.core.domain.entity.SysUser;
import com.zyy.common.core.domain.model.LoginUser;
import com.zyy.common.utils.SecurityUtils;
import com.zyy.system.domain.SysRoleCms;
import com.zyy.system.service.ISysRoleCmsService;
import com.zyy.web.domain.CmsAttr;
import com.zyy.web.domain.CmsSiteSetup;
import com.zyy.web.domain.TreeSelectWeb;
import com.zyy.web.service.ICmsAttrService;
import com.zyy.web.service.ICmsModelService;
import com.zyy.web.service.ICmsSiteSetupService;
import com.zyy.web.utils.PinYinUtils;
import org.apache.commons.lang3.ArrayUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.zyy.common.annotation.Log;
import com.zyy.common.core.controller.BaseController;
import com.zyy.common.core.domain.AjaxResult;
import com.zyy.common.enums.BusinessType;
import com.zyy.web.domain.CmsChannel;
import com.zyy.web.service.ICmsChannelService;
import com.zyy.common.utils.poi.ExcelUtil;
import com.zyy.common.core.page.TableDataInfo;

/**
 * 栏目Controller
 *
 * @author hnzyy sun
 * @date 2023-06-20
 */
@RestController
@RequestMapping("/web/channel")
public class CmsChannelController extends BaseController
{
    @Autowired
    private ICmsChannelService cmsChannelService;

    @Autowired
    private ICmsAttrService cmsAttrService;

    @Autowired
    private ICmsSiteSetupService cmsSiteSetupService;

    @Autowired
    private ICmsModelService cmsModelService;

    @Autowired
    private ISysRoleCmsService sysRoleCmsService;

    @Value("${zyy.staticHtml}")
    private String staticHtml;

    /**
     * 查询栏目列表
     */
    @PreAuthorize("@ss.hasPermi('web:channel:list')")
    @GetMapping("/list")
    public TableDataInfo list(CmsChannel cmsChannel) {
        LoginUser principal = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        cmsChannel.setSiteId(principal.getSiteId());
        if (!SysUser.isAdmin(principal.getUserId())){
            SysRoleCms sysRoleCms = new SysRoleCms();
            sysRoleCms.setRoleId(principal.getUser().getRoles().get(0).getRoleId());
            sysRoleCms.setPropertyType("channel");
            List<SysRoleCms> sysRoleCmsList = sysRoleCmsService.selectSysRoleCmsList(sysRoleCms);
            cmsChannel.setRoleCmsList(sysRoleCmsList);
        }
        List<CmsChannel> list=cmsChannelService.selectCmsChannelList(cmsChannel);
        return getDataTable(list);
    }

    /**
     * 导出栏目列表
     */
    @PreAuthorize("@ss.hasPermi('web:channel:export')")
    @Log(title = "栏目", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CmsChannel cmsChannel)
    {
        List<CmsChannel> list = cmsChannelService.selectCmsChannelList(cmsChannel);
        ExcelUtil<CmsChannel> util = new ExcelUtil<CmsChannel>(CmsChannel.class);
        util.exportExcel(response, list, "栏目数据");
    }

    /**
     * 获取栏目详细信息
     */
    @PreAuthorize("@ss.hasPermi('web:channel:query')")
    @GetMapping(value = "/{channelId}")
    public AjaxResult getInfo(@PathVariable("channelId") Long channelId)
    {
        CmsChannel cmsChannel = cmsChannelService.selectCmsChannelByChannelId(channelId);

        if(cmsChannel.getContentModel()!=null) {
            List<Map<String, Object>> mapList = JSON.parseObject(cmsChannel.getContentModel(), new TypeReference<List<Map<String, Object>>>(){});
            if(mapList!=null&&mapList.size()>0) {
                //获取内容模型
                Long[] modelIds = new Long[mapList.size()];
                for (int i = 0; i < modelIds.length; i++) {
                    Map<String, Object> map = mapList.get(i);
                    Long modelId = new Long(((Integer) map.get("modelId")));
                    modelIds[i] = modelId;
                }
                cmsChannel.setContentModelList(cmsModelService.selectCmsModelByModelIds(modelIds));
            }
        }
        return success(cmsChannel);
    }

    /**
     * 新增栏目
     */
    @PreAuthorize("@ss.hasPermi('web:channel:add')")
    @Log(title = "栏目", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CmsChannel cmsChannel) throws IOException {
        LoginUser principal = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        cmsChannel.setSiteId(principal.getSiteId());
        String contentModelIdsStr = JSON.toJSONString(cmsChannel.getContentModelList());
//        String contentModelIdsStr = ArrayUtils.toString(cmsChannel.getContentModelIds(), ",");
        cmsChannel.setContentModel(contentModelIdsStr);
        cmsChannel.setCreateBy(principal.getUsername());
        int insertCmsChannel = cmsChannelService.insertCmsChannel(cmsChannel);

        if(cmsChannel.getAttr()!=null) {
            Iterator iterator = cmsChannel.getAttr().entrySet().iterator();
            while (iterator.hasNext()) {
                Map.Entry entry = (Map.Entry) iterator.next();
                CmsAttr cmsAttr = new CmsAttr();
                cmsAttr.setAttrName(entry.getKey().toString());
                cmsAttr.setAttrValue(entry.getValue().toString());
                if (entry.getValue() instanceof ArrayList) {
                    ArrayList arrayList = (ArrayList) entry.getValue();
                    cmsAttr.setAttrValue(JSON.toJSONString(arrayList));
                }
                cmsAttr.setChannelId(cmsChannel.getChannelId());
                int i = cmsAttrService.insertCmsAttr(cmsAttr);
            }
        }
        AjaxResult ajaxResult=toAjax(insertCmsChannel);
        //生成静态页面
        CmsSiteSetup cmsSiteSetup = cmsSiteSetupService.selectCmsSiteSetupBySiteId(principal.getSiteId());
        if(cmsSiteSetup.getSiteStatic().equals("0")) {
//            new CreateStaticPage().generateHtml(cmsChannel.getPath(),staticHtml,scheme);
        }
        return ajaxResult;
    }

    /**
     * 修改栏目
     */
    @PreAuthorize("@ss.hasPermi('web:channel:edit')")
    @Log(title = "栏目", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CmsChannel cmsChannel) throws IOException {
        LoginUser principal = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        JSONObject attrs = cmsChannel.getAttr();
        if(attrs!=null) {
            CmsAttr attr = new CmsAttr();
            attr.setChannelId(cmsChannel.getChannelId());
            cmsAttrService.deleteCmsAttrByChannelId(cmsChannel.getChannelId());
            if(cmsChannel.getAttr()!=null) {
                Iterator iterator = attrs.entrySet().iterator();
                while (iterator.hasNext()) {
                    Map.Entry entry = (Map.Entry) iterator.next();
                    if (entry.getValue() != null) {
                        CmsAttr cmsAttr = new CmsAttr();
                        cmsAttr.setAttrName(entry.getKey().toString());
                        cmsAttr.setAttrValue(entry.getValue().toString());
                        if (entry.getValue() instanceof ArrayList) {
                            ArrayList arrayList = (ArrayList) entry.getValue();
                            cmsAttr.setAttrValue(JSON.toJSONString(arrayList));
                        }
                        cmsAttr.setChannelId(cmsChannel.getChannelId());
                        int i = cmsAttrService.insertCmsAttr(cmsAttr);
                    }
                }
            }
        }
        String contentModelIdsStr = JSON.toJSONString(cmsChannel.getContentModelList());
//        String contentModelIdsStr = ArrayUtils.toString(cmsChannel.getContentModelIds(), ",");
        cmsChannel.setContentModel(contentModelIdsStr);
        if(cmsChannel.getIsDelete()!=null&&cmsChannel.getIsDelete().equals("1")){
            cmsChannel.setDeleteBy(principal.getUsername());
            cmsChannel.setDeleteTime(new Date());
        }else{
            cmsChannel.setUpdateBy(principal.getUsername());
        }
        AjaxResult ajaxResult=toAjax(cmsChannelService.updateCmsChannel(cmsChannel));
        //生成静态页面
        CmsSiteSetup cmsSiteSetup = cmsSiteSetupService.selectCmsSiteSetupBySiteId(principal.getSiteId());
        if(cmsSiteSetup.getSiteStatic().equals("0")) {
//            new CreateStaticPage().generateHtml(cmsChannel.getPath(),staticHtml,scheme);
        }
        return ajaxResult;
    }

    /**
     * 删除栏目
     */
    @PreAuthorize("@ss.hasPermi('web:channel:remove')")
    @Log(title = "栏目", businessType = BusinessType.DELETE)
	@DeleteMapping("/{channelIds}")
    public AjaxResult remove(@PathVariable Long[] channelIds)
    {
        return toAjax(cmsChannelService.deleteCmsChannelByChannelIds(channelIds));
    }


    //获取汉字的拼音首字母
    @GetMapping("/toChannelPath/{str}")
    @ResponseBody
    public String channelPath(@PathVariable("str") String str){
        String pinYinFirst = PinYinUtils.getPinYinFirst(str);
        return pinYinFirst;
    }

    //判断链接名称是否已经存在
    @GetMapping("/toChannelPathIsNull/{str}")
    @ResponseBody
    public String channelPathIsNull(@PathVariable("str") String str){
        LoginUser principal = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        CmsChannel cmsChannel = new CmsChannel();
        cmsChannel.setPath(str);
        cmsChannel.setSiteId(principal.getSiteId());
        List<CmsChannel> cmsChannels = cmsChannelService.selectCmsChannelList(cmsChannel);
        if(cmsChannels.size()>0){
            return "false";
        }else{
            return "true";
        }
    }


    /**
     * 获取菜单下拉树列表
     */
    @GetMapping("/treeselect")
    public AjaxResult treeselect(CmsChannel cmsChannel)
    {
        LoginUser principal = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        if(cmsChannel.getSiteId()==null){
            cmsChannel.setSiteId(principal.getSiteId());
        }

        if (!SysUser.isAdmin(principal.getUserId())){
            SysRoleCms sysRoleCms = new SysRoleCms();
            sysRoleCms.setRoleId(principal.getUser().getRoles().get(0).getRoleId());
            sysRoleCms.setPropertyType("channel");
            List<SysRoleCms> sysRoleCmsList = sysRoleCmsService.selectSysRoleCmsList(sysRoleCms);
            cmsChannel.setRoleCmsList(sysRoleCmsList);
        }
        List<TreeSelectWeb> treeSelectWebs = cmsChannelService.selectDeptTreeList(cmsChannel);
        return success(treeSelectWebs);
    }

}
