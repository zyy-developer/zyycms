package com.zyy.web.controller;

import com.zyy.common.core.controller.BaseController;
import com.zyy.web.domain.CmsLeaveMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.web.bind.annotation.*;

import javax.mail.internet.MimeMessage;
import java.util.Date;

/**
 * 在线留言Controller
 *
 * @author hnzyy sun
 * @date 2023-10-10
 */
@RestController
@RequestMapping("/web/leaveMsg")
public class CmsLeaveMsgController extends BaseController {


    @Autowired
    private JavaMailSender javaMailSender;

    // 获取yml配置的发送者邮箱
    @Value("${spring.mail.username}")
    private String mainUserName;

    //发送人昵称
    @Value("${spring.mail.nickname}")
    private String nickname;

    //接收人邮箱
    @Value("${spring.mail.receive}")
    private String receive;

    /**
     * 发送留言
     * @return
     */
    @PostMapping("/send")
    public String sendLeaveMsg(CmsLeaveMsg cmsLeaveMsg){
        StringBuffer buffer = new StringBuffer();
        buffer.append("姓名："+cmsLeaveMsg.getUserName()+"\n");
        buffer.append("邮箱："+cmsLeaveMsg.getMail()+"\n");
        buffer.append("电话："+cmsLeaveMsg.getPhone()+"\n");
        buffer.append("公司："+cmsLeaveMsg.getCompany()+"\n");
        buffer.append("内容："+cmsLeaveMsg.getContent()+"\n");
        sendSimpleMail("网站留言",buffer.toString());
        return "0";
    }

    /**
     * 普通邮件发送
     */
    public void sendSimpleMail(String title,String text) {
        // 构建一个邮件对象
        SimpleMailMessage message = new SimpleMailMessage();
        // 设置邮件主题
        message.setSubject(title);
        // 设置邮件发送者，昵称+<邮箱地址>
        message.setFrom(nickname+'<'+mainUserName+'>');
        // 设置邮件接收者，可以有多个接收者，多个接受者参数需要数组形式
        message.setTo(receive);
        // 设置邮件抄送人，可以有多个抄送人
//        message.setCc("12****32*qq.com");
        // 设置隐秘抄送人，可以有多个
//        message.setBcc("7******9@qq.com");
        // 设置邮件发送日期
        message.setSentDate(new Date());
        // 设置邮件的正文
        message.setText(text);
        // 发送邮件
        this.javaMailSender.send(message);
    }
}
