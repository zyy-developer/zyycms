<template>
  <div class="content" id="login-content">
    <div class="login-content">
      <div class="left-login-content">
          <img src="../assets/login/login-left.png">
      </div>
      <div class="right-login-content">
          <el-form ref="loginForm" :model="loginForm" :rules="loginRules" class="login-form">
            <div class="login-title">正易云内容管理系统</div>
            <el-form-item prop="username">
              <el-input
                v-model="loginForm.username"
                type="text"
                auto-complete="off"
                placeholder="请输入用户名"
              >
                <svg-icon slot="prefix" icon-class="user" class="el-input__icon input-icon" />
              </el-input>
            </el-form-item>
            <el-form-item prop="password">
              <el-input
                v-model="loginForm.password"
                type="password"
                auto-complete="off"
                placeholder="请输入密码"
                @keyup.enter.native="handleLogin"
              >
                <svg-icon slot="prefix" icon-class="password" class="el-input__icon input-icon" />
              </el-input>
            </el-form-item>
            <el-form-item prop="code" v-if="captchaEnabled">
              <el-input
                v-model="loginForm.code"
                auto-complete="off"
                placeholder="验证码"
                style="width: 63%"
                @keyup.enter.native="handleLogin"
              >
                <svg-icon slot="prefix" icon-class="validCode" class="el-input__icon input-icon" />
              </el-input>
              <div class="login-code">
                <img :src="codeUrl" @click="getCode" class="login-code-img"/>
              </div>
            </el-form-item>
            <el-checkbox v-model="loginForm.rememberMe" style="margin:0px 0px 25px 0px;">记住密码</el-checkbox>
            <el-form-item style="width:100%;">
              <el-button
                :loading="loading"
                size="medium"
                type="primary"
                style="width:100%;"
                @click.native.prevent="handleLogin"
              >
                <span v-if="!loading">登 录</span>
                <span v-else>登 录 中...</span>
              </el-button>
              <div style="float: right;" v-if="register">
                <router-link class="link-type" :to="'/register'">立即注册</router-link>
              </div>
            </el-form-item>
          </el-form>
      </div>
    </div>
  </div>
</template>

<script>
import { getCodeImg } from "@/api/login";
import Cookies from "js-cookie";
import { encrypt, decrypt } from '@/utils/jsencrypt'
export default {
  name: "login2",
  data(){
    return{
      codeUrl: "",
      loginForm: {
        username: "admin",
        password: '',
        // password: "admin123",
        rememberMe: false,
        code: "",
        uuid: ""
      },
      loginRules: {
        username: [
          { required: true, trigger: "blur", message: "请输入您的账号" }
        ],
        password: [
          { required: true, trigger: "blur", message: "请输入您的密码" }
        ],
        code: [{ required: true, trigger: "change", message: "请输入验证码" }]
      },
      loading: false,
      // 验证码开关
      captchaEnabled: true,
      // 注册开关
      register: false,
      redirect: undefined
    }
  },
  watch: {
    $route: {
      handler: function(route) {
        this.redirect = route.query && route.query.redirect;
      },
      immediate: true
    }
  },
  created() {
    this.getCode();
    this.getCookie();
  },
  methods:{
    getCode() {
      getCodeImg().then(res => {
        this.captchaEnabled = res.captchaEnabled === undefined ? true : res.captchaEnabled;
        if (this.captchaEnabled) {
          this.codeUrl = "data:image/gif;base64," + res.img;
          this.loginForm.uuid = res.uuid;
        }
      });
    },
    getCookie() {
      const username = Cookies.get("username");
      const password = Cookies.get("password");
      const rememberMe = Cookies.get('rememberMe')
      this.loginForm = {
        username: username === undefined ? this.loginForm.username : username,
        password: password === undefined ? this.loginForm.password : decrypt(password),
        rememberMe: rememberMe === undefined ? false : Boolean(rememberMe)
      };
    },
    handleLogin() {
      this.$refs.loginForm.validate(valid => {
        if (valid) {
          this.loading = true;
          if (this.loginForm.rememberMe) {
            Cookies.set("username", this.loginForm.username, { expires: 30 });
            Cookies.set("password", encrypt(this.loginForm.password), { expires: 30 });
            Cookies.set('rememberMe', this.loginForm.rememberMe, { expires: 30 });
          } else {
            Cookies.remove("username");
            Cookies.remove("password");
            Cookies.remove('rememberMe');
          }
          this.$store.dispatch("Login", this.loginForm).then(() => {
            this.$router.push({ path: this.redirect || "/" }).catch(()=>{});
          }).catch(() => {
            this.loading = false;
            if (this.captchaEnabled) {
              this.getCode();
            }
          });
        }
      });
    },
  }
}
</script>

<style rel="stylesheet/scss" lang="scss">
#login-content{
  width: 100%;
  height: 100%;
  background-image: url("../assets/login/bg.png");
  background-size: 100% 100%;
  background-repeat: no-repeat;
  display: flex;
  align-items: center;
  justify-content: center;
}
.login-content{
  width: 1200px;
  height: 700px;
  background: rgba(255,255,255,0.7);
  box-shadow: 0px 22px 44px 5px rgba(16,66,165,0.6);
  border-radius: 20px;
}
.left-login-content{
  width: 50%;
  height: 100%;
  float: left;
  padding: 70px 100px 120px 100px;
  img{
    width: 100%;
    height: 100%;
  }
}
.right-login-content{
  width: 50%;
  height: 100%;
  float: right;
  display: flex;
  align-items: center;
  //background-color: #ffffff;
  padding: 20px 50px;
}
.login-title{
  font-size: 36px;
  font-family: SourceHanSansCN;
  font-weight: 500;
  color: #4468F3;
  line-height: 30px;
  margin-bottom: 50px;
  letter-spacing: 4px;
}
.login-content .el-input__inner{
  background-color: rgba(0,0,0,0);
  border: 0px solid;
  border-bottom: 1px solid rgba(102, 102, 102, 0.52);
  border-radius: 0px;
  font-size: 16px;
}

.login-code {
  width: 33%;
  height: auto;
  float: right;
  img {
    cursor: pointer;
    vertical-align: middle;
    width: 100%;
    height: 100%;
  }
}
.login-content .el-input--medium .el-input__inner{
  height: 45px;
}
.login-content .el-input--medium .el-input__icon{
  width: 1.2em;
  height: 1.2em;
}
.login-content .el-input__prefix{
  display: flex;
  align-items: center;
}
.login-content .el-button--primary{
  font-size: 24px;
  font-weight: 500;
  color: #FFFFFF;
  background-image: linear-gradient(98deg, rgb(44, 112, 247,100%), rgba(109,92,236,100%));
  border-radius: 34px;
  height: 60px;
  transition: all 2s;
}
.login-content .el-button--primary:focus,.login-content .el-button--primary:hover{
  background-image: linear-gradient(128deg, rgb(44, 112, 247,60%), rgba(109,92,236,60%));
}
</style>
