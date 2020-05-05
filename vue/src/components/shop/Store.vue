<template>
  <!-- 显示一个商家 -->
  <div class="store">
    <div class="head" @click="shopPage">
      <!-- 左侧图片、标题以及内容 -->
      <div class="leftimgtext">
        <img src="../../assets/store/sm/youyouluming_100x100.jpg" class="imgstyle" alt="">
        <div class="lefttitle text">
          <p class="title text">呦呦鹿鸣</p>
          <p class="subtitle text">商品 13&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;粉丝 27792</p>
        </div>
      </div>
      <!-- 显示发送消息的时间 -->
      <p class="add_focus"><span class="is_focus"> 关注</span></p>
    </div>
    <div class="prolist">
      <div class="item">
        <img src="../../assets/product/md/1e4524a9721e452e83660a24f22b101b.jpg_300x300.jpg" alt="">
        <p class="title text2">呦呦鹿鸣 清风 原创设计传统汉服男女款汉服三件套春秋清雅三米摆</p>
        <p class="price">¥139.00</p>
      </div>
      <div class="item">
        <img src="../../assets/product/md/1e4524a9721e452e83660a24f22b101b.jpg_300x300.jpg" alt="">
        <p class="title text2">呦呦鹿鸣 清风 原创设计传统汉服男女款汉服三件套春秋清雅三米摆</p>
        <p class="price">¥139.00</p>
      </div>
      <div class="item">
        <img src="../../assets/product/md/1e4524a9721e452e83660a24f22b101b.jpg_300x300.jpg" alt="">
        <p class="title text2">呦呦鹿鸣 清风 原创设计传统汉服男女款汉服三件套春秋清雅三米摆</p>
        <p class="price">¥139.00</p>
      </div>
    </div>
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
    shopPage(){
      this.$router.replace('/ShopPage');
    }
  }
}
</script>
<style scoped>
  /* 一条消息的父元素 */
  .head{
    display: flex;
    justify-content: space-between;
    align-items: center
  }
  /* 左侧图片与标题的父组件样式 */
  .leftimgtext{
    display: flex;
    width:80%;
  }
  /* 图片的宽高 */
  .imgstyle{
    width:6.4vh;
    height:6.4vh;
    margin-right: 7px;
    border:1px solid #ccc
  }
  /* 左侧标题与子标题父元素 */
  .lefttitle{
    display: flex;
    flex-direction: column;
    text-align: left;
  }
  .text{
    white-space: nowrap;
    text-overflow: ellipsis;
    overflow: hidden;
  }
  /* 左侧标题 */
  .title{
    color:#000;
    font-size: 2.3vh;
  }
  /* 左侧子标题 */
  .subtitle{
    color:gray;
    margin-top: 0.9vh;
    font-size: 0.8rem;
    text-overflow: ellipsis;
    flex-wrap: nowrap
  }
  /* 右侧关注 */
  .add_focus{
    color:#f46;
    font-size:4vh;
    font-weight: 500;
    text-align: center;
  }
  .is_focus{
    color:gray;
    font-size: 2.3vh;
    color:#f46;
    font-weight: 500;
    display: inline-block;
    position: relative
  }
  .is_focus::before{
    display: inline-block;
    content: "";
    position: absolute;
    right:5vh;
    width:20px;
    height:20px;
    background: url(../../assets/store/add.png) no-repeat;
    background-size: 3vh;
  }
  .prolist{
    display: flex;
    justify-content: space-between;
    margin-top: 1vh
  }
  .item{
    width:32.2%;
  }
  .item img{
    width:100%;
  }
  .text2{
    white-space: nowrap;
    overflow: hidden;
  }
  .item .title{
    color:#898989;
    font-size: 0.8rem;
    font-weight: 500;
  }
  .item .price{
    color: #f46;
    font-size: 2.6vh;
    font-weight: 700;
    text-align: left;
    margin-top: 0.8vh
  }
</style>