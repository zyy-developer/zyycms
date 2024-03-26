<template>
    <div class="app-container">
      <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="80px">
        <el-form-item label="页面URL" prop="pageName">
          <el-input
            v-model="queryParams.pageName"
            placeholder="请输入页面URL"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item label="开始日期" prop="createDate">
          <el-date-picker clearable
                          v-model="queryParams.startDate"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择创建时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="结束日期" prop="createDate">
          <el-date-picker clearable
                          v-model="queryParams.endDate"
                          type="date"
                          value-format="yyyy-MM-dd"
                          placeholder="请选择创建时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
        </el-form-item>
      </el-form>

      <el-table
        :data="pageList"
        style="width: 100%" v-loading="loading">
        <el-table-column type="index" width="50" label="序号"></el-table-column>
        <el-table-column prop="pageName" label="页面URL">
          <template slot-scope="scope">
            <a @click="toLink(scope.row.pageName)">{{scope.row.pageName}}</a>
          </template>
        </el-table-column>
        <el-table-column
          prop="pvCount"
          label="浏览量(PV)">
        </el-table-column>
        <el-table-column
          prop="uvCount"
          label="访客数(UV)">
        </el-table-column>
      </el-table>

      <pagination
        v-show="total>0"
        :total="total"
        :page.sync="queryParams.pageNum"
        :limit.sync="queryParams.pageSize"
        @pagination="getViewsList"
      />
    </div>
</template>

<script>
import { getViewsList } from "@/api/index";
import Template from "../template";
export default {
  name: "page_view",
  components: {Template},
  data(){
    return{
      // 显示搜索条件
      showSearch: true,
      //页面列表
      pageList: [],
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        pageName: null,
        startDate: this.dateFormat(new Date()),
        endDate: this.dateFormat(new Date()),
      },
      //加载
      loading:false,
      // 总条数
      total: 0,
    }
  },
  created() {
    this.getViewsList();
  },
  methods:{
    //获取受访页面列表
    getViewsList(){
      this.loading = true;
      getViewsList(this.queryParams).then(res=>{
        this.pageList=res.rows;
        this.total = res.total;
        this.loading = false;
      })
    },
    //跳转至受访页面
    toLink(page){
      window.open(page);
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getViewsList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    //日期格式化
    dateFormat:function(time) {
      var date=new Date(time);
      var year=date.getFullYear();
      /* 在日期格式中，月份是从0开始的，因此要加0
       * 使用三元表达式在小于10的前面加0，以达到格式统一  如 09:11:05
       * */
      var month= date.getMonth()+1<10 ? "0"+(date.getMonth()+1) : date.getMonth()+1;
      var day=date.getDate()<10 ? "0"+date.getDate() : date.getDate();
      return year+"-"+month+"-"+day;
    },
  }
}
</script>

<style scoped>

</style>
