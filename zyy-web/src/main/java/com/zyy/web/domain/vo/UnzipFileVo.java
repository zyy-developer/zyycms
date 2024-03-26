package com.zyy.web.domain.vo;

public class UnzipFileVo {
    /**
     * 类型：0-文件夹；1-文件
     */
    private Integer type;

    /**
     * 文件路径（如：src/main/java/com/zyq/entity/User.java）
     */
    private String path;

    /**
     * 文件内容
     */
    private String content;

    /**
     * 字节流
     */
    private byte[] Bytes;

    public byte[] getBytes() {
        return Bytes;
    }

    public void setBytes(byte[] bytes) {
        Bytes = bytes;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
