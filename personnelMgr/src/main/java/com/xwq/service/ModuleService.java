package com.xwq.service;

import com.xwq.model.Module;

public interface ModuleService {
	public void add(Module t);
	public void delete(int id);
	public void update(Module t);
	public Module get(int id);
	
	public boolean moduleIsExist(int id);
}
