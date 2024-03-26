import request from '@/utils/request'

// 查询自定义属性列表
export function listAttr(query) {
  return request({
    url: '/web/attr/list',
    method: 'get',
    params: query
  })
}

// 查询自定义属性详细
export function getAttr(id) {
  return request({
    url: '/web/attr/' + id,
    method: 'get'
  })
}

// 新增自定义属性
export function addAttr(data) {
  return request({
    url: '/web/attr',
    method: 'post',
    data: data
  })
}

// 修改自定义属性
export function updateAttr(data) {
  return request({
    url: '/web/attr',
    method: 'put',
    data: data
  })
}

// 删除自定义属性
export function delAttr(id) {
  return request({
    url: '/web/attr/' + id,
    method: 'delete'
  })
}
