<template>
  <div class="special">
    <mt-navbar v-model="selected" fixed>
      <mt-tab-item id="1">热门店铺</mt-tab-item>
      <mt-tab-item id="2">最新入驻</mt-tab-item>
    </mt-navbar>
    <!-- tab-container -->
    <mt-tab-container v-model="selected">
      <mt-tab-container-item id="1">
        <!-- <mt-cell v-for="n in 20" :title="'内容 ' + n" :key="n" /> -->
        <StoreList></StoreList>
        <StoreList></StoreList>
        <StoreList></StoreList>
        <StoreList></StoreList>
        <StoreList></StoreList>
      </mt-tab-container-item>
      <mt-tab-container-item id="2">
        <!-- <mt-cell v-for="n in 4" :title="'测试 ' + n" :key="n"/> -->
        <StoreList></StoreList>
        <StoreList></StoreList>
        <StoreList></StoreList>
        <StoreList></StoreList>
        <StoreList></StoreList>
      </mt-tab-container-item>
    </mt-tab-container>
    <mt-spinner style="display:block;padding-top:1rem;" type="triple-bounce" color="#ff7ea8" :size="40"></mt-spinner>

  </div>
</template>
<script>
import StoreList from "../components/shop/StoreList.vue"
export default {
  data(){
    return {
      selected:"1"
    }
  },
  components:{
    // 指定标签名称
    StoreList,
  },
}
</script>
<style scoped>
  .special{
    padding:12% 0;
  }
  .mint-header{
    background: #e8e8e8;
    color: #666;
    height:7%;
  }
  .mint-navbar.is-fixed{
    border-bottom: 3px solid #fbb;
  }
  .mint-navbar .mint-tab-item.is-selected {
    border-bottom: 3px solid #f46;
    color: #f46;
  }
  .mint-navbar .mint-tab-item{
    padding:15px 0
  }
</style>