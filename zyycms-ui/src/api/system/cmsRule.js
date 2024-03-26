import request from '@/utils/request'

// 查询cms角色权限列表
export function listCms(query) {
  return request({
    url: '/system/cms/list',
    method: 'get',
    params: query
  })
}

// 查询cms角色权限详细
export function getCms(roleId) {
  return request({
    url: '/system/cms/' + roleId,
    method: 'get'
  })
}

// 新增cms角色权限
export function addCms(data) {
  return request({
    url: '/system/cms',
    method: 'post',
    data: data
  })
}

// 修改cms角色权限
export function updateCms(data) {
  return request({
    url: '/system/cms',
    method: 'put',
    data: data
  })
}

// 删除cms角色权限
export function delCms(roleId) {
  return request({
    url: '/system/cms/' + roleId,
    method: 'delete'
  })
}

// 结构树
export function getTreeSelect(query) {
  return request({
    url: '/system/cms/treeselect',
    method: 'get',
    params:query
  })
}

// 获取栏目树列表
export function getCheckedKeys(roleId) {
  return request({
    url: '/system/cms/getCheckedKeys/'+roleId,
    method: 'get'
  })
}

// 通过角色id获取站点列表
export function getSiteByRole(roleId) {
  return request({
    url: '/system/cms/getSiteList/'+roleId,
    method: 'get'
  })
}
