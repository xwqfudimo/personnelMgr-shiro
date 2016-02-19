package com.xwq.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.xwq.constant.SystemConstants;
import com.xwq.exception.PermissionDeniedException;
import com.xwq.model.Menu;
import com.xwq.service.DepartmentService;
import com.xwq.service.EmployeeService;
import com.xwq.service.JiabanService;
import com.xwq.service.KaoqinService;
import com.xwq.service.LogService;
import com.xwq.service.MenuService;
import com.xwq.service.PrivilegeService;
import com.xwq.service.QingjiaService;
import com.xwq.service.RoleService;
import com.xwq.service.UserService;
import com.xwq.vo.DeptFzrVo;
import com.xwq.websocket.SystemWebSocketHandler;

@Controller
public class BaseController {
	@Autowired
	protected EmployeeService employeeService;
	@Autowired
	protected UserService userService;
	@Autowired
	protected DepartmentService departmentService;
	@Autowired
	protected JiabanService jiabanService;
	@Autowired
	protected QingjiaService qingjiaService;
	@Autowired
	protected KaoqinService kaoqingService;
	@Autowired
	protected PrivilegeService privilegeService;
	@Autowired
	protected MenuService menuService;
	@Autowired
	protected RoleService roleService;
	@Autowired
	protected LogService logService;
	
	/**
	 * 设置通用信息
	 * @param href
	 * @param model
	 */
	@SuppressWarnings("unchecked")
	protected void infoSetting(HttpServletRequest request, String href, Model model) {
		Map<String,String> menuNameMap = (Map<String, String>) request.getSession().getServletContext().getAttribute("menuNameMap");
		String columnName = menuNameMap.get(href);
		model.addAttribute("columnName", columnName);
	}
	
	
	@Bean
    public SystemWebSocketHandler systemWebSocketHandler() {
        return new SystemWebSocketHandler();
    }
	
	/**
	 * 全部菜单树json
	 * @return
	 */
	protected String getMenuTreeJson() {
		List<Menu> menuList = this.menuService.listTree();
		
		//转换成json格式字符串
		StringBuffer buffer = new StringBuffer();
		buffer.append("[");
		
		for(int i=0; i<menuList.size(); i++) {
			Menu m = menuList.get(i);
			if(i != 0) buffer.append(",");
			buffer.append("{id:" + m.getId() + ", pId:0, name:'" + m.getName() + "',open:true}");
			
			for(Menu c : m.getChildren()) {
				buffer.append(",{id:" + c.getId() + ", pId:" + m.getId() + ", name:'" + c.getName() + "'}");
			}
		}
		buffer.append("]");
		
		return buffer.toString();
	}
	
	/**
	 * 带排序号的全部菜单树json
	 * @return
	 */
	protected String getMenuTreeJsonWithSort() {
		List<Menu> menuList = this.menuService.listTree();
		
		//转换成json格式字符串
		StringBuffer buffer = new StringBuffer();
		buffer.append("[");
		
		for(int i=0; i<menuList.size(); i++) {
			Menu m = menuList.get(i);
			if(i != 0) buffer.append(",");
			buffer.append("{id:" + m.getId() + ", pId:0, name:'" + m.getName() + "(" + m.getSort() + ")',open:true}");
			
			for(Menu c : m.getChildren()) {
				buffer.append(",{id:" + c.getId() + ", pId:" + m.getId() + ", name:'" + c.getName() + "(" + c.getSort() + ")'}");
			}
		}
		buffer.append("]");
		
		return buffer.toString();
	}
	
	/**
	 * 指定角色的菜单树json
	 * @param roleId
	 * @return
	 */
	protected String getMenuTreeByRoleId(int roleId) {
		List<Menu> menuList = this.menuService.listTreeByRoleId(roleId);
		
		//转换成json格式字符串
		StringBuffer buffer = new StringBuffer();
		buffer.append("[");
		
		for(int i=0; i<menuList.size(); i++) {
			Menu m = menuList.get(i);
			if(i != 0) buffer.append(",");
			buffer.append("{id:" + m.getId() + ", pId:0, name:'" + m.getName() + "',open:true}");
			
			for(Menu c : m.getChildren()) {
				buffer.append(",{id:" + c.getId() + ", pId:" + m.getId() + ", name:'" + c.getName() + "'}");
			}
		}
		buffer.append("]");
		
		return buffer.toString();
	}
	
	
	/**
	 * 在全部菜单中勾选指定角色的菜单项
	 * @param roleId
	 * @return
	 */
	protected String getCheckedMenuTreeByGroupAndRoleId(int roleId) {
		List<Menu> menuList = this.menuService.listTree();
		List<Menu> roleMenus = this.menuService.listByRoleId(roleId);
		
		//转换成json格式字符串
		StringBuffer buffer = new StringBuffer();
		buffer.append("[");
		
		for(int i=0; i<menuList.size(); i++) {
			Menu m = menuList.get(i);
			if(i != 0) buffer.append(",");
			
			if(roleMenus.contains(m)) {
				buffer.append("{id:" + m.getId() + ", pId:0, name:'" + m.getName() + "',open:true, checked:true}");
			} else  {
				buffer.append("{id:" + m.getId() + ", pId:0, name:'" + m.getName() + "',open:true}");
			}
			
			for(Menu c : m.getChildren()) {
				if(roleMenus.contains(c)) {
					buffer.append(",{id:" + c.getId() + ", pId:" + m.getId() + ", name:'" + c.getName() + "', checked:true}");
				}
				else {
					buffer.append(",{id:" + c.getId() + ", pId:" + m.getId() + ", name:'" + c.getName() + "'}");
				}
			}
		}
		buffer.append("]");
		
		return buffer.toString();
	}
	
	//根据负责人id返回部门id
	protected int getFzrDeptId(int empId) throws PermissionDeniedException {
		//判断登录用户是否具有审批的资格(部门经理、总经理)
		List<DeptFzrVo> deptList = this.departmentService.getDeptFzrIds();
		
		boolean flag = false;  
		int deptId = -1;
		for(DeptFzrVo vo : deptList) {
			if(vo.getFzrEmpId() == empId) {
				flag = true;
				deptId = vo.getDeptId();
				break;
			}
		}
		
		if(!flag) throw new PermissionDeniedException("你没有权限访问此功能！");
		
		return deptId;
	}
	
	/**
	 * 更新当前登录用户的权限url列表
	 * @param request
	 */
	protected void updatePrivilegeUrlList(HttpServletRequest request) {
		String username = request.getSession().getAttribute(SystemConstants.SESSION_LOGIN_USER).toString();
		List<String> privilegeUriList = this.privilegeService.getAllPrivilegeUrlByUsername(username);
		request.getSession().getServletContext().setAttribute("privilegeUriList", privilegeUriList);
	}
	
}
