<template>
  <div class="app-container">
    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="createIndex"
        >生成全站索引</el-button>
      </el-col>
    </el-row>


    <el-table v-loading="loading" row-key="channelId" :data="channelList" :tree-props="{children: 'children', hasChildren: 'hasChildren'}"
              :default-expand-all="true">
      <el-table-column label="栏目名称" align="left" prop="channelName">
        <template slot-scope="scope">
          <a @click="gotoChannelPage(scope.row.url)" target="_blank">{{scope.row.channelName}}</a>
        </template>
      </el-table-column>
      <el-table-column label="开启前台索引" align="center" prop="stage">
        <template slot-scope="scope">
          <el-switch
            v-model="scope.row.stage=='0'"
            @change="updateStage(scope.row)"
            :title="scope.row.stage=='0'?'隐藏':'显示'"
            active-color="#13ce66"
            inactive-color="#ff4949">
          </el-switch>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import { createContentIndex } from "@/api/web/contentIndex";
import { listChannel } from "@/api/web/channel";
import { getSite } from "@/api/web/site";
import Cookies from "js-cookie";
export default {
  name: "index",
  data(){
    return{
      // 遮罩层
      loading: true,
      // 栏目树
      channelList: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        parentId: null,
        channelName: null,
        path: null,
        externalLink: null,
        orderNum: null,
        tempId: null,
        stage: '0',
      },
      //站点域名
      domainName: null,
    }
  },
  created() {
    this.getSiteInfo();
    this.getList();
  },
  methods: {
    //生成全站索引
    createIndex() {
      createContentIndex().then(res => {
        if (res == 0) {
          this.$modal.msgSuccess("生成索引成功！");
        }
        console.log(res)
      })
    },
    //获取站点信息
    getSiteInfo(){
      let siteId=parseInt(Cookies.get("siteId"));
      getSite(siteId).then(response=>{
        this.domainName=response.data.domainName;
      })
    },
    /** 查询栏目列表 */
    getList() {
      this.loading = true;
      listChannel(this.queryParams).then(response => {
        this.channelList = this.handleTree(response.rows,"channelId");
        this.total = response.total;
        this.loading = false;
      });
    },
    //栏目浏览
    gotoChannelPage(url){
      window.open(this.domainName+url)
    },
  }
}
</script>

<style scoped>

</style>
