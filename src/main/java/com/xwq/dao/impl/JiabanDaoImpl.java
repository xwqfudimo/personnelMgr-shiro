package com.xwq.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.xwq.dao.JiabanDao;
import com.xwq.model.Jiaban;

@Repository("jiabanDao")
public class JiabanDaoImpl extends BaseDaoImpl<Jiaban> implements JiabanDao {

	@SuppressWarnings("unchecked")
	@Override
	public List<Jiaban> getByEmpIds(String hql, int offset, int pageSize, String paramName, List<Integer> empIds) {
		return getSession().createQuery(hql).setParameterList(paramName, empIds).setFirstResult(offset).setMaxResults(pageSize).list();
	}

	@Override
	public int getTotalCountByEmpIds(String hql, String paramName, List<Integer> empIds) {
		String result = getSession().createQuery(hql).setParameterList(paramName, empIds).uniqueResult().toString();
		int totalCount = result == null? 0 : Integer.parseInt(result);
		return totalCount;
	}
}
