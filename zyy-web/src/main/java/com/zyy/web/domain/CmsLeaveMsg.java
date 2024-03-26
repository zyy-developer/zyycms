package com.zyy.web.domain;

/**
 * 在线留言
 */
public class CmsLeaveMsg {

    //姓名
    private String userName;

    //邮箱
    private String mail;

    //电话
    private String phone;

    //公司
    private String company;

    //内容
    private String content;


    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
