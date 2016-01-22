package com.xwq.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xwq.model.Salary;

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
	 */
	@RequestMapping("/salary/{id}")
	public String view(@PathVariable int id, HttpServletRequest request, Model model) {
		infoSetting(request, "viewSalaryList", model);
		
		Salary salary = this.employeeService.getSalary(id);
		model.addAttribute("salary", salary);
		
		return "salary/show";
	}
}
