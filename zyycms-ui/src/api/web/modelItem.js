import request from '@/utils/request'

// 查询自定义模型字段列表
export function listModelItem(query) {
  return request({
    url: '/model/modelItem/list',
    method: 'get',
    params: query
  })
}

// 查询自定义模型字段详细
export function getModelItem(id) {
  return request({
    url: '/model/modelItem/' + id,
    method: 'get'
  })
}

// 新增自定义模型字段
export function addModelItem(data) {
  return request({
    url: '/model/modelItem',
    method: 'post',
    data: data
  })
}

// 修改自定义模型字段
export function updateModelItem(data) {
  return request({
    url: '/model/modelItem',
    method: 'put',
    data: data
  })
}

// 删除自定义模型字段
export function delModelItem(id) {
  return request({
    url: '/model/modelItem/' + id,
    method: 'delete'
  })
}
