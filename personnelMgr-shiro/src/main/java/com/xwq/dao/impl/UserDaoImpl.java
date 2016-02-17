package com.xwq.dao.impl;

import org.springframework.stereotype.Repository;

import com.xwq.dao.UserDao;
import com.xwq.model.User;

@Repository("userDao")
public class UserDaoImpl extends BaseDaoImpl<User> implements UserDao {
	
	/**
	 * 用户是否存在
	 */
	@Override
	public boolean userIsExist(String username) {
		String hql = "select count(id) from User where username = ?";
		String result = this.getSession().createQuery(hql).setParameter(0, username).uniqueResult().toString();
		int count = Integer.parseInt(result);
		if(count == 0) return false;
		return true;
	}

	/**
	 * 根据用户名查询登录密码
	 */
	@Override
	public String getPwdByUsername(String username) {
		String hql = "select password from User where username = ?";
		return this.getSession().createQuery(hql).setParameter(0, username).uniqueResult().toString();
	}

	@Override
	public User getByUsername(String username) {
		String hql = "from User u join fetch u.employee join fetch u.employee.department where u.username = ?";
		User user = (User)this.getSession().createQuery(hql).setParameter(0, username).uniqueResult();
		
		return user;
	}

	
}
