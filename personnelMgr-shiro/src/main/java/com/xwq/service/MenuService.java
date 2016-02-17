package com.xwq.service;

import java.util.List;

import com.xwq.model.Menu;

public interface MenuService {
	public Menu get(int id);
	public void update(Menu menu);
	public void delete(int id);
	public void add(Menu menu);
	
	public void deleteByPid(int pid);
	
	public List<Menu> listTree();
	public List<Menu> listByUsername(String username);
	public List<Menu> listTreeByRoleId(int roleId);
	public List<Menu> listByRoleId(int roleId);
	
	public String getMenuNameByHref(String href);
	
	public void deleteAllRoleMenu(int roleId);
	
	
	public List<Menu> getAllMenuByUsername(String username);
}
