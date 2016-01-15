package com.xwq.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xwq.model.Department;
import com.xwq.util.ParameterUtil;

@Controller
public class DepartmentController extends BaseController {

	/**
	 * 部门列表
	 * @param model
	 * @return
	 */
	@RequestMapping("/deptMgr")
	public String list(Model model) {
		infoSetting("deptMgr", model);
		
		List<Department> depts = this.departmentService.list();
		model.addAttribute("depts", depts);
		
		return "dept/list";
	}
	
	@RequestMapping(value="/dept_add", method=RequestMethod.GET)
	public String add(Model model) {
		infoSetting("deptMgr", model);
		
		return "dept/add";
	}
	
	/**
	 * 新增部门
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/dept_add", method=RequestMethod.POST)
	public String add(HttpServletRequest request) {
		String name = request.getParameter("name");
		
		if(ParameterUtil.parameterOK(name)) {
			Department dept = new Department();
			dept.setName(name);
			dept.setFzr(request.getParameter("fzr"));
			dept.setFzrPhone(request.getParameter("fzr_phone"));
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
	@RequestMapping(value="/dept_edit/{id}", method=RequestMethod.GET)
	public String update(@PathVariable int id, Model model) {
		infoSetting("deptMgr", model);
		
		Department dept = this.departmentService.get(id);
		model.addAttribute("dept", dept);
		
		return "dept/edit";
	}
	
	/**
	 * 修改部门提交
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/dept_edit_submit", method=RequestMethod.POST)
	public String update(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		
		if(ParameterUtil.parameterOK(name)) {
			Department dept = this.departmentService.get(id);
			dept.setName(name);
			dept.setFzr(request.getParameter("fzr"));
			dept.setFzrPhone(request.getParameter("fzr_phone"));
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
	@RequestMapping(value="/dept_del/{id}", method=RequestMethod.GET)
	public @ResponseBody boolean delete(@PathVariable int id) {
		this.departmentService.delete(id);
		
		return true;
	}
}