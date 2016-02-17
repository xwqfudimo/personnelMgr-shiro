package com.xwq.dao.impl;

import org.springframework.stereotype.Repository;

import com.xwq.dao.PrivilegeDao;
import com.xwq.model.Privilege;

@Repository("resourceDao")
public class ResourceDaoImpl extends BaseDaoImpl<Privilege> implements
		PrivilegeDao {

}
