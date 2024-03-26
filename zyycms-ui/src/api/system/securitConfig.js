import request from '@/utils/request'

// 查询安全配置列表
export function listSecuritConfig(query) {
  return request({
    url: '/system/securitConfig/list',
    method: 'get',
    params: query
  })
}

// 查询安全配置详细
export function getSecuritConfig(id) {
  return request({
    url: '/system/securitConfig/' + id,
    method: 'get'
  })
}

// 新增安全配置
export function addSecuritConfig(data) {
  return request({
    url: '/system/securitConfig',
    method: 'post',
    data: data
  })
}

// 修改安全配置
export function updateSecuritConfig(data) {
  return request({
    url: '/system/securitConfig',
    method: 'put',
    data: data
  })
}

// 删除安全配置
export function delSecuritConfig(id) {
  return request({
    url: '/system/securitConfig/' + id,
    method: 'delete'
  })
}

// 修改安全配置
export function updateConfigStage(id) {
  return request({
    url: '/system/securitConfig/updateStage/'+id,
    method: 'put'
  })
}
