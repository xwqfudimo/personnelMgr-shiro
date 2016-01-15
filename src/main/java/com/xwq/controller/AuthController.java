package com.xwq.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xwq.model.Resource;
import com.xwq.util.ParameterUtil;

@Controller
public class AuthController extends BaseController {

	/**
	 * 权限列表
	 * @param model
	 * @return
	 */
	@RequestMapping("/authMgr")
	public String list(Model model) {
		infoSetting("authMgr", model);
		
		List<Resource> list = this.resourceService.list();
		model.addAttribute("auths", list);
		
		return "auth/list";
	}
	
	@RequestMapping(value="/auth_add", method=RequestMethod.GET)
	public String add(Model model) {
		infoSetting("authMgr", model);
		
		return "auth/add";
	}
	
	/**
	 * 新增权限
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/auth_add", method=RequestMethod.POST)
	public String add(HttpServletRequest request) {
		String name = request.getParameter("name");
		String uri = request.getParameter("uri");
		
		if(ParameterUtil.parameterOK(name, uri)) {
			Resource res = new Resource();
			res.setName(name);
			res.setUri(uri);
			res.setGroup(request.getParameter("group_name"));
			
			this.resourceService.add(res);
		}
		
		return "redirect:/authMgr";
	}
	
	/**
	 * 修改权限页面
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping("/auth_edit/{id}")
	public String update(@PathVariable int id, Model model) {
		infoSetting("authMgr", model);
		
		Resource res = this.resourceService.get(id);
		model.addAttribute("res", res);
		
		return "auth/edit";
	}
	
	/**
	 * 修改权限提交
	 * @param request
	 * @return
	 */
	@RequestMapping("/auth_edit_submit")
	public String update(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String uri = request.getParameter("uri");
		
		if(ParameterUtil.parameterOK(name, uri)) {
			Resource res = this.resourceService.get(id);
			res.setName(name);
			res.setUri(uri);
			res.setGroup(request.getParameter("group_name"));
			
			this.resourceService.update(res);	
		}
		
		
		return "redirect:/authMgr";
	}
	
	
	/**
	 * 删除权限
	 * @param id
	 * @return
	 */
	@RequestMapping("/auth_del/{id}")
	public @ResponseBody boolean delete(@PathVariable int id) {
		this.resourceService.delete(id);
		
		return true;
	}
}
