package com.zyy.web.controller;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.FileSystems;
import java.util.*;
import java.util.stream.Collectors;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson2.JSONObject;
import com.zyy.common.core.domain.entity.SysUser;
import com.zyy.common.core.domain.model.LoginUser;
import com.zyy.common.utils.SecurityUtils;
import com.zyy.system.domain.SysRoleCms;
import com.zyy.system.service.ISysRoleCmsService;
import com.zyy.web.domain.CmsAttr;
import com.zyy.web.domain.CmsChannel;
import com.zyy.web.domain.Content;
import com.zyy.web.service.ICmsAttrService;
import com.zyy.web.service.ICmsChannelService;
import com.zyy.web.utils.GrabUtis;
import com.zyy.web.utils.MyIKAnalyzer;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.Term;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.zyy.common.annotation.Log;
import com.zyy.common.core.controller.BaseController;
import com.zyy.common.core.domain.AjaxResult;
import com.zyy.common.enums.BusinessType;
import com.zyy.web.domain.CmsContent;
import com.zyy.web.service.ICmsContentService;
import com.zyy.common.utils.poi.ExcelUtil;
import com.zyy.common.core.page.TableDataInfo;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.wltea.analyzer.lucene.IKAnalyzer;

/**
 * 文章管理Controller
 *
 * @author hnzyy sun
 * @date 2023-06-20
 */
@RestController
@RequestMapping("/web/content")
public class CmsContentController extends BaseController
{
    @Autowired
    private ICmsContentService cmsContentService;

    @Autowired
    private ICmsAttrService cmsAttrService;

    @Autowired
    private ICmsChannelService cmsChannelService;

    @Autowired
    private CmsIndexSearchController cmsIndexSearchController;

    @Autowired
    private ISysRoleCmsService sysRoleCmsService;

//    @Resource
//    private WorkspaceProcessController workspaceProcessController;

    @Value("${zyy.staticHtml}")
    private String staticHtml;

    @Value("${zyy.lucenePath}")
    private String lucenePath;

    /**
     * 查询文章管理列表
     */
    @PreAuthorize("@ss.hasPermi('web:content:list')")
    @GetMapping("/list")
    public TableDataInfo list(CmsContent cmsContent)
    {
        LoginUser principal = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        startPage();
        cmsContent.setSiteId(principal.getSiteId());
        if (!SysUser.isAdmin(principal.getUserId())){
            SysRoleCms sysRoleCms = new SysRoleCms();
            sysRoleCms.setRoleId(principal.getUser().getRoles().get(0).getRoleId());
            sysRoleCms.setPropertyType("channel");
            List<SysRoleCms> sysRoleCmsList = sysRoleCmsService.selectSysRoleCmsList(sysRoleCms);
            cmsContent.setRoleCmsList(sysRoleCmsList);
        }

        List<CmsContent> list = cmsContentService.selectCmsContentList(cmsContent);
        return getDataTable(list);
    }

