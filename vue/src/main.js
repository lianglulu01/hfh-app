import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'

// 1.引入mint-ui所有组件
import MintUI from "mint-ui"
// 2.单独引入mint-ui样式文件
import "mint-ui/lib/style.css"
// 3.将mint-ui对象注册Vue实例
Vue.use(MintUI)

// 引入iconfont样式文件
// import "./font/iconfont.css"

// 1.引入axios库
import axios from "axios"
// 2.配置访问服务器基础路径
axios.defaults.baseURL="http://127.0.0.1:4000/"
// 3.配置保存session数据
axios.defaults.withCredentials=true
// 4.注册
Vue.prototype.axios=axios

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
