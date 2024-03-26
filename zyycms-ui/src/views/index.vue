<template>
  <div class="app-container home">
    <el-row :gutter="20">
      <el-col :lg="16">
        <div class="update-log wzgk">
          <div class="title-log">
            <span>网站概况</span>
          </div>
          <hr/>
          <div class="sm-cards">
            <div class="sm-card">
              <div class="sm-card-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 48 48" fill="none">
                  <path d="M32.2845 11.254C32.8158 10.9953 33.4334 10.9336 34.005 11.0718C34.7431 11.2482 35.3923 11.7773 35.7283 12.4741C36.0127 13.0474 36.0701 13.7266 35.9179 14.3498C34.634 20.9825 33.3501 27.618 32.069 34.2506C32.0001 34.6622 31.8823 35.0709 31.6554 35.4207C31.4055 35.8235 31.0465 36.1528 30.63 36.3674C30.1417 36.6203 29.5759 36.7055 29.0359 36.6144C28.6884 36.5585 28.358 36.4233 28.0622 36.2322C26.8644 35.4501 25.6581 34.6799 24.4603 33.8978C23.389 34.8181 22.3233 35.7442 21.252 36.6673C21.0136 36.8702 20.7062 36.9936 20.3932 36.9995C20.083 37.0083 19.7728 36.8937 19.5372 36.6849C19.2356 36.4203 19.0604 36.0176 19.0489 35.6118V32.2661C19.0374 31.193 19.0461 30.117 19.0432 29.0439C19.0317 28.8205 19.0432 28.5735 19.204 28.403C21.3468 26.0922 23.4952 23.7872 25.638 21.4734C22.7714 23.799 19.902 26.1274 17.0355 28.4559C16.9435 28.5324 16.8488 28.6088 16.7339 28.6441C16.5673 28.6941 16.3806 28.6735 16.2312 28.5823C14.8697 27.7033 13.5112 26.8183 12.1468 25.9422C11.7648 25.6776 11.4517 25.3072 11.2535 24.8809C11.041 24.4311 10.9606 23.9195 11.018 23.4256C11.0812 22.8435 11.3397 22.2819 11.7447 21.8674C11.9572 21.644 12.21 21.4617 12.4829 21.3235C12.9941 21.0912 13.4882 20.8178 13.9908 20.5709C20.0916 17.4603 26.1866 14.3557 32.2845 11.254Z" fill="white"/>
                </svg>
              </div>
              <div class="sm-card-content">
                <p>内容发布数</p>
                <p>
                  <span>今日</span>
                  <span>{{toDayInsertNum}}</span>
                </p>
              </div>
            </div>
            <div class="sm-card">
              <div class="sm-card-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" viewBox="0 0 32 32" fill="none">
                  <path d="M23.4979 26H7.83242C6.57464 26 5.51367 24.9681 5.3476 23.5878L3.6808 9.68156C3.49629 8.13377 5.16309 7.17707 6.19638 8.23969L8.99795 11.12C9.62531 11.7658 10.6155 11.7009 11.1691 10.9765L14.5181 6.58939C15.1178 5.80354 16.2125 5.80354 16.8153 6.58939L20.1643 10.9765C20.7178 11.7009 21.7081 11.7692 22.3354 11.12L25.137 8.23969C26.1703 7.17707 27.8371 8.13035 27.6526 9.68156L25.9858 23.5878C25.8166 24.9681 24.7557 26 23.4979 26Z" fill="white"/>
                </svg>
              </div>
              <div class="sm-card-content">
                <p>IP数</p>
                <p>
                  <span>今日</span>
                  <span>{{toDayIpNum}}</span>
                </p>
              </div>
            </div>
            <div class="sm-card">
              <div class="sm-card-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 48 48" fill="none">
                  <path fill-rule="evenodd" clip-rule="evenodd" d="M12.3334 16C12.3334 13.7909 14.1242 12 16.3334 12H31.3334C33.5425 12 35.3334 13.7909 35.3334 16V33C35.3334 35.2091 33.5425 37 31.3334 37H16.3334C14.1242 37 12.3334 35.2091 12.3334 33V16ZM17.3334 20.5C17.3334 19.6716 18.0049 19 18.8334 19H28.8334C29.6618 19 30.3334 19.6716 30.3334 20.5C30.3334 21.3284 29.6618 22 28.8334 22H18.8334C18.0049 22 17.3334 21.3284 17.3334 20.5ZM18.8334 27C18.0049 27 17.3334 27.6716 17.3334 28.5C17.3334 29.3284 18.0049 30 18.8334 30H28.8334C29.6618 30 30.3334 29.3284 30.3334 28.5C30.3334 27.6716 29.6618 27 28.8334 27H18.8334Z" fill="white"/>
                </svg>
              </div>
              <div class="sm-card-content">
                <p>浏览量</p>
                <p>
                  <span>今日</span>
                  <span>{{toDayPvNum}}</span>
                </p>
              </div>
            </div>
            <div class="sm-card">
              <div class="sm-card-icon">
                <svg xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 48 48" fill="none">
                  <path d="M32.2845 11.254C32.8158 10.9953 33.4334 10.9336 34.005 11.0718C34.7431 11.2482 35.3923 11.7773 35.7283 12.4741C36.0127 13.0474 36.0701 13.7266 35.9179 14.3498C34.634 20.9825 33.3501 27.618 32.069 34.2506C32.0001 34.6622 31.8823 35.0709 31.6554 35.4207C31.4055 35.8235 31.0465 36.1528 30.63 36.3674C30.1417 36.6203 29.5759 36.7055 29.0359 36.6144C28.6884 36.5585 28.358 36.4233 28.0622 36.2322C26.8644 35.4501 25.6581 34.6799 24.4603 33.8978C23.389 34.8181 22.3233 35.7442 21.252 36.6673C21.0136 36.8702 20.7062 36.9936 20.3932 36.9995C20.083 37.0083 19.7728 36.8937 19.5372 36.6849C19.2356 36.4203 19.0604 36.0176 19.0489 35.6118V32.2661C19.0374 31.193 19.0461 30.117 19.0432 29.0439C19.0317 28.8205 19.0432 28.5735 19.204 28.403C21.3468 26.0922 23.4952 23.7872 25.638 21.4734C22.7714 23.799 19.902 26.1274 17.0355 28.4559C16.9435 28.5324 16.8488 28.6088 16.7339 28.6441C16.5673 28.6941 16.3806 28.6735 16.2312 28.5823C14.8697 27.7033 13.5112 26.8183 12.1468 25.9422C11.7648 25.6776 11.4517 25.3072 11.2535 24.8809C11.041 24.4311 10.9606 23.9195 11.018 23.4256C11.0812 22.8435 11.3397 22.2819 11.7447 21.8674C11.9572 21.644 12.21 21.4617 12.4829 21.3235C12.9941 21.0912 13.4882 20.8178 13.9908 20.5709C20.0916 17.4603 26.1866 14.3557 32.2845 11.254Z" fill="white"/>
                </svg>
              </div>
              <div class="sm-card-content">
                <p>访客数</p>
                <p>
                  <span>今日</span>
                  <span>{{toDayUvNum}}</span>
                </p>
              </div>
            </div>
          </div>
        </div>
      </el-col>
      <el-col :lg="8">
        <div class="update-log dbsx">
          <div class="title-log">
            <span>待办事项</span>
          </div>
          <hr/>
          <div class="sm-cards">
            <div class="sm-card">
                <span>内容</span>
                <span>0</span>
            </div>
            <div class="sm-card">
                <span>会员</span>
                <span>0</span>
            </div>
          </div>
        </div>
      </el-col>
    </el-row>
    <br/>
    <el-row :gutter="20">
      <el-col :lg="16">
        <div class="update-log">
          <div class="title-log">
            <span>趋势图</span>
            <a class="more">查看更多>></a>
          </div>
          <hr/>
          <div class="charts-info">
            <div class="charts-data-tabs">
              <el-radio-group v-model="trendTabActive" @change="otherTabsChart">
                <el-radio
                  v-for="dict in trendTab"
                  :key="dict.value"
                  :label="dict.value"
                >{{ dict.label }}
                </el-radio>
              </el-radio-group>
            </div>
            <VueEcharts :option="getTrend()" style="width:100%;height:550px"></VueEcharts>
          </div>
        </div>
      </el-col>
      <el-col :lg="8">
        <div class="update-log">
          <div class="title-log">
            <span>新老客户</span>
            <a class="more">查看更多>></a>
          </div>
          <hr/>
          <div class="pie-chart">
            <VueEcharts :option="getNewCustomInfo()" style="width:60%;height:100%"></VueEcharts>
            <div class="right-data">
              <div class="right-data-item">
                <span>浏览量</span>
                <span>{{newUserData.pv}}</span>
              </div>
              <div class="right-data-item">
                <span>访客数</span>
                <span>{{newUserData.uv}}</span>
              </div>
              <div class="right-data-item">
                <span>跳出率</span>
                <span>0</span>
              </div>
              <div class="right-data-item">
                <span>平均访问时长</span>
                <span>00:00:00</span>
              </div>
            </div>
          </div>
          <hr/>
          <div class="pie-chart">
            <VueEcharts :option="getOldCustomInfo()" style="width:60%;height:100%"></VueEcharts>
            <div class="right-data">
              <div class="right-data-item">
                <span>浏览量</span>
                <span>{{oldUserData.pv}}</span>
              </div>
              <div class="right-data-item">
                <span>访客数</span>
                <span>{{oldUserData.uv}}</span>
              </div>
              <div class="right-data-item">
                <span>跳出率</span>
                <span>0</span>
              </div>
              <div class="right-data-item">
                <span>平均访问时长</span>
                <span>00:00:00</span>
              </div>
            </div>
          </div>
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>

