package com.xwq.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xwq.comparator.DepartmentComparator;
import com.xwq.enums.Gender;
import com.xwq.model.Department;
import com.xwq.model.Employee;
import com.xwq.util.JsonUtil;
import com.xwq.util.ParameterUtil;
import com.xwq.vo.EmpVo;

@Controller
public class EmployeeController extends BaseController {
	
	/**
	 * 查看员工资料
	 * @param request
	 * @return
	 */
	@RequestMapping("/viewEmpInfo")
	public String viewEmpInfo(HttpSession session, Model model) {
		int empId = Integer.parseInt(session.getAttribute("empId").toString());
		
		Employee emp = this.employeeService.get(empId);
		model.addAttribute("emp", emp);
		
		infoSetting("viewEmpInfo", model);
		
		return "emp/viewEmpInfo";
	}
	
	
	/**
	 * 修改登录密码提交
	 */
	@RequestMapping(value="/modifyPwdSubmit", method=RequestMethod.POST)
	public @ResponseBody int modifyPwd(HttpServletRequest request, Model model) {
		String oldPwd = request.getParameter("oldPwd");
		String newPwd = request.getParameter("newPwd");
		String newPwd2 = request.getParameter("newPwd2");
		
		if(oldPwd != null && !"".equals(oldPwd.trim()) && newPwd != null && !"".equals(newPwd.trim()) && newPwd2 != null && !"".equals(newPwd2.trim())) {
			if(newPwd.equals(newPwd2)) {
				String username = request.getSession().getAttribute("loginUser").toString();
				String password = this.userService.getPwdByUsername(username);
				
				
				String md5Pwd = DigestUtils.md5Hex(oldPwd);
				if(password.equals(md5Pwd)) {
					//修改成功
					this.userService.updatePassword(username, DigestUtils.md5Hex(newPwd));
					
					return 1;
				}
			}
		}
		
		return 0;
		
	}
	
	
	/**
	 * 查询员工资料
	 */
	@RequestMapping(value="/empSearch", method=RequestMethod.GET)
	public String empSearch(HttpServletRequest request, Model model) {
		infoSetting("empSearch", model);
		
		//部门-员工树状列表
		List<Employee> emps = this.employeeService.getEmpsWithDept();
		
		Set<Department> depts = new HashSet<Department>();
		for(Employee e : emps) {
			depts.add(e.getDepartment());
		}
		
		StringBuffer buffer = new StringBuffer();
		buffer.append("[");
		List<Department> deptList = new ArrayList<Department>(depts);
		Collections.sort(deptList, new DepartmentComparator());
		
		for(int i=0; i<deptList.size(); i++) {
			Department d = deptList.get(i);
			if(i != 0) buffer.append(",");
			buffer.append("{id:" + d.getId() + ", pId:0, name:'" + d.getName() + "',open:true}");
			
			for(Employee e : emps) {
				if(e.getDepartment().getId() == d.getId()) {
					buffer.append(",{id:" + d.getId() + e.getId() + ", pId:" + d.getId() + ", name:'" + e.getName() + "', icon:'" + request.getContextPath() + "/resources/images/user.png'}");
				}
			}
		}
		buffer.append("]");
		
		model.addAttribute("data", buffer.toString());
		
		return "emp/empSearch";
	}
	
	
	/**
	 * 查询员工资料搜索结果
	 */
	@RequestMapping(value="/empSearch", method=RequestMethod.POST, produces = "text/html;charset=UTF-8")
	public @ResponseBody Object empSearchResult(HttpServletRequest request) {
		String empName = request.getParameter("empName");
		List<EmpVo> emps = this.employeeService.getEmpsByName(empName);
		
		return JsonUtil.toJson(emps);
	}
	

	@RequestMapping(value="/emp/{id}", produces="text/html;charset=UTF-8")
	public @ResponseBody Object get(@PathVariable int id) {
		Employee emp = this.employeeService.get(id);
		
		return JsonUtil.toJson(emp);
	}
	
	
	/**
	 * 员工列表
	 * @param model
	 * @return
	 */
	@RequestMapping("/empMgr")
	public String list(Model model) {
		infoSetting("empMgr", model);
		
		List<Employee> emps = this.employeeService.list();
		model.addAttribute("emps", emps);
		
		return "emp/list";
	}
	
	/**
	 * 新增员工
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/emp_add", method=RequestMethod.GET)
	public String add(Model model) {
		infoSetting("empMgr", model);
		
		model.addAttribute("depts", this.departmentService.getDeptList());
		
		return "emp/add";
	}
	
	
	/**
	 * 新增员工提交
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/emp_add", method=RequestMethod.POST)
	public String add(HttpServletRequest request) {
		String name = request.getParameter("name");
		
		if(ParameterUtil.parameterOK(name)) {
			Employee emp = new Employee();
			this.setEmp(emp, request);
			
			this.employeeService.add(emp);
		}
		
		return "redirect:/empMgr";
	}
	
	/**
	 * 修改员工
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/emp_edit/{id}", method=RequestMethod.GET)
	public String update(@PathVariable int id, Model model) {
		infoSetting("empMgr", model);
		
		Employee emp = this.employeeService.get(id);
		model.addAttribute("emp", emp);
		
		model.addAttribute("depts", this.departmentService.getDeptList());
		
		return "emp/edit";
	}
	
	/**
	 * 修改员工提交
	 * @return
	 */
	@RequestMapping(value="/emp_edit_submit", method=RequestMethod.POST)
	public String update(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		
		Employee emp = this.employeeService.get(id);
		this.setEmp(emp, request);
		this.employeeService.update(emp);
		
		return "redirect:/empMgr";
	}
	
	
	private void setEmp(Employee emp, HttpServletRequest request) {
		emp.setName(request.getParameter("name"));
		emp.setAddress(request.getParameter("address"));
		emp.setBeizhu(request.getParameter("beizhu"));
		emp.setBirthdate(request.getParameter("birthdate"));
		emp.setCard(request.getParameter("card"));
		emp.setDepartment(this.departmentService.get(Integer.parseInt(request.getParameter("deptId"))));
		emp.setEmail(request.getParameter("email"));
		emp.setMarriage(request.getParameter("marriage"));
		emp.setNationality(request.getParameter("nationality"));
		emp.setPhone(request.getParameter("phone"));
		emp.setRzsj(request.getParameter("rzsj"));
		emp.setSex(Gender.valueOf(request.getParameter("sex")));
		emp.setXl(request.getParameter("xl"));
		emp.setZzmm(request.getParameter("zzmm"));
	}
	
	
	/**
	 * 删除员工
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/emp_del/{id}", method=RequestMethod.GET)
	public @ResponseBody boolean delete(@PathVariable int id) {
		this.employeeService.delete(id);
		
		return true;
	}
}
