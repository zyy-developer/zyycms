package com.zyy.web.utils;

import com.zyy.common.config.ZyyCmsConfig;
import com.zyy.common.utils.file.FileUploadUtils;
//import org.apache.commons.fileupload.FileItem;
//import org.apache.commons.fileupload.FileItemFactory;
//import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.springframework.http.MediaType;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.*;

public class GrabUtis {

    /*微信公众号图片抓取*/
    public static String getWxImageUrl(String txt) throws Exception{
//        String txt=json.getString("txt3");
        if(txt==null){
            return "";
        }
//        txt = StringEscapeUtils.unescapeHtml4(txt);
//        String realPath = RequestUtils.getHttpServletRequest().getSession().getServletContext().getRealPath("/");
        String format = new SimpleDateFormat("yyyyMM").format(new Date());
        String imgFirstStr="src=\"https";
        if(txt.indexOf(imgFirstStr)==-1){
            return txt;
        }
        String[] split = txt.split(imgFirstStr);
        for (int i = 1; i < split.length; i++) {
            String sp = split[i];
            int lastIndex = sp.indexOf("\"");
            if (lastIndex == -1) {
                continue;
            }
            String substring = sp.substring(0, lastIndex);
            String imgUrl = "https" + substring;
            String fileName = UUID.randomUUID()+"."+"jpg";
//            String filePath=+ "/" + format + "/" + fileName;
//            txt=txt.replace(imgUrl, filePath);
            //定义一个URL对象，就是你想下载的图片的URL地址
            URL url = new URL(imgUrl);
            //打开连接
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            //设置请求方式为"GET"
            conn.setRequestMethod("GET");
            //超时响应时间为10秒
            conn.setConnectTimeout(10 * 1000);
            //通过输入流获取图片数据
            InputStream is = conn.getInputStream();
            MultipartFile multipartFile = getMultipartFile(is, fileName);
            String filePath = ZyyCmsConfig.getUploadPath();
            // 上传并返回新文件名称
            String newfileName = FileUploadUtils.upload(filePath, multipartFile);
            txt=txt.replace(imgUrl, newfileName);
            txt=txt.replace("data-src","src");
        }
        if(split.length>2){
            txt="<div style=\"max-width:677px;margin:auto;\">"+txt+"</div>";
        }
        return txt;
    }

    //转存远程图片
    public static List<Map> catchImage(String[] imgUrls){
        List<Map> list = new ArrayList<>();
        try {
            for (String imgUrl:imgUrls) {
                //定义一个URL对象，就是你想下载的图片的URL地址
                URL url = new URL(imgUrl);
                //打开连接
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                //设置请求方式为"GET"
                conn.setRequestMethod("GET");
                //超时响应时间为10秒
                conn.setConnectTimeout(10 * 1000);
                //通过输入流获取图片数据
                InputStream is = conn.getInputStream();
                MultipartFile multipartFile = getMultipartFile(is, UUID.randomUUID()+"."+"jpg");
                String filePath = ZyyCmsConfig.getUploadPath();
                // 上传并返回新文件名称
                String newFileName = FileUploadUtils.upload(filePath, multipartFile);
                Map<String, Object> map = new HashMap<>();
                map.put("source",imgUrl);
                map.put("url",newFileName);
                map.put("state","SUCCESS");
                list.add(map);
            }
        } catch (IOException ioException) {
            ioException.printStackTrace();
        }

        return list;
    }


    /**
     * 获取封装得MultipartFile
     *
     * @param inputStream inputStream
     * @param fileName    fileName
     * @return MultipartFile
     */
    public static MultipartFile getMultipartFile(InputStream inputStream, String fileName) {
        FileItem fileItem = createFileItem(inputStream, fileName);
        //CommonsMultipartFile是feign对multipartFile的封装，但是要FileItem类对象
        return new CommonsMultipartFile(fileItem);
    }


    /**
     * FileItem类对象创建
     *
     * @param
     * @param
     * @return FileItem
     */
    public static FileItem createFileItem(InputStream inputStream, String fileName) {
        FileItemFactory factory = new DiskFileItemFactory(16, null);
        String textFieldName = "file";
        FileItem item =  factory.createItem(textFieldName, MediaType.MULTIPART_FORM_DATA_VALUE, true, fileName);
        int bytesRead = 0;
        byte[] buffer = new byte[8192];
        OutputStream os = null;
        //使用输出流输出输入流的字节
        try {
            os = item.getOutputStream();
            while ((bytesRead = inputStream.read(buffer, 0, 8192)) != -1) {
                os.write(buffer, 0, bytesRead);
            }
            inputStream.close();
        } catch (IOException e) {
            throw new IllegalArgumentException("文件上传失败");
        } finally {
            if (os != null) {
                try {
                    os.close();
                } catch (IOException e) {

                }
            }
            if (inputStream != null) {
                try {
                    inputStream.close();
                } catch (IOException e) {
                }
            }
        }

        return item;
    }


    public static byte[] readInputStream(InputStream inStream) throws Exception {
        ByteArrayOutputStream outStream = new ByteArrayOutputStream();
        //创建一个Buffer字符串
        byte[] buffer = new byte[6024];
        //每次读取的字符串长度，如果为-1，代表全部读取完毕
        int len;
        //使用一个输入流从buffer里把数据读取出来
        while ((len = inStream.read(buffer)) != -1) {
            //用输出流往buffer里写入数据，中间参数代表从哪个位置开始读，len代表读取的长度
            outStream.write(buffer, 0, len);
        }
        //关闭输入流
        inStream.close();
        //把outStream里的数据写入内存
        return outStream.toByteArray();
    }


}
