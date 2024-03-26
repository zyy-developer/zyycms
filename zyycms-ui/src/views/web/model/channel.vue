<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="模型名称" prop="modelName">
        <el-input
          v-model="queryParams.modelName"
          placeholder="请输入模型名称"
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
          v-hasPermi="['web:model:add']"
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
          v-hasPermi="['web:model:edit']"
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
          v-hasPermi="['web:model:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['web:model:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="modelList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="modelId" />
      <el-table-column label="模型名称" align="center" prop="modelName" />
      <el-table-column label="状态" align="center" prop="stage">
        <template slot-scope="scope">
          <el-switch
            v-model="scope.row.stage=='0'"
            @change="updateStage(scope.row)"
            active-color="#13ce66"
            :title="scope.row.stage=='0'?'停用':'启用'"
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
            @click="doFiled(scope.row.modelId)"
          >模型字段</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['web:model:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['web:model:remove']"
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

    <!-- 添加或修改模型对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="600px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="模型名称" prop="modelName">
          <el-input v-model="form.modelName" placeholder="请输入模型名称" />
        </el-form-item>
        <el-form-item label="PC端模板" prop="tempDefault">
          <el-select v-model="form.tempDefault" placeholder="请选择模板" clearable>
            <el-option v-for="item in tempDefaultList" :key="item" :label="item" :value="item"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="移动端模板" prop="tempMobile">
          <el-select v-model="form.tempMobile" placeholder="请选择模板" clearable>
            <el-option v-for="item in tempMobileList" :key="item" :label="item" :value="item"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="模型范围" prop="isPublic">
          <el-radio-group v-model="form.isPublic">
            <el-radio
              v-for="dict in dict.type.cms_model_display"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listModel, getModel, delModel, addModel, updateModel } from "@/api/web/model";
import { getTempList } from "@/api/web/template";

export default {
  name: "Model",
  dicts: ['cms_model_display'],
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
      // 模型表格数据
      modelList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        modelName: null,
        modelCode: null,
        modelCodeAdmin: null,
        modelType:'channel'
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      },
      tempDefaultList:[],
      tempMobileList:[]
    };
  },
  created() {
    this.getList();
    this.getTemplateList("channel");
  },
  methods: {
    /** 查询模型列表 */
    getList() {
      this.loading = true;
      listModel(this.queryParams).then(response => {
        this.modelList = response.rows;
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
        modelId: null,
        modelName: null,
        modelCode: null,
        modelCodeAdmin: null,
        createTime: null,
        modelType:'channel',
        tempDefault: null,
        tempMobile: null,
        stage: '0',
        isPublic: '1',
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
      this.ids = selection.map(item => item.modelId)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加模型";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const modelId = row.modelId || this.ids
      getModel(modelId).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改模型";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.modelId != null) {
            updateModel(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            this.form.modelCode='{"list":[],"config":{"layout":"horizontal","labelCol":{"xs":4,"sm":4,"md":4,"lg":4,"xl":4,"xxl":4},"labelWidth":100,"labelLayout":"flex","wrapperCol":{"xs":18,"sm":18,"md":18,"lg":18,"xl":18,"xxl":18},"hideRequiredMark":false,"customStyle":""}}'
            addModel(this.form).then(response => {
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
      const modelIds = row.modelId || this.ids;
      this.$modal.confirm('是否确认删除模型编号为"' + modelIds + '"的数据项？').then(function() {
        return delModel(modelIds);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('web/model/export', {
        ...this.queryParams
      }, `model_${new Date().getTime()}.xlsx`)
    },
    /** 模型字段 */
    doFiled(val){
      this.$router.push({ path: "/model/builder", query: {modelId: val} });
    },
    /** 获取模板列表 */
    getTemplateList(name){
      getTempList(name).then(response=>{
        let pcList=[],mobileList=[];
        if((typeof response.pcTemps==="undefined")==false) {
          let pctemps = response.pcTemps;
          pctemps.forEach(item => {
            var isOS = item.lastIndexOf("\\") == -1 ? item.lastIndexOf("/") : item.lastIndexOf("\\");
            pcList.push(item.substring(isOS + 1, item.length))
          })
          this.tempDefaultList=pcList;
        }
        if((typeof response.mobileTemps==="undefined")==false) {
          let mobileTemps = response.mobileTemps;
          mobileTemps.forEach(item => {
            var isOS = item.lastIndexOf("\\") == -1 ? item.lastIndexOf("/") : item.lastIndexOf("\\");
            mobileList.push(item.substring(isOS + 1, item.length))
          })
          this.tempMobileList=mobileList;
        }
      })
    },
    /** 修改状态 */
    updateStage(row){
      if(row.stage=="0"){
        row.stage="1";
      }else{
        row.stage="0";
      }
      updateModel({modelId:row.modelId,stage:row.stage}).then(response => {
        if(response.code==200){
          this.$modal.msgSuccess("修改成功");
        }
      })
    }
  }
};
</script>
