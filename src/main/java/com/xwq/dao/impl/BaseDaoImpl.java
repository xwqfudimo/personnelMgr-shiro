package com.xwq.dao.impl;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.xwq.dao.BaseDao;

@Repository
public class BaseDaoImpl<T> implements BaseDao<T> {
	@Autowired
	protected SessionFactory sessionFactory;
	
	protected Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@SuppressWarnings("unchecked")
	protected Class<T> getClz() {
		return (Class<T>)((ParameterizedType)(this.getClass().getGenericSuperclass())).getActualTypeArguments()[0];
	}

	@Override
	public void add(T t) {
		getSession().save(t);
	}

	@Override
	public void delete(int id) {
		getSession().delete(this.get(id));
	}

	@Override
	public void update(T t) {
		getSession().update(t);
	}

	@SuppressWarnings("unchecked")
	@Override
	public T get(int id) {
		return (T)getSession().get(getClz(), id);
	}
	
	protected Query getQuery(String hql, Object... params) {
		Query query = getSession().createQuery(hql);
		for(int i=0; i<params.length; i++) {
			query.setParameter(i, params[i]);
		}
		return query;
	}
	
	protected SQLQuery getSQLQuery(String sql, Object... params) {
		SQLQuery query = getSession().createSQLQuery(sql);
		for(int i=0; i<params.length; i++) {
			query.setParameter(i, params[i]);
		}
		return query;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> getList(String hql, Object... params) {
		Query query = getQuery(hql, params);
		return query.list();
	}

	@Override
	public int execute(String hql, Object... params) {
		Query query = getQuery(hql, params);
		return query.executeUpdate();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List queryList(String hql, Object... params) {
		Query query = getQuery(hql, params);
		return query.list();
	}

	@Override
	public Object query(String hql, Object... params) {
		Query query = getQuery(hql, params);
		
		return query.uniqueResult();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List sqlQueryList(String sql, Object... params) {
		SQLQuery query = getSQLQuery(sql, params);
		return query.list();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<T> getListByPage(String hql, int offset, int pageSize, Object... params) {
		Query query = getQuery(hql, params);
		query.setFirstResult(offset).setMaxResults(pageSize);
		return query.list();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List queryListByPage(String hql, int offset, int pageSize, Object... params) {
		Query query = getQuery(hql, params);
		query.setFirstResult(offset).setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public Object sqlQuery(String sql, Object... params) {
		SQLQuery query = getSQLQuery(sql, params);
		return query.uniqueResult();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List sqlQueryListByPage(String sql, int offset, int pageSize, Object... params) {
		SQLQuery query = getSQLQuery(sql, params);
		query.setFirstResult(offset);
		query.setMaxResults(pageSize);
		return query.list();
	}

	
}
