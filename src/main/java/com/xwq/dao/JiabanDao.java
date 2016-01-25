package com.xwq.dao;

import java.util.List;

import com.xwq.model.Jiaban;

public interface JiabanDao extends BaseDao<Jiaban> {
	public int getTotalCountByEmpIds(String hql, String paramName, List<Integer> empIds);
	public List<Jiaban> getByEmpIds(String hql, int offset, int pageSize, String paramName, List<Integer> empIds);
}
