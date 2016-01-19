package com.xwq.dao.impl;

import org.springframework.stereotype.Repository;

import com.xwq.dao.AuthorityDao;
import com.xwq.model.Privilege;

@Repository("authorityDao")
public class AuthorityDaoImpl extends BaseDaoImpl<Privilege> implements
		AuthorityDao {

}
