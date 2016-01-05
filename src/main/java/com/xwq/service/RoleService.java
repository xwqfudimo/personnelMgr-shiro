package com.xwq.service;

import java.util.List;

import com.xwq.model.Role;

public interface RoleService {
	public void add(Role t);
	public void delete(int id);
	public void update(Role t);
	public Role get(int id);
	
	public List<Role> listByUserId(int userId);
	public void addUserRole(int userId, int roleId);
	public void deleteUserRole(int userId, int roleId);
}
