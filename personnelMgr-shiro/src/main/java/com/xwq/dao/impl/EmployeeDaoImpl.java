package com.xwq.dao.impl;

import org.springframework.stereotype.Repository;

import com.xwq.dao.EmployeeDao;
import com.xwq.model.Employee;

@Repository("employeeDao")
public class EmployeeDaoImpl extends BaseDaoImpl<Employee> implements
		EmployeeDao {

}
