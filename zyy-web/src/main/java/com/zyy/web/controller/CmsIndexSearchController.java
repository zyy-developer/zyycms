package com.zyy.web.controller;

import com.zyy.common.core.controller.BaseController;
import com.zyy.common.core.domain.model.LoginUser;
import com.zyy.common.utils.SecurityUtils;
import com.zyy.web.domain.CmsContent;
import com.zyy.web.domain.Content;
import com.zyy.web.service.ICmsContentService;
import com.zyy.web.utils.MyIKAnalyzer;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.*;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.highlight.*;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.springframework.web.bind.annotation.*;
import org.springframework.beans.factory.annotation.*;
import org.wltea.analyzer.lucene.IKAnalyzer;

import java.io.IOException;
import java.nio.file.FileSystems;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;

/**
 * 内容索引
 */
@RequestMapping("/search")
@RestController
public class CmsIndexSearchController extends BaseController {

    @Autowired
    private ICmsContentService cmsContentService;

    @Value("${zyy.lucenePath}")
    private String lucenePath;


    /**
     * 生成索引
     * @return
     * @throws IOException
     */
    @RequestMapping("/createIndex")
    public int createIndex() throws IOException {
        LoginUser principal = (LoginUser) SecurityUtils.getAuthentication().getPrincipal();
        CmsContent content = new CmsContent();
        content.setStage("0");
        content.setSiteId(principal.getSiteId());
        content.setTextShow(true);
        List<CmsContent> cmsContents = cmsContentService.selectCmsContentList(content);
        // 创建文档的集合
        Collection<Document> docs = new ArrayList<>();
        for (int i = 0; i < cmsContents.size(); i++) {
            //contentMapper.insertSelective(list1.get(i));
            // 创建文档对象
            Document document = new Document();
            //StringField会创建索引，但是不会被分词，TextField，即创建索引又会被分词。
            document.add(new StringField("id", cmsContents.get(i).getId() + "", Field.Store.YES));
            document.add(new TextField("title", cmsContents.get(i).getTitle(), Field.Store.YES));
            document.add(new TextField("content", cmsContents.get(i).getText()!=null?cmsContents.get(i).getText():"", Field.Store.YES));
            document.add(new TextField("descs", cmsContents.get(i).getProfile()!=null?cmsContents.get(i).getProfile():"", Field.Store.YES));
            document.add(new TextField("url", cmsContents.get(i).getUrl(), Field.Store.YES));
            docs.add(document);
        }
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
     * 内容搜索
     * @param text
     * @param page
     * @param pageSize
     * @return
     * @throws IOException
     * @throws ParseException
     * @throws InvalidTokenOffsetsException
     */
    @RequestMapping("/searchText")
    public Object searchText(String text, int page,int pageSize) throws IOException, ParseException, InvalidTokenOffsetsException {
        String[] str = {"title", "descs","content"};
//        int page = 1;
//        int pageSize = 10;
        Directory directory = FSDirectory.open(FileSystems.getDefault().getPath(lucenePath));
        // 索引读取工具
        IndexReader reader = DirectoryReader.open(directory);
        // 索引搜索工具
        IndexSearcher searcher = new IndexSearcher(reader);
        // 创建查询解析器,两个参数：默认要查询的字段的名称，分词器
        MultiFieldQueryParser parser = new MultiFieldQueryParser(str, new MyIKAnalyzer());
        // 创建查询对象
        Query query = parser.parse(text);
        // 获取前十条记录
        //TopDocs topDocs = searcher.search(query, 100);
        TopDocs topDocs = searchByPage(page, pageSize, searcher, query);
        // 获取总条数
        System.out.println("本次搜索共找到" + topDocs.totalHits + "条数据");
        //高亮显示
        SimpleHTMLFormatter simpleHTMLFormatter = new SimpleHTMLFormatter("<span style='color:red'>", "</span>");
        Highlighter highlighter = new Highlighter(simpleHTMLFormatter, new QueryScorer(query));
        Fragmenter fragmenter = new SimpleFragmenter(100);   //高亮后的段落范围在100字内
        highlighter.setTextFragmenter(fragmenter);
        // 获取得分文档对象（ScoreDoc）数组.SocreDoc中包含：文档的编号、文档的得分
        ScoreDoc[] scoreDocs = topDocs.scoreDocs;
        List<Content> list = new ArrayList<>();
        for (ScoreDoc scoreDoc : scoreDocs) {
            // 取出文档编号
            int docID = scoreDoc.doc;
            // 根据编号去找文档
            Document doc = reader.document(docID);
            //Content content = contentMapper.selectByPrimaryKey(doc.get("id"));
            Content content = new Content();
            //处理高亮字段显示
            String title = highlighter.getBestFragment(new MyIKAnalyzer(), "title", doc.get("title"));
            if (title == null) {
                title = doc.getField("title").stringValue();
            }
            String descs = highlighter.getBestFragment(new MyIKAnalyzer(), "descs", doc.get("descs"));
            if (descs == null) {
                descs = doc.getField("descs").stringValue();
            }
            content.setId(Integer.parseInt(doc.getField("id").stringValue()));
            content.setDescs(descs);
            content.setTitle(title);
            content.setUrl(doc.getField("url").stringValue());
            list.add(content);
        }
        System.err.println("list的长度：" + list.size());
        HashMap<Object, Object> map = new HashMap<>();
        map.put("page",page);
        map.put("pageSize",pageSize);
        map.put("list",list);
        map.put("count",topDocs.totalHits);
        map.put("pages",(int)Math.ceil((double) topDocs.totalHits/pageSize));
        return map;
    }


    private TopDocs searchByPage(int page, int perPage, IndexSearcher searcher, Query query) throws IOException {
        TopDocs result = null;
        if (query == null) {
            System.out.println(" Query is null return null ");
            return null;
        }
        ScoreDoc before = null;
        if (page != 1) {
            TopDocs docsBefore = searcher.search(query, (page - 1) * perPage);
            ScoreDoc[] scoreDocs = docsBefore.scoreDocs;
            if (scoreDocs.length > 0) {
                before = scoreDocs[scoreDocs.length - 1];
            }
        }
        result = searcher.searchAfter(before, query, perPage);
        return result;
    }


    @RequestMapping("/updateIndex")
    public int update(String age) throws IOException {
        // 创建目录对象
        Directory directory = FSDirectory.open(FileSystems.getDefault().getPath(lucenePath));
        // 创建配置对象
        IndexWriterConfig conf = new IndexWriterConfig(new MyIKAnalyzer());
        // 创建索引写出工具
        IndexWriter writer = new IndexWriter(directory, conf);
        // 创建新的文档数据
        Document doc = new Document();
        doc.add(new StringField("id", "34", Field.Store.YES));
        //Content content = contentMapper.selectByPrimaryKey("34");
        //content.setTitle("xxx");
        //contentMapper.updateByPrimaryKeySelective(content);
        Content content = new Content(34, "XXX", "", "", "");
        doc.add(new TextField("title", content.getTitle(), Field.Store.YES));
        doc.add(new TextField("price", content.getPrice(), Field.Store.YES));
        doc.add(new TextField("descs", content.getDescs(), Field.Store.YES));
        writer.updateDocument(new Term("id", "34"), doc);
        // 提交
        writer.commit();
        // 关闭
        writer.close();
        return 0;
    }

}
