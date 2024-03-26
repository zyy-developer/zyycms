import request from '@/utils/request'

// 查询栏目列表
export function listChannel(query) {
  return request({
    url: '/web/channel/list',
    method: 'get',
    params: query
  })
}

// 查询栏目详细
export function getChannel(channelId) {
  return request({
    url: '/web/channel/' + channelId,
    method: 'get',
  })
}

// 新增栏目
export function addChannel(data) {
  return request({
    url: '/web/channel',
    method: 'post',
    data: data
  })
}

// 修改栏目
export function updateChannel(data) {
  return request({
    url: '/web/channel',
    method: 'put',
    data: data
  })
}

// 删除栏目
export function delChannel(channelId) {
  return request({
    url: '/web/channel/' + channelId,
    method: 'delete'
  })
}


// 获取栏目访问链接
export function getChannelPath(str) {
  return request({
    url: '/web/channel/toChannelPath/'+str,
    method: 'get'
  })
}

// 查询菜单下拉树结构
export function treeselect(data) {
  return request({
    url: '/web/channel/treeselect',
    method: 'get',
    params: data
  })
}


// 判断访问链接是否重复
export function getChannelPathIsNull(str) {
  return request({
    url: '/web/channel/toChannelPathIsNull/'+str,
    method: 'get'
  })
}
