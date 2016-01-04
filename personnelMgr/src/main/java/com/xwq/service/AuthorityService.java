package com.xwq.service;

import com.xwq.model.Authority;

public interface AuthorityService {
	public void add(Authority t);
	public void delete(int id);
	public void update(Authority t);
	public Authority get(int id);
}
