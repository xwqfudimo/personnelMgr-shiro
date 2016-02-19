package com.xwq.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xwq.annotation.Auth;
import com.xwq.annotation.LogText;
import com.xwq.exception.PermissionDeniedException;
import com.xwq.model.Employee;
import com.xwq.model.Salary;
import com.xwq.vo.EmpVo;

@Controller
public class SalaryController extends BaseController {
	/**
	 * 月工资列表
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/viewSalaryList", method=RequestMethod.GET)
	public String list(HttpServletRequest request, Model model) {
		infoSetting(request, "viewSalaryList", model);
		
		int empId = Integer.parseInt(request.getSession().getAttribute("empId").toString());
		List<Salary> salaryList = this.employeeService.listSalaryByEmpId(empId);
		model.addAttribute("salaryList", salaryList);
		
		return "salary/list";
	}
	
	/**
	 * 薪水详情
	 * @param id
	 * @param request
	 * @param model
	 * @return
	 * @throws PermissionDeniedException 
	 */
	@RequestMapping("/salary/{id}")
	public String view(@PathVariable int id, HttpServletRequest request, Model model) throws PermissionDeniedException {
		infoSetting(request, "viewSalaryList", model);
		
		int empId = Integer.parseInt(request.getSession().getAttribute("empId").toString());
		Salary salary = this.employeeService.getSalary(id);
		int eid = salary.getEmployee().getId();
		if(empId == eid) {
			model.addAttribute("salary", salary);
		} else {
			throw new PermissionDeniedException("你无权访问该功能！");
		}
		
		return "salary/show";
	}
	
	/**
	 * 薪资管理
	 * @param request
	 * @param model
	 * @return
	 */
	@Auth("hr/salaryMgr")
	@RequestMapping("/salaryMgr")
	public String salaryMgr(HttpServletRequest request, Model model) {
		infoSetting(request, "salaryMgr", model);
		
		List<Salary> salaryList = this.employeeService.listAllSalaryByPage();
		model.addAttribute("salaryList", salaryList);
		
		return "salary/salaryMgr";
	}
	
	/**
	 * 新增薪资
	 * @param request
	 * @param model
	 * @return
	 */
	@Auth("hr/salaryMgr")
	@RequestMapping(value="/salary_add", method=RequestMethod.GET)
	public String salaryAdd(HttpServletRequest request, Model model) {
		infoSetting(request, "salaryMgr", model);
		
		List<EmpVo> voList = this.employeeService.getAllEmpVo();
		model.addAttribute("emps", voList);
		
		return "salary/add";
	}
	
	/**
	 * 新增薪资提交
	 * @param request
	 * @param model
	 * @return
	 */
	@LogText("新增薪资")
	@Auth("hr/salaryMgr")
	@RequestMapping(value="/salary_add", method=RequestMethod.POST)
	public String salaryAdd(HttpServletRequest request) {
		int empId = Integer.parseInt(request.getParameter("empId"));
		Employee emp = this.employeeService.get(empId);
		
		if(emp != null) {
			Salary salary = new Salary();
			salary.setEmployee(emp);
			salary.setEmpName(emp.getName());
			salary.setDeptName(emp.getDepartment().getName());
			salary.setBasicSalary(Double.parseDouble(request.getParameter("basic_salary")));
			salary.setBonus(Double.parseDouble(request.getParameter("bonus")));
			salary.setButie(Double.parseDouble(request.getParameter("butie")));
			salary.setDate(request.getParameter("date"));
			salary.setGongjijin(Double.parseDouble(request.getParameter("gongjijin")));
			salary.setJiabanPlus(Double.parseDouble(request.getParameter("jiaban_plus")));
			salary.setKaoqingMinus(Double.parseDouble(request.getParameter("kaoqin_minus")));
			salary.setShebao(Double.parseDouble(request.getParameter("shebao")));
			salary.setShifaMoney(Double.parseDouble(request.getParameter("shifa_money")));
			salary.setYingdeMoney(Double.parseDouble(request.getParameter("yingde_money")));
			
			this.employeeService.addSalary(salary);
		}
		
		return "redirect:/salaryMgr";
	}
	
	/**
	 * 修改薪资
	 * @param id
	 * @param request
	 * @param model
	 * @return
	 */
	@Auth("hr/salaryMgr")
	@RequestMapping(value="/salary_edit/{id}", method=RequestMethod.GET)
	public String edit(@PathVariable int id, HttpServletRequest request, Model model) {
		infoSetting(request, "salaryMgr", model);
		
		Salary salary = this.employeeService.getSalary(id);
		model.addAttribute("salary", salary);
		
		return "salary/edit";
	}
	
	
	/**
	 * 修改薪资提交
	 * @param id
	 * @param request
	 * @param model
	 * @return
	 */
	@LogText("修改薪资")
	@Auth("hr/salaryMgr")
	@RequestMapping(value="/salary_edit_submit", method=RequestMethod.POST)
	public String update(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		Salary salary = this.employeeService.getSalary(id);
		
		if(salary != null) {
			salary.setBasicSalary(Double.parseDouble(request.getParameter("basic_salary")));
			salary.setBonus(Double.parseDouble(request.getParameter("bonus")));
			salary.setButie(Double.parseDouble(request.getParameter("butie")));
			salary.setDate(request.getParameter("date"));
			salary.setGongjijin(Double.parseDouble(request.getParameter("gongjijin")));
			salary.setJiabanPlus(Double.parseDouble(request.getParameter("jiaban_plus")));
			salary.setKaoqingMinus(Double.parseDouble(request.getParameter("kaoqin_minus")));
			salary.setShebao(Double.parseDouble(request.getParameter("shebao")));
			salary.setShifaMoney(Double.parseDouble(request.getParameter("shifa_money")));
			salary.setYingdeMoney(Double.parseDouble(request.getParameter("yingde_money")));
			
			this.employeeService.updateSalary(salary);
		}
		
		return "redirect:/salaryMgr";
	}
	
	
	/**
	 * 删除薪资
	 * @param id
	 * @return
	 */
	@LogText("删除薪资")
	@Auth("hr/salaryMgr")
	@RequestMapping("/salary_del/{id}")
	public @ResponseBody boolean delete(@PathVariable int id) {
		this.employeeService.deleteSalary(id);
		
		return true;
	}
}
