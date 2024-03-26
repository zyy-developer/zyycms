package com.zyy.system.fixed;

import java.util.ArrayList;
import java.util.List;

import com.zyy.common.utils.StringUtils;
import com.zyy.common.utils.spring.SpringUtils;

/**
 * 固定字典数据，此类定义的数据为系统运行必须，不可更改，系统模块的字典数据持久化管理会自动持久化此数据到数据库方便使用。
 */
public class FixedDictType {

	public static final String BEAN_PREFIX = "FIXED_DICT.";

	/**
	 * 字典类型唯一标识
	 */
	private String dictType;

	/**
	 * 字典类型名称
	 */
	private String dictName;

	/**
	 * 是否允许动态添加字典数据项
	 */
	private boolean allowAdd;

	/**
	 * 字典数据列表
	 */
	private List<DictData> dataList = new ArrayList<>();

	/**
	 * 备注
	 */
	private String remark;

	public FixedDictType() {}

	public FixedDictType(String dictType, String dictName) {
		this(dictType, dictName, false, null);
	}

	public FixedDictType(String dictType, String dictName, String remark) {
		this(dictType, dictName, false, remark);
	}

	public FixedDictType(String dictType, String dictName, boolean allowAdd) {
		this(dictType, dictName, allowAdd, null);
	}

	public FixedDictType(String dictType, String dictName, boolean allowAdd, String remark) {
		this.dictType = dictType;
		this.dictName = dictName;
		this.allowAdd = allowAdd;
		this.remark = remark;
	}

	protected void addDictData(String dictLabel, String dictValue, int dictSort) {
		this.addDictData(dictLabel, dictValue, dictSort, null);
	}

	protected void addDictData(String dictLabel, String dictValue, int dictSort, String remark) {
		if (this.dataList.stream().anyMatch(d -> d.getValue().equals(dictValue))) {
			throw new RuntimeException("固定字典【{0}】数据值重复：{1}");
		}
		this.dataList.add(new DictData(dictLabel, dictValue, dictSort, remark));
	}

	public static class DictData {

	    private String label;

	    private String value;

	    private long sort;

	    private String remark;

	    public DictData() {}

	    public DictData(String dictLabel, String dictValue, long dictSort) {
			this(dictLabel, dictValue, dictSort, null);
		}

	    public DictData(String dictLabel, String dictValue, long dictSort, String remark) {
			this.label = dictLabel;
			this.value = dictValue;
			this.sort = dictSort;
			this.remark = remark;
		}

		public String getLabel() {
			return label;
		}

		public void setLabel(String label) {
			this.label = label;
		}

		public String getValue() {
			return value;
		}

		public void setValue(String value) {
			this.value = value;
		}

		public long getSort() {
			return sort;
		}

		public void setSort(long sort) {
			this.sort = sort;
		}

		public String getRemark() {
			return remark;
		}

		public void setRemark(String remark) {
			this.remark = remark;
		}
	}

	public String getDictType() {
		return dictType;
	}

	public void setDictType(String dictType) {
		this.dictType = dictType;
	}

	public String getDictName() {
		return dictName;
	}

	public void setDictName(String dictName) {
		this.dictName = dictName;
	}

	public boolean isAllowAdd() {
		return allowAdd;
	}

	public void setAllowAdd(boolean allowAdd) {
		this.allowAdd = allowAdd;
	}

	public List<DictData> getDataList() {
		return dataList;
	}

	public void setDataList(List<DictData> dataList) {
		this.dataList = dataList;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
}
