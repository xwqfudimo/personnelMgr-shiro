package com.xwq.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xwq.annotation.Auth;
import com.xwq.annotation.LogText;
import com.xwq.model.Menu;

@Controller
public class MenuController extends BaseController {
	
	/**
	 * 菜单树
	 * @param request
	 * @param model
	 * @return
	 */
	@Auth("menu/list")
	@RequestMapping("/menuMgr")
	public String list(HttpServletRequest request, Model model) {
		infoSetting(request, "menuMgr", model);
		
		model.addAttribute("menuTree", this.getMenuTreeJsonWithSort());
		
		return "menu/list";
	}
	
	
	/**
	 * 菜单编辑
	 * @param id
	 */
	@Auth("menu/update")
	@RequestMapping("/menu_edit/{id}")
	public String edit(@PathVariable int id, Model model) {
		Menu menu = this.menuService.get(id);
		
		if(menu != null) {
			model.addAttribute("menu", menu);
		}
		
		return "menu/edit";
	}
	
	/**
	 * 更新菜单
	 * @param request
	 * @return
	 */
	@LogText("更新菜单")
	@Auth("menu/update")
	@RequestMapping("/menu_edit_submit")
	public @ResponseBody boolean update(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		Menu menu = this.menuService.get(id);
		
		if(menu != null) {
			menu.setName(request.getParameter("name"));
			menu.setHref(request.getParameter("href"));
			menu.setSort(Integer.parseInt(request.getParameter("sort")));
			
			this.menuService.update(menu);
		}
		
		return true;
	}
	
	
	/**
	 * 删除菜单
	 * @param id
	 * @return
	 */
	@LogText("删除菜单")
	@Auth("menu/delete")
	@RequestMapping("/menu_del/{id}")
	public @ResponseBody boolean delete(@PathVariable int id) {
		this.menuService.delete(id);
		
		return true;
	}
	
	
	/**
	 * 新增菜单
	 * @param pid
	 * @return
	 */
	@Auth("menu/add")
	@RequestMapping("/menu_add/{pid}")
	public String add(@PathVariable int pid, Model model) {
		model.addAttribute("pid", pid);
		
		return "menu/add";
	}
	
	/**
	 * 新增菜单提交
	 * @param request
	 * @return
	 */
	@LogText("新增菜单")
	@Auth("menu/add")
	@RequestMapping(value="/menu_add_submit", method=RequestMethod.POST)
	public @ResponseBody boolean addSubmit(HttpServletRequest request) {
		Menu menu = new Menu();
		menu.setParent(this.menuService.get(Integer.parseInt(request.getParameter("pid"))));
		menu.setName(request.getParameter("name"));
		menu.setHref(request.getParameter("href"));
		menu.setSort(Integer.parseInt(request.getParameter("sort")));
		menu.setLevel(2);
		
		this.menuService.add(menu);
		
		return true;
	}
	
	
	/**
	 * 新增一级菜单
	 */
	@Auth("menu/add")
	@RequestMapping("/menu_add_top")
	public String addTopMenu() {
		return "menu/add_top";
	}
	
	/**
	 * 新增一级菜单提交
	 */
	@LogText("新增一级菜单")
	@Auth("menu/add")
	@RequestMapping("/menu_add_top_submit")
	public @ResponseBody boolean addTopMenuSubmit(HttpServletRequest request) {
		Menu menu = new Menu();
		menu.setName(request.getParameter("name"));
		menu.setHref(request.getParameter("href"));
		menu.setSort(Integer.parseInt(request.getParameter("sort")));
		menu.setLevel(1);
		
		this.menuService.add(menu);
		return true;
	}
}
