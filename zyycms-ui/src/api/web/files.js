import request from '@/utils/request'

// 查询资源库列表
export function listFiles(query) {
  return request({
    url: '/web/files/list',
    method: 'get',
    params: query
  })
}

// 查询资源库详细
export function getFiles(id) {
  return request({
    url: '/web/files/' + id,
    method: 'get'
  })
}

// 新增资源库
export function addFiles(data) {
  return request({
    url: '/web/files',
    method: 'post',
    data: data
  })
}

// 修改资源库
export function updateFiles(data) {
  return request({
    url: '/web/files',
    method: 'put',
    data: data
  })
}

// 删除资源库
export function delFiles(id) {
  return request({
    url: '/web/files/' + id,
    method: 'delete'
  })
}
