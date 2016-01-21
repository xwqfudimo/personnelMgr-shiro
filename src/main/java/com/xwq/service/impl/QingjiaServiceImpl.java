package com.xwq.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xwq.dao.QingjiaDao;
import com.xwq.model.Qingjia;
import com.xwq.service.QingjiaService;
import com.xwq.util.Pagination;

@Service("qingjiaService")
public class QingjiaServiceImpl implements QingjiaService {
	@Autowired
	private QingjiaDao qingjiaDao;

	@Override
	public void add(Qingjia t) {
		this.qingjiaDao.add(t);
	}

	@Override
	public void delete(int id) {
		this.qingjiaDao.delete(id);
	}

	@Override
	public void update(Qingjia t) {
		this.qingjiaDao.update(t);
	}

	@Override
	public Qingjia get(int id) {
		return this.qingjiaDao.get(id);
	}

	@Override
	public List<Qingjia> getListByEmpId(int empId, String filter) {
		String hql = "";
		if(filter == null || filter.equals("all-apply")) {
			hql = "from Qingjia j where j.employee.id = ? order by j.submitTime desc";
		}
		else if(filter.equals("null-apply")) {
			hql = "from Qingjia j where j.employee.id = ? and j.auditStatus is null order by j.submitTime desc";
		}
		else if(filter.equals("yes-apply")) {
			hql = "from Qingjia j where j.employee.id = ? and j.auditStatus = 1 order by j.submitTime desc";
		}
		else {
			hql = "from Qingjia j where j.employee.id = ? and j.auditStatus = 0 order by j.submitTime desc";
		}
		
		int totalCount = Integer.parseInt(this.qingjiaDao.query("select count(*) " + hql, empId).toString());
		Pagination.setTotalCount(totalCount);
		
		return this.qingjiaDao.getListByPage(hql, Pagination.getOffset(), Pagination.getPageSize(), empId);
	}

}
