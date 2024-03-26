<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="用户id" prop="userId">
        <el-input
          v-model="queryParams.userId"
          placeholder="请输入用户id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="文件大小" prop="resourceSize">
        <el-input
          v-model="queryParams.resourceSize"
          placeholder="请输入文件大小"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="文件路径" prop="resourceUrl">
        <el-input
          v-model="queryParams.resourceUrl"
          placeholder="请输入文件路径"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="图片尺寸" prop="resourceDimensions">
        <el-input
          v-model="queryParams.resourceDimensions"
          placeholder="请输入图片尺寸"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="视频时长" prop="resourceDate">
        <el-input
          v-model="queryParams.resourceDate"
          placeholder="请输入视频时长"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="文件别名" prop="resourceAlias">
        <el-input
          v-model="queryParams.resourceAlias"
          placeholder="请输入文件别名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="上传云存储ID" prop="uploadOssId">
        <el-input
          v-model="queryParams.uploadOssId"
          placeholder="请输入上传云存储ID"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="后缀名" prop="suffix">
        <el-input
          v-model="queryParams.suffix"
          placeholder="请输入后缀名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="视频抽帧id" prop="videoCoverId">
        <el-input
          v-model="queryParams.videoCoverId"
          placeholder="请输入视频抽帧id"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否显示在资源库" prop="isDisplay">
        <el-input
          v-model="queryParams.isDisplay"
          placeholder="请输入是否显示在资源库"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否删除" prop="isDelete">
        <el-input
          v-model="queryParams.isDelete"
          placeholder="请输入是否删除"
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
          v-hasPermi="['web:files:add']"
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
          v-hasPermi="['web:files:edit']"
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
          v-hasPermi="['web:files:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['web:files:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="filesList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="id" />
      <el-table-column label="用户id" align="center" prop="userId" />
      <el-table-column label="共享状态" align="center" prop="shareStatus" />
      <el-table-column label="文件大小" align="center" prop="resourceSize" />
      <el-table-column label="文件类型" align="center" prop="resourceType" />
      <el-table-column label="文件路径" align="center" prop="resourceUrl" />
      <el-table-column label="图片尺寸" align="center" prop="resourceDimensions" />
      <el-table-column label="视频时长" align="center" prop="resourceDate" />
      <el-table-column label="文件别名" align="center" prop="resourceAlias" />
      <el-table-column label="上传云存储ID" align="center" prop="uploadOssId" />
      <el-table-column label="后缀名" align="center" prop="suffix" />
      <el-table-column label="视频抽帧id" align="center" prop="videoCoverId" />
      <el-table-column label="是否显示在资源库" align="center" prop="isDisplay" />
      <el-table-column label="是否删除" align="center" prop="isDelete" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['web:files:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['web:files:remove']"
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

    <!-- 添加或修改资源库对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="用户id" prop="userId">
          <el-input v-model="form.userId" placeholder="请输入用户id" />
        </el-form-item>
        <el-form-item label="文件大小" prop="resourceSize">
          <el-input v-model="form.resourceSize" placeholder="请输入文件大小" />
        </el-form-item>
        <el-form-item label="文件路径" prop="resourceUrl">
          <el-input v-model="form.resourceUrl" placeholder="请输入文件路径" />
        </el-form-item>
        <el-form-item label="图片尺寸" prop="resourceDimensions">
          <el-input v-model="form.resourceDimensions" placeholder="请输入图片尺寸" />
        </el-form-item>
        <el-form-item label="视频时长" prop="resourceDate">
          <el-input v-model="form.resourceDate" placeholder="请输入视频时长" />
        </el-form-item>
        <el-form-item label="文件别名" prop="resourceAlias">
          <el-input v-model="form.resourceAlias" placeholder="请输入文件别名" />
        </el-form-item>
        <el-form-item label="上传云存储ID" prop="uploadOssId">
          <el-input v-model="form.uploadOssId" placeholder="请输入上传云存储ID" />
        </el-form-item>
        <el-form-item label="后缀名" prop="suffix">
          <el-input v-model="form.suffix" placeholder="请输入后缀名" />
        </el-form-item>
        <el-form-item label="视频抽帧id" prop="videoCoverId">
          <el-input v-model="form.videoCoverId" placeholder="请输入视频抽帧id" />
        </el-form-item>
        <el-form-item label="是否显示在资源库" prop="isDisplay">
          <el-input v-model="form.isDisplay" placeholder="请输入是否显示在资源库" />
        </el-form-item>
        <el-form-item label="是否删除" prop="isDelete">
          <el-input v-model="form.isDelete" placeholder="请输入是否删除" />
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
import { listFiles, getFiles, delFiles, addFiles, updateFiles } from "@/api/web/files";

export default {
  name: "Files",
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
      // 资源库表格数据
      filesList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        userId: null,
        shareStatus: null,
        resourceSize: null,
        resourceType: null,
        resourceUrl: null,
        resourceDimensions: null,
        resourceDate: null,
        resourceAlias: null,
        uploadOssId: null,
        suffix: null,
        videoCoverId: null,
        isDisplay: null,
        isDelete: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        userId: [
          { required: true, message: "用户id不能为空", trigger: "blur" }
        ],
        shareStatus: [
          { required: true, message: "共享状态不能为空", trigger: "change" }
        ],
        resourceSize: [
          { required: true, message: "文件大小不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询资源库列表 */
    getList() {
      this.loading = true;
      listFiles(this.queryParams).then(response => {
        this.filesList = response.rows;
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
        userId: null,
        shareStatus: null,
        resourceSize: null,
        resourceType: null,
        resourceUrl: null,
        resourceDimensions: null,
        resourceDate: null,
        resourceAlias: null,
        uploadOssId: null,
        suffix: null,
        videoCoverId: null,
        isDisplay: null,
        createBy: null,
        createTime: null,
        isDelete: null
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
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加资源库";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getFiles(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改资源库";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateFiles(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addFiles(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除资源库编号为"' + ids + '"的数据项？').then(function() {
        return delFiles(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('web/files/export', {
        ...this.queryParams
      }, `files_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
