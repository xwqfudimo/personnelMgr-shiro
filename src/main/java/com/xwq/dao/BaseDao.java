package com.xwq.dao;

import java.util.List;

public interface BaseDao<T> {
	public void add(T t);
	public void delete(int id);
	public void update(T t);
	public T get(int id);
	public Object query(String hql, Object...params);
	public List<T> getList(String hql, Object...params);
	public int execute(String hql, Object...params);
	@SuppressWarnings("rawtypes")
	public List queryList(String hql, Object...params);
}
