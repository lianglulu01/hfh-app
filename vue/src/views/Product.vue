<template>
<div class="main">
  <mt-header title="商品详情" fixed>
    <router-link to="/" slot="left">
      <mt-button icon="back">返回</mt-button>
    </router-link>
    <mt-button slot="right">分享</mt-button>
  </mt-header>
  <div class="product_info_head">
    <div class="top_slide">
      <mt-swipe :auto="0" :show-indicators="false">
        <mt-swipe-item>
          <img src="../assets/product/lg/e14aedf8566f4e3189c0ddecbbd90ab2.png_700x700.jpg" alt="" data-index="1" style="width:375px">
        </mt-swipe-item>
        <mt-swipe-item>
          <img src="../assets/product/lg/646938ddaceb4d26ae54d5dc383f134c.png_700x700.jpg" alt="" data-index="2" style="width:375px">
        </mt-swipe-item>
        <mt-swipe-item>
          <img src="../assets/product/lg/80fcbe156a1b4d258e31cb173d3d262a.png_700x700.jpg" alt="" data-index="3" style="width:375px">
        </mt-swipe-item>
        <mt-swipe-item>
          <img src="../assets/product/lg/26a5a216073b4f1a9a5e71ad596a53a6.png_700x700.jpg" alt="" data-index="4" style="width:375px">
        </mt-swipe-item>
        <mt-swipe-item>
          <img src="../assets/product/lg/77e6ab61233b4732966686510d028242.jpg_700x700.jpg" alt="" data-index="5" style="width:375px">
        </mt-swipe-item>
      </mt-swipe>
      <!-- <ul style="width: 3000px;height: 375px;transition: transform 1s ease 0s;transform: translate3d(-375px, 0px, 0px);backface-visibility: hidden;">
        <li style="width:375px;height:375px;">
        </li>
        <li style="width:375px;height:375px;">
        </li>
        <li style="width:375px;height:375px;">
        </li>
        <li style="width:375px;height:375px;">
        </li>
        <li style="width:375px;height:375px;">
        </li>
        
      </ul> -->
      <div class="pic">图片</div>
    </div>
    <div class="info">
        <p class="info_name">司南阁原创[花凰]汉服女绣花对襟衫裙直领衫齐腰大袖抹胸批帛订金</p>
        <p class="price" style="font-weight: 500;">¥ 200.00</p>
        <ul class="info_sum">
          <li class="one">邮费:<span></span>¥8.00</li>
          <li class="two">库存:<span>2078</span></li>
          <li class="three"><span>242</span>人已种草</li>
        </ul>
        <ul class="product_server">
          <li class="shopday"><span>60天內发货</span></li>
          <li class="real"><span>正品保证</span></li>
          <li class="gray"><span>不支持七天无理由退货</span></li>
        </ul>
      </div>
  </div>
  <div class="product_pay">
    支付
    <ul>
      <li>微信支付</li>
      <li>支付宝</li>
      <li>花呗</li>
    </ul>
  </div>
</div>

</template>

<script>

export default {
  data() {
    return {
      
    };
  },
  components: {
      
  },
  methods: {
  },
};
</script>

<style>
.mint-header {
  background-color: #eee;
  color:#f46;
  font-size:2vh;
}
.mint-header.is-fixed{
  height:8vh;
}
.product_info_head{
  width:100%;
  margin-top:8vh;
}
.top_slide{
  position: relative;
  width:100%;height:375px;
}
.pic{
  position: absolute;
  top:92%;left:46%;
  width:6.6vh;height:3.4vh;
  font-size: 12px;
  color:#fff;
  line-height: 3.4vh;
  background: rgba(255,100,150,.8);
  border-radius: 10px;
  z-index: 10;
}
.info{
  padding: 1.8vh;
  text-align: left;
  background: #fff;
}
.info p:nth-child(1){
  color:#555;
  font-size: 2.2vh;
}
.info p:nth-child(2){
  color:#f46;
  font-size: 3vh;
  margin-top:0.7vh;
}
.info ul:nth-child(3){
  display: flex;
  justify-content: space-between;
  color:#aaa;
  font-size: 1.9vh;
  padding:1.4vh 0;
  border-bottom:1px solid #eee
}
.info ul:nth-child(4){
  color:#555;
  font-size: 2vh;
  margin-top:1.5vh;
}
.info ul:nth-child(4) li:nth-child(1){
  float: left;
  
}
.info ul:nth-child(4) li:nth-child(3){
  color:#999;
  margin-top:0.9vh
}
.product_pay{
  margin:0.8rem 0;
  padding:0 0.8rem;
  height:3rem;
  line-height: 3rem;
  background: #fff;
  color:#555;
  font-size: 2vh;
  text-align: left;
}
.product_pay ul{
  float: right;
}
.product_pay ul li{
  float: right;
  margin-left: 1rem;
}
</style>