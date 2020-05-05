<template>
  <!-- 显示一条消息 -->
  <div class="rootstyle">
    <!-- 上侧图片 -->
    <div class="topimg">
      <img src="../../assets/icon7.jpg" class="imgstyle" alt="">
    </div>
    <!-- 下侧图片和价格 -->
    <ul class="bottom">
      <li class="bottomip" @click="product">
        <img class="bottomimg" src="../../assets/icon1-1.jpg" alt="">
        <span class="bottomprice">¥190</span>
      </li>
      <li class="bottomip">
        <img class="bottomimg" src="../../assets/icon1-2.jpg" alt="">
        <span class="bottomprice">¥190</span>
      </li>
      <li class="bottomip">
        <img class="bottomimg" src="../../assets/icon1-3.jpg" alt="">
        <span class="bottomprice">¥190</span>
      </li>
      <li class="bottomip">
        <img class="bottomimg" src="../../assets/icon1-4.jpg" alt="">
        <span class="bottomprice">¥190</span>
      </li>
      <li class="bottomip">
        <img class="bottomimg" src="../../assets/icon1-5.jpg" alt="">
        <span class="bottomprice">¥190</span>
      </li>
      <li class="bottomip">
        <img class="bottomimg" src="../../assets/icon1-1.jpg" alt="">
        <span class="bottomprice">¥190</span>
      </li>
      <li class="bottomip">
        <img class="bottomimg" src="../../assets/icon1-2.jpg" alt="">
        <span class="bottomprice">¥190</span>
      </li>
      <li class="bottomip">
        <img class="bottomimg" src="../../assets/icon1-3.jpg" alt="">
        <span class="bottomprice">¥190</span>
      </li>
      <li class="bottomip">
        <img class="bottomimg" src="../../assets/icon1-4.jpg" alt="">
        <span class="bottomprice">¥190</span>
      </li>
      <li class="bottomip">
        <img class="bottomimg" src="../../assets/icon1-5.jpg" alt="">
        <span class="bottomprice">¥190</span>
      </li>
    </ul>
  </div>
</template>
<script>
// 接收父组件传递来的数据

export default {
  props:{     //声明接收父组件传递数据
    imgurl:{default:""},  //左侧图片默认值
    title:{default:""},   //左侧标题
    subtitle:{default:""},   //左侧子标题
    sendtime:{default:""},   //发送时间
  },
  methods:{
    product(){
      this.$router.replace('/product')
    }
  }
}
</script>
<style scoped>
  /* 一条消息的父元素 */
  .rootstyle{
    display: flex;
    flex-direction: column;
  }
  /* 上侧图片父组件样式 */
  .topimg{
    width:100%;
  }
  /* 上侧图片的宽高 */
  .imgstyle{
    width:100%;
  }
  /* 下侧内容父组件样式 */
  .bottom{
    display: flex;
    overflow-y: auto;
    height:100%;
  }
  /* 下侧图片价格父元素 */
  .bottomip{
    margin: 0.1rem 0.45rem 0.2rem 0;
    
    display: flex;
    flex-direction: column
  }
  /* 下侧图片样式 */
  .bottomimg{
    width:14vh;
    border-radius: 0.3rem;
  }
  /* 下侧文本样式 */
  .bottomprice{
    color:#ff4466;
    font-size: 0.8rem;
    font-weight: 900;
    padding-bottom: 0.5rem;
  }
</style>