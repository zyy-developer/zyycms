<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="姓名/单位" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入姓名/单位"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="捐赠金额" prop="money">
        <el-input
          v-model="queryParams.money"
          placeholder="请输入捐赠金额"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="捐赠项目" prop="porjectId">
        <el-input
          v-model="queryParams.porjectId"
          placeholder="请输入捐赠项目"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="手机号" prop="phone">
        <el-input
          v-model="queryParams.phone"
          placeholder="请输入手机号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="专业" prop="speciality">
        <el-input
          v-model="queryParams.speciality"
          placeholder="请输入专业"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否公开姓名" prop="isShowName">
        <el-input
          v-model="queryParams.isShowName"
          placeholder="请输入是否公开姓名"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="留言" prop="message">
        <el-input
          v-model="queryParams.message"
          placeholder="请输入留言"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="是否已经支付" prop="isPay">
        <el-input
          v-model="queryParams.isPay"
          placeholder="请输入是否已经支付"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="捐赠时间" prop="payTime">
        <el-date-picker clearable
          v-model="queryParams.payTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择捐赠时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="电子证书路径" prop="certificate">
        <el-input
          v-model="queryParams.certificate"
          placeholder="请输入电子证书路径"
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
          v-hasPermi="['web:donate:add']"
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
          v-hasPermi="['web:donate:edit']"
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
          v-hasPermi="['web:donate:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['web:donate:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="donateList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="id" />
      <el-table-column label="姓名/单位" align="center" prop="name" />
      <el-table-column label="捐赠金额" align="center" prop="money" />
      <el-table-column label="捐赠项目" align="center" prop="porjectId" />
      <el-table-column label="手机号" align="center" prop="phone" />
      <el-table-column label="入学年份" align="center" prop="enrollmentYear" />
      <el-table-column label="专业" align="center" prop="speciality" />
      <el-table-column label="是否公开姓名" align="center" prop="isShowName" />
      <el-table-column label="留言" align="center" prop="message" />
      <el-table-column label="是否已经支付" align="center" prop="isPay" />
      <el-table-column label="捐赠时间" align="center" prop="payTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.payTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="电子证书路径" align="center" prop="certificate" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['web:donate:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['web:donate:remove']"
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

    <!-- 添加或修改捐赠记录对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="姓名/单位" prop="name">
          <el-input v-model="form.name" placeholder="请输入姓名/单位" />
        </el-form-item>
        <el-form-item label="捐赠金额" prop="money">
          <el-input v-model="form.money" placeholder="请输入捐赠金额" />
        </el-form-item>
        <el-form-item label="捐赠项目" prop="porjectId">
          <el-input v-model="form.porjectId" placeholder="请输入捐赠项目" />
        </el-form-item>
        <el-form-item label="手机号" prop="phone">
          <el-input v-model="form.phone" placeholder="请输入手机号" />
        </el-form-item>
        <el-form-item label="专业" prop="speciality">
          <el-input v-model="form.speciality" placeholder="请输入专业" />
        </el-form-item>
        <el-form-item label="是否公开姓名" prop="isShowName">
          <el-input v-model="form.isShowName" placeholder="请输入是否公开姓名" />
        </el-form-item>
        <el-form-item label="留言" prop="message">
          <el-input v-model="form.message" placeholder="请输入留言" />
        </el-form-item>
        <el-form-item label="是否已经支付" prop="isPay">
          <el-input v-model="form.isPay" placeholder="请输入是否已经支付" />
        </el-form-item>
        <el-form-item label="捐赠时间" prop="payTime">
          <el-date-picker clearable
            v-model="form.payTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择捐赠时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="电子证书路径" prop="certificate">
          <el-input v-model="form.certificate" placeholder="请输入电子证书路径" />
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
import { listDonate, getDonate, delDonate, addDonate, updateDonate } from "@/api/web/donate";

export default {
  name: "Donate",
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
      // 捐赠记录表格数据
      donateList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        name: null,
        money: null,
        porjectId: null,
        phone: null,
        enrollmentYear: null,
        speciality: null,
        isShowName: null,
        message: null,
        isPay: null,
        payTime: null,
        certificate: null
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        name: [
          { required: true, message: "姓名/单位不能为空", trigger: "blur" }
        ],
        money: [
          { required: true, message: "捐赠金额不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询捐赠记录列表 */
    getList() {
      this.loading = true;
      listDonate(this.queryParams).then(response => {
        this.donateList = response.rows;
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
        money: null,
        porjectId: null,
        phone: null,
        enrollmentYear: null,
        speciality: null,
        isShowName: null,
        message: null,
        isPay: null,
        createTime: null,
        payTime: null,
        certificate: null
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
      this.title = "添加捐赠记录";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getDonate(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改捐赠记录";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateDonate(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addDonate(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除捐赠记录编号为"' + ids + '"的数据项？').then(function() {
        return delDonate(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('web/donate/export', {
        ...this.queryParams
      }, `donate_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
