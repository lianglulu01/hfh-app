<template>
  <div class="page-tabbar">
    <div class="page-wrap">
      <!-- 消息列表面板 -->
      <mt-tab-container v-model="active">
        <mt-tab-container-item id="page">
          <!-- 调用titlebar子组件 -->
          <titlebar></titlebar>
          <div style="height:5%;padding:2% 2%;background:#fff">
            <mt-swipe :auto="4000" :show-indicators="false">
              <mt-swipe-item>
                <img src="../assets/icon4.jpg" alt="">
                </mt-swipe-item>
              <mt-swipe-item>
                <img src="../assets/icon5.jpg" alt="">
              </mt-swipe-item>
              <mt-swipe-item>
                <img src="../assets/icon6.jpg" alt="">
                </mt-swipe-item>
            </mt-swipe>
          </div>
          <ul class="options">
            <li class="brand" @click="brandList">
              <img src="../assets/shop.png" alt="">
              品牌馆
            </li>
            <li class="second-hand">
              <img src="../assets/fleas.png" alt="">
              二手铺
            </li>
          </ul>
          <div class="zhuti">
            <MessageList></MessageList>
            <MessageList></MessageList>
            <MessageList></MessageList>
            <div class="more"><a @click="special">更多专题 ></a></div>
          </div>
          <div class="selling_product">
            <div class="title">
              <span>本周热卖</span>
            </div>
            <SellingList></SellingList>
          </div>
          <div class="new_product">
            <div class="title">
              <span>精选萌物</span>
            </div>
            <NewList></NewList>
            <mt-spinner style="display:block;padding:1rem 0 12rem;" type="triple-bounce" color="#ff7ea8" :size="40"></mt-spinner>
          </div>
        </mt-tab-container-item>
        <mt-tab-container-item id="category">
          <titlebar></titlebar>
          <ul class="cate">
            <li><img src="../assets/icon_type_qixiong.png" alt=""><span>齐襟</span></li>
            <li><img src="../assets/icon_type_beizi.png" alt=""><span>褙子</span></li>
            <li><img src="../assets/icon_type_jiaoling.png" alt=""><span>交领</span></li>
            <li><img src="../assets/icon_type_duijing.png" alt=""><span>对襟</span></li>
            <li><img src="../assets/icon_type_aoqun.png" alt=""><span>袄裙</span></li>
            <li><img src="../assets/icon_type_zhoubian.png" alt=""><span>配饰周边</span></li>
            <li><img src="../assets/icon_type_hanyuansu.png" alt=""><span>汉元素</span></li>
            <li><img src="../assets/icon_type_more.png" alt=""><span>全部分类</span></li>
          </ul>
        </mt-tab-container-item>
        <mt-tab-container-item id="cart">
          发现
        </mt-tab-container-item>
        <mt-tab-container-item id="me">
          我的
        </mt-tab-container-item>
      </mt-tab-container>
      <!-- 5.底部导航条 -->
      <mt-tabbar v-model="active" fixed>
        <mt-tab-item id="page" @click.native="select(0)">
          <tabbar-icon
            :focus="list[0].isSelect"
            :selectedImg="require('../assets/page_selected.png')"
            :normalImg="require('../assets/page.png')"
          ></tabbar-icon>
          首页
        </mt-tab-item>
        <mt-tab-item id="category" @click.native="select(1)">
          <tabbar-icon
            :focus="list[1].isSelect"
            :selectedImg="require('../assets/class_selected.png')"
            :normalImg="require('../assets/class.png')"
          ></tabbar-icon>
          分类
        </mt-tab-item>
        <mt-tab-item id="cart" @click.native="select(2)">
          <tabbar-icon
            :focus="list[2].isSelect"
            :selectedImg="require('../assets/cart_selected.png')"
            :normalImg="require('../assets/cart.png')"
          ></tabbar-icon>
          购物车
        </mt-tab-item>
        <mt-tab-item id="me" @click.native="select(3)">
          <tabbar-icon
            :focus="list[3].isSelect"
            :selectedImg="require('../assets/user_selected.png')"
            :normalImg="require('../assets/user.png')"
          ></tabbar-icon>
          个人中心
        </mt-tab-item>
      </mt-tabbar>
    </div>
  </div>
</template>
<script>
// 1.引入子组件
import TitleBar from "../components/page/TitleBar" 
import MessageList from "../components/page/MessageList.vue"
import TabbarIcon from "../components/page/TabbarIcon.vue"
import SellingList from "../components/page/SellingList.vue"
import NewList from "../components/page/NewList.vue"

