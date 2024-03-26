package com.zyy.web.domain.vo;

import com.zyy.web.domain.OfficialAccount;

import java.util.List;

public class OfficialAccountVo {
    private Integer pageIndex;

    private Integer pageSize;

    private Integer totalPage;

    private List<OfficialAccount> objectList;

    public Integer getPageIndex() {
        return pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public List<OfficialAccount> getObjectList() {
        return objectList;
    }

    public void setObjectList(List<OfficialAccount> objectList) {
        this.objectList = objectList;
    }
}
