import request from '@/utils/request'

// 查询模型列表
export function listModel(query) {
  return request({
    url: '/web/model/list',
    method: 'get',
    params: query
  })
}

// 查询模型详细
export function getModel(modelId) {
  return request({
    url: '/web/model/' + modelId,
    method: 'get'
  })
}

// 新增模型
export function addModel(data) {
  return request({
    url: '/web/model',
    method: 'post',
    data: data
  })
}

// 修改模型
export function updateModel(data) {
  return request({
    url: '/web/model',
    method: 'put',
    data: data
  })
}

// 删除模型
export function delModel(modelId) {
  return request({
    url: '/web/model/' + modelId,
    method: 'delete'
  })
}

// 获取模型名称
export function selectModels(modelId) {
  return request({
    url: '/web/model/getModels/' + modelId,
    method: 'get'
  })
}
