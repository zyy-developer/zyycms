<template>
    <div class="system">
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="系统名称" prop="configKey">
          <el-input v-model="form.system_title" placeholder="请输入系统名称" />
        </el-form-item>
        <el-form-item label="系统logo" prop="configValue">
          <imageUpload v-model="form.system_logo" :limit="1" :fileType="['png', 'jpg', 'jpeg']"></imageUpload>
        </el-form-item>
<!--        <el-form-item label="系统ico" prop="configValue">-->
<!--          <imageUpload v-model="form.system_ico" :limit="1" :fileType="['ico']" :fileSize="1"></imageUpload>-->
<!--        </el-form-item>-->
<!--        <el-form-item label="登录名称" prop="configValue">-->
<!--          <el-input v-model="form.system_login_name" placeholder="请输入登录名称" />-->
<!--        </el-form-item>-->
        <el-button type="primary" @click="saveConfig">保 存</el-button>
      </el-form>
    </div>
</template>

<script>
import { listConfig, getConfig, delConfig, addConfig, updateConfig } from "@/api/web/config";
export default {
  name: "System",
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
        category: 'system'
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
        var form={};
        for (let i = 0; i < res.rows.length; i++) {
          eval('form.'+res.rows[i].configKey+'="'+res.rows[i].configValue+'"');
        }
        this.form=form;
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
