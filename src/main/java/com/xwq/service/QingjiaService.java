package com.xwq.service;

import java.util.List;

import com.xwq.model.Qingjia;

public interface QingjiaService {
	public void add(Qingjia t);
	public void delete(int id);
	public void update(Qingjia t);
	public Qingjia get(int id);
	public List<Qingjia> getListByEmpId(int empId, String filter);
}
