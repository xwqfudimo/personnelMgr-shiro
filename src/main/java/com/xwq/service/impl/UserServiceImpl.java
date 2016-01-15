package com.xwq.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xwq.dao.UserDao;
import com.xwq.model.User;
import com.xwq.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	@Override
	public void add(User t) {
		this.userDao.add(t);
	}

	@Override
	public void delete(int id) {
		this.userDao.delete(id);
	}

	@Override
	public void update(User t) {
		this.userDao.update(t);
	}

	@Override
	public User get(int id) {
		return this.userDao.get(id);
	}

	@Override
	public boolean userIsExist(String username) {
		return this.userDao.userIsExist(username);
	}

	@Override
	public String getPwdByUsername(String username) {
		return this.userDao.getPwdByUsername(username);
	}

	@Override
	public User getByUsername(String username) {
		return this.userDao.getByUsername(username);
	}

	@Override
	public boolean updatePassword(String username, String newPwd) {
		String hql = "update User set password = ? where username = ?";
		int result = this.userDao.execute(hql, newPwd, username);
		if(result == 0) return false;
		return true;
	}

	@Override
	public List<User> list() {
		return this.userDao.getList("from User u join fetch u.employee");
	}

}
