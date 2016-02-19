package com.xwq.service;

import java.util.List;
import java.util.Map;

import com.xwq.model.Privilege;
import com.xwq.model.RolePrivilege;

public interface PrivilegeService {
	public void add(Privilege res);
	public void delete(int id);
	public void update(Privilege res);
	public Privilege get(int id);
	public List<Privilege> list();
	public List<Privilege> list(String search);
	public Map<String, List<Privilege>> listByGroup();
	public Map<String, List<Privilege>> listByGroupAndRoleId(int roleId);
	
	public List<Privilege> listByUserId(int userId);
	public List<Privilege> listByRoleId(int roleId);
	
	public void addRolePrivilege(int roleId, int priId);
	public void deleteRolePrivilege(int roleId, int priId);
	public void batchAddRolePrivilege(List<RolePrivilege> rps);
	public void deleteAllRolePrivilege(int roleId);
	
	public List<String> getAllPrivilegeUrlByUsername(String username);
}
