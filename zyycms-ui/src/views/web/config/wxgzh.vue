<template>
  <div class="email">
    <el-form ref="form" :model="form" :rules="rules" label-width="130px">
      <el-form-item label="AppId" prop="configKey">
        <el-input v-model="form.wechat_mp_appid" placeholder="请输入AppId" />
      </el-form-item>
      <el-form-item label="AppSecret" prop="configKey">
        <el-input v-model="form.wechat_mp_appSecret" placeholder="请输入AppSecret" />
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
        category: 'wechat_mp'
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
