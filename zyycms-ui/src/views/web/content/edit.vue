<template>
  <el-scrollbar class="center-scrollbar" id="contentEdit">
    <el-button type="primary" id="submit" @click="submitForm(0)" v-hasPermi="['web:content:edit']">发 布</el-button>
    <el-button type="info" id="submit" @click="submitForm(4)" v-hasPermi="['web:content:edit']">草 稿</el-button>
    <el-button type="danger" id="submit" @click="closeForm">关 闭</el-button>
    <br/><br/>
    <el-form ref="form" :model="form" :rules="rules" label-width="100px">
      <el-row :span="24">
        <el-col :span="18">
          <el-form-item label="文章名字" prop="title">
            <el-input v-model="form.title" placeholder="请输入文章名字" />
          </el-form-item>

          <el-form-item label="文章内容">
            <div>
              <vue-ueditor-wrap v-model="form.text" :editorDependencies="['ueditor.config.js','ueditor.all.js']"
                                :config="UeditorConfig" editor-id="editor-demo-01"></vue-ueditor-wrap>
            </div>
          </el-form-item>
          <div>
            <k-form-build
              :defaultValue="defaultValue"
              :value="jsonData"
              ref="KFB"
              :config="config"
            />
          </div>

        </el-col>
        <el-col :span="6">
          <el-form-item label="发布时间" prop="releaseTime">
            <el-date-picker
              v-model="form.releaseTime"
              type="datetime"
              format="yyyy-MM-dd HH:mm:ss"
              value-format="yyyy-MM-dd HH:mm:ss"
              placeholder="请选择发布时间">
            </el-date-picker>
          </el-form-item>
          <el-form-item label="所属栏目" prop="channelId">
            <treeselect
              v-model="form.channelId"
              :options="channelTreeList"
              :show-count="true"
              placeholder="选择栏目"
            />
          </el-form-item>
          <el-form-item label="作者" prop="author">
            <el-input v-model="form.author" placeholder="请输入作者" />
          </el-form-item>
          <el-form-item label="来源" prop="source">
            <el-input v-model="form.source" placeholder="请输入来源" />
          </el-form-item>
          <el-form-item label="描述" prop="profile">
            <el-input type="textarea" maxlength="200" :rows="5" v-model="form.profile" placeholder="请输入描述" />
          </el-form-item>
          <el-form-item label="外部链接" prop="externalLink">
            <el-input type="textarea" v-model="form.externalLink" placeholder="请输入" />
          </el-form-item>
          <el-form-item label="封面图" prop="cover">
            <imageUpload v-model="form.cover" :isShowTip="false" :fileSize="10" :limit="1" :fileType="['png', 'jpg', 'jpeg']"></imageUpload>
          </el-form-item>
        </el-col>
      </el-row>


      <el-row>

      </el-row>

    </el-form>
  </el-scrollbar>

</template>

<script>
import {listContent, getContent, delContent, addContent, updateContent} from "@/api/web/content";
import {treeselect, getChannel, updateChannel} from "@/api/web/channel";
import { parseTime} from "@/utils/index";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
import {updateModel,getModel,listModel,selectModels} from '@/api/web/model'
import {getToken} from "@/utils/auth";
import { getInfo } from '@/api/login';
// 富文本编辑器
import VueUeditorWrap from 'vue-ueditor-wrap'
import Template from "@/views/web/template/index.vue";

