package com.xwq.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xwq.dao.RoleDao;
import com.xwq.dao.UserRoleDao;
import com.xwq.model.Role;
import com.xwq.model.UserRole;
import com.xwq.service.RoleService;

@Service("roleService")
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleDao roleDao;
	@Autowired
	private UserRoleDao userRoleDao;

	@Override
	public void add(Role t) {
		this.roleDao.add(t);
	}

	@Override
	public void delete(int id) {
		this.roleDao.delete(id);
	}

	@Override
	public void update(Role t) {
		this.roleDao.update(t);
	}

	@Override
	public Role get(int id) {
		return this.roleDao.get(id);
	}

	//根据用户id查询用户所拥有的角色
	@Override
	public List<Role> listByUserId(int userId) {
		String hql = "select r from Role r, User u, UserRole ur where u.id = ur.userId AND r.id = ur.roleId where u.id = ?";
		return this.roleDao.getList(hql, userId);
	}

	//新增用户-角色关联
	@Override
	public void addUserRole(int userId, int roleId) {
		UserRole ur = new UserRole();
		ur.setUserId(userId);
		ur.setRoleId(roleId);
		
		this.userRoleDao.add(ur);
	}

	//删除用户-角色关联
	@Override
	public void deleteUserRole(int userId, int roleId) {
		String hql = "delete from UserRole ur where ur.userId = ? and ur.roleId = ?";
		this.userRoleDao.execute(hql, userId, roleId);
	}

}
