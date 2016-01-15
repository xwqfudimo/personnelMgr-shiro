package com.xwq.service;

import java.util.List;

import com.xwq.model.Resource;

public interface ResourceService {
	public void add(Resource res);
	public void delete(int id);
	public void update(Resource res);
	public Resource get(int id);
	public List<Resource> list();
	
	
	public List<Resource> listByUserId(int userId);
	public List<Resource> listByRoleId(int roleId);
	
	public void addRoleResource(int roleId, int resId);
	public void deleteRoleResource(int roleId, int resId);
}
