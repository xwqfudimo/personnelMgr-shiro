package com.xwq.service;

import java.util.List;

import com.xwq.model.Log;

public interface LogService {
	public void addLog(Log log);
	public List<Log> listByPage(String search);
	public Log get(int id);
}
