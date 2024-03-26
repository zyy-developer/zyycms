<template>
  <div class="app-container">
    <el-button type="primary" @click="saveFile()" class="saveBtn">保存</el-button>
    <el-button type="danger" @click="closePage()" class="saveBtn">关闭</el-button>
    <div>
      <div ref="html" style="width: 100%; height: 80vh"></div>
    </div>
  </div>
</template>

<script>
import { getTemplateInfo ,saveTemplateInfo } from "@/api/web/template";
import * as monaco from "monaco-editor";
export default {
  name: "tempEdit",
  data() {
    return {
      filePath:'',
      fileCode:'',
      lang: '',
      monacoEditor: null,
    }
  },
  created() {
    this.filePath=this.$route.query.path;
    let fileType=this.filePath.substring(this.filePath.lastIndexOf(".")+1,this.filePath.length);
    if(fileType=="htm"||fileType=="html"){
      this.lang="html"
    }else if(fileType=="css"){
      this.lang="css"
    }else if(fileType=="js"){
      this.lang="javascript"
    }
    this.getParameter();
  },
  methods: {
    //加载文件
    getParameter(){
      getTemplateInfo({filePath:this.filePath}).then(response =>{
        if(response!=null) {
          this.fileCode = response;
          this.init(this.lang,this.fileCode);
          // this.monacoEditor.setValue(this.fileCode)
        }
      })
    },
    //保存文件
    saveFile(){
      var html = this.monacoEditor.getValue();
      this.fileCode=html;
      this.fileCode=this.fileCode.replaceAll("%","@@");
      this.fileCode=this.fileCode.replaceAll("+","~~");
      saveTemplateInfo({filePath:this.filePath,file:encodeURIComponent(encodeURIComponent(this.fileCode))}).then(response =>{
        if(response=="ok"){
          this.$modal.alertSuccess("保存成功");
        }
      })
    },
    //代码编辑器初始化
    init(lang,code) {
      // 使用 - 创建 monacoEditor 对象
      this.monacoEditor = monaco.editor.create(this.$refs.html, {
        theme: "vs-dark", // 主题 vs-dark黑色
        value: code, // 默认显示的值
        language: lang,
        folding: true, // 是否折叠
        foldingHighlight: true, // 折叠等高线
        foldingStrategy: "indentation", // 折叠方式  auto | indentation
        showFoldingControls: "always", // 是否一直显示折叠 always | mouseover
        disableLayerHinting: true, // 等宽优化
        emptySelectionClipboard: false, // 空选择剪切板
        selectionClipboard: false, // 选择剪切板
        automaticLayout: true, // 自动布局
        codeLens: false, // 代码镜头
        scrollBeyondLastLine: false, // 滚动完最后一行后再滚动一屏幕
        colorDecorators: true, // 颜色装饰器
        accessibilitySupport: "off", // 辅助功能支持  "auto" | "off" | "on"
        lineNumbers: "on", // 行号 取值： "on" | "off" | "relative" | "interval" | function
        lineNumbersMinChars: 1, // 行号最小字符   number
        enableSplitViewResizing: false,
        readOnly: false, //是否只读  取值 true | false
      });
    },
    //关闭页面
    closePage(){
      this.$tab.closePage();
    }
  }
}
</script>

<style scoped>
#text{
  width: 100%;
  height: 700px;
  padding: 3px 5px;
  font-size: 15px;
  font-family: sans-serif;
}
:focus-visible {
  outline: none;
}
.saveBtn{
  margin-bottom: 15px;
}
</style>
