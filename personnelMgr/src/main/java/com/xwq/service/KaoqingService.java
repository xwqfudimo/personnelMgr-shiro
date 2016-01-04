package com.xwq.service;

import java.util.List;

import com.xwq.model.Kaoqing;

public interface KaoqingService {
	public void add(Kaoqing t);
	public void delete(int id);
	public void update(Kaoqing t);
	public Kaoqing get(int id);
	public List<Kaoqing> getListByEmpId(int empId, String filter);
}