    /**
     * 导出文章管理列表
     */
    @PreAuthorize("@ss.hasPermi('web:content:export')")
    @Log(title = "文章管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, CmsContent cmsContent)
    {
        List<CmsContent> list = cmsContentService.selectCmsContentList(cmsContent);
        ExcelUtil<CmsContent> util = new ExcelUtil<CmsContent>(CmsContent.class);
        util.exportExcel(response, list, "文章管理数据");
    }

    /**
     * 获取文章管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('web:content:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(cmsContentService.selectCmsContentById(id));
    }

    /**
     * 新增文章管理
     */
    @PreAuthorize("@ss.hasPermi('web:content:add')")
    @Log(title = "文章管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CmsContent cmsContent) throws Exception {
        LoginUser principal = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        cmsContent.setSiteId(principal.getSiteId());
        cmsContent.setCreateBy(principal.getUsername());
        int cmsContentServiceResult = cmsContentService.insertCmsContent(cmsContent);
        //自定义字段
        JSONObject attrs = cmsContent.getAttr();
        Iterator iterator = attrs.entrySet().iterator();
        while (iterator.hasNext()) {
            Map.Entry entry = (Map.Entry) iterator.next();
            CmsAttr cmsAttr = new CmsAttr();
            cmsAttr.setAttrName(entry.getKey().toString());
            cmsAttr.setAttrValue(entry.getValue().toString());
            if(entry.getValue() instanceof ArrayList){
               ArrayList arrayList = (ArrayList)entry.getValue();
               cmsAttr.setAttrValue(JSON.toJSONString(arrayList));
            }
            cmsAttr.setContentId(cmsContent.getId());
            int i = cmsAttrService.insertCmsAttr(cmsAttr);
        }
        AjaxResult ajaxResult=toAjax(cmsContentServiceResult);
        ajaxResult.put("id",cmsContent.getId());
        //生成索引和静态页面
        CmsContent cmsContent1 = cmsContentService.selectCmsContentById(cmsContent.getId());
        this.createIndex(cmsContent1);
      //  generateHtml(cmsContent1.getUrl());
        return ajaxResult;
    }

    /**
     * 修改文章管理
     */
    @PreAuthorize("@ss.hasPermi('web:content:edit')")
    @Log(title = "文章管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CmsContent cmsContent) throws Exception {
        LoginUser principal = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        //自定义字段
        JSONObject attrs = cmsContent.getAttr();
        if(attrs!=null) {
            CmsAttr attr = new CmsAttr();
            attr.setContentId(cmsContent.getId());
            cmsAttrService.deleteCmsAttrByContentId(cmsContent.getId());
            Iterator iterator = attrs.entrySet().iterator();
            while (iterator.hasNext()) {
                Map.Entry entry = (Map.Entry) iterator.next();
                if(entry.getValue()!=null) {
                    CmsAttr cmsAttr = new CmsAttr();
                    cmsAttr.setAttrName(entry.getKey().toString());
                    cmsAttr.setAttrValue(entry.getValue().toString());
                    if(entry.getValue() instanceof ArrayList){
                        ArrayList arrayList = (ArrayList)entry.getValue();
                        cmsAttr.setAttrValue(JSON.toJSONString(arrayList));
                    }
                    cmsAttr.setContentId(cmsContent.getId());
                    int i = cmsAttrService.insertCmsAttr(cmsAttr);
                }
            }
        }
        if(cmsContent.getContentTypeList()!=null){
            cmsContent.setContentType(JSON.toJSONString(cmsContent.getContentTypeList()));
        }
        if(cmsContent.getIsDelete()!=null&&cmsContent.getIsDelete().equals("1")){
            cmsContent.setDeleteBy(principal.getUsername());
            cmsContent.setDeleteTime(new Date());
        }else{
            cmsContent.setUpdateBy(principal.getUsername());
        }
        AjaxResult ajaxResult = toAjax(cmsContentService.updateCmsContent(cmsContent));
        ajaxResult.put("id",cmsContent.getId());
        //生成索引和静态页面
        CmsContent cmsContent1 = cmsContentService.selectCmsContentById(cmsContent.getId());
        this.updateIndex(cmsContent1);
    //    generateHtml(cmsContent1.getUrl());
        return ajaxResult;
    }


    /**
     * 删除文章管理
     */
    @PreAuthorize("@ss.hasPermi('web:content:remove')")
    @Log(title = "文章管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        for (Long id:ids) {
            try {
                this.deleteIndex(id);
            } catch (IOException ioException) {
                ioException.printStackTrace();
            }
        }
        return toAjax(cmsContentService.deleteCmsContentByIds(ids));
    }


