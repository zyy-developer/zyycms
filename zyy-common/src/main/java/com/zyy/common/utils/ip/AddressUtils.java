package com.zyy.common.utils.ip;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.maxmind.geoip2.DatabaseReader;
import com.maxmind.geoip2.exception.GeoIp2Exception;
import com.maxmind.geoip2.model.CityResponse;
import com.maxmind.geoip2.record.City;
import com.maxmind.geoip2.record.Country;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
//import com.alibaba.fastjson2.JSON;
//import com.alibaba.fastjson2.JSONObject;
import com.zyy.common.config.ZyyCmsConfig;
import com.zyy.common.constant.Constants;
import com.zyy.common.utils.StringUtils;
import com.zyy.common.utils.http.HttpUtils;

import java.io.*;
import java.net.*;
import java.util.HashMap;
import java.util.Map;

/**
 * 获取地址类
 *
 * @author hnzyy
 */
public class AddressUtils
{
    private static final Logger log = LoggerFactory.getLogger(AddressUtils.class);

    // IP地址查询
    public static final String IP_URL = "http://ip.taobao.com/outGetIpInfo";

    // 未知地址
    public static final String UNKNOWN = "XX XX";

    public static String getRealAddressByIP(String ip)
    {
        // 内网不查询
        if (IpUtils.internalIp(ip))
        {
            return "内网IP";
        }
        if (ZyyCmsConfig.isAddressEnabled())
        {
            try
            {
                String rspStr = HttpUtils.sendGet(IP_URL, "ip=" + ip + "&json=true", Constants.GBK);
                if (StringUtils.isEmpty(rspStr))
                {
                    log.error("获取地理位置异常 {}", ip);
                    return UNKNOWN;
                }
                JSONObject obj = JSON.parseObject(rspStr);
                String region = obj.getString("pro");
                String city = obj.getString("city");
                return String.format("%s %s", region, city);
            }
            catch (Exception e)
            {
                log.error("获取地理位置异常 {}", ip);
            }
        }
        return UNKNOWN;
    }


    public static String getIpAddress(String ip){
        try {
            // 创建一个DatabaseReader对象，加载IP数据库文件
            File database = new File("GeoLite2-City.mmdb");
            DatabaseReader reader = new DatabaseReader.Builder(database).build();

            // 解析IP地址
            InetAddress ipAddress = InetAddress.getByName(ip);

            // 查询归属地信息
            CityResponse response = reader.city(ipAddress);
            Country country = response.getCountry();
            City city = response.getCity();

            // 打印归属地信息
            System.out.println("IP地址: " + ipAddress);
            System.out.println("国家: " + country.getName());
            System.out.println("城市: " + city.getName());
        } catch (IOException | GeoIp2Exception e) {
            e.printStackTrace();
        }
        return "";
    }


    /**
     * description ali地域查询
     *
     * @param ip ip地址
     * @return java.lang.String
     * @version 1.0
     */
    public static String getAlibaba(String ip) {
        // 内网不查询
        if (IpUtils.internalIp(ip))
        {
            return null;
        }
        Map map = new HashMap();
        map.put("ip", ip);
        map.put("accessKey", "alibaba-inc");
        String result = HttpUtils.sendPost("http://ip.taobao.com/outGetIpInfo", "ip="+ip+"&accessKey=alibaba-inc");
        Map valueMap = JSONObject.parseObject(result, Map.class);

        // 请求成功，解析响应数据
        if ("query success".equals(valueMap.get("msg"))) {
            Map<String, String> dataMap = (Map<String, String>) valueMap.get("data");
            String country = dataMap.get("country");
            String region = dataMap.get("region");
            String city = dataMap.get("city");
            Map<String, String> IpAddressMap = new HashMap<>();
            IpAddressMap.put("country",country);
            IpAddressMap.put("region",region);
            IpAddressMap.put("city",city);

            return JSON.toJSONString(IpAddressMap);
        }
        return null;
    }

}
