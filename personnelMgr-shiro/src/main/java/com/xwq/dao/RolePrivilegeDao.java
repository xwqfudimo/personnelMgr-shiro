package com.xwq.dao;

import java.util.List;

import com.xwq.model.RolePrivilege;

public interface RolePrivilegeDao extends BaseDao<RolePrivilege> {
	public void batchAdd(List<RolePrivilege> rps);
}
