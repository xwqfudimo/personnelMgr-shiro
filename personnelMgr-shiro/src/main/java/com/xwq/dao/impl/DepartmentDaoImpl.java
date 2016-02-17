package com.xwq.dao.impl;

import org.springframework.stereotype.Repository;

import com.xwq.dao.DepartmentDao;
import com.xwq.model.Department;

@Repository("departmentDao")
public class DepartmentDaoImpl extends BaseDaoImpl<Department> implements
		DepartmentDao {

}
