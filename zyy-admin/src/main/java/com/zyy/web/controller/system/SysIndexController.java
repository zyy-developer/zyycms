package com.zyy.web.controller.system;

import org.springframework.beans.factory.annotation.Autowired;
import com.zyy.common.config.ZyyCmsConfig;

/**
 * 首页
 *
 * @author hnzyy
 */
//@RestController
//@Controller
public class SysIndexController
{
    /** 系统基础配置 */
    @Autowired
    private ZyyCmsConfig zyyCmsConfig;

    /**
     * 访问首页，提示语
     */
//    @RequestMapping("/")
    public String index()
    {
      return "index";
        //  return StringUtils.format("欢迎使用{}后台管理框架，当前版本：v{}，请通过前端地址访问。", ruoyiConfig.getName(), ruoyiConfig.getVersion());
    }
}
