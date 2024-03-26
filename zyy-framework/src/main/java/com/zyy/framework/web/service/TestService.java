package com.zyy.framework.web.service;

import org.springframework.stereotype.Service;

@Service("text")
public class TestService {


    public String dotest(){

        return "测试数据";
    }
}
