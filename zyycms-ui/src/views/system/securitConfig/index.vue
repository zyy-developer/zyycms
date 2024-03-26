<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">

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
          v-hasPermi="['system:securitConfig:add']"
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
          v-hasPermi="['system:securitConfig:edit']"
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
          v-hasPermi="['system:securitConfig:remove']"
        >删除</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="securitConfigList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="主键" align="center" prop="id" />
      <el-table-column label="密码长度" align="center" prop="passwordLenMin" >
        <template slot-scope="scope">
          <span>{{ scope.row.passwordLenMin }} - {{ scope.row.passwordLenMax }}</span>
        </template>
      </el-table-column>
      <el-table-column label="密码校验规则" align="center" prop="passwordRule">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.sys_security_password_rule" :value="scope.row.passwordRule"/>
        </template>
      </el-table-column>
      <el-table-column label="密码过期时长（单位：秒）" align="center" prop="passwordExpireSeconds" />
      <el-table-column label="每日密码错误次数阈值" align="center" prop="passwordRetryLimit" />
      <el-table-column label="状态" align="center" prop="stage">
        <template slot-scope="scope">
          <el-switch
            v-model="scope.row.stage"
            active-value="0"
            inactive-value="1"
            @change="handleStatusChange(scope.row)"
          ></el-switch>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:securitConfig:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:securitConfig:remove']"
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

    <!-- 添加或修改安全配置对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="800px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="200px">
<!--        <el-form-item label="状态" prop="stage">-->
<!--          <el-input v-model="form.stage" placeholder="请输入状态" />-->
<!--        </el-form-item>-->
        <el-form-item label="密码最小长度" prop="passwordLenMin">
          <el-input-number v-model="form.passwordLenMin" controls-position="right" :min="6" :max="16"></el-input-number>
<!--          <el-input v-model="form.passwordLenMin" placeholder="请输入密码最小长度" />-->
        </el-form-item>
        <el-form-item label="密码最大长度" prop="passwordLenMax">
          <el-input-number v-model="form.passwordLenMax" controls-position="right" :min="16" :max="30"></el-input-number>
<!--          <el-input v-model="form.passwordLenMax" placeholder="请输入密码最大长度" />-->
        </el-form-item>
        <el-form-item label="密码校验规则" prop="passwordRule">
          <el-select v-model="form.passwordRule">
            <el-option
              v-for="item in dict.type.sys_security_password_rule"
              :key="item.value"
              :label="item.label"
              :value="item.value">
            </el-option>
          </el-select>
<!--          <el-input v-model="form.passwordRule" placeholder="请输入密码校验规则" />-->
        </el-form-item>
        <el-form-item label="密码敏感字符" prop="passwordSensitive">
<!--          sys_security_password_sensitive-->
          <el-checkbox-group v-model="form.passwordSensitiveList">
            <el-checkbox
              v-for="item in dict.type.sys_security_password_sensitive"
              :key="item.value"
              :label="item.value"
            >{{item.label}}</el-checkbox>
          </el-checkbox-group>
<!--          <el-input v-model="form.passwordSensitive" placeholder="请输入密码敏感字符" />-->
        </el-form-item>
        <el-form-item label="弱密码集合" prop="weakPasswords">
          <el-input v-model="form.weakPasswords" type="textarea" :rows="5" placeholder="每行一个弱密码" />
        </el-form-item>
        <el-form-item label="首次登录是否强制修改密码" prop="forceModifyPwdAfterAdd">
<!--          <el-input v-model="form.forceModifyPwdAfterAdd" placeholder="请输入后台添加的用户首次登陆是否需要强制修改密码" />-->
          <el-switch
            v-model="form.forceModifyPwdAfterAdd"
            active-value="Y"
            inactive-value="N">
          </el-switch>
          <i class="el-icon-info tips">仅适用于后台添加用户</i>
        </el-form-item>
        <el-form-item label="重置密码后是否强制修改密码" prop="forceModifyPwdAfterReset">
<!--          <el-input v-model="form.forceModifyPwdAfterReset" placeholder="请输入后台重置密码后首次登陆是否需要强制修改密码" />-->
          <el-switch
            v-model="form.forceModifyPwdAfterReset"
            active-value="Y"
            inactive-value="N">
          </el-switch>
          <i class="el-icon-info tips">仅适用于后台重置用户密码</i>
        </el-form-item>
        <el-form-item label="密码过期时长（单位：秒）" prop="passwordExpireSeconds">
