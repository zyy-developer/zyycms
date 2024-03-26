import request from '@/utils/request'

// 查询捐赠记录列表
export function listDonate(query) {
  return request({
    url: '/web/donate/list',
    method: 'get',
    params: query
  })
}

// 查询捐赠记录详细
export function getDonate(id) {
  return request({
    url: '/web/donate/' + id,
    method: 'get'
  })
}

// 新增捐赠记录
export function addDonate(data) {
  return request({
    url: '/web/donate',
    method: 'post',
    data: data
  })
}

// 修改捐赠记录
export function updateDonate(data) {
  return request({
    url: '/web/donate',
    method: 'put',
    data: data
  })
}

// 删除捐赠记录
export function delDonate(id) {
  return request({
    url: '/web/donate/' + id,
    method: 'delete'
  })
}
