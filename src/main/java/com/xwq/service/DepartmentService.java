package com.xwq.service;

import java.util.List;

import com.xwq.model.Department;
import com.xwq.vo.DeptVo;

public interface DepartmentService {
	public void add(Department t);
	public void delete(int id);
	public void update(Department t);
	public Department get(int id);
	
	public List<DeptVo> getDeptList(); 
	public List<Department> list();
}
