<template>
  <k-form-design title="表单设计器" @save="handleSave" ref='kfd' :toolbars="['save']"/>
</template>

<script>

import {updateModel,getModel} from '@/api/web/model'
export default {
  name: "builder",
  data() {
    return {
      modelId:null,
      jsonData:[],
    }
  },
  methods: {
    handleSave(values) {

      let data={
        modelId:this.modelId,
        modelCode:values,
        // modelCodeAdmin:JSON.stringify(this.$refs.designer.getOption()),
      }
      updateModel(data).then(response =>{
        console.log(response)
        if(response.code=200){
          this.$modal.alertSuccess("保存成功");
        }
      })
    },
    importData () {
      if(this.jsonData!=null){
        this.$refs.kfd.handleSetData(this.jsonData)
      }
    },
    //加载配置
    getConfig(){
      getModel(this.modelId).then(response =>{
        if(response.code==200) {
          console.log(response)
          if (response.data.modelCode != "null") {
            let modelCode = eval('(' + response.data.modelCode + ')');
            // this.drawingList = content;
            this.jsonData=modelCode;
            this.importData();
          }
        }
      })
    }
  },
  mounted() {
    this.modelId=this.$route.query.modelId;
    this.getConfig();
  },
}
</script>

<style>
.form-designer-container-9136076486841527 .content aside.left, .k-form-build-9136076486841527 .content aside.left{
  width: 300px !important;
}
.form-designer-container-9136076486841527 .content aside.right, .k-form-build-9136076486841527 .content aside.right{
  width: 300px !important;
}
</style>