export default {
  data () {
    return {
      active:"page",
      list:[
        {isSelect:true},    //第一个按钮的状态 下标0
        {isSelect:false},   //第二个按钮的状态 下标1
        {isSelect:false},   //第三个按钮的状态 下标2
        {isSelect:false},   //第四个按钮的状态 下标3
      ]
    }
  },
  methods:{
    //完成点击按钮切换图片的功能  idx是按钮下标 0、1、2、3
    select(idx){   
      // 1.创建循环遍历数组list
      for(var i=0;i<this.list.length;i++){
        // 2.判断如果参数下标idx与当前按钮下标相同
        if(i==idx){
          // 3.当前元素选中true
          this.list[i].isSelect=true
        }else{
          // 4.其他元素默认状态false
          this.list[i].isSelect=false;
        }
      }
    },
    brandList(){
      this.$router.replace('/Shop');
    },
    special(){
      this.$router.replace('/Special');
    }
  },
  // 2.注册子组件
  components:{
    // 指定标签名称
    "titlebar":TitleBar,
    MessageList,
    TabbarIcon,
    SellingList,
    NewList,
  },
}
</script>
<style scoped>
/* 最外层父元素 */
  .page-tabbar{
    overflow: hidden;    /*溢出隐藏 */
  }
/* 内层元素 */
  .page-wrap{
    overflow: auto;   /* 数据多出现滚动条 */
  }
  /* 底部导航栏样式重置 */
  .mint-tabbar{
    border-top: 1px solid #f0f0f0;
  }
  .mint-tabbar > .mint-tab-item.is-selected {
    background-color: #fcfcfc;
    color: #ff4466;
  }
  .mint-tabbar > .mint-tab-item{
    background-color: #fcfcfc;
    color: #999;
  }
  .mint-tab-item{
    border-right: 1px solid #f4f4f4;
  }
  /* 轮播图 */
  .mint-swipe-items-wrap img{
    width:100%;
  }
  .mint-swipe-items-wrap{
    padding: 1%;
    height:26vh
  }
  /* 品牌馆/二手馆 */
  .options{
    display: flex;
    justify-content: space-around;
    color:#898989;
    font-size: 15px;
    border-bottom: 1px solid #f4f4f4;
    border-top: 1px solid #f4f4f4;
    background: white;
  }
  .options img{
    width: 15%;
    vertical-align: middle;
    padding-right: 0.4rem;
  }
  .options li{
    float: left;
    width: 50%;
    height: 6vh;
    line-height: 6vh;
    margin: 2vh 0;
  }
  .options li:first-child{
    border-right:1px solid #f4f4f4;
  }
  /* 主题块 */
  .zhuti{
    padding: 3%;
    background: white;
  }
  
  .more{
    background: white;
    padding: 0.5rem 0 0.6rem;
  }
  .more a{
    display: inline-block;
    padding: 0.4rem 1.4rem;
    margin: 0 auto;
    color: #ff4466;
    font-size: 100%;
    border: 1px solid #ff4466;
    border-radius: 0.2rem;
  }
  /* 热卖商品、精选商品 */
  .selling_product{
    margin-top: 0.8rem;
    padding:0.8rem 0.8rem 0;
    background: white;
    margin-bottom: 0.8rem;
  }
  .title{height:2rem}
  .selling_product .title span::before{
    background: url(../assets/left_line.png) no-repeat;
  }
  .selling_product .title span::after{
    background: url(../assets/right_line.png) no-repeat;
  }
  .title{height:2rem}
  .new_product .title span::before{
    background: url(../assets/left_side.png) no-repeat;
    background-size: 3rem;
  }
  .new_product .title span::after{
    background: url(../assets/right_side.png) no-repeat;
  }
  .selling_product .title span::before,.new_product .title span::before{
    content: '';
    width: 36vw;
    height: 24px;
    margin-right: 15px;
    display: inline-block;
    vertical-align: text-bottom;
    background-size: contain;
    background-position: right center;
  }
  .selling_product .title span::after,.new_product .title span::after{
    content: '';
    width: 34vw;
    height: 22px;
    margin-left: 15px;
    display: inline-block;
    vertical-align: text-bottom;
    background-size: contain;
    background-position: left center;
  }


  /* 分类页 */
  .cate{
    display: flex;
    flex-wrap: wrap;
    background: white;
    padding-bottom:1rem;
  }
  .cate li{
    display: flex;
    flex-direction: column;
    width:25%;
    align-items: center;
    margin-top: 1rem;
  }
  .cate img{
    width:8.7vh;
  }
  .cate span{
    margin-top: 0.3rem;
    color:#898989;
    font-size: 13px;
  }
</style>