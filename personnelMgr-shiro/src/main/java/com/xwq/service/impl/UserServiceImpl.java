package com.xwq.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xwq.dao.UserDao;
import com.xwq.model.User;
import com.xwq.service.UserService;
import com.xwq.util.Pagination;
import com.xwq.vo.UserVo;

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

	/**
	 * 查询用户是否存在
	 */
	@Override
	public boolean userIsExist(String username) {
		return this.userDao.userIsExist(username);
	}

	/**
	 * 根据用户名查询密码
	 */
	@Override
	public String getPwdByUsername(String username) {
		return this.userDao.getPwdByUsername(username);
	}

	/**
	 * 根据用户名查询用户
	 */
	@Override
	public User getByUsername(String username) {
		return this.userDao.getByUsername(username);
	}

	/**
	 * 更新指定用户名的密码
	 */
	@Override
	public boolean updatePassword(String username, String newPwd) {
		String hql = "update User set password = ? where username = ?";
		int result = this.userDao.execute(hql, newPwd, username);
		if(result == 0) return false;
		return true;
	}


	/**
	 * 分页查询用户列表
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<UserVo> list(String search) {
		int totalCount = Integer.parseInt(this.userDao.query("select count(id) from User where username like ?", "%"+search+"%").toString());
		Pagination.setTotalCount(totalCount);
		
		String sql = "SELECT u.id as uid, u.username as username, e.name as ename, urr.rname as rname  FROM USER u LEFT JOIN (SELECT ur.user_id AS userid, r.role_desc as rname FROM user_role ur, role r WHERE ur.role_id = r.id) urr ON(u.id = urr.userid) LEFT JOIN employee e ON(u.emp_id = e.id) where u.username like ?";
		List<Object[]> list = this.userDao.sqlQueryListByPage(sql, Pagination.getOffset(), Pagination.getPageSize(), "%"+search+"%");
		
		Map<Integer,UserVo> userMap = new HashMap<Integer,UserVo>();
		
		for(Object[] objs : list) {
			int uid = Integer.parseInt(objs[0].toString());
			String username = objs[1].toString();
			String ename = objs[2] == null? "" : objs[2].toString();
			String rname = objs[3] == null? "" : objs[3].toString();
		
			if(userMap.containsKey(uid)) {
				UserVo uv = userMap.get(uid);
				String uvRname = uv.getRname();
				uvRname = uvRname + "，" + rname;
				uv.setRname(uvRname);
				userMap.put(uid, uv);
			}
			else {
				UserVo vo = new UserVo();
				vo.setUid(uid);
				vo.setUsername(username);
				vo.setEname(ename);
				vo.setRname(rname);
				userMap.put(uid, vo);
			}
		}
		
		
		List<UserVo> userList = new ArrayList<UserVo>();
		userList.addAll(userMap.values());
		
		return userList;
	}

	/**
	 * 根据员工名查询用户名
	 */
	@Override
	public String getUsernameByEmpName(String empName) {
		String hql = "select u.username from User u, Employee e where u.employee.id = e.id and e.name = ?";
		return this.userDao.query(hql, empName).toString();
	}

}
