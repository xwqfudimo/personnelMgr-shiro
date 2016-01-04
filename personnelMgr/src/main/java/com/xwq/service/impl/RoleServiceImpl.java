package com.xwq.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xwq.dao.RoleDao;
import com.xwq.model.Role;
import com.xwq.service.RoleService;

@Service("roleService")
public class RoleServiceImpl implements RoleService {
	@Autowired
	private RoleDao roleDao;

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

}
