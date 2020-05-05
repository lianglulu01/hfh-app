<template>
<div class="main">
    <!-- 头部logo -->
    <div class="head">
        <img src="../assets/logo_white.png" style="width: 40%;">
    </div>
    <div class="logGet">
        <!-- 输入框 -->
        <div class="lgA" > 
            <div class="DetailsTags">
                <mt-cell title="国家/地区" is-link>
                    <span>中国大陆</span>
                </mt-cell>
            </div >
            <Popup ref="CustomPopupRef">
                <div slot="PoperContent" class="PoperContentView">
                    <mt-picker :slots="slots" @change="onValuesChange"></mt-picker> 
                </div>
            </Popup>
        </div>
        <div class="lgD">
            <input placeholder="填写手机号" maxlength="11" type="tel" v-model="phone">
        </div>
        <div class="lgD" v-if="showSearch">
            <input placeholder="填写验证码" maxlength="6" v-model="captcha">
            <button :disabled="!rightPhone" :class="{right_phone:rightPhone}" @click.prevent="getCode">{{computeTime>0 ? `(${computeTime}s)已发送` : '获取验证码'}}</button>
        </div>
        <div class="lgD" v-else>
            <input placeholder="填写密码" v-model="upwd" maxlength="12">
            <button @click="showImg" class="right_phone">忘记密码</button>
        </div>
        <div class="logC">
            <a><mt-button @click="login" :disabled="isClick">登录</mt-button></a>
        </div>
        <div class="info"  v-if="showSearch">新用户获取验证码进行注册～</div>
        <button class="info"  v-else @click="showImg">去注册 &gt;&gt;</button>
    </div>
    <div class="logWay">
        <div class="linktitle">
            <span>其它方式登录</span>
        </div>
        <ul>
            <li><img src="../assets/icon_qq.png" alt=""></li>
            <li><img src="../assets/icon_weibo.png" alt=""></li>
            <li @click="showImg" class="showSearch">
                <img class="header_img" v-if="!showSearch" src="../assets/icon_phone.png" alt="">
                <img class="header_img" v-if="showSearch" src="../assets/icon_pass.png" alt="">
            </li>
        </ul>
    </div>
</div>  
</template>

<script>

import Popup from '../components/login/PopUp.vue'
export default {
    data() {
        return {
            showSearch:false,   //true代表短信登陆, false代表密码
            phone:"",     //手机号,
            captcha:"",   //验证码
            upwd:'',       //密码
            computeTime: 0,
            timer:null,
            slots: [
                {
                flex: 1,
                values: ['2015-01', '2015-02', '2015-03', '2015-04', '2015-05', '2015-06'],
                className: 'slot1',
                textAlign: 'right'
                },
            ]
        };
    },
    components: {
        Popup
    },
    computed:{
        rightPhone(){
            return /^1[3456789]\d{9}$/.test(this.phone);    //利用正则对手机号匹配
        },
        isClick(){
            if(this.showSearch){
                //手机号/验证码 是否为空
                if(!this.phone || !this.captcha) return true
            }else{
                //账号/密码 是否为空
                if(!this.phone || !this.upwd) return true
            }       
        },
    },
    methods: {
        showCustomPopupClick() {
            this.$refs.CustomPopupRef.showCustom();
        },
        closerButton() {
            this.$refs.CustomPopupRef.maskClick();
        },
        showImg () {
            this.showSearch = ! this.showSearch;
        },
        // 验证码 倒计时60s
        getCode(){
            if(!this.computeTime){
                this.computeTime = 60;
                this.timer = setInterval(() => {
                    this.computeTime --;
                    if( this.computeTime <= 0){
                        clearInterval(this.timer)
                    }
                }, 1000);
            }
        },
        // 登录/注册
        login(){
            if(this.showSearch){
                //短信登录
                if(!this.rightPhone){
                    this.$toast("手机号格式不正确")
                    return;
                }else if(!/^\d{6}$/.test(this.captcha)){
                    this.$toast('验证码格式不正确')
                    return;
                }
                this.axios.post('/register','phone=' + this.phone + '&upwd=' + this.upwd)
                .then(res=>{
                    if(!res.data.code){
                        this.$messagebox.alert('用户已经存在','提示信息');
                    } else {
                        this.$store.dispatch('change',res.data.phone);
                        window.localStorage.setItem('phone',res.data.phone)
                        this.$router.push('/',()=>{});
                    }
                });
            }else{
                //密码登录
                if(!this.rightPhone){
                    this.$toast("用户名格式不正确")
                    return;
                }else if(!/^\d{6,12}$/.test(this.upwd)){
                    this.$toast('密码必须是6~12位');
                }
                this.axios.post('/login','phone=' + this.phone + '&upwd=' + this.upwd)
                .then(res=>{
                    if(res.data.code == 0){
                        this.$messagebox.alert('用户名或密码错误');
                    } else {
                        this.$store.dispatch('change',res.data.phone);
                        window.localStorage.setItem('username',res.data.phone);
                        this.$router.push('/',()=>{});
                    }
                });
            }
        }
    },
}
</script>

