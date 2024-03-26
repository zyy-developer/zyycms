import request from '@/utils/request'

// 查询消息通知模板列表
export function listMessageTemplate(query) {
  return request({
    url: '/web/messageTemplate/list',
    method: 'get',
    params: query
  })
}

// 查询消息通知模板详细
export function getMessageTemplate(id) {
  return request({
    url: '/web/messageTemplate/' + id,
    method: 'get'
  })
}

// 新增消息通知模板
export function addMessageTemplate(data) {
  return request({
    url: '/web/messageTemplate',
    method: 'post',
    data: data
  })
}

// 修改消息通知模板
export function updateMessageTemplate(data) {
  return request({
    url: '/web/messageTemplate',
    method: 'put',
    data: data
  })
}

// 删除消息通知模板
export function delMessageTemplate(id) {
  return request({
    url: '/web/messageTemplate/' + id,
    method: 'delete'
  })
}
