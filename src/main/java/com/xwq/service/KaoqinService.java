package com.xwq.service;

import java.util.List;

import com.xwq.model.Kaoqin;

public interface KaoqinService {
	public void add(Kaoqin t);
	public void delete(int id);
	public void update(Kaoqin t);
	public Kaoqin get(int id);
	public List<Kaoqin> getListByEmpId(int empId, String filter);
	public List<Kaoqin> listAllByPage(String filter);
}
