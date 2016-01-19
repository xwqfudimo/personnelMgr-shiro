package com.xwq.dao;

import java.util.List;

import com.xwq.model.RoleMenu;

public interface RoleMenuDao extends BaseDao<RoleMenu> {
	public void batchAdd(List<RoleMenu> rms);
}
