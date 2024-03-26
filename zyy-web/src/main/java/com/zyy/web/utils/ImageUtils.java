package com.zyy.web.utils;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

/**
 * 图片工具类
 */
public class ImageUtils {


    /**
     *
     * @param filePath 图片路径
     * @param waterMarkImage 水印路径
     * @param prop 水印占比
     * @param ratio 不透明度
     * @param position 水印位置
     */
    public static void watermark(String filePath,String waterMarkImage,int prop,double ratio,String position){
        // 读取原图片信息 得到文件（本地图片）
        File srcImgFile = new File(filePath);
        //将文件对象转化为图片对象
        Image srcImg = null;
        try {
            srcImg = ImageIO.read(srcImgFile);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        //获取图片的宽
        int srcImgWidth = srcImg.getWidth(null);
        //获取图片的高
        int srcImgHeight = srcImg.getHeight(null);

        BufferedImage bufImg = new BufferedImage(srcImgWidth, srcImgHeight, BufferedImage.TYPE_INT_RGB);
        // 加水印
        //创建画笔
        Graphics2D g = bufImg.createGraphics();
        //绘制原始图片
        g.drawImage(srcImg, 0, 0, srcImgWidth, srcImgHeight, null);

        //-------------------------图片水印 start----------------------------
        // 水印文件
//        String waterMarkImage="D:\\水印测试\\sxrmyy.png";
        Image srcWaterMark = null;
        try {
            srcWaterMark = ImageIO.read(new File(waterMarkImage));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        //获取水印图片的宽度
        int widthWaterMark= srcWaterMark.getWidth(null);
        //获取水印图片的高度
        int heightWaterMark = srcWaterMark.getHeight(null);

        //设置 alpha 透明度：alpha 必须是范围 [0.0, 1.0] 之内（包含边界值）的一个浮点数字
        g.setComposite(AlphaComposite.getInstance(AlphaComposite.SRC_ATOP, (float) ratio));

        double multiple=widthWaterMark/(srcImgWidth*(prop*0.01));
        int syWidth=(int)(srcImgWidth*(prop*0.01));
        int syHeight=(int)(heightWaterMark/multiple);

        int positX=0,positY=0;
        switch (position){
            case "topLeft":
                positX=0;
                positY=0;
                break;
            case "topRight":
                positX=(srcImgWidth - syWidth);
                positY=0;
                break;
            case "topCenter":
                positX=(srcImgWidth - syWidth) / 2;
                positY=0;
                break;
            case "leftCenter":
                positX=0;
                positY=(srcImgHeight - syHeight) / 2;
                break;
            case "center":
                positX=(srcImgWidth - syWidth) / 2;
                positY=(srcImgHeight - syHeight) / 2;
                break;
            case "rightCenter":
                positX=(srcImgWidth - syWidth);
                positY=(srcImgHeight - syHeight) / 2;
                break;
            case "leftBottom":
                positX=0;
                positY=(srcImgHeight - syHeight);
                break;
            case "centerBottom":
                positX=(srcImgWidth - syWidth) / 2;
                positY=(srcImgHeight - syHeight) ;
                break;
            case "rightBottom":
                positX=(srcImgWidth - syWidth);
                positY=(srcImgHeight - syHeight);
                break;
        }

        //绘制水印图片  坐标为中间位置
        g.drawImage(srcWaterMark, positX, positY, syWidth,syHeight,null);
        // 水印文件结束
        g.dispose();
        //-------------------------图片水印 end----------------------------

        //待存储的地址
        String tarImgPath=filePath;
        // 输出图片
        FileOutputStream outImgStream = null;
        try {
            String suffix=tarImgPath.substring(tarImgPath.lastIndexOf(".")+1);
            outImgStream = new FileOutputStream(tarImgPath);
            ImageIO.write(bufImg, suffix, outImgStream);
            outImgStream.flush();
            outImgStream.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
