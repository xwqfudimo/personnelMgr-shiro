package com.xwq.dao.impl;

import org.springframework.stereotype.Repository;

import com.xwq.dao.LogDao;
import com.xwq.model.Log;

@Repository("logDao")
public class LogDaoImpl extends BaseDaoImpl<Log> implements LogDao {

}
