package com.xwq.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xwq.dao.JiabanDao;
import com.xwq.model.Jiaban;
import com.xwq.service.JiabanService;

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
			hql = "from Jiaban j where j.employee.id = ? order by j.startTime desc";
		}
		else if(filter.equals("null-apply")) {
			hql = "from Jiaban j where j.employee.id = ? and j.auditStatus is null order by j.startTime desc";
		}
		else if(filter.equals("yes-apply")) {
			hql = "from Jiaban j where j.employee.id = ? and j.auditStatus = 1 order by j.startTime desc";
		}
		else {
			hql = "from Jiaban j where j.employee.id = ? and j.auditStatus = 0 order by j.startTime desc";
		}
		
		return this.jiabanDao.getList(hql, empId);
	}

}
