<template>
  <div>
    <mt-navbar v-model="selected">
      <mt-tab-item id="1">综合</mt-tab-item>
      <mt-tab-item id="2">最新</mt-tab-item>
      <mt-tab-item id="3">价格↑</mt-tab-item>
      <mt-tab-item id="4">价格↓</mt-tab-item>
    </mt-navbar>
    <!-- tab-container -->
    <mt-tab-container v-model="selected">
      <mt-tab-container-item id="1">
        <NewList></NewList>
        <!-- <mt-cell v-for="n in 10" :title="'内容 ' + n" :key="n"/> -->
      </mt-tab-container-item>
      <mt-tab-container-item id="2">
        <NewList></NewList>
      </mt-tab-container-item>
      <mt-tab-container-item id="3">
        <NewList></NewList>
      </mt-tab-container-item>
      <mt-tab-container-item id="4">
        <NewList></NewList>
      </mt-tab-container-item>
    </mt-tab-container>
  </div>
</template>
<script>
import NewList from "../page/NewList.vue"
export default {
  data(){
    return{
      selected:"1"
    }
  },
  components:{
    // 指定标签名称
     NewList,
  },
}
</script>
<style scoped>
.mint-navbar .mint-tab-item {
    padding:10px 0;
    font-size: 3vh;
  }
.mint-navbar .mint-tab-item.is-selected {
  border-bottom: 3px solid #f46;
  color: #f46;
}
</style>