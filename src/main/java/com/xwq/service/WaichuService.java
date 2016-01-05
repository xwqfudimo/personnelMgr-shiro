package com.xwq.service;

import com.xwq.model.Waichu;

public interface WaichuService {
	public void add(Waichu t);
	public void delete(int id);
	public void update(Waichu t);
	public Waichu get(int id);
}
