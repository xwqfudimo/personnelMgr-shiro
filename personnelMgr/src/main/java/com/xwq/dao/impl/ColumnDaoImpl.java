package com.xwq.dao.impl;

import org.springframework.stereotype.Repository;

import com.xwq.dao.ColumnDao;
import com.xwq.model.Column;

@Repository("columnDao")
public class ColumnDaoImpl extends BaseDaoImpl<Column> implements ColumnDao {

}
