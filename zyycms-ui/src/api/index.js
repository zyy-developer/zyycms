import request from '@/utils/request'

// 获取网站概况数据
export function getOverDate(data) {
  return request({
    url: '/web/charts/getWebOverviewData',
    method: 'post',
    params: data
  })
}

// 获取日访问量
export function getViewsCount(data) {
  return request({
    url: '/web/charts/getViewsCount',
    method: 'post',
    params: data
  })
}

// 获取受访页面列表数据
export function getViewsList(data){
  return request({
    url: '/web/charts/getPageViewList',
    method: 'post',
    params: data
  })
}

// 获取地域访客数据
export function getRegionCountList(data){
  return request({
    url: '/web/charts/getRegionViewList',
    method: 'post',
    params: data
  })
}