<style>
    body {
        background-size: 100%;
        background-repeat: no-repeat;
        background-position: center center;
    }
    .main{
        width: 100%;
        height: 100vh;
        background: url(../assets/login-bg.png) no-repeat;
        background-size: contain;
        background-color: #fff;
        display: flex;
        flex-direction: column;
        overflow: hidden;
        
    }

    .head {
        height: 120px;
        height: 10.4rem;
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .PoperContentView {
        height: 12rem;
        background: #FFFFFF;
    }
    .ServiceNoteTitle {
        height: 12rem;
        border-bottom: 1px solid #EEEEEE;
        text-align: center;
        line-height: 12rem;
    }
    .closerButton {
        position: absolute;
        right: 10rem;
    }
    .logGet {
        background: #fff;
        border-radius: 3px;
        width: 82%;
        height: 45vh;
        padding: 0 4%;
        margin:0 auto;
        font-size: 14px;
        box-shadow: 0 1px 4px 0 rgba(0,0,0,0.1);
        position: relative
    }
    .mint-cell-wrapper{font:14px bolder;color:#ff6699;height:3.3rem;}
    .mint-cell-value{font-size: 14px;color:#666;}
    .lgD,.logC{
        border-bottom:1px solid #eee;

    }
    .mint-cell-title{
        text-align: left;
        padding: 0.8rem;
    }
    .logGet .lgD input{
        height: 3.2rem;
        text-indent: 1.2rem;
        outline: none;
        width: 100%;
        border:0
    }

    .logGet .lgD input::placeholder{
        font-size: 14px;
    }
    .logGet .lgD button{
        color: #ffaabb;
        position: absolute;
        top: 7.5rem;
        right: 8%;
    }
    .logGet .lgD button.right_phone{
        color:#ff6699;
    }
    .logC{
        padding-top: 1.4rem;
    }
    .logC a button {
        width: 100%;
        height: 45px;
        background-color: #ff6699;
        color: white;
        font: 14px bolder;
        outline: none;
    }
    .info{
        color: #999;
        font-size: 12px;
        margin-top: 0.5rem;
    }
    .logWay{
        margin-top: 5.5rem;
        color:#ff6699;
        font-size: 14px;
    }
    .logWay span::before{
        content: '';
        width: 20vw;
        height: 16px;
        margin-right: 15px;
        display: inline-block;
        vertical-align: middle;
        background: url(../assets/left_side_line.png) no-repeat;
        background-size: contain;
        background-position: right center;
    }
    .logWay span::after{
        content: '';
        width: 20vw;
        height: 16px;
        margin-left: 15px;
        display: inline-block;
        vertical-align:middle;
        background: url(../assets/right_side_line.png) no-repeat;
        background-size: contain;
        background-position: left center;
    }
    .logWay ul{
        display: flex;
        width:80%;
        margin: 5% 10%;
        position: relative;
    }
    .logWay ul img{
        width:5vh;
        margin-left: 50px;
    }
    .logWay ul li:nth-child(3),.logWay ul li:nth-child(4){
        position: absolute;
        right:50px
    }
    .hid{
        display: none;
    }

</style>