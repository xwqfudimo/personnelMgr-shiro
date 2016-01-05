package com.xwq.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.xwq.model.Employee;
import com.xwq.model.Resource;
import com.xwq.model.User;
import com.xwq.service.ResourceService;
import com.xwq.service.UserService;
import com.xwq.vo.MenuVo;

@Controller
@SessionAttributes({"empId", "empName", "deptName", "modules"})
public class IndexController {
	@Autowired
	private UserService userService;
	@Autowired
	private ResourceService resourceService;

	/**
	 * 管理首页
	 * @param request
	 * @return
	 */
	@RequestMapping(value={"/", "/index"})
	public String index(HttpSession session) {
		String username = session.getAttribute("loginUser").toString();
		
		User user = this.userService.getByUsername(username);
		Employee emp = user.getEmployee();
		
		session.setAttribute("empId", emp.getId());
		session.setAttribute("empName", emp.getName());
		session.setAttribute("deptName", emp.getDepartment().getName());
		
		
		List<Resource> resList = this.resourceService.listByUserId(user.getId());
		List<MenuVo> menus = new ArrayList<MenuVo>();
		
		for(Resource res : resList) {
			if(res.getLevel() == 1) {
				MenuVo vo = new MenuVo();
				vo.setModule(res);
				
				List<Resource> children = new ArrayList<Resource>();
				for(Resource r : resList) {
					if(r.getLevel() == 2 && r.getParent().getId() == res.getId()) {
						children.add(r);
					}
				}
				
				if(children.size() > 0) vo.setChildren(children);
				
				menus.add(vo);
			}
		}
		
		session.setAttribute("menus", menus);
		
		return "index";
	}
}
