package com.xwq.vo;

import java.util.ArrayList;
import java.util.List;

import com.xwq.model.Resource;

public class MenuVo {
	private Resource module;
	private List<Resource> children = new ArrayList<Resource>();
	
	public Resource getModule() {
		return module;
	}
	public void setModule(Resource module) {
		this.module = module;
	}
	public List<Resource> getChildren() {
		return children;
	}
	public void setChildren(List<Resource> children) {
		this.children = children;
	}
}
