<template>
    <div class="app-container">
      <iframe :src="url" id="iframe"></iframe>
    </div>
</template>

<script>
export default {
  name: "preview",
  data(){
    return{
      //域名
      url:"",

    }
  },
  created() {
    this.url=this.$route.query.url+"?preview=true";
  },
  methods:{

  }
}
</script>

<style scoped>
#iframe{
  width: 100%;
  height: 90vh;
  border: 0px solid;
}
</style>
