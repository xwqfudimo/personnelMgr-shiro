package com.xwq.service;

import com.xwq.model.Department;

public interface DepartmentService {
	public void add(Department t);
	public void delete(int id);
	public void update(Department t);
	public Department get(int id);
	
}