<!--          <el-input v-model="form.passwordExpireSeconds" placeholder="请输入密码有效期" />-->
          <el-input-number v-model="form.passwordExpireSeconds" controls-position="right" :min="0" :max="8640000"></el-input-number>
          <i class="el-icon-info tips">0表示永不过期，最长不超过100天</i>
        </el-form-item>
        <el-form-item label="每日密码错误次数阈值" prop="passwordRetryLimit">
<!--          <el-input v-model="form.passwordRetryLimit" placeholder="请输入密码错误次数阈值" />-->
          <el-input-number v-model="form.passwordRetryLimit" controls-position="right" :min="0"></el-input-number>
          <i class="el-icon-info tips">0表示无限制</i>
        </el-form-item>
<!--        <el-form-item label="密码错误次数阈值触发后的处理策略" prop="passwordRetryStrategy">-->

<!--          <el-input v-model="form.passwordRetryStrategy" placeholder="请输入密码错误次数阈值触发后的处理策略" />-->
<!--        </el-form-item>-->
<!--        <el-form-item label="密码错误阈值触发锁定账号时长，单位：秒" prop="passwordRetryLockSeconds">-->
<!--          <el-input v-model="form.passwordRetryLockSeconds" placeholder="请输入密码错误阈值触发锁定账号时长，单位：秒" />-->
<!--        </el-form-item>-->
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import { listSecuritConfig, getSecuritConfig, delSecuritConfig, addSecuritConfig, updateSecuritConfig ,updateConfigStage } from "@/api/system/securitConfig";
import Template from "@/views/web/template/index.vue";

export default {
  name: "SecuritConfig",
  components: {Template},
  dicts: ['sys_security_password_rule','sys_security_password_sensitive'],
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
      // 安全配置表格数据
      securitConfigList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        stage: null,
        passwordLenMin: null,
        passwordLenMax: null,
        passwordRule: null,
        passwordSensitive: null,
        weakPasswords: null,
        forceModifyPwdAfterAdd: null,
        forceModifyPwdAfterReset: null,
        passwordExpireSeconds: null,
        passwordRetryLimit: null,
        passwordRetryStrategy: null,
        passwordRetryLockSeconds: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        stage: [
          { required: true, message: "状态不能为空", trigger: "blur" }
        ],
        passwordLenMin: [
          { required: true, message: "密码最小长度不能为空", trigger: "blur" }
        ],
        passwordRule: [
          { required: true, message: "密码校验规则不能为空", trigger: "blur" }
        ],
        forceModifyPwdAfterAdd: [
          { required: true, message: "后台添加的用户首次登陆是否需要强制修改密码不能为空", trigger: "blur" }
        ],
        passwordExpireSeconds: [
          { required: true, message: "密码有效期不能为空", trigger: "blur" }
        ],
        passwordRetryLimit: [
          { required: true, message: "密码错误次数阈值不能为空", trigger: "blur" }
        ],
        passwordRetryStrategy: [
          { required: true, message: "密码错误次数阈值触发后的处理策略不能为空", trigger: "blur" }
        ],
        passwordRetryLockSeconds: [
          { required: true, message: "密码错误阈值触发锁定账号时长，单位：秒不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询安全配置列表 */
    getList() {
      this.loading = true;
      listSecuritConfig(this.queryParams).then(response => {
        this.securitConfigList = response.rows;
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
        stage: null,
        passwordLenMin: null,
        passwordLenMax: null,
        passwordRule: null,
        passwordSensitiveList: [],
        weakPasswords: null,
        forceModifyPwdAfterAdd: null,
        forceModifyPwdAfterReset: null,
        passwordExpireSeconds: null,
        passwordRetryLimit: null,
        passwordRetryStrategy: null,
        passwordRetryLockSeconds: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null
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
      this.title = "添加安全配置";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getSecuritConfig(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改安全配置";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateSecuritConfig(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addSecuritConfig(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除安全配置编号为"' + ids + '"的数据项？').then(function() {
        return delSecuritConfig(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('system/securitConfig/export', {
        ...this.queryParams
      }, `securitConfig_${new Date().getTime()}.xlsx`)
    },
    /** 修改状态 */
    handleStatusChange (row) {
      const configId = row.id;
      updateConfigStage(configId).then(res => {
        this.$modal.msgSuccess("修改状态成功！");
        this.getList();
      });
    }
  }
};
</script>
