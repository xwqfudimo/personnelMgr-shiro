package com.xwq.service;

import com.xwq.model.User;

public interface UserService {
	public void add(User t);
	public void delete(int id);
	public void update(User t);
	public User get(int id);
	
	public boolean userIsExist(String username); 
	public String getPwdByUsername(String username);
	public User getByUsername(String username);
	public boolean updatePassword(String username, String newPwd);
}
