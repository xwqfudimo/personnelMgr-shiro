package com.xwq.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xwq.annotation.Auth;
import com.xwq.annotation.LogText;
import com.xwq.model.Privilege;
import com.xwq.model.Role;
import com.xwq.model.RoleMenu;
import com.xwq.model.RolePrivilege;
import com.xwq.util.ParameterUtil;

@Controller
public class RoleController extends BaseController {

	/**
	 * 角色列表
	 * @param model
	 * @return
	 */
	@Auth("role/list")
	@RequestMapping("/roleMgr")
	public String list(HttpServletRequest request, Model model) {
		infoSetting(request, "roleMgr", model);
		
		List<Role> roles = this.roleService.listByPage();
		model.addAttribute("roles", roles);
		
		return "role/list";
	}
	
	@Auth("role/add")
	@RequestMapping(value="/role_add", method=RequestMethod.GET)
	public String add(HttpServletRequest request, Model model) {
		infoSetting(request, "roleMgr", model);
		
		//全部菜单(树)
		model.addAttribute("menuTree", this.getMenuTreeJson());
		//全部(分组)权限
		Map<String, List<Privilege>> map = this.privilegeService.listByGroup();
		model.addAttribute("pMap", map);
		
		return "role/add";
	}
	
	/**
	 * 添加角色
	 * @param request
	 * @param model
	 * @return
	 */
	@LogText("新增角色")
	@Auth("role/add")
	@RequestMapping(value="/role_add", method=RequestMethod.POST)
	public String addSubmit(HttpServletRequest request, Model model) {
		String name = request.getParameter("name");
		String desc = request.getParameter("desc");
		String[] privilegeIds = request.getParameterValues("privilegeId");
		
		//菜单id去重
		String menuIds = request.getParameter("menuIds");
		Set<String> menuIdSet = new HashSet<String>();
		for(String str : menuIds.split(",")) {
			menuIdSet.add(str);
		}
		List<Integer> menuIdArray = new ArrayList<Integer>();
		for(String mid : menuIdSet) {
			menuIdArray.add(Integer.parseInt(mid));
		}
		
		
		if(ParameterUtil.parameterOK(name)) {
			//新增角色
			Role role = new Role();
			role.setName(name);
			role.setDesc(desc);
			this.roleService.add(role);
			
			//新增角色-菜单
			List<RoleMenu> rms = new ArrayList<RoleMenu>();
			for(int mid : menuIdArray) {
				RoleMenu rm = new RoleMenu();
				rm.setMenuId(mid);
				rm.setRoleId(role.getId());
				rms.add(rm);
			}
			this.roleService.batchAddRoleMenu(rms);
			
			//新增角色-权限
			List<RolePrivilege> rps = new ArrayList<RolePrivilege>();
			for(String priId : privilegeIds) {
				int pid = Integer.parseInt(priId);
				RolePrivilege rp = new RolePrivilege();
				rp.setRoleId(role.getId());
				rp.setPrivilegeId(pid);
				rps.add(rp);
			}
			this.privilegeService.batchAddRolePrivilege(rps);
		}
		
		return "redirect:/roleMgr";
	}
	
	/**
	 * 角色详细信息
	 * @param id
	 * @param model
	 * @return
	 */
	@Auth("role/view")
	@RequestMapping(value="/role/{id}", method=RequestMethod.GET)
	public String show(@PathVariable int id, HttpServletRequest request, Model model) {
		infoSetting(request, "roleMgr", model);
		
		Role role = this.roleService.get(id);
		model.addAttribute("role", role);
		
		//角色所拥有的菜单
		model.addAttribute("roleMenuTree", this.getMenuTreeByRoleId(id));
		//角色所拥有的权限
		Map<String, List<Privilege>> map = this.privilegeService.listByGroupAndRoleId(id);
		model.addAttribute("rolePrivilegeMap", map);
		
		return "role/show";
	}
	
	/**
	 * 修改角色
	 * @param id
	 * @param model
	 * @return
	 */
	@Auth("role/update")
	@RequestMapping(value="/role_edit/{id}", method=RequestMethod.GET)
	public String edit(@PathVariable int id, HttpServletRequest request, Model model) {
		infoSetting(request, "roleMgr", model);
		
		//全部(分组)权限
		Map<String, List<Privilege>> map = this.privilegeService.listByGroup();
		model.addAttribute("pMap", map);
		
		Role role = this.roleService.get(id);
		model.addAttribute("role", role);
		
		//角色所拥有的带勾选的全部菜单树
		model.addAttribute("menuTree", this.getCheckedMenuTreeByGroupAndRoleId(id));
		
		//角色所拥有的权限
		List<Privilege> rolePrivilegeList = this.privilegeService.listByRoleId(id);
		model.addAttribute("rolePrivilegeList", rolePrivilegeList);
		
		return "role/edit";
	}
	
	
	/**
	 * 更新角色
	 */
	@LogText("更新角色")
	@Auth("role/update")
	@RequestMapping(value="/role_edit_submit", method=RequestMethod.POST)
	public String update(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		String name = request.getParameter("name");
		String desc = request.getParameter("desc");
		String[] privilegeIds = request.getParameterValues("privilegeId");
		
		//菜单id去重
		String menuIds = request.getParameter("menuIds");
		Set<String> menuIdSet = new HashSet<String>();
		for(String str : menuIds.split(",")) {
			menuIdSet.add(str);
		}
		List<Integer> menuIdArray = new ArrayList<Integer>();
		for(String mid : menuIdSet) {
			menuIdArray.add(Integer.parseInt(mid));
		}
		
		
		if(ParameterUtil.parameterOK(name)) {
			//更新角色
			Role role = this.roleService.get(id);
			role.setName(name);
			role.setDesc(desc);
			this.roleService.update(role);
			
			//更新角色菜单
			this.menuService.deleteAllRoleMenu(id);
			List<RoleMenu> rms = new ArrayList<RoleMenu>();
			for(int mid : menuIdArray) {
				RoleMenu rm = new RoleMenu();
				rm.setMenuId(mid);
				rm.setRoleId(role.getId());
				rms.add(rm);
			}
			this.roleService.batchAddRoleMenu(rms);
			
			//更新角色权限
			this.privilegeService.deleteAllRolePrivilege(id);
			List<RolePrivilege> rps = new ArrayList<RolePrivilege>();
			for(String priId : privilegeIds) {
				int pid = Integer.parseInt(priId);
				RolePrivilege rp = new RolePrivilege();
				rp.setRoleId(role.getId());
				rp.setPrivilegeId(pid);
				rps.add(rp);
			}
			this.privilegeService.batchAddRolePrivilege(rps);
		}
		
		return "redirect:/roleMgr";
	}
	
	
	/**
	 * 删除角色
	 * @param id
	 * @return
	 */
	@LogText("删除角色")
	@Auth("role/delete")
	@RequestMapping("/role_del/{id}")
	public @ResponseBody boolean delete(@PathVariable int id) {
		this.roleService.delete(id);
		
		this.menuService.deleteAllRoleMenu(id);
		this.privilegeService.deleteAllRolePrivilege(id);
		
		return true;
	}
}
