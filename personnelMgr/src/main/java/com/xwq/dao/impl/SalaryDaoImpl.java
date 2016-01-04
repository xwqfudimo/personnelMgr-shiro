package com.xwq.dao.impl;

import org.springframework.stereotype.Repository;

import com.xwq.dao.SalaryDao;
import com.xwq.model.Salary;

@Repository("salaryDao")
public class SalaryDaoImpl extends BaseDaoImpl<Salary> implements SalaryDao {

}
