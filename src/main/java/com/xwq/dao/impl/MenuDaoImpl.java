package com.xwq.dao.impl;

import org.springframework.stereotype.Repository;

import com.xwq.dao.MenuDao;
import com.xwq.model.Menu;

@Repository("menuDao")
public class MenuDaoImpl extends BaseDaoImpl<Menu> implements MenuDao {

}