import { getOverDate, getViewsCount} from "@/api/index";

import "echarts"
import VueEcharts from "vue-echarts"
export default {
  name: "Index",
  components: {
    VueEcharts,
  },
  data() {
    return {
      trendTabActive:'pv',
      trendTab:[
        {label:"浏览量（PV）",value:'pv'},
        {label:"访问数（UV）",value:'uv'},
        {label:"IP数",value:'ip'},
        // {label:"跳出率",value:14},
        // {label:"平均访问时长",value:5},
      ],
      //今日新增文章数量
      toDayInsertNum: 0,
      //今日pv总数
      toDayPvNum: 0,
      //今日ip总数
      toDayIpNum:0,
      //今日UV总数
      toDayUvNum:0,
      //栏目数量
      channelLength:0,
      //趋势数据
      views:[ 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
      //趋势名称
      trendName: null,
      //新用户数据
      newUserData:{pv:0,uv:0,percentage:0},
      //老用户数据
      oldUserData:{pv:0,uv:0,percentage:0},
    };
  },
  created() {
    this.getOverviewDate();
    this.getViewsCountData('pv');
  },
  methods: {
    goTarget(href) {
      window.open(href, "_blank");
    },
    //获取趋势图
    getTrend(){
      return {
        tooltip: {
          trigger: 'axis',
        },
        xAxis: {
          name: '点',
          axisLabel: {
            formatter: '{value}'
          },
          type: 'category',
          data: ['0', '1', '2', '3', '4', '5', '6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23']
        },
        yAxis: {
          type: 'value'
        },
        series: [
          {
            name: this.trendName,
            data: this.views,
            type: 'line',
            smooth: true
          }
        ]
      }
    },
    //新客户
    getNewCustomInfo(){
      return{
        series: [
          {
            type: 'gauge',
            progress: {
              show: true,
              width: 15
            },
            axisLine: {
              lineStyle: {
                width: 18
              }
            },
            axisTick: {
              show: false
            },
            splitLine: {
              length: 10,
              lineStyle: {
                width: 2,
                color: '#999'
              }
            },
            axisLabel: {
              distance: 20,
              color: '#999',
              fontSize: 15
            },
            anchor: {
              show: true,
              showAbove: true,
              size: 18,
              itemStyle: {
                borderWidth: 8
              }
            },
            title: {
              show: true,
            },
            detail: {
              valueAnimation: true,
              fontSize: 40,
              offsetCenter: [0, '70%']
            },
            data: [
              {
                name: '新客户',
                value: this.newUserData.percentage
              }
            ]
          }
        ]
      };
    },
    //老客户
    getOldCustomInfo(){
      return{
        series: [
          {
            type: 'gauge',
            progress: {
              show: true,
              width: 15
            },
            axisLine: {
              lineStyle: {
                width: 18
              }
            },
            axisTick: {
              show: false
            },
            splitLine: {
              length: 10,
              lineStyle: {
                width: 2,
                color: '#999'
              }
            },
            axisLabel: {
              distance: 20,
              color: '#999',
              fontSize: 15
            },
            anchor: {
              show: true,
              showAbove: true,
              size: 18,
              itemStyle: {
                borderWidth: 8
              }
            },
            title: {
              show: true,
            },
            detail: {
              valueAnimation: true,
              fontSize: 40,
              offsetCenter: [0, '70%']
            },
            data: [
              {
                name: '老客户',
                value: this.oldUserData.percentage
              }
            ]
          }
        ]
      };
    },
    //获取概况数据
    getOverviewDate(){
      getOverDate({}).then(response=>{
        console.log(response)
        this.toDayPvNum=response.toDayPvCount;
        this.toDayInsertNum=response.toDayInsertCount;
        this.toDayIpNum=response.toDayIpCount;
        this.toDayUvNum=response.toDayUvCount;
        this.newUserData={uv:response.newUserData.uv,pv:response.newUserData.pv,percentage: parseInt(response.newUserData.uv/this.toDayUvNum*100)}
        this.oldUserData={uv:response.oldUserData.uv,pv:response.oldUserData.pv,percentage: parseInt(response.oldUserData.uv/this.toDayUvNum*100)}
      })
    },
    //获取访问量
    getViewsCountData(type){
      getViewsCount({type:type}).then(response =>{
        const views=response.views;
        if(views.length>0){
          let viewsList={hour:[],data:[]};
            for (let i = 0; i < 24; i++) {
              viewsList.hour.push(i)
              viewsList.data.push(0)
            }
          for (let i = 0; i <views.length ; i++) {
              viewsList.data[views[i].hour]=views[i].count;
          }
          this.views=viewsList.data;
          if(type=="pv"){
            this.trendName="浏览量（PV）";
          }else if(type=="uv"){
            this.trendName="访客数（UV）";
          }else if(type=="ip"){
            this.trendName="IP数（IP）";
          }
          this.getTrend();
        }
      })
    },
    //切换其他统计趋势数据
    otherTabsChart(value){
      this.getViewsCountData(value);
    }
  }
};
</script>

<style scoped lang="scss">
.home {
  blockquote {
    padding: 10px 20px;
    margin: 0 0 20px;
    font-size: 17.5px;
    border-left: 5px solid #eee;
  }
  hr {
    margin-top: 0px;
    margin-bottom: 0px;
    border: 0;
    border-top: 1px solid #eee;
  }
  .col-item {
    margin-bottom: 20px;
  }

  ul {
    padding: 0;
    margin: 0;
  }

  font-family: "open sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 13px;
  color: #676a6c;
  overflow-x: hidden;
  background: #F4F6FA;
  height: calc(100vh - 84px);

  ul {
    list-style-type: none;
  }

  h4 {
    margin-top: 0px;
  }

  h2 {
    margin-top: 10px;
    font-size: 26px;
    font-weight: 100;
  }

  p {
    margin-top: 8px;

    b {
      font-weight: 700;
    }
  }

  .update-log {
    border-radius: 8px;
    background: #FFF;
    /* 板块投影 */
    box-shadow: 0px 1px 4px 0px rgba(0, 0, 0, 0.06);
  }
  .title-log{
    display: flex;
    height: 56px;
    font-size: 16px;
    font-weight: 550;
    color:#333333;
    align-items: center;
    padding: 0 24px;
    justify-content: space-between;
  }
  .sm-cards{
    padding: 16px;
    display: flex;
    justify-content: space-between;
  }
  .sm-card{
    width: 24%;
    height: 100px;
    border-radius: 8px;
    background: #F8F8F8;
    display: flex;
    align-items: center;
    overflow: hidden;
  }
  .sm-card-icon{
    width: 48px;
    height: 48px;
    border-radius: 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-left: 30px;
  }
  .sm-card:nth-child(1) .sm-card-icon{
    background-color: #00B87A;
  }
  .sm-card:nth-child(2) .sm-card-icon{
    background-color: #FFAC2E;
  }
  .sm-card:nth-child(3) .sm-card-icon{
    background-color: #6B54F8;
  }
  .sm-card:nth-child(4) .sm-card-icon{
    background-color: #0db3e5;
  }
  .sm-card-content{
    margin-left: 20px;
  }
  .sm-card-content p:first-child{
    color: #333;
    font-size: 16px;
    font-style: normal;
    font-weight: 500;
    line-height: 18px;
    margin-block-end: 0px;
  }
  .sm-card-content p:last-child{
    margin-block-end: 0px;
  }
  .sm-card-content p:last-child span:nth-child(1){
    color: rgba(51, 51, 51, 0.40);
    font-size: 12px;
    font-style: normal;
    font-weight: 500;
    line-height: 14px;
  }
  .sm-card-content p:last-child span:nth-child(2){
    //color: #00B87A;
    font-size: 24px;
    font-style: normal;
    font-weight: 500;
    line-height: 26px;
    margin-left: 16px;
  }
  .sm-card:nth-child(1) .sm-card-content p:last-child span:nth-child(2){
    color: #00B87A;
  }
  .sm-card:nth-child(2) .sm-card-content p:last-child span:nth-child(2){
    color: #FFAC2E;
  }
  .sm-card:nth-child(3) .sm-card-content p:last-child span:nth-child(2){
    color: #6B54F8;
  }
  .sm-card:nth-child(4) .sm-card-content p:last-child span:nth-child(2){
    color: #0db3e5;
  }

  .dbsx .sm-card{
    width: 48%;
  }
  .dbsx .sm-card span:first-child{
    color: #333;
    font-size: 16px;
    font-style: normal;
    font-weight: 500;
    line-height: 18px;
    margin-left: 40px;
  }
  .dbsx .sm-card span:last-child{
    color: #0094E5;
    font-size: 24px;
    font-style: normal;
    font-weight: 500;
    line-height: 26px;
    margin-left: 60px;
  }
  .charts-info{
    height: 560px;
    overflow: hidden;
  }
  .pie-chart{
    height: 279px;
    overflow: hidden;
    display: flex;
    justify-content: space-between;
  }
  .more{
    color: #0094E5;
  }
  .right-data{
    width: 60%;
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: self-start;
  }
  .right-data-item{
    width: 80%;
    border-radius: 8px;
    background: #F8F8F8;
    height: 28px;
    padding: 0px 18px;
    margin-top: 14px;
    display: flex;
    align-items: center;
    justify-content: space-between;
  }
  .right-data-item span:nth-child(1){
    display: flex;
    align-items: center;
  }
  .right-data-item span:nth-child(1):before{
    content: "";
    display: inline-block;
    width: 8px;
    height: 8px;
    border-radius: 50%;
    margin-right: 12px;
  }
  .right-data .right-data-item:nth-child(1) span:nth-child(1):before{
    background-color: #FF9F5A;
  }
  .right-data .right-data-item:nth-child(2) span:nth-child(1):before{
    background-color: #59AFFF;
  }
  .right-data .right-data-item:nth-child(3) span:nth-child(1):before{
    background-color: #8DE477;
  }
  .right-data .right-data-item:nth-child(4) span:nth-child(1):before{
    background-color: #7262FD;
  }
  .charts-data-tabs{
    width: 100%;
    height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
    top: 30px;
    z-index: 10;
  }
}
</style>

