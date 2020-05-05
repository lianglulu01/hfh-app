<template>
  <!-- 显示一个商品 -->
  <div class="rootstyle">
    <!-- 商品图片标题价格 -->
    <div class="itp" @click="product">
      <img src="../../assets/product/md/ea5ad5f5bfbc410bacf7968963bffbbc.jpg_300x300.jpg" class="imgstyle" alt="">
      <p class="title">【月魄】【正版】纨素执素汉服原创烫银钉珠亮丝渐变间色齐胸齐腰</p>
      <p class="price">¥119</p>
    </div>
    <div class="itp">
      <img src="../../assets/product/md/ea5ad5f5bfbc410bacf7968963bffbbc.jpg_300x300.jpg" class="imgstyle" alt="">
      <p class="title">【月魄】【正版】纨素执素汉服原创烫银钉珠亮丝渐变间色齐胸齐腰</p>
      <p class="price">¥119</p>
    </div>
    <div class="itp">
      <img src="../../assets/product/md/ea5ad5f5bfbc410bacf7968963bffbbc.jpg_300x300.jpg" class="imgstyle" alt="">
      <p class="title">【月魄】【正版】纨素执素汉服原创烫银钉珠亮丝渐变间色齐胸齐腰</p>
      <p class="price">¥119</p>
    </div>
    <div class="itp">
      <img src="../../assets/product/md/44029702d34c4427b4d9bdc35b944325.jpg_300x300.jpg" class="imgstyle" alt="">
      <p class="title">【呦呦鹿鸣】(白鹿青崖)原创汉服设计 重工刺绣 齐胸襦裙 春秋</p>
      <p class="price">¥168</p>
    </div>
    <div class="itp">
      <img src="../../assets/product/md/44029702d34c4427b4d9bdc35b944325.jpg_300x300.jpg" class="imgstyle" alt="">
      <p class="title">【呦呦鹿鸣】(白鹿青崖)原创汉服设计 重工刺绣 齐胸襦裙 春秋</p>
      <p class="price">¥168</p>
    </div>
    <div class="itp">
      <img src="../../assets/product/md/44029702d34c4427b4d9bdc35b944325.jpg_300x300.jpg" class="imgstyle" alt="">
      <p class="title">【呦呦鹿鸣】(白鹿青崖)原创汉服设计 重工刺绣 齐胸襦裙 春秋</p>
      <p class="price">¥168</p>
    </div>
    <div class="itp">
      <img src="../../assets/product/md/1e4524a9721e452e83660a24f22b101b.jpg_300x300.jpg" class="imgstyle" alt="">
      <p class="title">呦呦鹿鸣 清风 原创设计传统汉服男女款汉服三件套春秋清雅三米摆</p>
      <p class="price">¥139</p>
    </div>
    <div class="itp">
      <img src="../../assets/product/md/1e4524a9721e452e83660a24f22b101b.jpg_300x300.jpg" class="imgstyle" alt="">
      <p class="title">呦呦鹿鸣 清风 原创设计传统汉服男女款汉服三件套春秋清雅三米摆</p>
      <p class="price">¥139</p>
    </div>
    <div class="itp">
      <img src="../../assets/product/md/1e4524a9721e452e83660a24f22b101b.jpg_300x300.jpg" class="imgstyle" alt="">
      <p class="title">呦呦鹿鸣 清风 原创设计传统汉服男女款汉服三件套春秋清雅三米摆</p>
      <p class="price">¥139</p>
    </div>
  </div>
</template>
<script>
// 接收父组件传递来的数据

export default {
  props:{     //声明接收父组件传递数据
    // imgurl:{default:""},  //左侧图片默认值
    // title:{default:""},   //左侧标题
    // subtitle:{default:""},   //左侧子标题
    // sendtime:{default:""},   //发送时间
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
    flex-wrap: wrap
  }
  /* 上侧图片父组件样式 */
  .itp{
    width:32.3%;
    display: flex;
    flex-direction: column;
    
  }
  /* 图片的宽高 */
  .itp img{
    width:100%;
  }
  .itp p:nth-child(2){
    font-size: 12px;
    text-overflow: ellipsis;
    height:1rem;
    overflow: hidden;
    white-space: nowrap;
    margin:0.3rem 0; 
  }
  .itp p:nth-child(3){
    color:#f46;
    text-align: left;
    font-weight: 900;
    padding-bottom: 0.6rem
  }
</style>