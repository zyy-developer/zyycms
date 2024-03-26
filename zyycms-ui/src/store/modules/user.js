import { login, logout, getInfo ,getPublicKey } from '@/api/login'
import { getToken, setToken, removeToken } from '@/utils/auth'
import {encrypt} from "@/utils/jsencrypt";
import Cookies from "js-cookie";

const user = {
  state: {
    token: getToken(),
    name: '',
    avatar: '',
    roles: [],
    permissions: []
  },

  mutations: {
    SET_TOKEN: (state, token) => {
      state.token = token
    },
    SET_NAME: (state, name) => {
      state.name = name
    },
    SET_AVATAR: (state, avatar) => {
      state.avatar = avatar
    },
    SET_ROLES: (state, roles) => {
      state.roles = roles
    },
    SET_PERMISSIONS: (state, permissions) => {
      state.permissions = permissions
    }
  },

  actions: {
    getPublicKey() {
      return new Promise((resolve, reject) => {
        getPublicKey()
          .then(res => {
            resolve(res)
          })
          .catch(error => {
            reject(error)
          })
      })
    },
    // 登录
    Login({ commit }, userInfo) {
      return new Promise((resolve, reject) => {

        getPublicKey().then(res => {
          let publicKey = res.publicKey
          //调用加密方法(传密码和公钥)
          const password = encrypt(userInfo.password, publicKey)
          const username = userInfo.username.trim()
          // const password = userInfo.password
          const code = userInfo.code
          const uuid = userInfo.uuid
          login(username, password, code, uuid).then(res => {
            let siteList = res.siteList;
            Cookies.set("siteList", JSON.stringify(siteList));
            Cookies.set("siteId", res.siteId)
            setToken(res.token)
            commit('SET_TOKEN', res.token)
            resolve()
          }).catch(error => {
            reject(error)
          })
        })
      })
    },

    // 获取用户信息
    GetInfo({ commit, state }) {
      return new Promise((resolve, reject) => {
        getInfo().then(res => {
          const user = res.user
          const avatar = (user.avatar == "" || user.avatar == null) ? require("@/assets/images/profile.jpg") : process.env.VUE_APP_BASE_API + user.avatar;
          if (res.roles && res.roles.length > 0) { // 验证返回的roles是否是一个非空数组
            commit('SET_ROLES', res.roles)
            commit('SET_PERMISSIONS', res.permissions)
          } else {
            commit('SET_ROLES', ['ROLE_DEFAULT'])
          }
          commit('SET_NAME', user.userName)
          commit('SET_AVATAR', avatar)
          resolve(res)
        }).catch(error => {
          reject(error)
        })
      })
    },

    // 退出系统
    LogOut({ commit, state }) {
      return new Promise((resolve, reject) => {
        logout(state.token).then(() => {
          commit('SET_TOKEN', '')
          commit('SET_ROLES', [])
          commit('SET_PERMISSIONS', [])
          removeToken()
          resolve()
        }).catch(error => {
          reject(error)
        })
      })
    },

    // 前端 登出
    FedLogOut({ commit }) {
      return new Promise(resolve => {
        commit('SET_TOKEN', '')
        removeToken()
        resolve()
      })
    }
  }
}

export default user
