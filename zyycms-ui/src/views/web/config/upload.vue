<template>
    <div>
      <el-tabs :tab-position="tabPosition" style="height: 500px;">
        <el-tab-pane label="阿里云OSS">
          <el-form ref="aliyunForm" :model="aliyunForm" :rules="rules" label-width="120px">
            <el-form-item label="endpoint" prop="configKey">
              <el-input v-model="aliyunForm.oss_aliyun_endpoint" placeholder="请输入endpoint" />
            </el-form-item>
            <el-form-item label="accessKeyId" prop="configValue">
              <el-input v-model="aliyunForm.oss_aliyun_accessKeyId" placeholder="请输入accessKeyId" />
            </el-form-item>
            <el-form-item label="accessKeySecret" prop="configValue">
              <el-input v-model="aliyunForm.oss_aliyun_accessKeySecret" placeholder="请输入accessKeySecret" />
            </el-form-item>
            <el-form-item label="bucketName" prop="configValue">
              <el-input v-model="aliyunForm.oss_aliyun_bucketName" placeholder="请输入bucketName" />
            </el-form-item>
            <el-button type="primary" @click="saveOssConfig">保 存</el-button>
          </el-form>
        </el-tab-pane>
        <el-tab-pane label="腾讯云COS">
          <el-form ref="tencentForm" :model="tencentForm" :rules="rules" label-width="120px">
            <el-form-item label="secretId" prop="configKey">
              <el-input v-model="tencentForm.cos_tencent_secretId" placeholder="请输入secretId" />
            </el-form-item>
            <el-form-item label="secretKey" prop="configValue">
              <el-input v-model="tencentForm.cos_tencent_secretKey" placeholder="请输入secretKey" />
            </el-form-item>
            <el-form-item label="存储桶地区" prop="configValue">
              <el-input v-model="tencentForm.cos_tencent_region" placeholder="请输入region" />
            </el-form-item>
            <el-form-item label="存储桶名称" prop="configValue">
              <el-input v-model="tencentForm.cos_tencent_bucketName" placeholder="请输入bucketName" />
            </el-form-item>
            <el-form-item label="访问域名" prop="configValue">
              <el-input v-model="tencentForm.cos_tencent_path" placeholder="请输入path" />
            </el-form-item>
            <el-button type="primary" @click="saveCosConfig">保 存</el-button>
          </el-form>
        </el-tab-pane>
        <el-tab-pane label="七牛云">

        </el-tab-pane>
      </el-tabs>
    </div>
</template>

<script>
import { listConfig, getConfig, delConfig, addConfig, updateConfig } from "@/api/web/config";
export default {
  name: "upload",
  data(){
    return{
      tabPosition: 'left',
      // OSS表单参数
      aliyunForm: {},
      // COS表单参数
      tencentForm: {},
      // 表单校验
      rules: {
      },
      // 配置列表
      listConfig: [],
      ossQueryParams: {
        category: 'oss_aliyun'
      },
      cosQueryParams: {
        category: 'cos_tencent'
      },

    }
  },
  created() {
    this.getOssConfigList();
    this.getCosConfigList();
  },
  methods:{
    //加载阿里云配置
    getOssConfigList(){
      listConfig(this.ossQueryParams).then(res=>{
        var form={};
        for (let i = 0; i < res.rows.length; i++) {
          eval('form.'+res.rows[i].configKey+'="'+res.rows[i].configValue+'"');
        }
        this.aliyunForm=form;
      })
    },
    //加载腾讯云配置
    getCosConfigList(){
      listConfig(this.cosQueryParams).then(res=>{
        var form={};
        for (let i = 0; i < res.rows.length; i++) {
          eval('form.'+res.rows[i].configKey+'="'+res.rows[i].configValue+'"');
        }
        this.tencentForm=form;
      })
    },
    //保存阿里云OSS配置
    saveOssConfig(){
      this.$refs["aliyunForm"].validate(valid => {
        if (valid) {
          updateConfig(this.aliyunForm).then(response => {
            this.$modal.msgSuccess("保存成功");
            this.getOssConfigList();
          });
        }
      });
    },
    //保存腾讯云OSS配置
    saveCosConfig(){
      this.$refs["tencentForm"].validate(valid => {
        if (valid) {
          updateConfig(this.tencentForm).then(response => {
            this.$modal.msgSuccess("保存成功");
            this.getCosConfigList();
          });
        }
      });
    }
  }
}
</script>

<style scoped>

</style>
