package com.xwq.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xwq.dao.DepartmentDao;
import com.xwq.dao.EmployeeDao;
import com.xwq.dao.SalaryDao;
import com.xwq.dao.YjReportDao;
import com.xwq.model.Employee;
import com.xwq.model.Salary;
import com.xwq.model.YjReport;
import com.xwq.service.EmployeeService;
import com.xwq.util.Pagination;
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
	@Autowired
	private SalaryDao salaryDao;

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

	/**
	 * 查询带有部门信息的员工列表
	 */
	@Override
	public List<Employee> getEmpsWithDept() {
		String hql = "from Employee e join fetch e.department";
		return this.employeeDao.getList(hql);
	}

	/**
	 * 根据姓名模糊查询员工
	 */
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

	/**
	 * 查询指定员工id的业绩报告列表
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<YjReportVo> getYjReportListByEmpId(int empId, String filter) {
		String hql = "";
		if(filter == null || "all".equals(filter)) {
			hql = " from YjReport yj where yj.employee.id = ?";
		}
		else if("yes".equals(filter)) {
			hql = " from YjReport yj where yj.employee.id = ? and yj.audited = 1";
		}
		else {
			hql = " from YjReport yj where yj.employee.id = ? and yj.audited = 0";
		}
		
		int totalCount = Integer.parseInt(this.yjReportDao.query("select count(id) " + hql, empId).toString());
		Pagination.setTotalCount(totalCount);
		
		String select = "select id, title, submitDate, audited ";
		List<Object[]> list = (List<Object[]>) this.yjReportDao.queryListByPage(select + hql, Pagination.getOffset(), Pagination.getPageSize(), empId);
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

	/**
	 * 查询包含id,name属性的所有员工列表
	 */
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

	/**
	 * 分页查询员工列表
	 */
	@Override
	public List<Employee> list(String search) {
		int totalCount = Integer.parseInt(this.employeeDao.query("select count(*) from Employee where name like ?", "%"+search+"%").toString());
		Pagination.setTotalCount(totalCount);
		
		return this.employeeDao.getListByPage("from Employee e join fetch e.department where e.name like ?", Pagination.getOffset(), Pagination.getPageSize(), "%"+search+"%");
	}

	/**
	 * 指定id员工的月工资列表
	 */
	@Override
	public List<Salary> listSalaryByEmpId(int empId) {
		String hql = " from Salary s where s.employee.id = ?  order by date desc";
		
		int totalCount = Integer.parseInt(this.salaryDao.query("select count(*) " + hql, empId).toString());
		Pagination.setTotalCount(totalCount);
		
		return this.salaryDao.getListByPage(hql, Pagination.getOffset(), Pagination.getPageSize(), empId);
	}

	@Override
	public Salary getSalary(int id) {
		return this.salaryDao.get(id);
	}

	/**
	 * 获取指定id部门的员工id列表
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> getEmpIdsByDeptId(int deptId) {
		String hql = "select e.id from Employee e where e.department.id = ?";
		return this.employeeDao.queryList(hql, deptId);
	}

	/**
	 * 查询指定员工id列表的所有业绩报告列表
	 */
	@Override
	public List<YjReport> getYjReportListByEmpIds(List<Integer> empIdList, String filter) {
		String hql = "";
		if(filter == null || "all".equals(filter)) {
			hql = " from YjReport yj where yj.employee.id in (:ids)";
		}
		else if("yes".equals(filter)) {
			hql = " from YjReport yj where yj.employee.id in (:ids) and yj.audited = 1";
		}
		else {
			hql = " from YjReport yj where yj.employee.id in (:ids) and yj.audited = 0";
		}
		
		int totalCount = this.yjReportDao.getTotalCountByEmpIds("select count(*) " + hql, "ids", empIdList);
		Pagination.setTotalCount(totalCount);
		
		return this.yjReportDao.getByEmpIds(hql, Pagination.getOffset(), Pagination.getPageSize(), "ids", empIdList);
	}

	/**
	 * 审核业绩报告
	 */
	@Override
	public void auditedYjReport(int id, String auditPerson) {
		String hql = "update YjReport set audited = true, auditPerson = ? where id = ?";
		this.yjReportDao.execute(hql, auditPerson, id);
	}

	/**
	 * 分页查询所有薪资列表
	 */
	@Override
	public List<Salary> listAllSalaryByPage() {
		String hql = " from Salary order by date desc";
		
		int totalCount = Integer.parseInt(this.salaryDao.query("select count(*) " + hql).toString());
		Pagination.setTotalCount(totalCount);
		
		return this.salaryDao.getListByPage(hql, Pagination.getOffset(), Pagination.getPageSize());
	}

	@Override
	public void addSalary(Salary salary) {
		this.salaryDao.add(salary);
	}

	@Override
	public void updateSalary(Salary salary) {
		this.salaryDao.update(salary);
	}

	@Override
	public void deleteSalary(int id) {
		this.salaryDao.delete(id);
	}
	
}
