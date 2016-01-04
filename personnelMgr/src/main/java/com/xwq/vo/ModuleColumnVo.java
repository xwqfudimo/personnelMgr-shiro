package com.xwq.vo;

import java.util.ArrayList;
import java.util.List;

import com.xwq.model.Column;
import com.xwq.model.Module;

public class ModuleColumnVo {
	private Module module;
	private List<Column> columns = new ArrayList<Column>();
	
	public Module getModule() {
		return module;
	}
	public void setModule(Module module) {
		this.module = module;
	}
	public List<Column> getColumns() {
		return columns;
	}
	public void setColumns(List<Column> columns) {
		this.columns = columns;
	}
}
