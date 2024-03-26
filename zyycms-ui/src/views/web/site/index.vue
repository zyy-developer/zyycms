<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="站点名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入站点名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="站点目录" prop="directory">
        <el-input
          v-model="queryParams.directory"
          placeholder="请输入站点目录"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="域名" prop="domainName">
        <el-input
          v-model="queryParams.domainName"
          placeholder="请输入域名"
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
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['web:site:edit']"
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
          v-hasPermi="['web:site:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['web:site:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table default-expand-all v-loading="loading" row-key="id" :data="siteList" @selection-change="handleSelectionChange" :tree-props="{children: 'children', hasChildren: 'hasChildren'}">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="id" />
      <el-table-column label="站点名称" align="center" prop="name" />
      <el-table-column label="站点目录" align="center" prop="directory" />
      <el-table-column label="域名" align="center" prop="domainName" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-view"
            @click="handleInfo(scope.row)"
          >预览</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['web:site:edit']"
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
            v-if="scope.row.directory!='www'"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['web:site:remove']"
          >删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改站点对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="1000px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="120px">
        <el-row :span="24">
          <el-col :span="12">
            <el-form-item label="站点名称" prop="name">
              <el-input v-model="form.name" placeholder="请输入站点名称" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="站点目录" prop="directory">
              <el-input v-model="form.directory" placeholder="请输入站点目录" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :span="24">
          <el-col :span="12">
            <el-form-item label="域名" prop="domainName">
              <el-input v-model="form.domainName" placeholder="请输入域名" class="input-with-select">
                <el-select v-model="form.requestMethod" slot="prepend" placeholder="请选择" >
                  <el-option label="http" value="http"></el-option>
                  <el-option label="https" value="https"></el-option>
                </el-select>
              </el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="首页模板" v-if="form.id !=null">
              <el-select v-model="setup.siteHomePath" placeholder="请选择模板">
                <el-option v-for="item in tempDefaultList" :key="item" :label="item" :value="item"></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :span="24">
          <el-col :span="12">
            <el-form-item label="PC端模板方案">
              <el-select v-model="setup.siteTempSchemePc" placeholder="请选择模板方案">
                <el-option v-for="item in templateSchemeList" :key="item" :label="item" :value="item"></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="移动端模板方案">
              <el-select v-model="setup.siteTempSchemeMobile" placeholder="请选择模板方案">
                <el-option v-for="item in templateSchemeList" :key="item" :label="item" :value="item"></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :span="24">
          <el-col :span="12">
            <el-form-item label="站点启停">
              <el-radio-group v-model="setup.siteStop">
                <el-radio
                  v-for="dict in dict.type.cms_setup_stage"
                  :key="dict.value"
                  :label="dict.value"
                >{{dict.label}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="一键变灰">
              <el-radio-group v-model="setup.siteGrayscale">
                <el-radio
                  v-for="dict in dict.type.cms_setup_stage"
                  :key="dict.value"
                  :label="dict.value"
                >{{dict.label}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :span="24">
          <el-col :span="12">
            <el-form-item label="屏幕自适应">
              <el-radio-group v-model="setup.siteAdaption">
                <el-radio
                  v-for="dict in dict.type.cms_setup_stage"
                  :key="dict.value"
                  :label="dict.value"
                >{{dict.label}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="网站静态化">
              <el-radio-group v-model="setup.siteStatic">
                <el-radio
                  v-for="dict in dict.type.cms_setup_stage"
                  :key="dict.value"
                  :label="dict.value"
                >{{dict.label}}</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :span="24">
          <el-col :span="12">
            <el-form-item label="上传logo">
              <imageUpload v-model="setup.siteLogo" :limit="1" :fileType="['png', 'jpg', 'jpeg']"></imageUpload>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="上传favicon">
              <imageUpload v-model="setup.siteFavicon" :limit="1" :fileType="['ico']" :fileSize="1"></imageUpload>
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :span="24">
            <el-form-item label="网站风格">
              <el-radio v-model="setup.siteTempStyle" label="">默认</el-radio>
              <el-radio v-model="setup.siteTempStyle" v-for="item in templateStyleList" :label="item.tempSuffix">{{item.name}}</el-radio>
            </el-form-item>
        </el-row>
        <el-row :span="24">
            <el-form-item label="SEO标题" prop="domainName">
              <el-input v-model="setup.siteSeoTitle" placeholder="请输入SEO标题" />
            </el-form-item>
        </el-row>
        <el-row :span="24">
          <el-form-item label="SEO关键词">
            <el-input v-model="setup.siteSeoKeywords" placeholder="请输入SEO关键词" />
          </el-form-item>
        </el-row>
        <el-row :span="24">
            <el-form-item label="SEO描述" prop="domainName">
              <el-input type="textarea" :rows="4" v-model="setup.siteSeoDesc" placeholder="请输入SEO描述" />
            </el-form-item>
        </el-row>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listSite, getSite, delSite, addSite, updateSite } from "@/api/web/site";
import { getTempList } from "@/api/web/template";
export default {
  name: "Site",
  dicts: ['cms_setup_stage','cms_water_mark_position','cms_storage_location'],
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
      // 总条数
      total: 0,
      // 站点表格数据
      siteList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        directory: null,
        domainName: null,
      },
      // 表单参数
      form: {},
      // 站点设置
      setup: {},
      // 表单校验
      rules: {
        name: [
          { required: true, message: "站点名称不能为空", trigger: "blur" }
        ],
        directory: [
          { required: true, message: "站点目录不能为空", trigger: "blur" }
        ],
      },
      fileInfo:null,
      //首页模板列表
      tempDefaultList:[],
      //模板方案列表
      templateSchemeList:["default","mobile"],
      //模板风格列表
      templateStyleList: [],
    };
  },
  created() {
    this.getList();
   // this.getTempStyleList();
  },
  methods: {
    /** 查询站点列表 */
    getList() {
      this.loading = true;
      listSite(this.queryParams).then(response => {
        this.siteList = this.handleTree(response.rows,'id');
        this.total = response.total;
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
        name: null,
        directory: null,
        domainName: null,
        requestMethod: "http",
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
      };
      this.setup = {
        siteId: null,
        siteStatic: "1",
        siteFavicon: null,
        siteLogo: null,
        siteGrayscale: "1",
        siteAdaption: "1",
        siteStop: "0",
        siteHomePath: null,
        siteSeoTitle: null,
        siteSeoDesc: null,
        siteSeoKeywords: null,
        siteTempSchemePc: "default",
        siteTempSchemeMobile: "mobile",
        siteTempStyle: "",
        siteWaterMark: "1",
        siteWaterPath: null,
        siteWaterPosition: "topLeft",
        siteWaterProp: 100,
        siteWaterOpacity: 1.00,
        siteStorageLocation: "0",
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
      this.ids = selection.map(item => item.id)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd(row) {
      this.reset();
      if (row != null && row.id) {
        this.form.parentId = row.id;
      }
      this.open = true;
      this.title = "添加站点";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      this.getTempList("index");
      getSite(id).then(response => {
        this.form = response.data;
        this.setup = response.data.setup;
        this.open = true;
        this.title = "修改站点";
      });
    },
    /** 预览站点 */
    handleInfo(row){
      window.open(row.url)
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          this.form.setup=this.setup;
          if (this.form.id != null) {
            updateSite(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addSite(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除站点编号为"' + ids + '"的数据项？').then(function() {
        return delSite(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('web/site/export', {
        ...this.queryParams
      }, `site_${new Date().getTime()}.xlsx`)
    },
    /** 获取模板列表 */
    getTempList(name){
      getTempList(name).then(response=>{
        let pcList=[],mobileList=[];
        let pctemps=response.pcTemps;
        pctemps.forEach(item =>{
          var isOS=item.lastIndexOf("\\")==-1?item.lastIndexOf("/"):item.lastIndexOf("\\");
          pcList.push(item.substring(isOS+1,item.length))
        })
        let mobileTemps=response.mobileTemps;
        mobileTemps.forEach(item =>{
          var isOS=item.lastIndexOf("\\")==-1?item.lastIndexOf("/"):item.lastIndexOf("\\");
          mobileList.push(item.substring(isOS+1,item.length))
        })
        this.tempDefaultList=pcList;
        // this.tempMobileList=mobileList;
      })
    },
  }
};
</script>
<style>
.input-with-select .el-input-group__prepend {
  width: 70px;
  padding: 0 15px;
}
.el-upload-list--picture-card .el-upload-list__item-thumbnail{
  object-fit: contain;
}
</style>