export default {
  name: "Edit",
  components: {Template, Treeselect,VueUeditorWrap},
  data(){
    return {
      UeditorConfig: {
        // 初始容器高度
        initialFrameHeight: 400,
        // 初始容器宽度
        initialFrameWidth: '100%',
        // 编辑器后端服务接口，参考后端规范 https://open-doc.modstart.com/ueditor-plus/backend.html
        serverUrl: process.env.VUE_APP_BASE_API+'/UEditor',
        headers: {
          Authorization: "Bearer " + getToken()
        },
        // 配置 UEditorPlus 的静态资源根路径，可以是 CDN 的静态资源地址
        UEDITOR_HOME_URL: '/admin/UEditor/',
      },

      // 栏目树
      channelTreeList: [],
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        stage: [
          {required: true, message: "0:已发布 1:下线不能为空", trigger: "blur"}
        ],
        title: [
          {required: true, message: "标题不能为空", trigger: "blur"}
        ],
      },
      defaultProps: {
        children: "children",
        label: "label"
      },
      channelName: "",
      modelList: [],
      //自定义表单
      defaultValue: {},
      jsonData: {},
      config: {
        uploadFile: process.env.VUE_APP_BASE_API + "/common/uploadtocms", // 上传文件地址
        uploadImage: process.env.VUE_APP_BASE_API + "/common/uploadtocms", // 上传图片地址
        uploadFileName: "file", // 上传文件name
        uploadImageName: "file", // 上传图片name
        uploadFileData: {}, // 上传文件额外参数
        uploadImageData: {}, // 上传图片额外参数
        uploadFileHeaders: {Authorization: "Bearer " + getToken()}, // 上传文件请求头部
        uploadImageHeaders: {Authorization: "Bearer " + getToken()} // 上传图片请求头部
      },
      //部门名称
      deptName:null,
      //微信公众号列表查询参数
      wxQueryParams:{
        pageIndex: 1,
        pageSize: 10
      },
      //微信公众号记录数
      wxNoticeTotal: 0,
      //微信公众号列表窗口打开
      wxNoticeOpen: false,
      //微信公众号文章列表
      wxNoticeList: [],
    }
  },
  created() {
    this.reset();
    this.getTreeselect();
    this.form.releaseTime=this.dateFormat(new Date());
    this.form.modelId=this.$route.query.modelId;
    // this.form.channelId=this.$route.query.channelId;
    this.form.id=this.$route.query.id;
    if(this.form.id!=null){
      this.getContentInfo();
    }else {
      this.form.channelId=this.$route.query.channelId;
      this.getModelItemList();
      // 文章作者默认为部门名称
      getInfo().then(res=>{
        this.deptName=res.user.dept.deptName;
        this.form.author=this.deptName;
      })
    }
  },
  activated() {
      if(this.$route.query.id!=this.form.id) {
        this.form.modelId = this.$route.query.modelId;
        this.form.id = this.$route.query.id;
        if (this.form.id != null) {
          this.getContentInfo();
        } else {
          this.form.channelId = this.$route.query.channelId;
          this.getModelItemList();
        }
      }
  },
  methods:{
    //查询栏目树
    getTreeselect() {
      let _this=this;
      treeselect().then(response =>{
        this.channelTreeList = response.data;
      })
    },
    //获取模型结构
    getModelItemList(){
      getModel(this.form.modelId).then(response =>{
        if(response.code==200){
          let modelCode=eval('('+response.data.modelCode+')');
          this.$refs["KFB"].reset();
          this.jsonData=modelCode;
        }
      })
    },
    //获取内容详情
    getContentInfo(){
      getContent(this.form.id).then(response => {
        this.form = response.data;
        if(this.form.modelId!=null) {
          getModel(this.form.modelId).then(response => {
            if (response.code == 200) {
              let content = eval('(' + response.data.modelCode + ')');
              this.jsonData=content;
              this.$refs["KFB"].setData(this.form.attr)
            }
          })
        }
      });
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        title: null,
        channelId: null,
        modelId: null,
        text: null,
        views: null,
        stage: "0",
        releaseTime: null,
        createTime: null,
        attr:{},
        author: null,
        source: null,
        profile: null,
        externalLink: null,
        cover: null,
        orderNum: null,
      };
      this.resetForm("form");
    },
    //编辑器初始化
    onCreated(editor) {
      this.editor = Object.seal(editor) // 一定要用 Object.seal() ，否则会报错
    },
    //日期格式化
    dateFormat:function(time) {
      var date=new Date(time);
      var year=date.getFullYear();
      /* 在日期格式中，月份是从0开始的，因此要加0
       * 使用三元表达式在小于10的前面加0，以达到格式统一  如 09:11:05
       * */
      var month= date.getMonth()+1<10 ? "0"+(date.getMonth()+1) : date.getMonth()+1;
      var day=date.getDate()<10 ? "0"+date.getDate() : date.getDate();
      var hours=date.getHours()<10 ? "0"+date.getHours() : date.getHours();
      var minutes=date.getMinutes()<10 ? "0"+date.getMinutes() : date.getMinutes();
      var seconds=date.getSeconds()<10 ? "0"+date.getSeconds() : date.getSeconds();
      // 拼接
      return year+"-"+month+"-"+day+" "+hours+":"+minutes+":"+seconds;
    },
    /** 提交按钮 */
    submitForm(stage) {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if(stage!=null) {
            this.form.stage = stage;
          }
          if (this.form.id != null) {
            this.$refs.KFB.getData().then(res => {
              this.form.attr=res;
              updateContent(this.form).then(response => {
                  this.$modal.msgSuccess("修改成功");
                  this.$tab.closePage();
                  this.$router.push({path: "/content/Content", query: {}});
              });
            })
          } else {
            this.$refs.KFB.getData().then(res => {
              this.form.attr=res;
              addContent(this.form).then(response => {
                  this.$modal.msgSuccess("新增成功");
                  this.$tab.closePage();
                  this.$router.push({ path: "/content/Content", query: {} });
              });
            })
          }
        }
      });
    },
    // 自定义表单提交
    submitData (getData) {

    },
    //关闭当前页面
    closeForm(){
      this.$tab.closePage();
    },
    //粘贴事件
    handlePaste(e){
      console.log(e)
      // 获取解析 粘贴的文本
      let text = (e.clipboardData || window.clipboardData).getData("text");
      console.log("text", text);
      // element.addEventListener('paste', (event) => {
      //   const clipboardData = event.clipboardData;
      //   const text = clipboardData.getData('text/plain');
      //
      //   console.log(text);
      // });
    },
  },
}
</script>

<style>
#contentEdit .el-scrollbar__wrap{
  padding: 40px;
}
#submit{
  margin-left: 20px;
}
.w-e-full-screen-container{
  z-index: 9999;
}
.edui-toolbar>div{
  height: 34px !important;
  line-height: 30px !important;
}
.edui-gray .edui-button .edui-button-wrap{
  width: 25px !important;
  height: 30px !important;
  padding: 2px !important;
}
.edui-gray .edui-toolbar .edui-combox .edui-combox-body{
  height: 30px !important;
}
.edui-gray .edui-editor-toolbarbox{
  border-bottom: 1px solid #d4d4d4 !important;
  background-color: #ffffff !important;
}
.edui-state-hover{
  padding: 0px !important;
}
.edui-gray .edui-arrow{
  padding: 0px !important;
}
</style>
