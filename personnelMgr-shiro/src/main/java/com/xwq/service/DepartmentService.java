package com.xwq.service;

import java.util.List;

import com.xwq.model.Department;
import com.xwq.vo.DeptFzrVo;
import com.xwq.vo.DeptListVo;
import com.xwq.vo.DeptVo;

public interface DepartmentService {
	public void add(Department t);
	public void delete(int id);
	public void update(Department t);
	public Department get(int id);
	
	public List<DeptVo> getDeptList(); 
	public List<DeptListVo> list(String search);
	public List<DeptFzrVo> getDeptFzrIds();
	public List<Integer> getAllFzrEmpIdList();
}
