<template>
  <div>
    <Selling class="itemstyle"></Selling>
  </div>
</template>
<script>
//1.引入子组建
import Selling from "./Selling.vue"
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
    Selling,
  }
}
</script>
<style scoped>
  .itemstyle{
    width:100%;
    box-sizing: border-box;
    background: white;
    display: flex;
    justify-content: space-around;
  }
</style>