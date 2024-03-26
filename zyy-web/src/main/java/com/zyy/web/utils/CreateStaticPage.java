package com.zyy.web.utils;

import com.zyy.web.domain.CmsSite;
import com.zyy.web.service.ICmsSiteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;
import org.thymeleaf.templateresolver.ClassLoaderTemplateResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

/**
 * 生成静态页面
 */
@Component
public class CreateStaticPage {

    @Autowired
    private TemplateEngine templateEngine;


    /**
     * 生成静态页面
     */
    public static void generateHtml(String channelPath, String staticHtml, String scheme,String from) throws IOException {

        String connUrl=PathAddress(channelPath,scheme)+(from.equals("true")?"?from=true":"");
        //定义一个URL对象，就是你想下载的URL地址
        URL url = new URL(connUrl);
        //打开连接
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        //设置请求方式为"GET"
        conn.setRequestMethod("GET");
        //超时响应时间为10秒
        conn.setConnectTimeout(10 * 1000);
        //通过输入流获取数据
        InputStream is = conn.getInputStream();
        byte[] buffer = new byte[1024];
        int num;
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        while ((num = is.read(buffer)) != -1) {
            byteArrayOutputStream.write(buffer, 0, num);
        }
        byteArrayOutputStream.flush();
        String tempStr= byteArrayOutputStream.toString().replaceAll(".jhtml", "/index.html");
        File file=new File(staticHtml+"/"+channelPath);
        if(!file.exists()) {
            file.mkdirs();
        }
        FileOutputStream fileOutputStream=new FileOutputStream(file+"/index.html");
        fileOutputStream.write(tempStr.getBytes());
        fileOutputStream.close();
    }


    public static String PathAddress(String channelName,String scheme) {
        String strResult = "";
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes()).getRequest();
        StringBuffer strBuf = new StringBuffer();
        strBuf.append(scheme + "://");
        strBuf.append(request.getServerName() + ":");
        strBuf.append(request.getServerPort() + "");
        strResult = strBuf.toString()+"/"+channelName+(channelName.equals("")?"":".jhtml");
        return strResult;
    }



    public void makeHtml(String dir) {
        // 静态文件存储路径
        String storeDir = dir;

        // 获取数据
        Map<String, Object> map = new HashMap<>();
        map.put("name", "alex");
        map.put("age", 20);
        map.put("email", "3350996729@qq.com");

        // 上下文
        Context context = new Context();
        context.setVariables(map);
        // 输出流
        File dest = new File(storeDir, "test.html");
        if (dest.exists()) {
            dest.delete();
        }
        try (PrintWriter writer = new PrintWriter(dest, "UTF-8")) {
            // 生成html，第一个参数是thymeleaf页面下的原型名称
            // test参数为templates目录下的test.html文件
            templateEngine.process("make", context, writer);
//            log.info("执行生成页面成功！！！");
        } catch (Exception e) {
//            log.error("[静态页服务]：生成静态页异常", e);
        }
    }


    public void makeHtml(TemplateEngine templateEngine,Map<String, Object> toPage){
        ClassLoaderTemplateResolver resolver = new ClassLoaderTemplateResolver();
        resolver.setPrefix("file:\\D:\\zyycmsopen\\template\\www\\default\\index\\");  //模板文件的所在目录
        resolver.setSuffix(".html"); //模板文件的后缀

        //创建模板引擎对象
//        TemplateEngine templateEngine = new TemplateEngine();
        //将加载器放入模板引擎对象中
//        templateEngine.setTemplateResolver(resolver);
        //创建字符输出流并且自定义输出文件的位置和文件名
        FileWriter writer = null;
        try {
            writer = new FileWriter("D:\\zyycmsopen\\html\\index.html");
        } catch (IOException ioException) {
            ioException.printStackTrace();
        }
        //创建Context对象(存放Model)
        Context context = new Context();
        //放入数据
//        context.setVariable("hello",msg);
        context.setVariables(toPage);
        //创建静态文件,"text"是模板html名字
        templateEngine.process("www"+File.separator+"default"+File.separator+"index"+File.separator+"index",context,writer);
    }


}
