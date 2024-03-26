<template>
  <div class="app-container">
    <el-row :span="24">
      <el-col :span="4">
        <input type="file" id="uploadTemplate" @change="importTemplates()" />
        <el-button-group>
          <el-button type="primary" size="mini" icon="el-icon-folder-add" @click="uploadTemplateZip">导入</el-button>
          <el-button type="primary" size="mini" icon="el-icon-folder-remove" @click="exportTemplate">导出</el-button>
        </el-button-group>
        <el-tree
          class="filter-tree"
          :data="treeData"
          :props="defaultProps"
          default-expand-all
          @node-click="filterNode"
          ref="tree">
          <!--          :filter-node-method="filterNode"-->
        </el-tree>
      </el-col>
      <el-col :span="20">
        <input type="file" multiple id="uploadInput" @change="uploadFiles()"/>
        <el-row class="btn-group">
          <el-button type="primary" @click="addDir()">新增目录</el-button>
          <!--      <input type="file" id="fileInput">-->
          <el-button type="warning" @click="upload()">上传文件</el-button>
          <el-button type="success" @click="addFile()">新建文件</el-button>
          <!--      <el-button type="warning">警告按钮</el-button>-->
          <!--      <el-button type="danger">危险按钮</el-button>-->
        </el-row>

        <el-table
          :data="fileList"
          style="width: 100%" v-loading="loading">
          <el-table-column
            prop="fileName"
            label="文件名称">
            <template slot-scope="scope">
              <span @click="toLastDir" v-if="scope.row.fileName=='上一级'">上一级</span>
              <span class="fileName" @click="toEditPage(scope.row.filePath)" v-else>{{ scope.row.fileName }}</span>
            </template>
          </el-table-column>
          <el-table-column
            prop="fileSize"
            label="文件大小">
            <template slot-scope="scope">
              <span v-if="scope.row.fileType">{{ getFileSize(scope.row.fileSize) }}</span>
            </template>
          </el-table-column>
          <el-table-column
            prop="lastUpdateTime"
            label="修改时间">
            <template slot-scope="scope">
              <span>{{ scope.row.lastUpdateTime }}</span>
            </template>
          </el-table-column>
          <el-table-column
            label="操作">
            <template slot-scope="scope">
              <el-button
                size="mini"
                type="text"
                icon="el-icon-download"
                v-if="scope.row.fileType"
                @click="downloadFile(scope.row.fileName)"
              >下载</el-button>
              <el-button
                size="mini"
                type="text"
                icon="el-icon-edit"
                v-if="scope.row.fileType"
                @click="renameFile(scope.row.fileName)"
              >重命名</el-button>
              <el-button
                size="mini"
                type="text"
                icon="el-icon-delete"
                v-if="scope.row.fileType"
                @click="deleteFile(scope.row.filePath)"
              >删除</el-button>
<!--              <span class="">重命名</span>-->
<!--              <span class="removeBtn" @click="deleteFile(scope.row.filePath)" v-if="scope.row.fileType">删除</span>-->
            </template>
          </el-table-column>
        </el-table>
      </el-col>
    </el-row>


    <!--新建文件弹框-->
    <el-dialog
      title="新建文件"
      :visible.sync="centerDialogVisible"
      width="300px"
      center>
      <el-row :span="24">
        <el-col :span="16">
          <el-input v-model="fileName" placeholder="请输入文件名称"></el-input>
        </el-col>
        <el-col :span="8">
          <el-select v-model="fileTypeValue" placeholder="请选择文件类型">
            <el-option
              v-for="item in fileTypes"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
        </el-col>
      </el-row>
      <span slot="footer" class="dialog-footer">
      <el-button type="primary" @click="addFileSubmit()">确 定</el-button>
      <el-button @click="centerDialogVisible = false">取 消</el-button>
  </span>
    </el-dialog>

  </div>
</template>

