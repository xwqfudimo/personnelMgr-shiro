package com.xwq.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xwq.model.Employee;
import com.xwq.model.Role;
import com.xwq.model.User;
import com.xwq.util.ParameterUtil;
import com.xwq.vo.EmpVo;
import com.xwq.vo.UserVo;

@Controller
public class UserController extends BaseController {

	/**
	 * 用户列表
	 * @param model
	 * @return
	 */
	@RequestMapping("/userMgr")
	public String list(Model model) {
		infoSetting("userMgr", model);
		
		List<UserVo> users = this.userService.list();
		model.addAttribute("users", users);
		
		return "user/list";
	}
	
	@RequestMapping(value="user_add", method=RequestMethod.GET)
	public String add(Model model) {
		infoSetting("userMgr", model);
		
		//全部员工列表
		List<EmpVo> empVoList = this.employeeService.getAllEmpVo();
		model.addAttribute("empVoList", empVoList);
		
		//全部角色列表
		model.addAttribute("roleList", this.roleService.list());
		
		return "user/add";
	}
	
	/**
	 * 新增用户
	 * @param request
	 * @return
	 */
	@RequestMapping(value="user_add", method=RequestMethod.POST)
	public String add(HttpServletRequest request) {
		String username = request.getParameter("username");
		String pwd = request.getParameter("password");
		int empId = Integer.parseInt(request.getParameter("empId"));
		
		String[] roleIds = request.getParameterValues("roleIds");
		int[] rids = new int[roleIds.length];
		for(int i=0; i<roleIds.length; i++) {
			rids[i] = Integer.parseInt(roleIds[i]);
		}
		
		if(ParameterUtil.parameterOK(username, pwd)) {
			User u = new User();
			u.setUsername(username);
			u.setPassword(DigestUtils.md5Hex(pwd));
			Employee emp = this.employeeService.get(empId);
			u.setEmployee(emp);
			
			this.userService.add(u);
			
			//添加用户角色
			this.roleService.addUserRoles(u.getId(), rids);
		}
		
		return "redirect:/userMgr";
	}
	
	/**
	 * 删除用户
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/user_del/{id}", method=RequestMethod.GET)
	public @ResponseBody boolean delete(@PathVariable int id) {
		this.userService.delete(id);
		
		//删除用户角色
		this.roleService.deleteAllUserRole(id);
		
		return true;
	}
	
	/**
	 * 修改用户
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/user_edit/{id}", method=RequestMethod.GET)
	public String update(@PathVariable int id, Model model) {
		infoSetting("userMgr", model);
		
		User user = this.userService.get(id);
		model.addAttribute("user", user);
		
		//所用员工列表
		List<EmpVo> empVoList = this.employeeService.getAllEmpVo();
		model.addAttribute("empVoList", empVoList);
		
		//用户所拥有角色
		List<Role> roles = this.roleService.listByUserId(id);
		model.addAttribute("roles", roles);
		
		//全部角色列表
		model.addAttribute("roleList", this.roleService.list());
		
		return "user/edit";
	}
	
	/**
	 * 修改用户提交
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/user_edit_submit", method=RequestMethod.POST)
	public String update(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		int empId = Integer.parseInt(request.getParameter("empId"));
		
		String[] roleIds = request.getParameterValues("roleIds");
		int[] rids = new int[roleIds.length];
		for(int i=0; i<roleIds.length; i++) {
			rids[i] = Integer.parseInt(roleIds[i]);
		}
		
		if(ParameterUtil.parameterOK(username, password)) {
			User user = this.userService.get(id);
			user.setUsername(username);
			user.setPassword(DigestUtils.md5Hex(password));
			 
			Employee emp = this.employeeService.get(empId);
			user.setEmployee(emp);
			
			this.userService.update(user);
			
			
			//修改用户角色
			this.roleService.deleteAllUserRole(id);
			this.roleService.addUserRoles(id, rids);
		}
		
		return "redirect:/userMgr";
	}
	
	
	/**
	 * 修改登录密码
	 */
	@RequestMapping(value="/modifyPwd", method=RequestMethod.GET)
	public String modifyPwd(Model model) {
		infoSetting("modifyPwd", model);
		
		return "user/modifyPwd";
	}
}
