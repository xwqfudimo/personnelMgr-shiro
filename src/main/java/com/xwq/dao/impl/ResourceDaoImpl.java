package com.xwq.dao.impl;

import org.springframework.stereotype.Repository;

import com.xwq.dao.ResourceDao;
import com.xwq.model.Resource;

@Repository("resourceDao")
public class ResourceDaoImpl extends BaseDaoImpl<Resource> implements
		ResourceDao {

}
