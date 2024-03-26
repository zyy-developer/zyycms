package com.zyy.web.utils;

import javax.servlet.http.HttpServletRequest;

public class OsUtils {

    public static String getOsName(HttpServletRequest request) {
        String browserDetails = request.getHeader("User-Agent");
        String userAgent = browserDetails;
        String os = "";
        //=================OS Info=======================
        if (userAgent.toLowerCase().indexOf("windows") >= 0) {
            os = "Windows";
        }else if (userAgent.toLowerCase().indexOf("iphone") >= 0) {
            os = "IPhone";
        }else if (userAgent.toLowerCase().indexOf("mac") >= 0) {
            os = "Mac";
        } else if (userAgent.toLowerCase().indexOf("x11") >= 0) {
            os = "Unix";
        } else if (userAgent.toLowerCase().indexOf("android") >= 0) {
            os = "Android";
        } else {
            os = "UnKnown, More-Info: " + userAgent;
        }
        return os;
    }
}
