package com.xwq.dao.impl;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.hibernate.Query;
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

	@SuppressWarnings("unchecked")
	@Override
	public List<T> getList(String hql, Object... params) {
		Query query = getSession().createQuery(hql);
		for(int i=0; i<params.length; i++) {
			query.setParameter(i, params[i]);
		}
		
		return query.list();
	}

	@Override
	public int execute(String hql, Object... params) {
		Query query = getSession().createQuery(hql);
		for(int i=0; i<params.length; i++) {
			query.setParameter(i, params[i]);
		}
		
		return query.executeUpdate();
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List queryList(String hql, Object... params) {
		Query query = getSession().createQuery(hql);
		for(int i=0; i<params.length; i++) {
			query.setParameter(i, params[i]);
		}
		
		return query.list();
	}

	@Override
	public Object query(String hql, Object... params) {
		Query query = getSession().createQuery(hql);
		for(int i=0; i<params.length; i++) {
			query.setParameter(i, params[i]);
		}
		
		return query.uniqueResult();
	}

	
}
