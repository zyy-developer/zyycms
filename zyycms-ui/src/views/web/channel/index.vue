<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="栏目名称" prop="channelName">
        <el-input
          v-model="queryParams.channelName"
          placeholder="请输入栏目名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['web:channel:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['web:channel:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['web:channel:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="info"
          plain
          icon="el-icon-sort"
          size="mini"
          @click="toggleExpandAll"
        >展开/折叠</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          @click="openRecycleBinOpen"
        >回收站</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-s-promotion"
          size="mini"
          @click="staticHtml('all')"
          :loading="btnLoading"
          v-if="siteStatic"
        >全站页面生成</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-s-promotion"
          size="mini"
          @click="staticHtml('index')"
          :loading="btnLoading"
          v-if="siteStatic"
        >首页生成</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-s-promotion"
          size="mini"
          @click="staticHtml('channel')"
          :loading="btnLoading"
          v-if="siteStatic"
        >栏目页生成</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-s-promotion"
          size="mini"
          @click="staticHtml('content')"
          :loading="btnLoading"
          v-if="siteStatic"
        >内容页生成</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-if="refreshTable" v-loading="loading" row-key="channelId" :data="channelList" :tree-props="{children: 'children', hasChildren: 'hasChildren'}"
              :default-expand-all="isExpandAll"  @selection-change="handleSelectionChange">
      <el-table-column label="栏目名称" align="left" prop="channelName">
        <template slot-scope="scope">
          <a @click="gotoChannelPage(scope.row.url)" target="_blank">{{scope.row.channelName}}</a>
        </template>
      </el-table-column>
      <el-table-column label="id" align="center" prop="channelId" />
      <el-table-column label="访问链接" align="center" prop="path" />
      <el-table-column label="栏目模型" align="center" prop="modelName" />
      <el-table-column label="排序" align="center" prop="orderNum" />
      <el-table-column label="状态" align="center" prop="stage">
        <template slot-scope="scope">
          <el-switch
            v-model="scope.row.stage=='0'"
            @change="updateStage(scope.row)"
            :title="scope.row.stage=='0'?'隐藏':'显示'"
            active-color="#13ce66"
            inactive-color="#ff4949">
          </el-switch>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['web:channel:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-plus"
            @click="handleAdd(scope.row)"
            v-hasPermi="['web:channel:add']"
          >新增</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="toRecoveryBin(scope.row)"
            v-hasPermi="['web:channel:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!-- 添加或修改栏目对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="1000px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="上级栏目" prop="parentId">
          <treeselect
            v-model="form.parentId"
            :options="channelTreeList"
            :show-count="true"
            placeholder="选择栏目"
          />
        </el-form-item>
        <el-form-item label="栏目名称" prop="channelName">
          <el-input v-model="form.channelName" placeholder="请输入栏目名称" @input="getChannelPath"/>
        </el-form-item>
        <el-row>
          <el-col :span="12">
            <el-form-item label="内容模型">
              <el-select v-model="form.contentModel" multiple placeholder="请选择内容模型">
                <el-option
                  v-for="item in modelList"
                  :key="item.modelId"
                  :label="item.modelName"
                  :value="item.modelId"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="栏目模型" prop="channelModel">
              <el-select v-model="form.channelModel" placeholder="请选择栏目模型" @change="getModelInfo()">
                <el-option
                  v-for="item in channelModelList"
                  :key="item.modelId"
                  :label="item.modelName"
                  :value="item.modelId"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="访问链接" prop="path">
              <el-input v-model="form.path" placeholder="请输入访问链接" :disabled="title=='修改栏目'"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="排序" prop="orderNum">
              <el-input v-model="form.orderNum" placeholder="请输入排序"/>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="外部链接" prop="externalLink">
              <el-input v-model="form.externalLink" placeholder="请输入外部链接"/>
            </el-form-item>
          </el-col>
          <el-col :span="12">

          </el-col>
        </el-row>
        <el-row>
          <el-col :span="12">
            <el-form-item label="PC端模板" prop="tempId">
              <el-select v-model="form.tempId" placeholder="请选择模板" clearable>
                <el-option v-for="item in pcTempList" :key="item" :label="item" :value="item"></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="移动端模板" prop="tempMobile">
              <el-select v-model="form.tempMobile" placeholder="请选择模板" clearable>
                <el-option v-for="item in mobileTempList" :key="item" :label="item" :value="item"></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>

        <div class="zdy-form">
          <k-form-build
            :defaultValue="defaultValue"
            :value="jsonData"
            ref="KFB"
            :config="config"
          />
          <!--              <button>提交</button>-->
        </div>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 回收站对话框 -->
    <el-dialog title="回收站" :visible.sync="recycleBinOpen" width="1000px" append-to-body>
      <el-table
        :data="recycleData"
        style="width: 100%">
        <el-table-column
          prop="channelName"
          label="栏目名称"
          width="300">
        </el-table-column>
        <el-table-column
          prop="path"
          label="栏目路径"
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
import { listChannel, getChannel, delChannel, addChannel, updateChannel, getChannelPath, getChannelPathIsNull,treeselect } from "@/api/web/channel";
import {updateModel,getModel,listModel,selectModels} from '@/api/web/model';
import { getSite } from "@/api/web/site";
import { toAllPage, toIndexPage, toChannelPage, toContentPage} from '@/api/web/staticPage';
import {getToken} from "@/utils/auth";
import Template from "@/views/web/template";
import { getTempList } from "@/api/web/template";
import Treeselect from "@riophae/vue-treeselect";
import "@riophae/vue-treeselect/dist/vue-treeselect.css";
import Cookies from "js-cookie";
import { getCacheValue } from "@/api/monitor/cache";

export default {
  name: "Channel",
  dicts: ['cms_channel_stage'],
  components: {Template,Treeselect},
  data() {
    return {
      // 是否展开，默认全部折叠
      isExpandAll: false,
      // 重新渲染表格状态
      refreshTable: true,
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
      // 总条数
      total: 0,
      // 栏目表格数据
      channelList: [],
      // 内容模型列表
      modelList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        parentId: null,
        channelName: null,
        path: null,
        externalLink: null,
        orderNum: null,
        tempId: null,
        stage: null,
        isDelete: '0',
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        parentId:[
          {required: true, message: "上级栏目不能为空", trigger: "change"}
        ],
        channelName: [
          { required: true, message: "栏目名称不能为空", trigger: "blur" }
        ],
        path: [
          { required: true, trigger: "blur" , validator: this.validatePath }
        ],
        createTime: [
          { required: true, message: "创建时间不能为空", trigger: "blur" }
        ],
        channelModel: [
          { required: true, message: "请选择栏目模型", trigger: "change" }
        ]
      },
      pcTempList:[],
      mobileTempList:[],
      channelModelList:[],
      //自定义表单
      defaultValue: {},
      jsonData:{},
      config: {
        uploadFile: process.env.VUE_APP_BASE_API+"/common/uploadtocms", // 上传文件地址
        uploadImage: process.env.VUE_APP_BASE_API+"/common/uploadtocms", // 上传图片地址
        uploadFileName: "file", // 上传文件name
        uploadImageName: "file", // 上传图片name
        uploadFileData: {  }, // 上传文件额外参数
        uploadImageData: {  }, // 上传图片额外参数
        uploadFileHeaders: { Authorization: "Bearer " + getToken() }, // 上传文件请求头部
        uploadImageHeaders: { Authorization: "Bearer " + getToken() } // 上传图片请求头部
      },
      //工作流
      actives: [],
      formList: {
        list: [],
        inputs: '',
        searchResult: []
      },
      //静态化开启
      siteStatic: false,
      //站点地址
      siteUrl: null,
      //按钮加载中
      btnLoading: false,
      // 栏目树
      channelTreeList: [],
      // 回收站弹窗
      recycleBinOpen: false,
      // 回收站列表数据
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
  created() {
    this.getSiteInfo();
    this.getList();
    this.getModelList();
    this.getChannelModelList();
    this.getTempList("channel");
    this.getGroups();
    this.getTreeselect();
  },
  methods: {
    //获取站点信息
    getSiteInfo(){
      let siteId=parseInt(Cookies.get("siteId"));
      getSite(siteId).then(response=>{
        this.siteUrl=response.data.url;
        if(response.data.setup.siteStatic=="0"){
          this.siteStatic=true;
        }
      })
    },
    /** 查询栏目列表 */
    getList() {
      this.loading = true;
      listChannel(this.queryParams).then(response => {
        this.channelList = this.handleTree(response.rows,"channelId");
        this.total = response.total;
        this.loading = false;
      });
    },
    /** 获取回收站文章数据 */
    getRecycleDataList(){
      listChannel(this.recycleQueryParams).then(response => {
        this.recycleData=response.rows;
        this.recycleDataTotal=response.total;
        this.loading = false;
      });
    },
    //获取内容模型列表
    getModelList(){
      listModel({modelType:'content'}).then(response =>{
        this.modelList=response.rows;
      })
    },
    //获取栏目模型列表
    getChannelModelList(){
      listModel({modelType:'channel'}).then(response =>{
        this.channelModelList=response.rows;
      })
    },
    /** 转换菜单数据结构 */
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
         this.channelTreeList = [];
         const channel = { id: 0, label: '最上级栏目', children: [] };
         channel.children = response.data;
         this.channelTreeList.push(channel);
      })
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        channelId: null,
        parentId: 0,
        channelName: null,
        path: null,
        externalLink: null,
        orderNum: null,
        tempId: null,
        tempMobile:null,
        stage: "0",
        createTime: null,
        contentModel:null,
        // contentModelIds:null,
        contentModelList: null,
        channelModel:null,
        examineTempId:null,
      };
      this.resetForm("form");
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
      this.ids = selection.map(item => item.channelId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 展开/折叠操作 */
    toggleExpandAll() {
      this.refreshTable = false;
      this.isExpandAll = !this.isExpandAll;
      this.$nextTick(() => {
        this.refreshTable = true;
      });
    },
    /** 新增按钮操作 */
    handleAdd(row) {
      this.reset();
      if(this.$refs["KFB"]!=null) {
        this.jsonData={};
        this.$refs["KFB"].reset();
      }
      if (row != null && row.channelId != null) {
        this.form.parentId = row.channelId;
      }
      if (row != null && row.channelModel != null){
        this.form.channelModel=row.channelModel;
        this.getModelInfo(this.form.attr);
      }
      this.open = true;
      this.title = "添加栏目";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      this.getTreeselect();
      const channelId = row.channelId || this.ids
      getChannel(channelId).then(response => {
        this.form = response.data;
        if(this.form.contentModel=="[]"){
          this.form.contentModel=[];
        }
        if(this.form.contentModelList!=null){
          this.form.contentModel=[];
          for (let i = 0; i < response.data.contentModelList.length; i++) {
            this.form.contentModel.push(response.data.contentModelList[i].modelId)
          }
        }
        this.open = true;
        this.title = "修改栏目";
        this.getModelInfo(this.form.attr);
      });

    },
    StringtoArray(str){
      if(str!=null){
        str = str.substr(1); //删除第一个字符
        str = str.substr(0, str.length - 1);
        var strleng=str.split(",");
        var list=[];
        for (let i = 0; i < strleng.length; i++) {
          list.push(parseInt(strleng[i]))
        }
        return list;
      }
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.contentModelList=[];
          if(this.form.contentModel!=null&&this.form.contentModel!="null"){
            for (let i = 0; i <this.form.contentModel.length ; i++) {
              var data={
                modelId:this.form.contentModel[i]
              }
              this.form.contentModelList.push(data)
            }
          }
          this.form.contentModel=null;
          const attrList=this.$refs.KFB.value.list;
          if (this.form.channelId != null) {
            if(attrList.length==0){
              updateChannel(this.form).then(response => {
                this.$modal.msgSuccess("修改成功");
                this.open = false;
                this.getList();
              });
            }else {
              this.$refs.KFB.getData().then(res => {
                this.form.attr = res;
                updateChannel(this.form).then(response => {
                  this.$modal.msgSuccess("修改成功");
                  this.open = false;
                  this.getList();
                });
              })
            }
          } else {
            if(attrList.length==0){
              addChannel(this.form).then(response => {
                this.$modal.msgSuccess("新增成功");
                this.open = false;
                this.getList();
              });
            }else {
              this.$refs.KFB.getData().then(res => {
                this.form.attr=res;
                addChannel(this.form).then(response => {
                  this.$modal.msgSuccess("新增成功");
                  this.open = false;
                  this.getList();
                });
              })
            }
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const channelIds = row.channelId || this.ids;
      this.$modal.confirm('是否确认删除栏目编号为"' + channelIds + '"的数据项？').then(function() {
        return delChannel(channelIds);
      }).then(() => {
        this.getList();
        this.getRecycleDataList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 移入回收站 */
    toRecoveryBin(row){
      var data={
        channelId: row.channelId,
        isDelete: '1',
      }
      this.$modal.confirm('是否将此栏目移入回收站？').then(function() {
        return updateChannel(data);
      }).then(()=>{
        this.getList();
        this.$modal.msgSuccess("操作成功");
      }).catch(() => {});
    },
    /** 还原栏目 */
    reductionItem(row){
      var data={
        channelId: row.channelId,
        isDelete: '0',
      }
      this.$modal.confirm('是否将此栏目移出回收站？').then(function() {
        return updateChannel(data);
      }).then(()=>{
        this.getList();
        this.getRecycleDataList();
        this.$modal.msgSuccess("还原成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('web/channel/export', {
        ...this.queryParams
      }, `channel_${new Date().getTime()}.xlsx`)
    },
    /** 获取栏目名称首字母 */
    getChannelPath(){
      if(this.title != "修改栏目") {
        let channelName = this.form.channelName;
        getChannelPath(channelName).then(response => {
          this.form.path = response;
        })
      }
    },
    /** 获取模板列表 */
    getTempList(name){
      getTempList(name).then(response=>{
        let pcList=[],mobileList=[];
        if((typeof response.pcTemps==="undefined")==false) {
          let pctemps=response.pcTemps;
          pctemps.forEach(item => {
            var isOS = item.lastIndexOf("\\") == -1 ? item.lastIndexOf("/") : item.lastIndexOf("\\");
            pcList.push(item.substring(isOS + 1, item.length))
          })
        }
        if((typeof response.mobileTemps==="undefined")==false) {
          let mobileTemps=response.mobileTemps;
          mobileTemps.forEach(item => {
            var isOS = item.lastIndexOf("\\") == -1 ? item.lastIndexOf("/") : item.lastIndexOf("\\");
            mobileList.push(item.substring(isOS + 1, item.length))
          })
        }
        this.pcTempList=pcList;
        this.mobileTempList=mobileList;
      })
    },
    /** 修改状态 */
    updateStage(row){
      if(row.stage=="0"){
        row.stage="1";
      }else{
        row.stage="0";
      }
      updateChannel({channelId:row.channelId,stage:row.stage}).then(response => {
        if(response.code==200){
          this.$modal.msgSuccess("修改成功");
        }
      })
    },
    //校验访问链接是否重复
    validatePath(rule, value, callback){
      if(value==null||value==""){
        callback(new Error('不能为空'))
      }else if(this.title=='添加栏目'){
        getChannelPathIsNull(value).then(response =>{
          if(response==false){
            callback(new Error('链接名称重复，请更改后重试'))
          }else{
            callback()
          }
        })
      }else{
        callback()
      }
    },
    //获取模型内容
    getModelInfo(attr){
      getModel(this.form.channelModel).then(response =>{
        if(response.code==200){
          let modelCode=eval('('+response.data.modelCode+')');
          this.$refs["KFB"].reset();
          if (modelCode != null) {
            this.jsonData = modelCode;
            if (attr != null) {
              this.$refs["KFB"].setData(attr)
            }
          }
        }
      })
    },
    //静态页面生成
    staticHtml(type){
      this.btnLoading=true;
      if (type=="all"){
        this.$modal.msgWarning("生成全站页面由于页面较多，生成速度会比较慢，请耐心等待即可！");
        toAllPage().then(response => {
          this.btnLoading=false;
          if(response.code==200){
            this.$modal.msgSuccess("生成全站页面成功！");
          }
        })
      }else if(type=="index") {
        toIndexPage().then(response => {
          this.btnLoading=false;
          if(response.code==200){
            this.$modal.msgSuccess("生成首页成功！");
          }
        })
      }else if(type=="channel"){
        toChannelPage().then(response =>{
          this.btnLoading=false;
          if(response.code==200){
            this.$modal.msgSuccess("生成栏目页成功！");
          }
        })
      }else if(type=="content"){
        toContentPage().then(response =>{
          this.btnLoading=false;
          if(response.code==200){
            this.$modal.msgSuccess("生成内容页成功！");
          }
        })
      }
    },
    //栏目浏览
    gotoChannelPage(url){
      if(url.indexOf("/c/") !=-1){
        url=url.substring(url.lastIndexOf("/"),url.length)
      }
      window.open(this.siteUrl+url)
    },
    // 打开回收站弹框
    openRecycleBinOpen(){
      this.recycleBinOpen=true;
      this.getRecycleDataList();
    }
  }
};
</script>
<style>
.ant-modal-mask,.ant-modal-wrap{
  z-index: 2018;
}
.ant-form-item-children{
  position: relative;
  display: block;
  height: auto;
}
.zdy-form{
  height: auto;
  overflow: auto;
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
