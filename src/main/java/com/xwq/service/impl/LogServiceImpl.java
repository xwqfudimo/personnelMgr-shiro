package com.xwq.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xwq.dao.LogDao;
import com.xwq.model.Log;
import com.xwq.service.LogService;
import com.xwq.util.Pagination;

@Service("logService")
public class LogServiceImpl implements LogService {
	@Autowired
	private LogDao logDao;

	@Override
	public void addLog(Log log) {
		this.logDao.add(log);
	}

	@Override
	public List<Log> listByPage(String search) {
		String hql = " from Log where logMsg like ? order by recordTime desc";
		
		int totalCount = Integer.parseInt(this.logDao.query("select count(*) " + hql, "%"+search+"%").toString());
		Pagination.setTotalCount(totalCount);
		
		return this.logDao.getListByPage(hql, Pagination.getOffset(), Pagination.getPageSize(), "%"+search+"%");
	}

	@Override
	public Log get(int id) {
		return this.logDao.get(id);
	}
}
