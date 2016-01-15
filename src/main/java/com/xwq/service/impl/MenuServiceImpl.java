package com.xwq.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.xwq.dao.MenuDao;
import com.xwq.model.Menu;
import com.xwq.service.MenuService;

@Service("menuService")
public class MenuServiceImpl implements MenuService {
	@Autowired
	private MenuDao menuDao;

	@Override
	public List<Menu> listByUsername(String username) {
		String hql = "select mu from Menu mu, User u, Role r, UserRole ur, RoleMenu rm where u.id = ur.userId AND r.id = ur.roleId AND r.id = rm.roleId AND mu.id = rm.menuId AND u.username = ? order by mu.sort";
		List<Menu> menuList = this.menuDao.getList(hql, username);
		
		List<Menu> menus = new ArrayList<Menu>();
		
		for(Menu menu : menuList) {
			if(menu.getLevel() == 1) {
				for(Menu m : menuList) {
					if(m.getLevel() == 2 && m.getParent().getId() == menu.getId()) {
						menu.getChildren().add(m);
					}
				}
				
				menus.add(menu);
			}
		}
		
		return menus;
	}

	//查询菜单名
	@Override
	public String getMenuNameByHref(String href) {
		href = "/" + href;
		String hql = "select name from Menu m where m.href = ?";
		return this.menuDao.query(hql, href).toString();
	}

	//菜单树
	@Override
	public List<Menu> listTree() {
		List<Menu> list = this.menuDao.getList("from Menu order by sort");
		List<Menu> menuList = new ArrayList<Menu>();
		
		for(Menu mu : list) {
			if(mu.getLevel() == 1) {
				menuList.add(mu);
			}
		}
		for(Menu pm : menuList) {
			for(Menu mu : list) {
				if(mu.getLevel() > 1 && mu.getParent().getId() == pm.getId()) {
					pm.getChildren().add(mu);
				}
			}
		}
		
		return menuList;
	}

	@Override
	public Menu get(int id) {
		return this.menuDao.get(id);
	}

	@Override
	public void update(Menu menu) {
		this.menuDao.update(menu);
	}

	@Override
	public void delete(int id) {
		//如果是父级菜单,先删除子菜单
		if(this.get(id).getLevel() == 1) {
			this.deleteByPid(id);
		}
		
		this.menuDao.delete(id);
	}

	@Override
	public void add(Menu menu) {
		this.menuDao.add(menu);
	}

	@Override
	public void deleteByPid(int pid) {
		String hql = "delete from Menu m where m.parent.id = ?";
		this.menuDao.execute(hql, pid);
	}
}