<script>
import { getTemplateList,addFile,uploadFile,deleteFile,renameFile,downloadFile,importTemplate} from "@/api/web/template";
import Template from "@/views/web/template/index";
export default {
  name: "TempList",
  components: {Template},
  data() {
    return {
      centerDialogVisible:false,

      fileTypes: [{
        value: 'html',
        label: '.html'
      }, {
        value: 'css',
        label: '.css'
      }, {
        value: 'js',
        label: '.js'
      }, {
        value: 'txt',
        label: '.txt'
      }],
      fileTypeValue:'html',
      fileName:'',

      filePath:null,
      fileList:[],
      lastBtn:false,
      treeData:[],
      loading:false,
      defaultProps: {
        children: 'children',
        label: 'fileName'
      }
    }
  },
  created() {
    this.getTempList();
  },
  methods: {
    getTempList(){
      this.loading=true;
      getTemplateList({filePath:this.filePath,type:'temp'}).then(reponse =>{
        this.loading=false;
        this.fileList=reponse.file;
        if(this.filePath==null){ this.treeData=reponse.file; }
        this.filePath=reponse.filePath;
        let pathSpilt=this.filePath.split("\\").length>1?this.filePath.split("\\"):this.filePath.split("/");
        if(pathSpilt.length>1){
          this.lastBtn=true;
          this.fileList.unshift({fileName:"上一级",fileSize:""})
        }else{
          this.lastBtn=false;
        }
      })
    },
    //左侧目录点击
    filterNode(value, data) {
      this.filePath=value.filePath;
      this.getTempList();
    },
    getFileName(name){
      var isOS=name.lastIndexOf("\\")==-1?name.lastIndexOf("/"):name.lastIndexOf("\\");
      return name.substring(isOS + 1,name.length);
    },
    toEditPage(path){
      if(path.indexOf(".")!=-1){
        if(path.indexOf(".txt")!=-1||path.indexOf(".html")!=-1||path.indexOf(".css")!=-1||path.indexOf(".js")!=-1) {
          this.$router.push({path: "/temp/tempEdit", query: {path: path}});
        }else{
          this.$modal.msgWarning("不支持打开此类型文件");
        }
      }else {
        this.filePath=path;
        this.getTempList();
        // this.$router.push({ path: "/temp/tempList", query: {path: path} });
      }
    },
    addDir(){
      var name=prompt("请输入目录名称","");
      if(name) {
        addFile({path: this.filePath,dirName:name}).then(reponse => {
          if(reponse=="ok"){
            this.$modal.msgSuccess("创建成功");
            this.getTempList();
          }
        })
      }
    },
    upload(){
      document.getElementById("uploadInput").click();
    },
    uploadFiles(){
      var files=document.getElementById("uploadInput").files;
      var formData = new FormData();
      for (let i = 0; i < files.length; i++) {
        formData.append("file",files[i]);
      }
      formData.append("path",this.filePath)
      uploadFile(formData).then(reponse =>{
        if(reponse=="ok"){
          this.$modal.msgSuccess("上传成功");
          this.getTempList();
        }
      })
    },
    deleteFile(path){
      this.$modal.confirm('您确定删除该文件吗?').then(function() {}).then(() => {
        deleteFile({path:path}).then(response =>{
          if(response=="ok"){
            this.$modal.msgSuccess("删除成功");
            this.getTempList();
          }
        })
      }).catch(() => {});
    },
    toLastDir(){
      let filePath=this.filePath;
      if(filePath!=null){
        var isOS=filePath.lastIndexOf("\\")==-1?filePath.lastIndexOf("/"):filePath.lastIndexOf("\\");
        this.filePath=filePath.substring(0,isOS);
        this.getTempList();

      }
    },
    //获取文件大小
    getFileSize(item){
      var size=(item/1024);
      if(size==0){
        return ""
      }else {
        return parseInt(size)+"KB";
      }
    },
    //重命名文件
    renameFile(fileName){
      var name=prompt("请输入文件名称",fileName);
      if(name) {
        renameFile({path: this.filePath,oldFileName:fileName,newFileName:name}).then(reponse => {
          if(reponse=="ok"){
            this.$modal.msgSuccess("重命名成功");
            this.getTempList();
          }
        })
      }
    },
    // 下载文件
    downloadFile(fileName){
      downloadFile({path:this.filePath,fileName:fileName}).then(response=>{
        var file = new File([response], fileName, {type: "text/plain;charset=utf-8"});
        this.$download.saveAs(file);
      });
    },
    // 导出模板
    exportTemplate(){
      this.$download.zip("/web/template/exportTemplate", "zyycms-template.zip");
    },
    // 导入模板
    importTemplates(){
      var files=document.getElementById("uploadTemplate").files;
      var formData = new FormData();
      // if(files[0].type=="")
      formData.append("file",files[0]);
      importTemplate(formData).then(res=>{
        if(res=="ok"){
          this.$modal.msgSuccess("导入成功");
        }
      })
    },
    uploadTemplateZip(){
      document.getElementById("uploadTemplate").click();
    },
    //打开新建文件弹框
    addFile(){
      this.centerDialogVisible=true;
    },
    //新建文件
    addFileSubmit(){
      if(this.fileName==""){
        this.$modal.msgWarning("请输入文件名称！")
      }else{
        addFile({path: this.filePath,dirName:this.fileName+"."+this.fileTypeValue}).then(reponse => {
          if(reponse=="ok"){
            this.$modal.msgSuccess("创建文件成功");
            this.getTempList();
            this.centerDialogVisible=false;
          }
        })
      }
    }
  }
}
</script>

<style scoped>
.grid-content{
  height: 40px;
  display: flex;
  align-items: center;
  padding: 0 18px;
  justify-content: space-between;
}
.grid-content span:first-child{
  color: #1e2ea6;
}
.grid-content span:nth-child(2){

}
.grid-content span:nth-child(3){

}
.removeBtn{
  color: #e52246;
  cursor: pointer;
}
.bg-purple-dark {
  background: #99a9bf;
  color: #1e2ea6;
}
.btn-group{
  margin-bottom: 20px;
}
#uploadInput,
#uploadTemplate{
  width: 0;
  height: 0;
}

.filter-tree{
  margin-top: 50px;
}
.fileName{
  color: #1c84c6;
  cursor: pointer;
}
</style>
