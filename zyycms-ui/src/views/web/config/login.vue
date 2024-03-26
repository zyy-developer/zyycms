<template>
  <div>
    <el-tabs :tab-position="tabPosition" style="height: 500px;">
      <el-tab-pane label="QQ登录">

      </el-tab-pane>
      <el-tab-pane label="微信登录">

      </el-tab-pane>
      <el-tab-pane label="微博登录">

      </el-tab-pane>
      <el-tab-pane label="钉钉登录">

      </el-tab-pane>
    </el-tabs>
  </div>
</template>

<script>

export default {
  name: "thirdPartyLogin",
  data(){
    return{
      tabPosition: 'left',
      // 表单校验
      rules: {
      },
      // 配置列表
      listConfig: [],


    }
  },
  created() {

  },
  methods:{

  }
}
</script>

<style scoped>

</style>
