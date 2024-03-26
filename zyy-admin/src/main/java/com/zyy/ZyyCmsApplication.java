package com.zyy;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.scheduling.annotation.EnableScheduling;

/**
 * 启动程序
 *
 * @author hnzyy
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class},scanBasePackages = {"com.zyy"})
@MapperScan({"com.zyy.**.mapper"})
@EnableScheduling
public class ZyyCmsApplication
{
    public static void main(String[] args)
    {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(ZyyCmsApplication.class, args);
        System.out.println("(♥◠‿◠)ﾉﾞ  正易云CMS启动成功   ლ(´ڡ`ლ)ﾞ");
        System.out.println("　　　　正正正正正正　正正正正正正正正正正正正正正正正　　正正正正正　正正正正正正正正　　正正正正正\n" +
                "　　　正正　　正正　　　正正　　正正　　正正　　正正　正正正　　　　　　正正　正正正　　正正　正正　\n" +
                "　　　　　　正正　　　　正正　正正　　　正正　正正　　正正　　　　　　正正正正正正　　正正　　　　　\n" +
                "　　　　　正正　　　　　正正正正　　　　正正正正　　正正　　　　　　　正正正正正正　　正正正　　　　\n" +
                "　　　　　正正　　　　　正正正　　　　　正正正　　　正正　　　　　　　正正正正正正　　　正正正　　　\n" +
                "　　　　正正　　　　　　正正　　　　　　正正　　　正正　　　　　　　正正正正正正　　　　　　正正　　\n" +
                "　　　正正　　　　　　　正正　　　　　　正正　　　正正　　　正正　　正正正正正正　　　　　　正正　　\n" +
                "　　正正　　正正　　　　正正　　　　　　正正　　　正正　　正正　　　正正正　正正　　正正　正正　　　\n" +
                "　正正正正正正　　　正正正正　　　　正正正正　　　　正正正正　　　正正正正正正正　正正正正正　");
    }
}
