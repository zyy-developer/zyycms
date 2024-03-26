<template>
  <div>
    <el-tabs :tab-position="tabPosition" style="height: 500px;">
      <el-tab-pane label="阿里云短信">

      </el-tab-pane>
      <el-tab-pane label="腾讯云短信">

      </el-tab-pane>
    </el-tabs>
  </div>
</template>
<script>
export default {
  name: "message",
  data(){
    return{
      tabPosition: 'left',
      // 表单校验
      rules: {
      },
      // 配置列表
      listConfig: [],
    }
  }
}
</script>

<style scoped>

</style>
