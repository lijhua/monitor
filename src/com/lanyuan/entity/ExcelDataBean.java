package com.lanyuan.entity;

import java.io.Serializable;

import mtime.kits.excel.annotation.ExcelField;

public class ExcelDataBean implements Serializable{

	private static final long serialVersionUID = 1L;
	@ExcelField(title = "数据类型", sort = 0, align = 2,width=5000)
	private String type;
	@ExcelField(title = "监控数值", sort = 1, align = 2,width=3000)
	private String value;
	@ExcelField(title = "创建时间", sort = 2, align = 2,width=8000)
	private String createTime;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	
	
}
