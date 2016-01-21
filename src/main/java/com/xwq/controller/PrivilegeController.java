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
import com.xwq.model.Privilege;
import com.xwq.util.ParameterUtil;

@Controller
public class PrivilegeController extends BaseController {

	/**
	 * 权限列表
	 * @param model
	 * @return
	 */
	@Auth("auth/list")
	@RequestMapping("/authMgr")
	public String list(HttpServletRequest request, Model model) {
		infoSetting(request, "authMgr", model);
		
		List<Privilege> list = this.privilegeService.list();
		model.addAttribute("auths", list);
		
		return "auth/list";
	}
	
	@Auth("auth/add")
	@RequestMapping(value="/auth_add", method=RequestMethod.GET)
	public String add(HttpServletRequest request, Model model) {
		infoSetting(request, "authMgr", model);
		
		return "auth/add";
	}
	
	/**
	 * 新增权限
	 * @param model
	 * @return
	 */
	@Auth("auth/add")
	@RequestMapping(value="/auth_add", method=RequestMethod.POST)
	public String add(HttpServletRequest request) {
		String name = request.getParameter("name");
		String uri = request.getParameter("uri");
		
		if(ParameterUtil.parameterOK(name, uri)) {
			Privilege res = new Privilege();
			res.setName(name);
			res.setUri(uri);
			res.setGroup(request.getParameter("group_name"));
			
			this.privilegeService.add(res);
		}
		
		return "redirect:/authMgr";
	}
	
	/**
	 * 修改权限页面
	 * @param id
	 * @param model
	 * @return
	 */
	@Auth("auth/update")
	@RequestMapping("/auth_edit/{id}")
	public String update(@PathVariable int id, HttpServletRequest request, Model model) {
		infoSetting(request, "authMgr", model);
		
		Privilege res = this.privilegeService.get(id);
		model.addAttribute("res", res);
		
		return "auth/edit";
	}
	
	/**
	 * 修改权限提交
	 * @param request
	 * @return
	 */
	@Auth("auth/update")
	@RequestMapping("/auth_edit_submit")
	public String update(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String uri = request.getParameter("uri");
		
		if(ParameterUtil.parameterOK(name, uri)) {
			Privilege res = this.privilegeService.get(id);
			res.setName(name);
			res.setUri(uri);
			res.setGroup(request.getParameter("group_name"));
			
			this.privilegeService.update(res);	
		}
		
		
		return "redirect:/authMgr";
	}
	
	
	/**
	 * 删除权限
	 * @param id
	 * @return
	 */
	@Auth("auth/delete")
	@RequestMapping("/auth_del/{id}")
	public @ResponseBody boolean delete(@PathVariable int id) {
		this.privilegeService.delete(id);
		
		return true;
	}
}
