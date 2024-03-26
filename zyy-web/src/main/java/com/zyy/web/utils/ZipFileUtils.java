package com.zyy.web.utils;

import com.zyy.web.domain.vo.UnzipFileVo;
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.util.*;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;

/**
 * 导入/导出工具类
 */
public class ZipFileUtils {
    /**
     * 复制文件夹
     *
     * @param source      复制后文件夹路径
     * @param destination 原文件夹路径
     * @throws IOException
     */
    private static void copyDirectory(File source, File destination) throws IOException {
        File[] files = source.listFiles();
        for (File file : files) {
            if (file.isDirectory()) {
                copyDirectory(file, new File(destination, file.getName()));
            } else {
                if (!destination.exists()) {
                    destination.mkdirs();
                }
                File copy = new File(destination, file.getName());
                copy.createNewFile();
                FileInputStream in = new FileInputStream(file);
                FileOutputStream out = new FileOutputStream(copy);
                byte[] buffer = new byte[1024];
                int length;
                while ((length = in.read(buffer)) > 0) {
                    out.write(buffer, 0, length);
                }
                in.close();
                out.close();
            }
        }
    }

    /**
     * 压缩文件
     *
     * @param path    需要压缩的文件路径
     * @param zipPath 压缩的文件后路径
     * @throws Exception
     */
    public static void zipFolder(String path, String zipPath) throws Exception {
        FileOutputStream fos = null;
        ZipOutputStream zos = null;
        try {
            fos = new FileOutputStream(zipPath);
            zos = new ZipOutputStream(fos);
            addFolderToZip("", new File(path), zos);
        } finally {
            if (zos != null) {
                zos.close();
            }
            if (fos != null) {
                fos.close();
            }
        }
    }

    /**
     * 秭归添加压缩路径
     */
    private static void addFolderToZip(String parentPath, File folder, ZipOutputStream zos) throws Exception {
        for (File file : folder.listFiles()) {
            if (file.isDirectory()) {
                    addFolderToZip(parentPath + folder.getName() + "/", file, zos);
            } else {
                FileInputStream fis = null;
                try {
                    fis = new FileInputStream(file);
                    String dirName="";
                    if(parentPath.length()>0){
                        dirName = parentPath.substring("cms-template/".length(), parentPath.length());
                    }
                    ZipEntry zipEntry = new ZipEntry(dirName + folder.getName()  + "/" + file.getName());
                    zos.putNextEntry(zipEntry);
                    byte[] bytes = new byte[1024];
                    int length;
                    while ((length = fis.read(bytes)) >= 0) {
                        zos.write(bytes, 0, length);
                    }
                } finally {
                    if (fis != null) {
                        fis.close();
                    }
                }
            }
        }
    }


    public static int BYTE_LEN = 10240;

    /**
     * 本地文件解压
     *
     * @param file 具体文件
     * @return 解压后的文件列表
     */
    public static List<UnzipFileVo> unzip(File file) {
        if (Objects.isNull(file) || !file.exists()) {
            return Collections.emptyList();
        }
        ZipFile zip = null;
        try {
            zip = new ZipFile(file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (Objects.isNull(zip)) {
            return Collections.emptyList();
        }
        Enumeration<? extends ZipEntry> entries = zip.entries();
        List<UnzipFileVo> vos = new ArrayList<>();
        while (entries.hasMoreElements()) {
            ZipEntry entry = entries.nextElement();
            String path = entry.getName();
            UnzipFileVo vo = new UnzipFileVo();
            vo.setPath(path);
            // 解析文件夹
            boolean directory = entry.isDirectory();
            if (directory) {
                vo.setType(0);
                vos.add(vo);
                continue;
            }
            // 解析文件
            vo.setType(1);
//            StringBuilder sb = new StringBuilder();
            try (InputStream in = zip.getInputStream(entry);
                 InputStreamReader inputStreamReader = new InputStreamReader(in);
                 BufferedReader reader = new BufferedReader(inputStreamReader)) {
                //得到图片的二进制数据，以二进制封装得到数据，具有通用性
                byte[] data = readInputStream(in);
                vo.setBytes(data);
            } catch (IOException e) {
                e.printStackTrace();
            } catch (Exception exception) {
                exception.printStackTrace();
            }
            vos.add(vo);
        }
        if (Objects.nonNull(zip)) {
            try {
                zip.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return vos;
    }


    /**
     * 上传文件解压
     *
     * @param multipartFile 上传文件
     * @return 解压后的文件列表
     */
    public static List<UnzipFileVo> unzip(MultipartFile multipartFile) {
        File file = getFile(multipartFile);
        if (Objects.isNull(file)) {
            return Collections.emptyList();
        }
        List<UnzipFileVo> vos = unzip(file);
        if (file.exists()) {
            boolean delete = file.delete();
            if (delete) {
                System.out.println(file.getName() + " 临时文件删除成功！");
            } else {
                System.out.println(file.getName() + " 临时文件删除失败！");
            }
        }
        return vos;
    }

    /**
     * MultipartFile 转 File
     *
     * @param multipartFile 上传文件
     * @return 本地文件
     */
    private static File getFile(MultipartFile multipartFile) {
        String fileName = System.currentTimeMillis() + "_" + multipartFile.getOriginalFilename();
        File file = new File("D://" + fileName);
        int len;
        try (OutputStream os = new FileOutputStream(file);
             InputStream in = multipartFile.getInputStream()) {
            byte[] buffer = new byte[BYTE_LEN];
            while ((len = in.read(buffer, 0, BYTE_LEN)) != -1) {
                os.write(buffer, 0, len);
            }
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
        return file;
    }


    public static byte[] readInputStream(InputStream inStream) throws Exception{
        ByteArrayOutputStream outStream = new ByteArrayOutputStream();
        //创建一个Buffer字符串
        byte[] buffer = new byte[1024];
        //每次读取的字符串长度，如果为-1，代表全部读取完毕
        int len = 0;
        //使用一个输入流从buffer里把数据读取出来
        while( (len=inStream.read(buffer)) != -1 ){
            //用输出流往buffer里写入数据，中间参数代表从哪个位置开始读，len代表读取的长度
            outStream.write(buffer, 0, len);
        }
        //关闭输入流
        inStream.close();
        //把outStream里的数据写入内存
        return outStream.toByteArray();
    }

}
