<template>
  <div class="special">
    <titlebar></titlebar>
    <div class="shop_head">
      <div class="shop_bg">
        <div class="bg_box"></div>
      </div>
      <div class="shop_head_info">
        <img src="../assets/store/md/youyouluming_200x200.jpg" alt="">
        <p>呦呦鹿鸣</p>
        <p>江苏 徐州&nbsp;·&nbsp;27792人已关注</p>
      </div>
    </div>
    <div class="head_btn">
      <mt-button size="small" class="select">
        <img src="../assets/store/icon_shop_follow.png" style="height:1rem;width:1rem"  slot="icon">
        关注店铺
      </mt-button>
      <mt-button size="small" class="chat">
        <img src="../assets/store/icon_shop_im.png" height="16" width="16" slot="icon">
        私敲客服
      </mt-button> 
    </div>
    <ul class="shop_menu">
      <li>
        <img src="../assets/store/icon_shop_product.png"  slot="icon">
        全部商品
      </li>
      <li>
        <img src="../assets/store/icon_shop_new.png" slot="icon">
        新品上架
      </li>
      <li>
        <img src="../assets/store/icon_shop_type.png" slot="icon">
        商品分类
      </li>
    </ul>
    <div class="shop_product_all">
      <div class="title">全部商品</div>
      <div class="tools">
        <ProSearch></ProSearch>
      </div>
      <div class="product_list"></div>
    </div>
    <mt-spinner style="display:block;padding-top:1rem;" type="triple-bounce" color="#ff7ea8" :size="40"></mt-spinner>
  </div>
</template>
<script>
import StoreList from "../components/shop/StoreList.vue"
import TitleBar from "../components/page/TitleBar.vue" 
import ProSearch from "../components/search/ProSearch.vue"


export default {
  data(){
    return {
      
    }
  },
  components:{
    // 指定标签名称
    StoreList,
    "titlebar":TitleBar,
    ProSearch,
  },
}
</script>
<style scoped>
  .special{
    position: relative;
  }
  .shop_head{
    width:100%;
    height:30vh;
    position: relative;
    background: white;
  }
  .shop_bg{
    background: url(../assets/store/store.jpg) no-repeat 50% 50%;
    width: 100%;
    height: 100%;
    background-repeat: no-repeat;
    opacity: 0.2;
    background-position: center;
    background-size: cover;
  }
  .bg_box{
    width:100%;
    height:55px;
    position: absolute;
    bottom:0px;
    z-index: 0;
    background-image:linear-gradient(to bottom, rgba(255,255,255,0) 0%, rgba(255,255,255,0.3) 20%, rgba(255,255,255,0.5) 40%, rgba(255,255,255,0.8) 60%, rgba(255,255,255,1) 100%);
  }
  
  .shop_head_info{
    width:100%;
    position: absolute;
    top:20%;
  }
  .shop_head_info img{
    width:12vh;
    border-radius:3px;
  }
  .shop_head p:nth-child(2){
    color:#555;
    font: 2.8vh bolder;
    margin:0.2rem 0;
  }
  .shop_head p:nth-child(3){
    color:#999;
    font: 100% bolder;
  }
  .head_btn{
    background: white;
    height:8vh;
  }
  .head_btn .mint-button--default{
    font-size: 1.8vh;
    height:4.8vh;
    width:28%;
    border-radius: 2px;
  }
  .select{
    background: #ececec;
    color:#f46;
    margin-right: 5%
  }
  .chat{
    background: #f46;
    color:white;
  }
  .shop_menu{
    font-size:1.9vh;
    height:2rem;
    line-height: 2rem;
    background: white;
    display: flex;
    justify-content: space-around
  }
  .shop_menu li{
    display: inline-block;
    width:28%;
    color:#555;
    background: white;
  }
  .shop_menu img{
    vertical-align: text-top;
    height:2.5vh;width:2.5vh;
  }
  .title{
    background: white;
    margin-top: 2vh;
    padding:2vh 0;
    color:#f46;
    font-size: 2vh;
    text-align: center;
  }
  .title::before{
    content: '';
    width: 20vw;
    height: 16px;
    margin-right: 15px;
    display: inline-block;
    vertical-align: middle;
    background: url(../assets/left.png) no-repeat;
    background-size: contain;
    background-position: right center;
  }
  .title::after{
    content: '';
    width: 20vw;
    height: 16px;
    margin-left: 15px;
    display: inline-block;
    vertical-align: middle;
    background: url(../assets/right.png) no-repeat;
    background-size: contain;
    background-position: left center;
  }
  
</style>