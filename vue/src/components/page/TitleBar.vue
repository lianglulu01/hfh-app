<template>
  <div>
    <div class="page-head">
      <input type="text" placeholder="搜索萌物、商家"  v-model="keywords" @click="search"/>
    </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      keywords:"",
      title:{default:""},
      value:{default:""},
    }
  },
  props:{   //声明接收父组件变量
    result:[]
  },
  components:{
    
  },
  methods:{
    search(){
      this.$router.replace('/Search');
    }
  }
}
</script>
<style scoped>
  /* 1.外层父元素 */
  .page-head{
    width:100%;
    /* height:60px; */
    background-color: #f4f4f4;
    box-sizing: border-box;
    padding:0.6rem 0.6rem 0.48rem;
    color:#898989;
    
  }
  .page-head input{
    width:96%;
    height:2rem;
    font-size: 1rem;
    padding:1%;
    border:0;
    outline: none;
    border-radius: 3%;
    background-color: white;
  }
  .page-head input::placeholder{
    color:#bcbcbc;
    font-size: 1rem;
    background: url(../../assets/search.png) no-repeat 25% 60%;
    background-size: 1.1rem;
    text-align: center;
    margin-right: 15px;
    display: inline-block
  }
  .page-head input:focus{
    text-align: start;
    background-color: white;
  }
  .page-head input:focus::placeholder{
    text-align: start;
    background-size:0;
  }
  /* .mint-button{
    width:15%;
    height:2.2rem;
    font-size: 14px;
    border-radius: 3%;
  } */
</style>