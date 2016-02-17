package com.xwq.vo;

import java.util.ArrayList;
import java.util.List;

import com.xwq.model.Privilege;

public class MenuVo {
	private Privilege module;
	private List<Privilege> children = new ArrayList<Privilege>();
	
	public Privilege getModule() {
		return module;
	}
	public void setModule(Privilege module) {
		this.module = module;
	}
	public List<Privilege> getChildren() {
		return children;
	}
	public void setChildren(List<Privilege> children) {
		this.children = children;
	}
}
