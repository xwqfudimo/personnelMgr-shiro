package com.xwq.service;

import java.util.List;

import com.xwq.model.Employee;
import com.xwq.model.Salary;
import com.xwq.model.YjReport;
import com.xwq.vo.EmpVo;
import com.xwq.vo.YjReportVo;

public interface EmployeeService {
	public void add(Employee t);
	public void delete(int id);
	public void update(Employee t);
	public Employee get(int id);
	public List<Employee> list(String search);
	
	public List<Employee> getEmpsWithDept();
	public List<EmpVo> getEmpsByName(String empName);
	public List<EmpVo> getAllEmpVo();
	public List<Integer> getEmpIdsByDeptId(int deptId);
	
	public List<YjReportVo> getYjReportListByEmpId(int empId, String filter);
	public List<YjReport> getYjReportListByEmpIds(List<Integer> empIdList, String filter);
	public void addYjReport(YjReport yjReport);
	public YjReport getYjReport(int id);
	public void updateYjReport(YjReport report);
	public void deleteYjReport(int id);
	public void auditedYjReport(int id, String auditPerson);
	
	public List<Salary> listSalaryByEmpId(int empId);
	public Salary getSalary(int id);
	public List<Salary> listAllSalaryByPage();
	public void addSalary(Salary salary);
	public void updateSalary(Salary salary);
	public void deleteSalary(int id);
}
