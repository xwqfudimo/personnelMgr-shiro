package com.xwq.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xwq.dao.DepartmentDao;
import com.xwq.dao.EmployeeDao;
import com.xwq.dao.YjReportDao;
import com.xwq.model.Employee;
import com.xwq.model.YjReport;
import com.xwq.service.EmployeeService;
import com.xwq.vo.EmpVo;
import com.xwq.vo.YjReportVo;

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {
	@Autowired
	private EmployeeDao employeeDao;
	@Autowired
	private YjReportDao yjReportDao;
	@Autowired
	private DepartmentDao departmentDao;

	@Override
	public void add(Employee t) {
		this.employeeDao.add(t);
		
		//部门人数+1
		int deptId = t.getDepartment().getId();
		String hql = "update Department set empNum = empNum+1 where id = ?";
		this.departmentDao.execute(hql, deptId);
	}

	@Override
	public void delete(int id) {
		this.employeeDao.delete(id);
	}

	@Override
	public void update(Employee t) {
		this.employeeDao.update(t);
	}

	@Override
	public Employee get(int id) {
		return this.employeeDao.get(id);
	}

	@Override
	public List<Employee> getEmpsWithDept() {
		String hql = "from Employee e join fetch e.department";
		return this.employeeDao.getList(hql);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<EmpVo> getEmpsByName(String empName) {
		String hql = "select id, name from Employee e where e.name like ?";
		List<Object[]> list = this.employeeDao.queryList(hql, "%" + empName + "%");
		
		List<EmpVo> emps = new ArrayList<EmpVo>();
		for(Object[] objs : list) {
			EmpVo vo = new EmpVo();
			vo.setId(Integer.parseInt(objs[0].toString()));
			vo.setName(objs[1].toString());
			
			emps.add(vo);
		}
		
		return emps;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<YjReportVo> getYjReportListByEmpId(int empId, String filter) {
		String hql = "";
		if(filter == null || "all".equals(filter)) {
			hql = "select id, title, submitDate, audited from YjReport yj where yj.employee.id = ?";
		}
		else if("yes".equals(filter)) {
			hql = "select id, title, submitDate, audited from YjReport yj where yj.employee.id = ? and yj.audited = 1";
		}
		else {
			hql = "select id, title, submitDate, audited from YjReport yj where yj.employee.id = ? and yj.audited = 0";
		}
		
		List<Object[]> list = (List<Object[]>) this.yjReportDao.queryList(hql, empId);
		List<YjReportVo> voList = new ArrayList<YjReportVo>();
		for(Object[] os : list) {
			YjReportVo vo = new YjReportVo();
			vo.setId(Integer.parseInt(os[0].toString()));
			vo.setTitle(os[1].toString());
			vo.setSubmitDate(os[2].toString());
			vo.setAudited(Boolean.parseBoolean(os[3].toString()));
			
			voList.add(vo);
		}
		
		return voList;
	}

	@Override
	public void addYjReport(YjReport yjReport) {
		this.yjReportDao.add(yjReport);
	}

	@Override
	public YjReport getYjReport(int id) {
		return this.yjReportDao.get(id);
	}

	@Override
	public void updateYjReport(YjReport report) {
		this.yjReportDao.update(report);
	}

	@Override
	public void deleteYjReport(int id) {
		this.yjReportDao.delete(id);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<EmpVo> getAllEmpVo() {
		String hql = "select id, name from Employee";
		List<Object[]> list = this.employeeDao.queryList(hql);
		
		List<EmpVo> empVoList = new ArrayList<EmpVo>();
		for(Object[] objs : list) {
			EmpVo vo = new EmpVo();
			vo.setId(Integer.parseInt(objs[0].toString()));
			vo.setName(objs[1].toString());
			
			empVoList.add(vo);
		}
		
		return empVoList;
	}

	@Override
	public List<Employee> list() {
		return this.employeeDao.getList("from Employee e join fetch e.department");
	}
	
}
