package com.xwq.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xwq.dao.WaichuDao;
import com.xwq.model.Waichu;
import com.xwq.service.WaichuService;

@Service("waichuService")
public class WaichuServiceImpl implements WaichuService {
	@Autowired
	private WaichuDao waichuDao;

	@Override
	public void add(Waichu t) {
		this.waichuDao.add(t);
	}

	@Override
	public void delete(int id) {
		this.waichuDao.delete(id);
	}

	@Override
	public void update(Waichu t) {
		this.waichuDao.update(t);
	}

	@Override
	public Waichu get(int id) {
		return this.waichuDao.get(id);
	}

}
