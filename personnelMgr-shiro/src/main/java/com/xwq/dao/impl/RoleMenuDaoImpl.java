package com.xwq.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import com.xwq.constant.SystemConstants;
import com.xwq.dao.RoleMenuDao;
import com.xwq.model.RoleMenu;

@Repository("roleMenuDao")
public class RoleMenuDaoImpl extends BaseDaoImpl<RoleMenu> implements RoleMenuDao {
	/**
	 * 批插入
	 */
	@Override
	public void batchAdd(List<RoleMenu> rms) {
		Session session = this.getSession();
		for(int i=0; i<rms.size(); i++) {
			session.save(rms.get(i));
			if(i % SystemConstants.BATCH_SIZE == 0) {
				session.flush();
				session.clear();
			}
		}
	}
}
