<template>
    <div class="login">
        <!-- 手机号 -->
        <InputGroup
            type="number"
            placeholder="手机号"
            v-model="phone" 
            :btnTitle="btnTitle"
            :disabled="disabled"
            :error="errors.phone"
            @btnClick="getVerifyCode"
        />
        <!-- 输入验证码 -->
        <InputGroup
            type="number"
            v-model="verifyCode"
            placeholder="验证码"
            :error="errors.code"
        />
        <!-- 登录按钮 -->
    　　　　　　　　
    <div class="login_btn">
          <button @click="handleLogin" :disabled="isClick">登录</button>
     </div>
  </div>
</template>
<script>
import InputGroup from '../components/type/InputGroup'   //引入封装的组件
export default {
  data() {
    return {
        phone:"", //手机号
        verifyCode:"", //验证码
        btnTitle:"获取验证码",
        disabled:false,  //是否可点击
        errors:{}, //验证提示信息
    }
  },
  components:{
    InputGroup,
  },
  methods:{
    getVerifyCode(){
      //获取验证码
      if(this.validatePhone()) {
        this.validateBtn()
        //发送网络请求
        // 注册聚合数据找到短信api服务，申请会得到两个tpl_id和key值，然后填入相对应的就行
        // 具体还是和你门后端进行沟通
        this.$axios.post('/api/posts/sms_send',{
            tpl_id: "",
            key: "",
            phone:this.phone
        }).then(res => {
            console.log(res)
        })
      }
    },
    validatePhone(){
      //判断输入的手机号是否合法
      if(!this.phone) {
        this.errors = {
        phone:"手机号码不能为空"
      }
        // return false
      } else if(!/^1[345678]\d{9}$/.test(this.phone)) {
        this.errors = {
        phone:"请输入正确是手机号"
      }
        // return false
      } else {
        this.errors ={}
        return true
      }
    },
    validateBtn(){
      //倒计时
      let time = 60;
      let timer = setInterval(() => {
      if(time == 0) {
        clearInterval(timer);
        this.disabled = false;
        this.btnTitle = "获取验证码";
      } else {
        this.btnTitle =time + '秒后重试';
        this.disabled = true;
        time--
      }
      },1000)
    },
    handleLogin() {
      //点击发送
      this.errors = {};
      this.$axios.post('/api/posts/sms_back',{
        phone:this.phone,
        code:this.verifyCode
      }).then(res => {
        console.log(res);
        localStorage.setItem('ele_login',true)
        this.$router.push('/')
      }).catch(error =>{
        //返回错误信息
        this.errors ={
          code:error.response.data.msg
        }
      })
    }
  },
  computed: {
    //手机号和验证码都不能为空
    isClick(){
      if(!this.phone || !this.verifyCode) {
        return true
      } else {
        return false
      }           
    }
  },
}
 
</script>