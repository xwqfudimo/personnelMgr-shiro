package com.xwq.dao.impl;

import org.springframework.stereotype.Repository;

import com.xwq.dao.RoleDao;
import com.xwq.model.Role;

@Repository("roleDao")
public class RoleDaoImpl extends BaseDaoImpl<Role> implements RoleDao {

}
