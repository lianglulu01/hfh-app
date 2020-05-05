<template>
  <div class="special">
    <mt-header fixed title="专题-汉服荟商城">
      <router-link to="/" slot="left">
        <mt-button icon="back">返回</mt-button>
      </router-link>
    </mt-header>
    <MessageList></MessageList>
    <MessageList></MessageList>
    <MessageList></MessageList>
    <MessageList></MessageList>
    <MessageList></MessageList>
    <MessageList></MessageList>
    <MessageList></MessageList>
    <MessageList></MessageList>
    <mt-spinner style="display:block;padding-top:1rem;" type="triple-bounce" color="#ff7ea8" :size="40"></mt-spinner>

  </div>
</template>
<script>
import MessageList from "../components/page/MessageList.vue"
export default {
  components:{
    // 指定标签名称
    MessageList,
  },
}
</script>
<style scoped>
  .special{
    padding:15% 3%;
  }
  .mint-header{
    background: #e8e8e8;
    color: #666;
    height:7%;
  }

</style>