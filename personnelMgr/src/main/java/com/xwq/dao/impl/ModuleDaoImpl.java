package com.xwq.dao.impl;

import org.springframework.stereotype.Repository;

import com.xwq.dao.ModuleDao;
import com.xwq.model.Module;

@Repository("moduleDao")
public class ModuleDaoImpl extends BaseDaoImpl<Module> implements ModuleDao {

	@Override
	public boolean moduleIsExist(int id) {
		String hql = "select count(id) from Module where id = ?";
		String result = this.getSession().createQuery(hql).setParameter(0, id).uniqueResult().toString();
		int count = Integer.parseInt(result);
		if(count == 0) return false;
		return true;
	}
	
}
