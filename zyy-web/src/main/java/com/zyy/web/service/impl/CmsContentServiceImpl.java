package com.zyy.web.service.impl;

import java.util.*;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.TypeReference;
import com.alibaba.fastjson2.JSONObject;
import com.zyy.common.core.domain.model.LoginUser;
import com.zyy.common.utils.DateUtils;
import com.zyy.common.utils.SecurityUtils;
import com.zyy.web.domain.*;
import com.zyy.web.domain.vo.CmsContentVo;
import com.zyy.web.mapper.CmsAttrMapper;
import com.zyy.web.mapper.CmsContentTxtMapper;
import com.zyy.web.mapper.CmsSensitiveMapper;
import com.zyy.web.utils.GrabUtis;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.zyy.web.mapper.CmsContentMapper;
import com.zyy.web.service.ICmsContentService;

/**
 * 文章管理Service业务层处理
 *
 * @author hnzyy
 * @date 2023-06-20
 */
@Service
public class CmsContentServiceImpl implements ICmsContentService
{
    @Autowired
    private CmsContentMapper cmsContentMapper;

    @Autowired
    private CmsAttrMapper cmsAttrMapper;

    @Autowired
    private CmsSensitiveMapper cmsSensitiveMapper;

    @Autowired
    private CmsContentTxtMapper cmsContentTxtMapper;

    /**
     * 查询文章管理
     *
     * @param id 文章管理主键
     * @return 文章管理
     */
    @Override
    public CmsContent selectCmsContentById(Long id)
    {
        CmsContent cmsContent = cmsContentMapper.selectCmsContentById(id);

        getAttr(cmsContent);

        CmsContentTxt cmsContentTxt = cmsContentTxtMapper.selectCmsContentTxtByContentId(cmsContent.getId());
        if(cmsContentTxt!=null){
            cmsContent.setText(cmsContentTxt.getText());
        }
        return cmsContent;
    }

    @Override
    public CmsContent selectCmsContentByIdAndTemp(Long id) {
        CmsContent cmsContent = cmsContentMapper.selectCmsContentById(id);
        if(cmsContent!=null) {
            CmsContentTxt cmsContentTxt = cmsContentTxtMapper.selectCmsContentTxtByContentId(cmsContent.getId());
            if (cmsContentTxt != null) {
                cmsContent.setText(cmsContentTxt.getText());
            }
        }
        getAttrByCms(cmsContent);
        return cmsContent;
    }

    /**
     * 查询文章管理列表
     *
     * @param cmsContent 文章管理
     * @return 文章管理
     */
    @Override
    public List<CmsContent> selectCmsContentList(CmsContent cmsContent)
    {
        List<CmsContent> cmsContents = cmsContentMapper.selectCmsContentList(cmsContent);
        for (CmsContent content: cmsContents) {
            if(content.getContentType()!=null) {
                List<Map<String, Object>> resultList = JSON.parseObject(content.getContentType(), new TypeReference<List<Map<String, Object>>>() {});
                List<CmsContentType>  contentTypeList = JSON.parseArray(JSON.toJSONString(resultList), CmsContentType.class);
                content.setContentTypeList(contentTypeList);
            }
            if(cmsContent.isTextShow()){
                CmsContentTxt cmsContentTxt = cmsContentTxtMapper.selectCmsContentTxtByContentId(content.getId());
                if (cmsContentTxt != null) {
                    content.setText(cmsContentTxt.getText());
                }
            }
//            //自定义属性处理
//            MapResultHandler<String, String> resultHandler = new MapResultHandler<>();
//            cmsAttrMapper.getDataAttrs(resultHandler,content.getId(),"content");
//            Map<String, String> mappedResults = resultHandler.getMappedResults();
//            cmsContent.setAttr(new JSONObject(mappedResults));
        }
        getAttrs(cmsContents);
        return cmsContents;
    }

    @Override
    public List<CmsContent> selectCmsContentListByTemp(CmsContent cmsContent) {
        List<CmsContent> cmsContents = cmsContentMapper.selectCmsContentList(cmsContent);
        for (CmsContent content: cmsContents) {
            if(cmsContent.isTextShow()){
                CmsContentTxt cmsContentTxt = cmsContentTxtMapper.selectCmsContentTxtByContentId(content.getId());
                if (cmsContentTxt != null) {
                    content.setText(cmsContentTxt.getText());
                }
            }
        }
        getAttrsByCms(cmsContents);
        return cmsContents;
    }

