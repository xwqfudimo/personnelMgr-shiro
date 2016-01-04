package com.xwq.service;

import com.xwq.model.Role;

public interface RoleService {
	public void add(Role t);
	public void delete(int id);
	public void update(Role t);
	public Role get(int id);
}
