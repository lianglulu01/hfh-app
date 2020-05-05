import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {path: '/',name: 'Page',component: () => import('../views/Page.vue')},
  {path: '/Login',name: 'Login',component: () => import('../views/Login.vue')},
  {path: '/Type',name: 'Type',component: () => import('../views/Type.vue')},
  {path: '/Special',name: 'Special',component: () => import('../views/Special.vue')},
  {path: '/Shop',name: 'Shop',component: () => import('../views/Shop')},
  {path: '/ShopPage',name: 'ShopPage',component: () => import('../views/ShopPage.vue')},
  {path: '/Store',name: 'Store',component: () => import('../components/shop/Store.vue')},
  {path: '/Product',name: 'Product',component: () => import('../views/Product.vue')},
  {path: '/Search',name: 'Search',component: () => import('../views/Search.vue')},
]

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes
})

export default router
