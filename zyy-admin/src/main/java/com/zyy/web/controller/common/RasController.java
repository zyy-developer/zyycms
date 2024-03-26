package com.zyy.web.controller.common;

import com.zyy.common.decryptor.RsaUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

//通用加密
@RequestMapping("/ras")
@RestController
public class RasController {


    /**
     * 获取公钥 前端用来密码加密
     *
     * @return
     */
    @GetMapping("/publicKey")
    public RsaUtils.RsaKeyPair publicKey() {
        //便于测试 公私秘钥都传了 可改为只传公钥
        //RsaUtils.RsaKeyPair rsaKeyPair = new RsaUtils.RsaKeyPair();
        //rsaKeyPair.setPublicKey(RsaUtils.getPublicKey());
        //return rsaKeyPair;
        return RsaUtils.rsaKeyPair();
    }
}
