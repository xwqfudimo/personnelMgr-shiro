package com.xwq.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xwq.dao.AuthorityDao;
import com.xwq.model.Authority;
import com.xwq.service.AuthorityService;

@Service("authorityService")
public class AuthorityServiceImpl implements AuthorityService {
	@Autowired
	private AuthorityDao authorityDao;

	@Override
	public void add(Authority t) {
		this.authorityDao.add(t);
	}

	@Override
	public void delete(int id) {
		this.authorityDao.delete(id);
	}

	@Override
	public void update(Authority t) {
		this.authorityDao.update(t);
	}

	@Override
	public Authority get(int id) {
		return this.authorityDao.get(id);
	}

}
