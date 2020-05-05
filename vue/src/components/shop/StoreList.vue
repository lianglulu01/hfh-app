<template>
  <div>
    <Store class="itemstyle"></Store>
  </div>
</template>
<script>
//1.引入子组建
import Store from "./Store.vue"
//1.1引入json文件
// import messagejson from "../json/messagelist.json"  //给messagelist.json 起名messagejson
export default {
  data(){
    return{
      // rows:messagejson.data   //给messagejson消息列表(.data)赋值给变量rows
    }
  },
  created(){
    // console.log(this.rows)
  },
  // 2.注册子组建
  components:{
    Store,
  }
}
</script>
<style scoped>
  .itemstyle{
    width:94%;
    padding: 1.75vh;
    background: white;
    margin-top: 0.8rem
  }
  
  
</style>