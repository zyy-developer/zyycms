<template>
  <div class="app-container">
    <el-tabs v-model="activeName" @tab-click="handleClick">
      <el-tab-pane label="系统配置" name="first">
        <system></system>
      </el-tab-pane>
      <el-tab-pane label="支付配置" name="second">
        <payment></payment>
      </el-tab-pane>
      <el-tab-pane label="邮箱配置" name="third">
        <Mail></Mail>
      </el-tab-pane>
      <el-tab-pane label="上传配置" name="fourth">
        <upload></upload>
      </el-tab-pane>
      <el-tab-pane label="短信配置" name="fifth">
        <message></message>
      </el-tab-pane>
      <el-tab-pane label="第三方登录配置" name="sixth">
        <login></login>
      </el-tab-pane>
      <el-tab-pane label="公众号配置" name="seventh">
        <wxgzh></wxgzh>
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script>
import payment from "./payment";
import Mail from "./mail";
import system from "./system";
import upload from "./upload";
import wxgzh from "./wxgzh.vue";
import login from "./login.vue";
import message from "./message.vue";
export default {
  components: {
    payment,
    Mail,
    system,
    upload,
    wxgzh,
    login,
    message
  },
  name: "Config",
  data(){
    return{
      activeName: 'first'
    }
  },
  methods:{
    handleClick(tab, event) {
      console.log(tab, event);
    }
  }
}
</script>

<style scoped>

</style>
