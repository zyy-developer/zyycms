import request from '@/utils/request'

// 查询内容类型列表
export function listContentType(query) {
  return request({
    url: '/web/contentType/list',
    method: 'get',
    params: query
  })
}

// 查询内容类型详细
export function getContentType(id) {
  return request({
    url: '/web/contentType/' + id,
    method: 'get'
  })
}

// 新增内容类型
export function addContentType(data) {
  return request({
    url: '/web/contentType',
    method: 'post',
    data: data
  })
}

// 修改内容类型
export function updateContentType(data) {
  return request({
    url: '/web/contentType',
    method: 'put',
    data: data
  })
}

// 删除内容类型
export function delContentType(id) {
  return request({
    url: '/web/contentType/' + id,
    method: 'delete'
  })
}
