package com.xwq.service;

import java.util.List;

import com.xwq.model.Jiaban;

public interface JiabanService {
	public void add(Jiaban t);
	public void delete(int id);
	public void update(Jiaban t);
	public Jiaban get(int id);
	public List<Jiaban> getListByEmpId(int empId, String filter);
}
