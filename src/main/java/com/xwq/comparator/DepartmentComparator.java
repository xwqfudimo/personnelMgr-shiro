package com.xwq.comparator;

import java.util.Comparator;

import com.xwq.model.Department;

public class DepartmentComparator implements Comparator<Department> {

	@Override
	public int compare(Department o1, Department o2) {
		if(o1.getSort() < o2.getSort()) return -1;
		else if(o1.getSort() > o2.getSort()) return 1;
		return 0;
	}

}
