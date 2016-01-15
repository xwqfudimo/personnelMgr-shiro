package com.xwq.service;

import java.util.List;

import com.xwq.model.User;

public interface UserService {
	public void add(User t);
	public void delete(int id);
	public void update(User t);
	public User get(int id);
	public List<User> list();
	
	public boolean userIsExist(String username); 
	public String getPwdByUsername(String username);
	public User getByUsername(String username);
	public boolean updatePassword(String username, String newPwd);
}
