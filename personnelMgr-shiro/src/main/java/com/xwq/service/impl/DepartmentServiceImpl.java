package com.xwq.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xwq.dao.DepartmentDao;
import com.xwq.model.Department;
import com.xwq.service.DepartmentService;
import com.xwq.util.Pagination;
import com.xwq.vo.DeptFzrVo;
import com.xwq.vo.DeptListVo;
import com.xwq.vo.DeptVo;

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

	/**
	 * 获取包含属性id,name的部门列表
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<DeptVo> getDeptList() {
		String hql = "select id, name from Department order by sort";
		List<Object[]> list = this.departmentDao.queryList(hql);
		
		List<DeptVo> voList = new ArrayList<DeptVo>();
		for(Object[] objs : list) {
			DeptVo vo = new DeptVo();
			vo.setId(Integer.parseInt(objs[0].toString()));
			vo.setName(objs[1].toString());
			
			voList.add(vo);
		}
		
		return voList;
	}

	/**
	 * 分页查询部门列表
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<DeptListVo> list(String search) {
		int totalCount = Integer.parseInt(this.departmentDao.query("select count(*) from Department where name like ?", "%"+search+"%").toString());
		Pagination.setTotalCount(totalCount);
		
		List<Object[]> objsList = this.departmentDao.queryListByPage("select d, e.name as ename, e.phone as ephone from Department d left join d.fzr e where d.name like ?", Pagination.getOffset(), Pagination.getPageSize(), "%"+search+"%");
		
		List<DeptListVo> voList = new ArrayList<DeptListVo>();
		for(Object[] objs : objsList) {
			DeptListVo vo = new DeptListVo();
			Department dept = (Department) objs[0];
			vo.setDept(dept);
			vo.setEname(objs[1].toString());
			vo.setEphone(objs[2].toString());
			
			voList.add(vo);
		}
		
		return voList;
	}

	/**
	 * 获取部门id及其负责人empId列表
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<DeptFzrVo> getDeptFzrIds() {
		String sql = "select id, fzr_emp_id from department";
		List<Object[]> list = this.departmentDao.sqlQueryList(sql);
		
		List<DeptFzrVo> voList = new ArrayList<DeptFzrVo>();
		for(Object[] objs : list) {
			DeptFzrVo vo = new DeptFzrVo();
			vo.setDeptId(Integer.parseInt(objs[0].toString()));
			vo.setFzrEmpId(Integer.parseInt(objs[1].toString()));
			voList.add(vo);
		}
		
		return voList;
	}

	/**
	 * 获取所有的部门负责人empId
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> getAllFzrEmpIdList() {
		String sql = "select fzr_emp_id from department";
		return this.departmentDao.sqlQueryList(sql);
	}
}
