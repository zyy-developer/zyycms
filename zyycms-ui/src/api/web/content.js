import request from '@/utils/request'

// 查询文章管理列表
export function listContent(query) {
  return request({
    url: '/web/content/list',
    method: 'get',
    params: query
  })
}

// 查询文章管理详细
export function getContent(id) {
  return request({
    url: '/web/content/' + id,
    method: 'get'
  })
}

// 新增文章管理
export function addContent(data) {
  return request({
    url: '/web/content',
    method: 'post',
    data: data
  })
}

// 修改文章管理
export function updateContent(data) {
  return request({
    url: '/web/content',
    method: 'put',
    data: data
  })
}

// 删除文章管理
export function delContent(id) {
  return request({
    url: '/web/content/' + id,
    method: 'delete'
  })
}

// 加载微信公众号文章列表
export function listWxNotice(query) {
  return request({
    url: '/web/wxOfficialAccount/getContentList',
    method: 'get',
    params: query
  })
}

// 获取微信公众号封面图
export function getWxCoverImage(url) {
  return request({
    url: '/web/wxOfficialAccount/getCoverImg',
    method: 'get',
    params: {url:url}
  })
}
