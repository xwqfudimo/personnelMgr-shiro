package com.xwq.comparator;

import java.util.Comparator;

import com.xwq.model.Module;

public class ModuleComparator implements Comparator<Module> {

	@Override
	public int compare(Module o1, Module o2) {
		if(o1.getSort() < o2.getSort()) return -1;
		else if(o1.getSort() > o2.getSort()) return 1;
		return 0;
	}

}
