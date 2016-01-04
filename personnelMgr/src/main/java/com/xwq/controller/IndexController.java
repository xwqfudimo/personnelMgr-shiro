package com.xwq.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.xwq.comparator.ModuleComparator;
import com.xwq.model.Column;
import com.xwq.model.Employee;
import com.xwq.model.Module;
import com.xwq.model.Role;
import com.xwq.model.User;
import com.xwq.service.ColumnService;
import com.xwq.service.UserService;
import com.xwq.vo.ModuleColumnVo;

@Controller
@SessionAttributes({"empId", "empName", "deptName", "modules"})
public class IndexController {
	@Autowired
	private UserService userService;
	@Autowired
	private ColumnService columnService;

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
		Role role = emp.getRole();
		List<Module> modules = role.getModules();
		Collections.sort(modules, new ModuleComparator());
		
		List<Column> columns = this.columnService.getAllColumns();
		
		List<ModuleColumnVo> voList = new ArrayList<ModuleColumnVo>();
		
		for(Module m : modules) {
			ModuleColumnVo vo = new ModuleColumnVo();
			vo.setModule(m);
			
			List<Column> cols = new ArrayList<Column>();
			for(Column c : columns) {
				if(c.getModule().getId() == m.getId()) {
					cols.add(c);
				}
			}
			
			vo.setColumns(cols);
			voList.add(vo);
		}
		
		session.setAttribute("empId", emp.getId());
		session.setAttribute("empName", emp.getName());
		session.setAttribute("deptName", emp.getDepartment().getName());
		session.setAttribute("modules", voList);
		
		return "index";
	}
}
