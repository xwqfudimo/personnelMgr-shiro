package com.xwq.dao;

import com.xwq.model.Module;

public interface ModuleDao extends BaseDao<Module> {
	public boolean moduleIsExist(int id);
}
