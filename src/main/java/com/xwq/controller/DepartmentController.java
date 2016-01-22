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
import com.xwq.model.Department;
import com.xwq.util.ParameterUtil;
import com.xwq.vo.EmpVo;

@Controller
public class DepartmentController extends BaseController {

	/**
	 * 部门列表
	 * @param model
	 * @return
	 */
	@Auth("dept/list")
	@RequestMapping("/deptMgr")
	public String list(HttpServletRequest request, Model model) {
		infoSetting(request, "deptMgr", model);
		
		String keyword = request.getParameter("keyword") == null? "" : request.getParameter("keyword");
		List<Department> depts = this.departmentService.list(keyword);
		model.addAttribute("depts", depts);
		
		return "dept/list";
	}
	
	@Auth("dept/add")
	@RequestMapping(value="/dept_add", method=RequestMethod.GET)
	public String add(HttpServletRequest request, Model model) {
		infoSetting(request, "deptMgr", model);
		
		List<EmpVo> voList = this.employeeService.getAllEmpVo();
		model.addAttribute("emps", voList);
		
		return "dept/add";
	}
	
	/**
	 * 新增部门
	 * @param request
	 * @return
	 */
	@LogText("新增部门")
	@Auth("dept/add")
	@RequestMapping(value="/dept_add", method=RequestMethod.POST)
	public String add(HttpServletRequest request) {
		String name = request.getParameter("name");
		
		if(ParameterUtil.parameterOK(name)) {
			Department dept = new Department();
			dept.setName(name);
			dept.setFzr(this.employeeService.get(Integer.parseInt(request.getParameter("fzr_id"))));
			dept.setSort(Integer.parseInt(request.getParameter("sort")));
			dept.setEmpNum(0);
			
			this.departmentService.add(dept);
		}
		
		return "redirect:/deptMgr";
	}
	
	/**
	 * 修改部门
	 * @param id
	 * @param model
	 * @return
	 */
	@Auth("dept/update")
	@RequestMapping(value="/dept_edit/{id}", method=RequestMethod.GET)
	public String update(@PathVariable int id, HttpServletRequest request, Model model) {
		infoSetting(request, "deptMgr", model);
		
		Department dept = this.departmentService.get(id);
		model.addAttribute("dept", dept);
		
		List<EmpVo> voList = this.employeeService.getAllEmpVo();
		model.addAttribute("emps", voList);
		
		return "dept/edit";
	}
	
	/**
	 * 修改部门提交
	 * @param request
	 * @return
	 */
	@LogText("修改部门")
	@Auth("dept/update")
	@RequestMapping(value="/dept_edit_submit", method=RequestMethod.POST)
	public String update(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		
		if(ParameterUtil.parameterOK(name)) {
			Department dept = this.departmentService.get(id);
			dept.setName(name);
			dept.setFzr(this.employeeService.get(Integer.parseInt(request.getParameter("fzr_id"))));
			dept.setSort(Integer.parseInt(request.getParameter("sort")));
			
			this.departmentService.update(dept);
		}
		
		return "redirect:/deptMgr";
	}
	
	/**
	 * 删除部门
	 * @param id
	 * @return
	 */
	@LogText("删除部门")
	@Auth("dept/delete")
	@RequestMapping(value="/dept_del/{id}", method=RequestMethod.GET)
	public @ResponseBody boolean delete(@PathVariable int id) {
		this.departmentService.delete(id);
		
		return true;
	}
}
