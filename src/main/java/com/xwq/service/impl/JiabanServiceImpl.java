package com.xwq.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xwq.dao.JiabanDao;
import com.xwq.enums.AuditStatus;
import com.xwq.model.Jiaban;
import com.xwq.service.JiabanService;
import com.xwq.util.Pagination;

@Service("jiabanService")
public class JiabanServiceImpl implements JiabanService {
	@Autowired
	private JiabanDao jiabanDao;

	@Override
	public void add(Jiaban t) {
		this.jiabanDao.add(t);
	}

	@Override
	public void delete(int id) {
		this.jiabanDao.delete(id);
	}

	@Override
	public void update(Jiaban t) {
		this.jiabanDao.update(t);
	}

	@Override
	public Jiaban get(int id) {
		return this.jiabanDao.get(id);
	}

	@Override
	public List<Jiaban> getListByEmpId(int empId, String filter) {
		String hql = "";
		if(filter == null || filter.equals("all-apply")) {
			hql = "from Jiaban j where j.employee.id = ? order by j.submitTime desc";
		}
		else if(filter.equals("null-apply")) {
			hql = "from Jiaban j where j.employee.id = ? and j.auditStatus is null order by j.submitTime desc";
		}
		else if(filter.equals("yes-apply")) {
			hql = "from Jiaban j where j.employee.id = ? and j.auditStatus = 1 order by j.submitTime desc";
		}
		else {
			hql = "from Jiaban j where j.employee.id = ? and j.auditStatus = 0 order by j.submitTime desc";
		}
		
		int totalCount = Integer.parseInt(this.jiabanDao.query("select count(*) " + hql, empId).toString());
		Pagination.setTotalCount(totalCount);
		
		return this.jiabanDao.getListByPage(hql, Pagination.getOffset(), Pagination.getPageSize(), empId);
	}

	
	@Override
	public List<Jiaban> getListByEmpIds(List<Integer> empIds, String filter) {
		String hql = "";
		if(filter == null || filter.equals("all")) {
			hql = "from Jiaban j where j.employee.id in(:ids) order by j.submitTime desc";
		}
		else if(filter.equals("null")) {
			hql = "from Jiaban j where j.employee.id in(:ids) and j.auditStatus is null order by j.submitTime desc";
		}
		else if(filter.equals("yes")) {
			hql = "from Jiaban j where j.employee.id in(:ids) and j.auditStatus = 1 order by j.submitTime desc";
		}
		else {
			hql = "from Jiaban j where j.employee.id in(:ids) and j.auditStatus = 0 order by j.submitTime desc";
		}
		
		int totalCount = this.jiabanDao.getTotalCountByEmpIds("select count(*) " + hql, "ids", empIds);
		Pagination.setTotalCount(totalCount);
		
		return this.jiabanDao.getByEmpIds(hql, Pagination.getOffset(), Pagination.getPageSize(), "ids", empIds);
	}

	@Override
	public void updateJiabanAuditStatus(int id, AuditStatus status, String auditPerson) {
		String hql = "update Jiaban set auditStatus = ?, auditPerson = ? where id = ?";
		this.jiabanDao.execute(hql, status, auditPerson, id);
	}

}
