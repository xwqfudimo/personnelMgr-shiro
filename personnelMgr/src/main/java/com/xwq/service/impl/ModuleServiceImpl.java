package com.xwq.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xwq.dao.ModuleDao;
import com.xwq.model.Module;
import com.xwq.service.ModuleService;

@Service("moduleService")
public class ModuleServiceImpl implements ModuleService {
	@Autowired
	private ModuleDao moduleDao;
	
	@Override
	public void add(Module t) {
		this.moduleDao.add(t);
	}

	@Override
	public void delete(int id) {
		this.moduleDao.delete(id);
	}

	@Override
	public void update(Module t) {
		this.moduleDao.update(t);
	}

	@Override
	public Module get(int id) {
		return this.moduleDao.get(id);
	}

	@Override
	public boolean moduleIsExist(int id) {
		return this.moduleDao.moduleIsExist(id);
	}

}
