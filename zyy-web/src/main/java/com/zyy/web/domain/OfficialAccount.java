package com.zyy.web.domain;

import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;

public class OfficialAccount {
    private String  title;

    private String url;

    private String thumbUrl;

    private String thumbMedialId;

    private String isDelete;

    private String author;

    private String digest;

    private String content;

    private String onlyFansCanComment;

    private String showOverPic;

    private String contentSourceUrl;

    private String needOpenComment;

    private String createTime;

    public String getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Long timestamp) {
        Instant instant = Instant.ofEpochMilli(Long.parseLong(timestamp+"890")); // 将时间戳转换为Instant对象
        LocalDateTime dateTime = LocalDateTime.ofInstant(instant, ZoneId.systemDefault()); // 将Instant对象转换为LocalDateTime对象
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDate = dateTime.format(formatter); // 格式化LocalDateTime对象为字符串
        this.createTime = formattedDate;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getThumbUrl() {
        return thumbUrl;
    }

    public void setThumbUrl(String thumbUrl) {
        this.thumbUrl = thumbUrl;
    }

    public String getThumbMedialId() {
        return thumbMedialId;
    }

    public void setThumbMedialId(String thumbMedialId) {
        this.thumbMedialId = thumbMedialId;
    }

    public String getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(String isDelete) {
        this.isDelete = isDelete;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getDigest() {
        return digest;
    }

    public void setDigest(String digest) {
        this.digest = digest;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getOnlyFansCanComment() {
        return onlyFansCanComment;
    }

    public void setOnlyFansCanComment(String onlyFansCanComment) {
        this.onlyFansCanComment = onlyFansCanComment;
    }

    public String getShowOverPic() {
        return showOverPic;
    }

    public void setShowOverPic(String showOverPic) {
        this.showOverPic = showOverPic;
    }

    public String getContentSourceUrl() {
        return contentSourceUrl;
    }

    public void setContentSourceUrl(String contentSourceUrl) {
        this.contentSourceUrl = contentSourceUrl;
    }

    public String getNeedOpenComment() {
        return needOpenComment;
    }

    public void setNeedOpenComment(String needOpenComment) {
        this.needOpenComment = needOpenComment;
    }
}
