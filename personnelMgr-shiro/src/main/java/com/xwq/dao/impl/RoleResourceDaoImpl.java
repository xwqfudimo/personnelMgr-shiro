package com.xwq.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.xwq.constant.SystemConstants;
import com.xwq.dao.RolePrivilegeDao;
import com.xwq.model.RolePrivilege;

@Repository("roleResourceDao")
public class RoleResourceDaoImpl extends BaseDaoImpl<RolePrivilege> implements
		RolePrivilegeDao {

	/**
	 * 批插入
	 */
	@Override
	public void batchAdd(List<RolePrivilege> rps) {
		Session session = this.getSession();
		
		for(int i=0; i<rps.size(); i++) {
			session.save(rps.get(i));
			if(i % SystemConstants.BATCH_SIZE == 0) {
				session.flush();
				session.clear();
			}
		}
	}

}
