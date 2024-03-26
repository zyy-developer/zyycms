package com.zyy.web.controller;

import com.alibaba.fastjson.JSON;
import com.zyy.common.core.controller.BaseController;
import com.zyy.common.core.page.TableDataInfo;
import com.zyy.common.utils.PageUtils;
import com.zyy.web.domain.CmsContent;
import com.zyy.web.service.ICmsChannelService;
import com.zyy.web.service.ICmsContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Cms异步请求接口Controller
 *
 * @author hnzyy sun
 * @date 2023-06-20
 */
@RestController
@RequestMapping("/cms")
public class CmsAsyncController extends BaseController {

    @Autowired
    private ICmsContentService iCmsContentService;

    @Autowired
    private ICmsChannelService iCmsChannelService;

    /**
     * 获取分页文章数据
     * @return
     */
    @PostMapping("/getContentPage")
    public TableDataInfo getContentPage(CmsContent cmsContent){
        cmsContent.setStage("0");
        cmsContent.setIsDelete("0");
        PageUtils.startCmsPage(cmsContent.getPageNo(),cmsContent.getCount());
        cmsContent.setCount(null);
        TableDataInfo dataTable = getDataTable(iCmsContentService.selectCmsContentListByTemp(cmsContent));
        return dataTable;
    }

    /**
     * 获取单个文章数据
     * @return
     */
    @PostMapping("/getContent")
    public String getContent(CmsContent cmsContent){
        cmsContent.setStage("0");
        cmsContent.setIsDelete("0");
        CmsContent content = iCmsContentService.selectCmsContentById(cmsContent.getId());
        return JSON.toJSONString(content);
    }
}
