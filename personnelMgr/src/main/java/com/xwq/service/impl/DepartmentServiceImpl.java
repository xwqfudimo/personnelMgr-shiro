package com.xwq.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xwq.dao.DepartmentDao;
import com.xwq.model.Department;
import com.xwq.service.DepartmentService;

@Service("departmentService")
public class DepartmentServiceImpl implements DepartmentService {
	@Autowired
	private DepartmentDao departmentDao;

	@Override
	public void add(Department t) {
		this.departmentDao.add(t);
	}

	@Override
	public void delete(int id) {
		this.departmentDao.delete(id);
	}

	@Override
	public void update(Department t) {
		this.departmentDao.update(t);
	}

	@Override
	public Department get(int id) {
		return this.departmentDao.get(id);
	}


}
