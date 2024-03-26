package com.zyy.web.domain;

import com.zyy.common.core.domain.BaseEntity;

public class Content extends BaseEntity {
    private Integer id;
    private String title;
    private String price;
    private String descs;
    private String url;

    public Content(){}

    public Content(Integer id,String title, String price,String num, String descs) {
        this.title = title;
        this.price = price;
        this.descs = descs;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getDescs() {
        return descs;
    }

    public void setDescs(String descs) {
        this.descs = descs;
    }
}
