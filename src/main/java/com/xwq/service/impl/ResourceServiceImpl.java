package com.xwq.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xwq.dao.ResourceDao;
import com.xwq.dao.RoleResourceDao;
import com.xwq.model.Resource;
import com.xwq.model.RoleResource;
import com.xwq.service.ResourceService;

@Service("resourceService")
public class ResourceServiceImpl implements ResourceService {
	@Autowired
	private ResourceDao resourceDao;
	@Autowired
	private RoleResourceDao roleResourceDao;

	@Override
	public void add(Resource res) {
		this.resourceDao.add(res);
	}

	@Override
	public void delete(int id) {
		this.resourceDao.delete(id);
	}

	@Override
	public void update(Resource res) {
		this.resourceDao.update(res);
	}

	@Override
	public Resource get(int id) {
		return this.resourceDao.get(id);
	}

	@Override
	public List<Resource> list() {
		return this.resourceDao.getList("from Resource");
	}

	//根据用户id查询用户所拥有的资源
	@Override
	public List<Resource> listByUserId(int userId) {
		String hql = "select res from User u, Role r, Resource res, UserRole ur, RoleResource rr " + 
						"where u.id=ur.userId AND r.id=ur.roleId AND r.id=rr.roleId AND res.id=rr.resId " + 
						"AND u.id = ? order by res.sort";
		return this.resourceDao.getList(hql, userId);
	}

	//根据角色id查询角色所拥有的资源
	@Override
	public List<Resource> listByRoleId(int roleId) {
		String hql = "select res from Role r, Resource res, RoleResource rr where r.id=rr.roleId AND res.id=rr.resId AND r.id = ?";
		return this.resourceDao.getList(hql, roleId);
	}

	//新增角色-资源关联
	@Override
	public void addRoleResource(int roleId, int resId) {
		RoleResource rr = new RoleResource();
		rr.setRoleId(roleId);
		rr.setResId(resId);
		
		this.roleResourceDao.add(rr);
	}

	//删除角色-资源关联
	@Override
	public void deleteRoleResource(int roleId, int resId) {
		String hql = "delete from RoleResource rr where rr.roleId=? and rr.resId=?";
		this.roleResourceDao.execute(hql, roleId, resId);
	}

	//查询栏目名
	@Override
	public String getColumnNameByHref(String href) {
		href = "/" + href;
		String hql = "select name from Resource res where res.href = ? and res.type = 'menu'";
		return this.resourceDao.query(hql, href).toString();
	}

}
