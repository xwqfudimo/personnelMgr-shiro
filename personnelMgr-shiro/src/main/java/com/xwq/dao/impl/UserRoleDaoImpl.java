package com.xwq.dao.impl;

import org.springframework.stereotype.Repository;

import com.xwq.dao.UserRoleDao;
import com.xwq.model.UserRole;

@Repository("userRoleDao")
public class UserRoleDaoImpl extends BaseDaoImpl<UserRole> implements
		UserRoleDao {

}
