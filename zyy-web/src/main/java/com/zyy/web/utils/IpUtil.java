package com.zyy.web.utils;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import java.io.InputStream;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;

import org.lionsoul.ip2region.xdb.Searcher;
import org.springframework.core.io.ClassPathResource;
import org.springframework.util.FileCopyUtils;
import org.springframework.stereotype.Component;

/**
 *获取ip地址
 */
@Component
public class IpUtil {
    private static final String UNKNOWN = "unknown";
    private static final String HEADER_FORWARDED = "x-forwarded-for";
    private static final String HEADER_PROXY = "Proxy-Client-IP";
    private static final String HEADER_WL_PROXY = "WL-Proxy-Client-IP";
    private static final String HEADER_HTTP = "HTTP_CLIENT_IP";
    private static final String HEADER_HTTP_FORWARDED = "HTTP_X_FORWARDED_FOR";
    private static final String LOCAL_IP = "127.0.0.1";
    private static final String LOCAL_HOST = "localhost";

    private static Searcher searcher;

    /**
     * 获取 IP 地址     *     * @param request     * @return
     */
    public static String getIpAddr(HttpServletRequest request) {
        String ip = request.getHeader(HEADER_FORWARDED);
        if (ip == null || ip.length() == 0 || UNKNOWN.equalsIgnoreCase(ip)) {
            ip = request.getHeader(HEADER_PROXY);
        }
        if (ip == null || ip.length() == 0 || UNKNOWN.equalsIgnoreCase(ip)) {
            ip = request.getHeader(HEADER_WL_PROXY);
        }
        if (ip == null || ip.length() == 0 || UNKNOWN.equalsIgnoreCase(ip)) {
            ip = request.getHeader(HEADER_HTTP);
        }
        if (ip == null || ip.length() == 0 || UNKNOWN.equalsIgnoreCase(ip)) {
            ip = request.getHeader(HEADER_HTTP_FORWARDED);
        }
        if (ip == null || ip.length() == 0 || UNKNOWN.equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        // 本机访问
        if (LOCAL_IP.equalsIgnoreCase(ip) || LOCAL_HOST.equalsIgnoreCase(ip) || "0:0:0:0:0:0:0:1".equalsIgnoreCase(ip)) {
            // 根据网卡取本机配置的 IP
            try {
                InetAddress localHost = InetAddress.getLocalHost();
                ip = localHost.getHostAddress();
            } catch (UnknownHostException e) {
                e.printStackTrace();
            }
        }
        // 对于通过多个代理的情况，第一个 IP 为客户端真实 IP,多个 IP 按照','分割
        if (ip != null && ip.length() > 15) {
            if (ip.indexOf(",") > 15) {
                ip = ip.substring(0, ip.indexOf(","));
            }
        }
        return ip;
    }



    /**
     * 在服务启动时加载 ip2region.db 到内存中
     * 解决打包 jar 后找不到 ip2region.db 的问题
     * @throws Exception 出现异常应该直接抛出终止程序启动，避免后续 invoke 时出现更多错误
     */
    @PostConstruct
    private static void initIp2regionResource() {
        try {
            InputStream inputStream = new ClassPathResource("/ipdb/ip2region.xdb").getInputStream();
            byte[] dbBinStr = org.springframework.util.FileCopyUtils.copyToByteArray(inputStream);
            // 创建一个完全基于内存的查询对象
            searcher = Searcher.newWithBuffer(dbBinStr);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 根据 IP 地址从 ip2region.db 中获取地理位置
     * @param ip IP 地址
     * @return IP归属地
     */
    public static String getCityInfo(String ip) {
        try {
            return searcher.search(ip);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 根据 IP 地址返回归属地，国内返回但省份，国外返回到国家
     * @param ip IP 地址
     * @return IP 归属地
     */
    public static String getIpRegion(String ip) {
        initIp2regionResource();
        HashMap<String, String> cityInfo = new HashMap<>();
        String searchIpInfo = getCityInfo(ip);
        String[] splitIpInfo = searchIpInfo.split("\\|");
        cityInfo.put("ip",ip);
        cityInfo.put("searchInfo", searchIpInfo);
        cityInfo.put("country",splitIpInfo[0]);
        cityInfo.put("region",splitIpInfo[1]);
        cityInfo.put("province",splitIpInfo[2]);
        cityInfo.put("city",splitIpInfo[3]);
        cityInfo.put("ISP",splitIpInfo[3]);

        //--------------国内属地返回省份--------------
        if ("中国".equals(cityInfo.get("country"))){
            return cityInfo.get("province")+"|"+cityInfo.get("city");
        }
        //------------------内网 IP----------------
        if ("0".equals(cityInfo.get("country"))){
            if ("内网IP".equals(cityInfo.get("ISP"))){
                return "";
            }
            else return "";
        }
        //--------------国外属地返回国家--------------
        else {
            return cityInfo.get("country");
        }
    }




}
