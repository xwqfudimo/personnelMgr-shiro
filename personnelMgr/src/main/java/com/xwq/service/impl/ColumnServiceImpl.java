package com.xwq.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xwq.dao.ColumnDao;
import com.xwq.model.Column;
import com.xwq.service.ColumnService;

@Service("columnService")
public class ColumnServiceImpl implements ColumnService {
	@Autowired
	private ColumnDao columnDao;

	@Override
	public List<Column> getColumns(int moduleId) {
		String hql = "from Column c where c.module.id = ? ";
		return this.columnDao.getList(hql, moduleId);
	}

	@Override
	public Column getByHref(String href) {
		String hql = "from Column where href = ?";
		return (Column)this.columnDao.query(hql, href);
	}

}
