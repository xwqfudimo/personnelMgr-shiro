package com.xwq.dao;

import java.util.List;

import com.xwq.model.Qingjia;

public interface QingjiaDao extends BaseDao<Qingjia> {

	int getTotalCountByEmpIds(String hql, String paramName, List<Integer> empIdList);

	List<Qingjia> getByEmpIds(String hql, int offset, int pageSize, String paramName, List<Integer> empIdList);

}
