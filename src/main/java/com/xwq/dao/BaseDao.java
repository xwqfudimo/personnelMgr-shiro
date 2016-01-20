package com.xwq.dao;

import java.util.List;

@SuppressWarnings("rawtypes")
public interface BaseDao<T> {
	public void add(T t);
	public void delete(int id);
	public void update(T t);
	public T get(int id);
	
	public Object query(String hql, Object...params);
	public List<T> getList(String hql, Object...params);
	public List<T> getListByPage(String hql, int offset, int pageSize, Object...params);
	public int execute(String hql, Object...params);
	public List queryList(String hql, Object...params);
	public List queryListByPage(String hql, int offset, int pageSize, Object...params);
	
	
	public List sqlQueryList(String sql, Object...params);
	public List sqlQueryListByPage(String sql, int offset, int pageSize, Object...params);
	public Object sqlQuery(String sql, Object...params);
}
