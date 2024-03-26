<template>
  <div class="app-container" id="contentPage">
  <el-row :span="24">
    <el-col :span="4">
      <div class="channel-conetnt">
        <div class="head-container">
          <el-input
            v-model="channelName"
            placeholder="请输入栏目名称"
            clearable
            size="small"
            prefix-icon="el-icon-search"
            style="margin-bottom: 20px"
          />
        </div>
        <div class="head-container">
          <el-tree
            :data="channelTreeList"
            :props="defaultProps"
            :expand-on-click-node="false"
            :filter-node-method="filterNode"
            ref="tree"
            node-key="id"
            default-expand-all
            highlight-current
            @node-click="handleNodeClick"
          />
        </div>
      </div>
    </el-col>
    <el-col :span="20">
      <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="50px">
        <el-form-item label="标题" prop="title">
          <el-input
            v-model="queryParams.title"
            placeholder="请输入文章名字"
            clearable
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item label="排序" prop="order">
          <el-select v-model="queryParams.order" placeholder="选择排序方式" clearable @change="handleQuery" label-width="50px">
            <el-option
              v-for="dict in dict.type.cms_content_order"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="类型" prop="contentType">
          <el-select v-model="queryParams.contentType" placeholder="选择内容类型" clearable @change="handleQuery" label-width="50px">
            <el-option
              v-for="item in contentTypeList"
              :key="item.id"
              :label="item.name"
              :value="item.id"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="状态" prop="stage">
          <el-select v-model="queryParams.stage" placeholder="选择文章状态" clearable @change="handleQuery" label-width="50px">
            <el-option
              v-for="item in dict.type.cms_content_stage"
              :key="item.value"
              :label="item.label"
              :value="item.value"
            />
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
          <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
          <el-button icon="el-icon-delete" type="danger" size="mini" @click="openRecycleBinOpen">回收站</el-button>
        </el-form-item>
      </el-form>

      <el-row :gutter="10" class="mb8">
        <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>

        <el-col :span="1.5" v-for="item in modelList">
          <el-button
            type="primary"
            plain
            icon="el-icon-circle-plus"
            size="mini"
            v-hasPermi="['web:content:add']"
            @click="handleAdd(item.modelId)"
          >{{ item.modelName }}
          </el-button>
        </el-col>
      </el-row>
      <div class="z-table" v-loading="loading">
        <draggable v-model="contentList" @start="onStart" @end="onEnd">
        <div class="z-table-row" v-for="item in contentList" @dblclick="handleRowDbClick(item)">
            <div class="z-table-row-left">
              <div class="news-title">
                <span>[{{item.channelName}}]</span>
                <a @click="toContentPage(item.url)" :title="item.title" target="_blank">{{item.title}}</a>
              </div>
              <div class="news-details">
                <dict-tag :options="dict.type.cms_content_stage" :value="item.stage"/>
                <span class="news-details-icon">
                  <i class="el-icon-view"></i>
                  <span>{{item.views}}</span>
                </span>
              </div>
            </div>
            <div class="z-table-row-right">
              <div class="create-by">
                  <span>创建人：{{item.createBy}}</span>
                  <span>创建时间：{{ parseTime(item.createTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
                  <span>发布时间：{{ parseTime(item.releaseTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
              </div>
              <div class="operate-buttons">
                <el-button
                  size="mini"
                  type="text"
                  icon="el-icon-document-remove"
                  @click="updateStage(item)"
                  v-if="item.stage=='0'"
                  v-hasPermi="['web:content:edit']"
                >下线
                </el-button>
                <el-button
                  size="mini"
                  type="text"
                  icon="el-icon-upload2"
                  @click="updateNewsTop(item)"
                  v-hasPermi="['web:content:edit']"
                >
                  <span v-text="item.topping=='1'?'取消置顶':'置顶'"></span>
                </el-button>
                <el-button
                  size="mini"
                  type="text"
                  icon="el-icon-help"
                  @click="preview(item)"
                  v-hasPermi="['web:content:edit']"
                >预览
                </el-button>
                <el-popover
                  placement="bottom"
                  width="120"
                  trigger="click">
                  <el-checkbox-group v-model="contentType" size="small" @change="updateContentTypeByRows(item)">
                    <el-checkbox v-for="it in contentTypeList" class="content-type-checkbox" :label="it.id"  border>{{it.name}}</el-checkbox>
                  </el-checkbox-group>
                  <el-button
                    slot="reference"
                    size="mini"
                    type="text"
                    icon="el-icon-thumb"
                    @click="openContentType(item)"
                    v-hasPermi="['web:content:edit']"
                  >内容类型
                  </el-button>
                </el-popover>
                <el-button
                  size="mini"
                  type="text"
                  icon="el-icon-edit"
                  @click="handleUpdate(item)"
                  v-hasPermi="['web:content:edit']"
                >修改
                </el-button>
                <el-button
                  size="mini"
                  type="text"
                  icon="el-icon-document-copy"
                  @click="openContentCopy(item.id)"
                  v-hasPermi="['web:content:edit']"
                >复制
                </el-button>
                <el-button
                  size="mini"
                  type="text"
                  icon="el-icon-delete"
                  @click="toRecoveryBin(item)"
                  v-hasPermi="['web:content:remove']"
                >删除
                </el-button>
              </div>
            </div>
        </div>
        </draggable>
        <div class="z-table-row" v-if="contentList.length==0">
          <span class="not-list">暂无内容！</span>
        </div>
      </div>

    </el-col>
    <el-col :span="20">

      <pagination
        v-show="total>0"
        :total="total"
        :page.sync="queryParams.pageNum"
        :limit.sync="queryParams.pageSize"
        @pagination="getList"
      />
    </el-col>
  </el-row>

    <!-- 选择要复制栏目对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
<!--      <el-form ref="form" :model="form" :rules="rules" label-width="100px">-->
        <el-tree
          :data="channelTreeList"
          :props="defaultProps"
          :expand-on-click-node="false"
          ref="tree"
          node-key="id"
          default-expand-all
          highlight-current
          @node-click="copyContentSelected"
        />

      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="copyContentSubmit">确 定</el-button>
        <el-button @click="copyCancel">取 消</el-button>
      </div>
<!--      </el-form>-->
    </el-dialog>

    <!-- 回收站对话框 -->
    <el-dialog title="回收站" :visible.sync="recycleBinOpen" width="1000px" append-to-body>
      <el-table
        :data="recycleData"
        style="width: 100%">
        <el-table-column
          prop="title"
          label="标题"
          width="300">
        </el-table-column>
        <el-table-column
          prop="channelName"
          label="所属栏目"
          width="120">
        </el-table-column>
        <el-table-column
          prop="deleteBy"
          label="删除人">
        </el-table-column>
        <el-table-column
          prop="deleteTime"
          label="删除时间">
          <template slot-scope="scope">
            <span>{{ parseTime(scope.row.deleteTime, '{y}-{m}-{d} {h}:{i}') }}</span>
          </template>
        </el-table-column>
        <el-table-column
          label="操作">
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="text"
              icon="el-icon-refresh-left"
              v-hasPermi="['web:content:remove']"
              @click="reductionItem(scope.row)"
            >还原
            </el-button>
            <el-button
              size="mini"
              type="text"
              icon="el-icon-delete"
              v-hasPermi="['web:content:remove']"
              @click="handleDelete(scope.row)"
            >删除
            </el-button>
          </template>
        </el-table-column>
      </el-table>
      <pagination
        v-show="recycleDataTotal>0"
        :total="recycleDataTotal"
        :page.sync="recycleQueryParams.pageNum"
        :limit.sync="recycleQueryParams.pageSize"
        @pagination="getRecycleDataList"
      />
    </el-dialog>

  </div>
</template>

<script>
import { listContent, getContent, delContent, addContent, updateContent } from "@/api/web/content";
import { getSite } from "@/api/web/site";
import {treeselect, getChannel, updateChannel} from "@/api/web/channel";
import { parseTime} from "@/utils/index";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
import IconSelect from "@/components/IconSelect";
import {updateModel,getModel,listModel,selectModels} from '@/api/web/model'
import { listContentType, getContentType, delContentType, addContentType, updateContentType } from "@/api/web/contentType";
import {getToken} from "@/utils/auth";

import Cookies from "js-cookie";
import draggable from "vuedraggable";
import Template from "@/views/web/template/index.vue";

export default {
  name: "Content",
  components: {Template, Treeselect, IconSelect,draggable},
  dicts: ['cms_content_stage','cms_content_order'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 栏目树
      channelTreeList: [],
      // 总条数
      total: 0,
      // 文章管理表格数据
      contentList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        title: null,
        channelId: null,
        modelId: null,
        text: null,
        views: null,
        stage: null,
        releaseTime: null,
        order:null,
        contentType:null,
        isDelete: '0',
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        stage: [
          { required: true, message: "0:已发布 1:下线不能为空", trigger: "blur" }
        ],
        title: [
          { required: true, message: "标题不能为空", trigger: "blur" }
        ],
      },
      defaultProps: {
        children: "children",
        label: "label"
      },
      channelName:"",
      modelList:[],
      //站点地址
      siteUrl:null,
      contentType: [],
      //内容类型列表
      contentTypeList: [],
      //复制文章id
      copyContentId: null,
      //复制框选中的栏目id
      copyChannelId: null,
      //回收站弹框开关
      recycleBinOpen: false,
      //回收站内容列表
      recycleData: [],
      //回收站结果数量
      recycleDataTotal: 0,
      //回收站数据查询参数
      recycleQueryParams: {
        pageNum: 1,
        pageSize: 10,
        isDelete: '1',
      },
    };
  },
  watch: {
    // 根据名称筛选栏目树
    channelName(val) {
      this.$refs.tree.filter(val);
    }
  },
  created() {
    this.getSiteInfo();
    this.getList();
    this.getTreeselect();
    this.getContentTypeList();
  },
  activated() {
    this.getList();
  },
  methods: {
    activeFormItem(element) {
      this.activeData = element
      this.activeId = element.formId
    },
    /** 查询文章管理列表 */
    getList() {
      this.loading = true;
      listContent(this.queryParams).then(response => {
        this.contentList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 获取回收站文章数据 */
    getRecycleDataList(){
      listContent(this.recycleQueryParams).then(response => {
        this.recycleData=response.rows;
        this.recycleDataTotal=response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
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
        releaseTime: new Date(),
        createTime: null,
        attr:{}
      };
      this.resetForm("form");
    },
    /** 转换栏目数据结构 */
    normalizer(node) {
      if (node.children && !node.children.length) {
        delete node.children;
      }
      return {
        id: node.id,
        label: node.label,
        children: node.children
      };
    },
    //查询栏目树
    getTreeselect() {
      let _this=this;
      treeselect().then(response =>{
        this.channelTreeList = response.data;
      })
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd(id) {
      this.$router.push({ path: "/content/edit", query: {modelId: id,channelId: this.queryParams.channelId} });
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      const id = row.id || this.ids;
      this.$router.push({ path: "/content/Edit", query: {id: id} });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            this.$refs.KFB.getData().then(res => {
              this.form.attr=res;
              updateContent(this.form).then(response => {
                this.$modal.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              });
            })
          } else {
            this.$refs.KFB.getData().then(res => {
              this.form.attr=res;
              addContent(this.form).then(response => {
                this.$modal.msgSuccess("新增成功");
                this.open = false;
                this.getList();
              });
            })
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除文章管理编号为"' + ids + '"的数据项？').then(function() {
        return delContent(ids);
      }).then(() => {
        this.getList();
        this.getRecycleDataList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 移入回收站 */
    toRecoveryBin(row){
      var data={
        id: row.id,
        isDelete: '1',
      }
      this.$modal.confirm('是否将此文章移入回收站？').then(function() {
        return updateContent(data);
      }).then(()=>{
        this.getList();
        this.$modal.msgSuccess("操作成功");
      }).catch(() => {});
    },
    /** 还原文章 */
    reductionItem(row){
      var data={
        id: row.id,
        isDelete: '0',
      }
      this.$modal.confirm('是否将此文章移出回收站？').then(function() {
        return updateContent(data);
      }).then(()=>{
        this.getList();
        this.getRecycleDataList();
        this.$modal.msgSuccess("还原成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('web/content/export', {
        ...this.queryParams
      }, `content_${new Date().getTime()}.xlsx`)
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
    //获取内容模型列表
    getChannelModels(){
      if(this.queryParams.channelId!=null) {
        getChannel(this.queryParams.channelId).then(response => {
          this.modelList = response.data.contentModelList;
        })
      }
    },
    // 筛选节点
    filterNode(value, data) {
      console.log(value)
      if (!value) return true;
      return data.label.indexOf(value) !== -1;
    },
    // 节点单击事件
    handleNodeClick(data) {
      this.modelList=[];
      this.queryParams.channelId = data.id;
      this.handleQuery();
      this.getChannelModels();
    },
    submitData (getData) {
      getData()
        .then(values => {
          console.log('验证通过', values)
        })
        .catch(() => {
          console.log('验证未通过，获取失败')
        })
    },
    getData() {
      // 通过函数获取数据
      this.$refs.KFB.getData()
        .then(res => {
          // 获取数据成功
          console.log(res)
          // alert(JSON.stringify(res));
        })
        .catch(err => {
          console.log(err, "校验失败");
        });
    },
    /** 修改状态 */
    updateStage(row){
      updateContent({id:row.id,stage:'1'}).then(response => {
        if(response.code==200){
          this.$modal.msgSuccess("下线成功");
          this.getList();
        }
      })
    },
    //编辑器初始化
    onCreated(editor) {
      this.editor = Object.seal(editor) // 一定要用 Object.seal() ，否则会报错
    },
    //时间格式化
    getdatatime(value) {
      if (value == '') {
        this.form.releaseTime = "";
      } else {
        this.form.releaseTime = parseTime(this.form.releaseTime, "{y}-{m}-{d}") + " 00:00:00";
      }
    },
    //获取站点信息
    getSiteInfo(){
      let siteId=parseInt(Cookies.get("siteId"));
      getSite(siteId).then(res=>{
        this.siteUrl=res.data.url;
      })
    },
    //文章浏览
    toContentPage(url){
      if(url.indexOf("/c/") !=-1){
        url=url.substring(url.indexOf("/",3),url.length)
      }
      window.open(this.siteUrl+url)
    },
    //每行双击事件
    handleRowDbClick(row){
      this.handleUpdate(row);
    },
    //获取内容类型列表
    getContentTypeList(){
      listContentType({}).then(resp=>{
        this.contentTypeList=resp.rows;
      })
    },
    //打开内容类型下拉菜单
    openContentType(row){
      this.contentType=[];
      if(row.contentTypeList!=null){
        row.contentTypeList.forEach(item=>{
          this.contentType.push(item.id)
        })
      }
    },
    //修改每行内容类型
    updateContentTypeByRows(row){
      let list=[];
      this.contentType.forEach(item=>{
        list.push({id:item})
      })
      let data={
        id:row.id,
        contentTypeList:list
      }
      updateContent(data).then(response => {
        this.$modal.msgSuccess("修改成功");
        this.getList();
      })
    },
    //开始拖动排序
    onStart(item){

    },
    //拖动结束
    onEnd(item){
      if(this.queryParams.order!=null&&this.queryParams.order!="0"){
        return;
      }
      if(item.newIndex==item.oldIndex){
        return;
      }
      let oldIndex = this.contentList[item.newIndex]
      let orderNum ;
      if(item.newIndex>item.oldIndex){
        let lastIndex = this.contentList[item.newIndex-1]
        orderNum = oldIndex.orderNum + 1;
      }else {
        let newIndex = this.contentList[item.newIndex + 1]
        orderNum = newIndex.orderNum - 1;
      }
      updateContent({id:oldIndex.id,orderNum:orderNum}).then(response => {
        if(response.code==200){
          this.$modal.msgSuccess("排序成功!");
          this.getList();
        }
      })
    },
    // 预览页面
    preview(row){
      if(row.url.indexOf("/c/") !=-1){
        row.url=row.url.substring(row.url.indexOf("/",3),row.url.length)
      }
      var preUrl=this.siteUrl+row.url;
      window.open(preUrl+"?preview=true")
      // this.$router.push({ path: "/content/preview", query: {url:preUrl} });
      // console.log(row.url)
    },
    // 打开复制文章框
    openContentCopy(id){
      this.open=true;
      this.title="选择栏目";
      this.copyContentId=id;
      // getContent(id).then(res=>{
      //   console.log(res)
      // })
    },
    // 复制文章选中
    copyContentSelected(data){
       let channelId=data.id;
       this.copyChannelId=channelId;
    },
    // 复制提交文章
    copyContentSubmit(){
       let channelId=this.copyChannelId;
       let copyContentId=this.copyContentId;
       if(channelId!=null){
         getContent(copyContentId).then(res=>{
           res.data.channelId=channelId;
           addContent(res.data).then(response => {
             this.$modal.msgSuccess("复制内容成功");
             this.open = false;
             this.getList();
           });
           console.log(res)
         })
       }else{
         this.$modal.msgError("请选择栏目!");
       }
    },
    // 复制框取消
    copyCancel(){
      this.copyChannelId=null;
      this.open=false;
    },
    // 打开回收站弹框
    openRecycleBinOpen(){
      this.recycleBinOpen=true;
      this.getRecycleDataList();
    },
    /** 文章置顶 */
    updateNewsTop(row){
      var stage="1",msg="置顶成功";
      if(row.topping=='1'){ stage="0";msg="取消置顶" }
      updateContent({id:row.id,topping:stage}).then(response => {
        if(response.code==200){
          this.$modal.msgSuccess(msg);
          this.getList();
        }
      })
    },
  },
};

</script>
<style>
.center-scrollbar{
  height: auto;
  border: 0px solid;
}
.el-scrollbar__wrap{
  width: 100%;
  overflow: hidden;
}
.drawing-item-copy,
.drawing-item-delete{
  display: none !important;
}
.pagination-container{
  position: unset;
}
.center-board-row > .el-form{
  height: auto !important;
}
.channel-conetnt{
  width: auto;
  height: calc(100vh - 170px);
  float: left;
}
#contentPage .el-dialog{
  width: 100% !important;
  min-height: 100vh !important;
}
#contentPage .el-dialog:not(.is-fullscreen){
  margin-top: 0px !important;
}
.content-type-checkbox{
  margin-top: 3px;
  margin-bottom: 3px;
  width: 100%;
  margin-left: 0 !important;
  margin-right: 0 !important;
}
.content-type-checkbox img{
  width: 18px;
  height: 18px;
  margin-right: 5px;
}

.ant-modal-mask,.ant-modal-wrap{
  z-index: 2018;
}
.content-title{
  color: #1c84c6;
}
.content-title:hover{
  color: #83b6e3;
}

.z-table{
  width: 100%;
  height: auto;
  border-top: 1px solid rgba(0,0,0,.06);
}
.z-table-row{
  width: 100%;
  height: 80px;
  border-bottom: 1px solid rgba(0,0,0,.06);
  border-radius: 2px;
  padding: 10px 12px;
  cursor: move;
}
.z-table-row:hover{
  background: #F5F7FA;
}
.z-table-row-left{
  width: 50%;
  height: 100%;
  float: left;
}
.z-table-row-left .news-details{
  margin-top: 10px;
}
.z-table-row-left .news-details>div{
  width: 80px;
  float: left;
}
.z-table-row-left .news-title{
  width: 100%;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.z-table-row-left .news-details-icon{
  margin-left: 12px;
  height: 28px;
  display: flex;
  align-items: center;
  float: left;
}
.z-table-row-left .news-details-icon span{
  margin-left: 5px;
}
.z-table-row-left .news-title a{
  margin-left: 10px;
  color: #1c84c6;
}
.z-table-row-left .news-title span{
  color: rgba(0,0,0,0.65)!important;
}
.z-table-row-left .news-title a:hover{
  color: #83b6e3;
}
.z-table-row-right{
  width: 50%;
  height: 100%;
  float: right;
}
.z-table-row-right .create-by{
  float: right;
}
.z-table-row-right .create-by span{
  margin-left: 20px;
}
.z-table-row-right .operate-buttons{
  width: 100%;
  margin-top: 10px;
  float: right;
  display: flex;
  justify-content: flex-end;
}
.z-table .not-list{
  width: 100%;
  text-align: center;
  display: block;
  line-height: 70px;
}
.z-table-row-right .operate-buttons button{
  margin-left: 15px;
}
.sortable-chosen{
  background-color: #F5F7FA !important;
}

</style>
