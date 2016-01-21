package com.xwq.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xwq.dao.KaoqingDao;
import com.xwq.model.Kaoqing;
import com.xwq.service.KaoqingService;
import com.xwq.util.DateUtil;
import com.xwq.util.Pagination;

@Service("kaoqingService")
public class KaoqingServiceImpl implements KaoqingService {
	@Autowired
	private KaoqingDao kaoqingDao;

	@Override
	public void add(Kaoqing t) {
		this.kaoqingDao.add(t);
	}

	@Override
	public void delete(int id) {
		this.kaoqingDao.delete(id);
	}

	@Override
	public void update(Kaoqing t) {
		this.kaoqingDao.update(t);
	}

	@Override
	public Kaoqing get(int id) {
		return this.kaoqingDao.get(id);
	}

	@Override
	public List<Kaoqing> getListByEmpId(int empId, String filter) {
		List<Kaoqing> result = null;
		if(filter == null || "this-month".equals(filter)) {
			String hql = "from Kaoqing kq where kq.employee.id = ? and kq.date like ? order by kq.date desc";
			
			int totalCount = Integer.parseInt(this.kaoqingDao.query("select count(*) " + hql, empId, DateUtil.getThisMonth() + "%").toString());
			Pagination.setTotalCount(totalCount);
			
			result = this.kaoqingDao.getListByPage(hql, Pagination.getOffset(), Pagination.getPageSize(), empId, DateUtil.getThisMonth() + "%");
		}
		else if("last-month".equals(filter)) {
			String hql = "from Kaoqing kq where kq.employee.id = ? and kq.date like ? order by kq.date desc";
			
			int totalCount = Integer.parseInt(this.kaoqingDao.query("select count(*) " + hql, empId, DateUtil.getLastMonth() + "%").toString());
			Pagination.setTotalCount(totalCount);
			
			result = this.kaoqingDao.getListByPage(hql, Pagination.getOffset(), Pagination.getPageSize(), empId, DateUtil.getLastMonth() + "%");
		}
		else {
			String hql = "from Kaoqing kq where kq.employee.id = ? order by kq.date desc";
			
			int totalCount = Integer.parseInt(this.kaoqingDao.query("select count(*) " + hql, empId).toString());
			Pagination.setTotalCount(totalCount);
			
			result = this.kaoqingDao.getListByPage(hql, Pagination.getOffset(), Pagination.getPageSize(), empId);
		}
			
		return result;
	}

}
