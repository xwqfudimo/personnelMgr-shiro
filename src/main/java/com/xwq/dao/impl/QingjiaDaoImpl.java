package com.xwq.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.xwq.dao.QingjiaDao;
import com.xwq.model.Qingjia;

@Repository("qingjiaDao")
public class QingjiaDaoImpl extends BaseDaoImpl<Qingjia> implements QingjiaDao {

	@Override
	public int getTotalCountByEmpIds(String hql, String paramName, List<Integer> empIdList) {
		String result = getSession().createQuery(hql).setParameterList(paramName, empIdList).uniqueResult().toString();
		int totalCount = result == null? 0 : Integer.parseInt(result);
		return totalCount;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Qingjia> getByEmpIds(String hql, int offset, int pageSize, String paramName, List<Integer> empIdList) {
		return getSession().createQuery(hql).setParameterList(paramName, empIdList).setFirstResult(offset).setMaxResults(pageSize).list();
	}

}
