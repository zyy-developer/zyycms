import request from '@/utils/request'

//一键生成全站静态页面
export function toAllPage(data) {
  return request({
    url: '/web/staicPage/createAllPage',
    method: 'post',
    data: data
  })
}

//生成首页
export function toIndexPage(data) {
  return request({
    url: '/web/staicPage/index',
    method: 'post',
    data: data
  })
}

//生成栏目页
export function toChannelPage(data) {
  return request({
    url: '/web/staicPage/channel',
    method: 'post',
    data: data
  })
}

//生成内容页
export function toContentPage(data) {
  return request({
    url: '/web/staicPage/content',
    method: 'post',
    data: data
  })
}
