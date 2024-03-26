package com.zyy.web.utils;

import com.zyy.common.core.redis.RedisCache;
import com.zyy.web.config.AlipayConfig;
import com.zyy.web.domain.CmsConfig;
import com.zyy.web.service.ICmsConfigService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.List;

@Component
public class ConfigUtils {

    public static final String CMS_CONFIG_KEY="cms_config:";

    @Autowired
    private RedisCache redisCache;

    @Autowired
    private ICmsConfigService cmsConfigService;

    @Autowired
    private AlipayConfig alipayConfig;

    private String[] categorys = {"cos_tencent","oss_aliyun","alipay","wechat_mp"};

    @PostConstruct
    public void setConfig(){
        for(String category: categorys) {
            CmsConfig cmsConfig = new CmsConfig();
            cmsConfig.setCategory(category);
            List<CmsConfig> cmsConfigs = cmsConfigService.selectCmsConfigList(cmsConfig);
            redisCache.setCacheObject(this.CMS_CONFIG_KEY+category,cmsConfigs);
        }

        alipayConfig.init();
    }
}