    /**
     * 删除索引
     * @param id
     * @return
     * @throws IOException
     */
    public int deleteIndex(Long id) throws IOException {
        // 创建目录对象
        Directory directory = FSDirectory.open(FileSystems.getDefault().getPath(lucenePath));
        // 创建配置对象
        IndexWriterConfig conf = new IndexWriterConfig(new IKAnalyzer());
        // 创建索引写出工具
        IndexWriter writer = new IndexWriter(directory, conf);
        // 根据词条进行删除
        writer.deleteDocuments(new Term("id",id+""));
        // 提交
        writer.commit();
        // 关闭
        writer.close();
        return 0;
    }

    /**
     * 创建内容索引
     * @return
     * @throws IOException
     */
    public int createIndex(CmsContent cmsContent) throws IOException {
        // 创建文档的集合
        Collection<Document> docs = new ArrayList<>();
        // 创建文档对象
        Document document = new Document();
        //StringField会创建索引，但是不会被分词，TextField，即创建索引又会被分词。
        document.add(new StringField("id", cmsContent.getId() + "", Field.Store.YES));
        document.add(new TextField("title", cmsContent.getTitle(), Field.Store.YES));
        document.add(new TextField("content", cmsContent.getText() != null ? cmsContent.getText() : "", Field.Store.YES));
        document.add(new TextField("descs", cmsContent.getProfile() != null ? cmsContent.getProfile() : "", Field.Store.YES));
        document.add(new TextField("url", cmsContent.getUrl(), Field.Store.YES));
        docs.add(document);
        // 索引目录类,指定索引在硬盘中的位置，我的设置为D盘的indexDir文件夹
        Directory directory = FSDirectory.open(FileSystems.getDefault().getPath(lucenePath));
        // 引入IK分词器
        Analyzer analyzer = new MyIKAnalyzer();
        // 索引写出工具的配置对象，这个地方就是最上面报错的问题解决方案
        IndexWriterConfig conf = new IndexWriterConfig(analyzer);
        // 设置打开方式：OpenMode.APPEND 会在索引库的基础上追加新索引。OpenMode.CREATE会先清空原来数据，再提交新的索引
        conf.setOpenMode(IndexWriterConfig.OpenMode.CREATE);
        // 创建索引的写出工具类。参数：索引的目录和配置信息
        IndexWriter indexWriter = new IndexWriter(directory, conf);
        // 把文档集合交给IndexWriter
        indexWriter.addDocuments(docs);
        // 提交
        indexWriter.commit();
        // 关闭
        indexWriter.close();
        return 0;
    }


    /**
     * 修改索引
     * @param cmsContent
     * @return
     * @throws IOException
     */
    public int updateIndex(CmsContent cmsContent) throws IOException {
        // 创建目录对象
        Directory directory = FSDirectory.open(FileSystems.getDefault().getPath(lucenePath));
        // 创建配置对象
        IndexWriterConfig conf = new IndexWriterConfig(new MyIKAnalyzer());
        // 创建索引写出工具
        IndexWriter writer = new IndexWriter(directory, conf);
        // 创建新的文档数据
        Document doc = new Document();
        doc.add(new StringField("id", cmsContent.getId()+"", Field.Store.YES));
        //Content content = contentMapper.selectByPrimaryKey("34");
        //content.setTitle("ce");
        //contentMapper.updateByPrimaryKeySelective(content);
//        Content content = new Content(34, "ce", "", "", "");
        doc.add(new TextField("title", cmsContent.getTitle(), Field.Store.YES));
        doc.add(new TextField("content", cmsContent.getText() != null ? cmsContent.getText() : "", Field.Store.YES));
        doc.add(new TextField("descs", cmsContent.getProfile() != null ? cmsContent.getProfile() : "", Field.Store.YES));
        doc.add(new TextField("url", cmsContent.getUrl(), Field.Store.YES));
        writer.updateDocument(new Term("id", cmsContent.getId()+""), doc);
        // 提交
        writer.commit();
        // 关闭
        writer.close();
        return 0;
    }

}
