package com.xwq.service;

import java.util.List;

import com.xwq.enums.AuditStatus;
import com.xwq.model.Qingjia;

public interface QingjiaService {
	public void add(Qingjia t);
	public void delete(int id);
	public void update(Qingjia t);
	public Qingjia get(int id);
	public List<Qingjia> getListByEmpId(int empId, String filter);
	public List<Qingjia> getListByEmpIds(List<Integer> empIdList, String filter);
	public void updateQingjiaAuditStatus(int id, AuditStatus status, String auditPerson);
}
