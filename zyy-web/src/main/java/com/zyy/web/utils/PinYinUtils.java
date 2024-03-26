package com.zyy.web.utils;

import net.sourceforge.pinyin4j.PinyinHelper;

public class PinYinUtils {
    // 返回中文的首字母，英文字符不变
    public static String getPinYinFirst(String src) {
        String temp = "";
        String demo = "";
        String convert = "";
        for (int j = 0; j < src.length(); j++) {
            char word = src.charAt(j);
            String[] pinyinArray = PinyinHelper.toHanyuPinyinStringArray(word);
            if (pinyinArray != null) {
                convert += pinyinArray[0].charAt(0);
            } else {
                convert += word;
            }
        }
        return convert;
    }
}
