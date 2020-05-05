<template>
  <div>
    <img class="imgstyle" :src="focus?selectedImg:normalImg" />
  </div>
</template>
<script>
export default {
  props:{
    focus:{default:""},
    selectedImg:{default:""},
    normalImg:{default:""}
  }
}
</script>
<style scoped>
  .imgstyle{
    width:30px;
    height:30px;
  }
</style>