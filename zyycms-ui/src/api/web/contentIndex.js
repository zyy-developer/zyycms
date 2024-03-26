import request from '@/utils/request'

// 生成全站索引
export function createContentIndex() {
  return request({
    url: '/search/createIndex',
    method: 'post',
  })
}
