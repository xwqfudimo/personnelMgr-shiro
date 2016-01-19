package com.xwq.service;

import java.util.List;

import com.xwq.model.Role;
import com.xwq.model.RoleMenu;

public interface RoleService {
	public void add(Role t);
	public void delete(int id);
	public void update(Role t);
	public Role get(int id);
	public List<Role> list();
	
	public List<Role> listByUserId(int userId);
	public void addUserRoles(int userId, int... roleIds);
	public void deleteUserRole(int userId, int roleId);
	public void deleteAllUserRole(int userId);
	
	public void batchAddRoleMenu(List<RoleMenu> rms);
}
