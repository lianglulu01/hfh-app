import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  //共享的数据源------仓库
  state: {
    count: [],
    phone:''
  },
  //负责修改state中的数据，不能发异步请求----搬运工
  mutations: {
    //state就代表当前Vuex的数据源,自动注入
    add(state) {
      state.count.push(Math.random());
    },
    changeUsername(state,value) {
      state.phone = value;
    }
  },
  //专门负责发送异步请求----送货工
  actions: {
    increment (context) {
      context.commit('add');
    },
    //context称为上下文，指现在的mutations对象
    change(context, value) {
      //commit提交
      context.commit('changeUsername', value);
    }
  },
  modules: {
  }
})
