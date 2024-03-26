package com.zyy.web.config;

import com.alipay.easysdk.factory.Factory;
import com.alipay.easysdk.kernel.Config;
import com.zyy.common.core.redis.RedisCache;
import com.zyy.web.domain.CmsConfig;
import com.zyy.web.service.ICmsConfigService;
import com.zyy.web.utils.ConfigUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.List;

/**
 * @author hnzyy sun
 * @date ：Created 2023/10/24 17:59
 * @description：alipay沙箱环境配置
 */
@Component
//@ConfigurationProperties(prefix = "alipay")
public class AlipayConfig {

    @Autowired
    private RedisCache redisCache;

    /**
     * appId
     */
    private String appId;

    /**
     * 私钥
     */
    private String appPrivateKey;

    /**
     * 公钥
     */
    private String publicKey;

    /**
     * 回调地址
     */
    private String notifyUrl;

    /**
     * 支付宝配置初始化,公钥模式
     */
    public void init() {
        List<CmsConfig> cacheObject = redisCache.getCacheObject(ConfigUtils.CMS_CONFIG_KEY+"alipay");
        Config config = new Config();
        //#基础配置
        config.protocol = "https";  //协议
        config.gatewayHost = "openapi-sandbox.dl.alipaydev.com";    //支付宝网关
        config.signType = "RSA2";   //签名方式
        for (CmsConfig cmsConfig1:cacheObject) {
            if(cmsConfig1.getConfigKey().equals("pay_alipay_appId")){
                config.appId = cmsConfig1.getConfigValue();  //应用id
            }else if(cmsConfig1.getConfigKey().equals("pay_alipay_appPrivateKey")){
                config.merchantPrivateKey = cmsConfig1.getConfigValue();    //应用私钥
            }else if(cmsConfig1.getConfigKey().equals("pay_alipay_publicKey")){
                config.alipayPublicKey = cmsConfig1.getConfigValue();    //支付宝公钥
            }else if(cmsConfig1.getConfigKey().equals("pay_alipay_notifyUrl")){
                config.notifyUrl = cmsConfig1.getConfigValue();  //回调地址
            }
        }
        Factory.setOptions(config);


//        Config config = new Config();
//        //#基础配置
//        config.protocol = "https";  //协议
//        config.gatewayHost = "openapi-sandbox.dl.alipaydev.com";    //支付宝网关
//        config.signType = "RSA2";   //签名方式
//        //#业务配置
//        config.appId = this.appId;  //应用id
//        config.merchantPrivateKey = this.appPrivateKey;    //应用私钥
//        config.alipayPublicKey = this.publicKey;    //支付宝公钥
//        config.notifyUrl = this.notifyUrl;  //回调地址
//        Factory.setOptions(config);
    }


    public String getAppId() {
        return appId;
    }

    public void setAppId(String appId) {
        this.appId = appId;
    }

    public String getAppPrivateKey() {
        return appPrivateKey;
    }

    public void setAppPrivateKey(String appPrivateKey) {
        this.appPrivateKey = appPrivateKey;
    }

    public String getPublicKey() {
        return publicKey;
    }

    public void setPublicKey(String publicKey) {
        this.publicKey = publicKey;
    }

    public String getNotifyUrl() {
        return notifyUrl;
    }

    public void setNotifyUrl(String notifyUrl) {
        this.notifyUrl = notifyUrl;
    }
}
