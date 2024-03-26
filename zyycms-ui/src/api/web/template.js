import request from '@/utils/request'

// 查询模板列表
export function listTemplate(query) {
  return request({
    url: '/web/template/list',
    method: 'get',
    params: query
  })
}

// 查询模板详细
export function getTemplate(id) {
  return request({
    url: '/web/template/' + id,
    method: 'get'
  })
}

// 新增模板
export function addTemplate(data) {
  return request({
    url: '/web/template',
    method: 'post',
    data: data
  })
}

// 修改模板
export function updateTemplate(data) {
  return request({
    url: '/web/template',
    method: 'put',
    data: data
  })
}

// 删除模板
export function delTemplate(id) {
  return request({
    url: '/web/template/' + id,
    method: 'delete'
  })
}


// 查询模板列表
export function getTemplateList(data) {
  return request({
    url: '/web/template/fileList',
    method: 'get',
    params: data
  })
}

// 获取模板内容
export function getTemplateInfo(data) {
  return request({
    url: '/web/template/getFile',
    method: 'get',
    params: data
  })
}

// 保存模板内容
export function saveTemplateInfo(data) {
  return request({
    url: '/web/template/updateTemp',
    method: 'post',
    data: data
  })
}

// 新建目录
export function addFile(data) {
  return request({
    url: '/web/template/addFile',
    method: 'post',
    params: data
  })
}

// 上传文件
export function uploadFile(data) {
  return request({
    url: '/web/template/uploadFile',
    method: 'post',
    data: data
  })
}

// 删除文件
export function deleteFile(data) {
  return request({
    url: '/web/template/deleteFile',
    method: 'delete',
    params: data
  })
}

// 查询模板列表(下拉列表)
export function getTempList(name) {
  return request({
    url: '/web/template/getTempList/'+name,
    method: 'get',
  })
}

// 文件重命名
export function renameFile(data) {
  return request({
    url: '/web/template/renameFile',
    method: 'post',
    params: data
  })
}

// 下载文件
export function downloadFile(data) {
  return request({
    url: '/web/template/download',
    method: 'get',
    params: data
  })
}

// 上传文件
export function importTemplate(data) {
  return request({
    url: '/web/template/importTemplate',
    method: 'post',
    data: data
  })
}
