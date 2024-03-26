
<template>
  <imageUpload v-model="imgUrl" :limit="1" :fileType="['png', 'jpg', 'jpeg']"></imageUpload>
</template>
<script>
export default {
  name: "UploadImageOne",
  data(){
    return{
        imgUrl: '',
    }
  }
}
</script>

<style scoped>

</style>