    /**
     * 新增文章管理
     *
     * @param cmsContent 文章管理
     * @return 结果
     */
    @Override
    public int insertCmsContent(CmsContent cmsContent)
    {
        cmsContent.setCreateTime(DateUtils.getNowDate());
//        LoginUser principal = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        Integer orderNum = cmsContentMapper.selectCmsContentMaxNum(cmsContent);
        if(orderNum!=null){
            cmsContent.setOrderNum(orderNum+10);
        }else{
            cmsContent.setOrderNum(10);
        }
        int i = cmsContentMapper.insertCmsContent(cmsContent);
        if(i>0){
            Long id = cmsContent.getId();
            //添加富文本内容
            CmsContentTxt cmsContentTxt = new CmsContentTxt();
            cmsContentTxt.setContentId(id);
            //远程图片转存
            String wxImageUrl = null;
            try {
                wxImageUrl = GrabUtis.getWxImageUrl(cmsContent.getText());
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            cmsContentTxt.setText(wxImageUrl);
            cmsContentTxt.setAttrKey("txt");
            cmsContentTxtMapper.insertCmsContentTxt(cmsContentTxt);
            //违禁词过滤
            List<CmsContentVo> cmsContentVoList = cmsContentMapper.selectCmsContentVoByContentId(id);
            if(cmsContentVoList!=null){
                for (CmsContentVo contentVo:cmsContentVoList) {
                    cmsContentMapper.updateCmsContentVoByContentId(contentVo);
                    CmsSensitiveLog cmsSensitiveLog = new CmsSensitiveLog();
                    cmsSensitiveLog.setSensitiveId(contentVo.getSensitiveId());
                    cmsSensitiveLog.setContentId(contentVo.getId());
                    cmsSensitiveLog.setSensitiveWord(contentVo.getSensitiveWord());
                    cmsSensitiveMapper.insertCmsSensitiveLog(cmsSensitiveLog);
                }
            }
        }
        return i;
    }

    /**
     * 修改文章管理
     *
     * @param cmsContent 文章管理
     * @return 结果
     */
    @Override
    public int updateCmsContent(CmsContent cmsContent)
    {
        int i = cmsContentMapper.updateCmsContent(cmsContent);
        if(i>0&&cmsContent.getText()!=null){
            Long id = cmsContent.getId();
            //添加富文本内容
            CmsContentTxt cmsContentTxt1 = cmsContentTxtMapper.selectCmsContentTxtByContentId(id);
            CmsContentTxt cmsContentTxt = new CmsContentTxt();
            //远程图片转存
            String wxImageUrl = null;
            try {
                wxImageUrl = GrabUtis.getWxImageUrl(cmsContent.getText());
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
            cmsContentTxt.setText(wxImageUrl);
            if(cmsContentTxt1!=null) {
                cmsContentTxt.setId(cmsContentTxt1.getId());
                cmsContentTxtMapper.updateCmsContentTxt(cmsContentTxt);
            }else{
                cmsContentTxt.setContentId(id);
                cmsContentTxt.setAttrKey("txt");
                cmsContentTxtMapper.insertCmsContentTxt(cmsContentTxt);
            }
            //违禁词过滤
            List<CmsContentVo> cmsContentVoList = cmsContentMapper.selectCmsContentVoByContentId(id);
            if(cmsContentVoList!=null){
                for (CmsContentVo contentVo:cmsContentVoList) {
                    cmsContentMapper.updateCmsContentVoByContentId(contentVo);
                    CmsSensitiveLog cmsSensitiveLog = new CmsSensitiveLog();
                    cmsSensitiveLog.setSensitiveId(contentVo.getSensitiveId());
                    cmsSensitiveLog.setContentId(contentVo.getId());
                    cmsSensitiveLog.setSensitiveWord(contentVo.getSensitiveWord());
                    cmsSensitiveMapper.insertCmsSensitiveLog(cmsSensitiveLog);
                }
            }
        }
        return i;
    }

    /**
     * 批量删除文章管理
     *
     * @param ids 需要删除的文章管理主键
     * @return 结果
     */
    @Override
    public int deleteCmsContentByIds(Long[] ids)
    {
        return cmsContentMapper.deleteCmsContentByIds(ids);
    }

    /**
     * 删除文章管理信息
     *
     * @param id 文章管理主键
     * @return 结果
     */
    @Override
    public int deleteCmsContentById(Long id)
    {
        return cmsContentMapper.deleteCmsContentById(id);
    }

    @Override
    public CmsContent selectCmsContentByContent(CmsContent cmsContent) {
        CmsContent cmsContentResult = cmsContentMapper.selectCmsContentByContent(cmsContent);
        if(cmsContentResult!=null) {
            CmsContentTxt cmsContentTxt = cmsContentTxtMapper.selectCmsContentTxtByContentId(cmsContentResult.getId());
            cmsContentResult.setText(cmsContentTxt.getText());
        }
        getAttrByCms(cmsContentResult);
        return cmsContentResult;
    }

    @Override
    public int addViews(CmsContent cmsContent) {
        return cmsContentMapper.addViews(cmsContent);
    }

    @Override
    public int selectTodayInsertNums(CmsContent cmsContent) {
        return cmsContentMapper.selectTodayInsertNums(cmsContent);
    }

    @Override
    public CmsContent selectCmsContentByFlowId(String flowId) {
        return cmsContentMapper.selectCmsContentByFlowId(flowId);
    }

    @Override
    public Integer selectCmsContentMaxNum(CmsContent cmsContent) {
        return cmsContentMapper.selectCmsContentMaxNum(cmsContent);
    }


    public void getAttr(CmsContent content){
        if(content==null){
            return;
        }
        List<CmsContent> list = new ArrayList<>();
        list.add(content);
        List<CmsAttr> cmsAttrs = cmsAttrMapper.selectCmsAttrListByIds(list);
        Map<String, Object> map = new HashMap<>();
        for (CmsAttr attr : cmsAttrs) {
            if (content.getId().equals(attr.getContentId())) {
                map.put(attr.getAttrName(), attr.getAttrValue());
                continue;
            }
        }
        content.setAttr(new JSONObject(map));
    }

    public void getAttrs(List<CmsContent> contents){
        if(contents==null||contents.size()==0){
            return;
        }
        List<CmsAttr> cmsAttrs = cmsAttrMapper.selectCmsAttrListByIds(contents);
        for (CmsContent content:contents){
            Map<String,Object> map=new HashMap<>();
            for (CmsAttr attr: cmsAttrs) {
                if(content.getId().equals(attr.getContentId())){
                    map.put(attr.getAttrName(), attr.getAttrValue());
                    continue;
                }
            }
            content.setAttr(new JSONObject(map));
        }
    }

    public void getAttrByCms(CmsContent content){
        if(content==null){
            return;
        }
        List<CmsContent> list = new ArrayList<>();
        list.add(content);
        List<CmsAttr> cmsAttrs = cmsAttrMapper.selectCmsAttrListByIds(list);
        Map<String, Object> map = new HashMap<>();
        for (CmsAttr attr : cmsAttrs) {
            if (content.getId().equals(attr.getContentId())) {
                if (attr.getAttrValue().indexOf("[") != -1 && attr.getAttrValue().indexOf("]") != -1) {
                    List jsonObjectList = JSONObject.parseObject(attr.getAttrValue(), List.class);
                    if (jsonObjectList.size() == 0) {
                        JSONObject json = new JSONObject();
                        json.put("url", "");
                        jsonObjectList.add(json);
                    }
                    map.put(attr.getAttrName(), jsonObjectList);
                } else {
                    map.put(attr.getAttrName(), attr.getAttrValue());
                }
                continue;
            }
        }
        content.setAttr(new JSONObject(map));
    }

    public void getAttrsByCms(List<CmsContent> contents){
        if(contents==null||contents.size()==0){
            return;
        }
        List<CmsAttr> cmsAttrs = cmsAttrMapper.selectCmsAttrListByIds(contents);
        for (CmsContent content:contents) {
            Map<String, Object> map = new HashMap<>();
            for (CmsAttr attr : cmsAttrs) {
                if(content.getId().equals(attr.getContentId())) {
                    if (attr.getAttrValue().indexOf("[") != -1 && attr.getAttrValue().indexOf("]") != -1) {
                        List jsonObjectList = JSONObject.parseObject(attr.getAttrValue(), List.class);
                        if (jsonObjectList.size() == 0) {
                            JSONObject json = new JSONObject();
                            json.put("url", "");
                            jsonObjectList.add(json);
                        }
                        map.put(attr.getAttrName(), jsonObjectList);
                    } else {
                        map.put(attr.getAttrName(), attr.getAttrValue());
                    }
                    continue;
                }
            }
            content.setAttr(new JSONObject(map));
        }
    }
}
