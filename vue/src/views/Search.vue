<template>
  <div>
    <mt-search
      v-model="value"
      cancel-text="取消"
      placeholder="搜索"
      :result.sync="result"
      ref="f">
    </mt-search>
    <ProSearch></ProSearch>
    <mt-spinner style="display:block;padding:1rem 0 12rem;" type="triple-bounce" color="#ff7ea8" :size="40"></mt-spinner>
  </div>
</template>
<script>
import ProSearch from "../components/search/ProSearch.vue"
export default {
  data(){
    return {
      value:"",
      result:["汉元素"]
    }
  },
  mounted () {
    // this.$refs.f.focus()
  },
  methods:{

  },
  components:{
    ProSearch,
  }
}
</script>
<style scoped>
.mint-search{
  height:60px;
}
.mint-search .mint-searchbar{
  background-color: #f4f4f4;
}
</style>