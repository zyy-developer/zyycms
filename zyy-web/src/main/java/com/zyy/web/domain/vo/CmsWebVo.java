package com.zyy.web.domain.vo;

public class CmsWebVo {

    //站点目录
    private String direName;

    //模板方案
    private String templateScheme;

    //模板文件名
    private String template;

    public String getDireName() {
        return direName;
    }

    public void setDireName(String direName) {
        this.direName = direName;
    }

    public String getTemplateScheme() {
        return templateScheme;
    }

    public void setTemplateScheme(String templateScheme) {
        this.templateScheme = templateScheme;
    }

    public String getTemplate() {
        return template;
    }

    public void setTemplate(String template) {
        this.template = template;
    }
}
