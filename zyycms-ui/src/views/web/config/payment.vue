<template>
  <div>
    <el-tabs :tab-position="tabPosition" style="height: 500px;">
      <el-tab-pane label="支付宝">
        <el-form ref="form" :model="form" :rules="rules" label-width="80px">
          <el-form-item label="AppId" prop="configKey">
            <el-input v-model="form.pay_alipay_appId" placeholder="请输入应用id" />
          </el-form-item>
          <el-form-item label="私钥" prop="configValue">
            <el-input type="textarea" :rows="10" v-model="form.pay_alipay_appPrivateKey" placeholder="请输入应用私钥" />
          </el-form-item>
          <el-form-item label="公钥" prop="configValue">
            <el-input type="textarea" :rows="3" v-model="form.pay_alipay_publicKey" placeholder="请输入应用公钥" />
          </el-form-item>
          <el-form-item label="回调地址" prop="configValue">
            <el-input v-model="form.pay_alipay_notifyUrl" placeholder="请输入回调地址" />
          </el-form-item>
          <el-button type="primary" @click="saveConfig">保 存</el-button>
        </el-form>
      </el-tab-pane>
      <el-tab-pane label="微信">
        微信
      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script>
import { listConfig, getConfig, delConfig, addConfig, updateConfig } from "@/api/web/config";
export default {
  name: "PayMeant",
  props: {

  },
  data(){
    return{
      tabPosition: 'left',
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      },
      // 配置列表
      listConfig: [],
      queryParams: {
        category: 'alipay'
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
              // this.open = false;
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
