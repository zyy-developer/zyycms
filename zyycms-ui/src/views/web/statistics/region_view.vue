<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="true" label-width="80px">
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
    <div class="echarts-map">
      <div ref="chinaMap" style="width: 60%; height: 600px;float: left"></div>
      <el-table
        :data="regionDataList" row-key="region"
        style="width: 40%;float: right" :tree-props="{children: 'children'}" >
        <el-table-column prop="pageName" label="省份">
          <template slot-scope="scope">
            <span>{{ scope.row.region }}</span>
          </template>
        </el-table-column>
        <el-table-column
          prop="pv"
          label="浏览量(PV)">
        </el-table-column>
        <el-table-column
          prop="uv"
          label="访客数(UV)">
        </el-table-column>
      </el-table>
    </div>
  </div>
</template>

<script>

import * as echarts from 'echarts'
import dataJson from "@/assets/json/chinaMap";
import { getRegionCountList } from "@/api/index";

export default {
  name: "region_view",
  data(){
    return{
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        pageName: null,
        startDate: this.dateFormat(new Date()),
        endDate: this.dateFormat(new Date()),
      },
      //省份列表
      regionDataList: [],
      //城市列表
      cityDataList: [],
      //省市数据
      regionData: [
        {name: '北京市', value: 0},
        {name: '天津市', value: 0},
        {name: '上海市', value: 0},
        {name: '重庆市', value: 0},
        {name: '河北省', value: 0},
        {name: '河南省', value: 0},
        {name: '云南省', value: 0},
        {name: '辽宁省', value: 0},
        {name: '黑龙江省', value: 0},
        {name: '湖南省', value: 0},
        {name: '安徽省', value: 0},
        {name: '山东省', value: 0},
        {name: '新疆维吾尔自治区', value: 0},
        {name: '江苏省', value: 0},
        {name: '浙江省', value: 0},
        {name: '江西省', value: 0},
        {name: '湖北省', value: 0},
        {name: '广西壮族自治区', value: 0},
        {name: '甘肃省', value: 0},
        {name: '山西省', value: 0},
        {name: '内蒙古', value: 0},
        {name: '陕西省', value: 0},
        {name: '吉林省', value: 0},
        {name: '福建省', value: 0},
        {name: '贵州省', value: 0},
        {name: '广东省', value: 0},
        {name: '青海省', value: 0},
        {name: '西藏自治区', value: 0},
        {name: '内蒙古自治区', value: 0},
        {name: '四川省', value: 0},
        {name: '宁夏回族自治区', value: 0},
        {name: '海南省', value: 0},
        {name: '台湾省', value: 0},
        {name: '香港特别行政区', value: 0},
        {name: '澳门特别行政区', value: 0}
      ]
    }
  },
  created() {
    this.getRegionData();
  },
  methods: {
    map_demo() {
      let myChart = echarts.init(this.$refs.chinaMap);
      let uploadDataUrl = dataJson;
      // 注册地图
      echarts.registerMap("china", uploadDataUrl);
      let option = {
        tooltip: {
          trigger: 'item',
          formatter: '{b}<br/>{c} 人'
        },
        visualMap: {
          min: 0,
          max: 12,
          // text: ['100', '0'],
          realtime: false,
          calculable: false,
          inRange: {
            color: ['#e0e6f1', '#71A9FF']
          }
        },
        geo: {
          map: 'china',
          // zoom: 1,          // 地图放大
          // aspectScale: 1, //地图宽高比例
          // roam:true,        //地图缩放、平移
          // // 滚轮缩放的极限控制
          // scaleLimit: {
          //   min: 0.5, //缩放最小大小
          //   max: 6, //缩放最大大小
          // },
        },
        series: [{
          name: '中国地图',
          type: 'map',
          map: 'china',
          data: this.regionData
        }]

      };
      myChart.setOption(option);
    },
    //查询地域统计数据
    getRegionData(){
      getRegionCountList(this.queryParams).then(res=>{
        console.log(res)
        let regionList=res.regionList;
        this.regionDataList=regionList;
        for (const dataKey in regionList) {
          for (const region in this.regionData) {
            if(this.regionData[region].name.indexOf(regionList[dataKey].region)!=-1){
              this.regionData[region].value=regionList[dataKey].uv;
            }
          }
        }
        this.map_demo();
      })
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getRegionData();
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
  },

  // 此时，页面上的元素，已经被渲染完毕了！
  mounted() {
    //注意: dom 节点渲染结束后渲染echarts
    this.map_demo()
  }
}
</script>

<style scoped>

</style>
