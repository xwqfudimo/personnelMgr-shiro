package com.xwq.service;

import java.util.List;

import com.xwq.model.Column;

public interface ColumnService {
	public List<Column> getColumns(int moduleId);
	public Column getByHref(String href);
}
