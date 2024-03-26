<template>
    <div class="email">
      <el-form ref="form" :model="form" :rules="rules" label-width="130px">
        <el-form-item label="邮箱发送协议" prop="configKey">
          <el-input v-model="form.email_protocol" placeholder="请输入邮箱发送协议" />
        </el-form-item>
        <el-form-item label="SMTP服务器地址" prop="configValue">
          <el-input v-model="form.email_host" placeholder="请输入SMTP服务器地址" />
        </el-form-item>
        <el-form-item label="发送者邮箱" prop="configValue">
          <el-input v-model="form.email_username" placeholder="请输入发送者邮箱" />
        </el-form-item>
        <el-form-item label="邮箱密码" prop="configValue">
          <el-input v-model="form.email_password" placeholder="请输入邮箱密码" />
        </el-form-item>
        <el-form-item label="发送人昵称" prop="configValue">
          <el-input v-model="form.email_nickname" placeholder="请输入发送人昵称" />
        </el-form-item>
        <el-form-item label="邮箱端口号" prop="configValue">
          <el-input v-model="form.email_port" placeholder="请输入邮箱端口号" />
        </el-form-item>
        <el-form-item label="接收者邮箱" prop="configValue">
          <el-input v-model="form.email_receive" placeholder="请输入接收者邮箱" />
        </el-form-item>
        <el-button type="primary" @click="saveConfig">保 存</el-button>
      </el-form>
    </div>
</template>

<script>
import { listConfig, getConfig, delConfig, addConfig, updateConfig } from "@/api/web/config";
export default {
  name: "Mail",
  data(){
    return{
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      },
      // 配置列表
      listConfig: [],
      queryParams: {
        category: 'email'
      }
    }
  },
  created() {
    this.getConfigList();
  },
  methods:{
    //加载配置
    getConfigList(){
      listConfig(this.queryParams).then(res=>{
        console.log(res)
        var form={};
        for (let i = 0; i < res.rows.length; i++) {
          eval('form.'+res.rows[i].configKey+'="'+res.rows[i].configValue+'"');
        }
        this.form=form;
        // eval("this.form."+res)
        console.log(this.form)
      })
    },
    //保存配置
    saveConfig(){
      this.$refs["form"].validate(valid => {
        if (valid) {
          updateConfig(this.form).then(response => {
            this.$modal.msgSuccess("保存成功");
            this.getConfigList();
          });
        }
      });
    }
  }
}
</script>

<style scoped>

</style>
