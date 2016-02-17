package com.xwq.dao;

import com.xwq.model.User;

public interface UserDao extends BaseDao<User> {
	public boolean userIsExist(String username);
	public String getPwdByUsername(String username);
	public User getByUsername(String username);
}
