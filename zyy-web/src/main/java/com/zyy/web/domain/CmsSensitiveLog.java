package com.zyy.web.domain;

import com.zyy.common.core.domain.BaseEntity;

public class CmsSensitiveLog extends BaseEntity {
    private static final long serialVersionUID = 1L;

    //主键
    private Long id;

    //敏感词
    private String sensitiveWord;

    //敏感词id
    private Long sensitiveId;

    //文章id
    private Long contentId;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSensitiveWord() {
        return sensitiveWord;
    }

    public void setSensitiveWord(String sensitiveWord) {
        this.sensitiveWord = sensitiveWord;
    }

    public Long getSensitiveId() {
        return sensitiveId;
    }

    public void setSensitiveId(Long sensitiveId) {
        this.sensitiveId = sensitiveId;
    }

    public Long getContentId() {
        return contentId;
    }

    public void setContentId(Long contentId) {
        this.contentId = contentId;
    }


}
