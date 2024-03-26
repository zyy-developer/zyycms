import request from '@/utils/request'

// 查询友情链接分类列表
export function listSort(query) {
  return request({
    url: '/web/sort/list',
    method: 'get',
    params: query
  })
}

// 查询友情链接分类详细
export function getSort(id) {
  return request({
    url: '/web/sort/' + id,
    method: 'get'
  })
}

// 新增友情链接分类
export function addSort(data) {
  return request({
    url: '/web/sort',
    method: 'post',
    data: data
  })
}

// 修改友情链接分类
export function updateSort(data) {
  return request({
    url: '/web/sort',
    method: 'put',
    data: data
  })
}

// 删除友情链接分类
export function delSort(id) {
  return request({
    url: '/web/sort/' + id,
    method: 'delete'
  })
}
