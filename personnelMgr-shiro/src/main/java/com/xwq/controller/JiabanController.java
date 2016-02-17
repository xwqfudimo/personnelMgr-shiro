package com.xwq.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.TextMessage;

import com.xwq.annotation.Auth;
import com.xwq.annotation.LogText;
import com.xwq.enums.AuditStatus;
import com.xwq.exception.PermissionDeniedException;
import com.xwq.model.Jiaban;
import com.xwq.util.DateUtil;

@Controller
public class JiabanController extends BaseController {
	/**
	 * 加班申请列表
	 */
	@Auth("jiaban/list")
	@RequestMapping(value="/jiabanApply", method=RequestMethod.GET)
	public String jiabanApply(HttpServletRequest request, Model model) {
		infoSetting(request, "jiabanApply", model);
		
		String filter = request.getParameter("filter");
		int empId = Integer.parseInt(request.getSession().getAttribute("empId").toString());
		List<Jiaban> list = this.jiabanService.getListByEmpId(empId, filter);
		model.addAttribute("jiabanList", list);
		
		if(filter == null) filter = "all-apply";
		model.addAttribute("filter", filter);
		
		return "jiabanApply/list";
	}
	
	/**
	 * 新增加班申请
	 */
	@Auth("jiaban/add")
	@RequestMapping(value="/jiabanApply_add", method=RequestMethod.GET)
	public String addJiabanApply(HttpServletRequest request, Model model) {
		infoSetting(request, "jiabanApply", model);
		
		return "jiabanApply/add";
	}
	
	/**
	 * 新增加班申请提交
	 * @param request
	 * @param model
	 * @return
	 */
	@LogText("新增加班申请")
	@Auth("jiaban/add")
	@RequestMapping(value="/jiabanApply_add", method=RequestMethod.POST)
	public String addJiabanApplySubmit(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		
		Jiaban jiaban = new Jiaban();
		jiaban.setStartTime(request.getParameter("start_time"));
		jiaban.setEndTime(request.getParameter("end_time"));
		jiaban.setDayNum(Integer.parseInt(request.getParameter("day_num")));
		jiaban.setHourNum(Integer.parseInt(request.getParameter("hour_num")));
		jiaban.setJbReason(request.getParameter("reason"));
		jiaban.setEmployee(this.employeeService.get(Integer.parseInt(session.getAttribute("empId").toString())));
		jiaban.setEmpName(session.getAttribute("empName").toString());
		jiaban.setDeptName(session.getAttribute("deptName").toString());
		jiaban.setSubmitTime(DateUtil.getCurrentTime());
		
		this.jiabanService.add(jiaban);
		
		return "redirect:/jiabanApply";
	}
	
	
	/**
	 * 查看加班申请
	 */
	@Auth("jiaban/view")
	@RequestMapping(value="/jiabanApply/{id}", method=RequestMethod.GET)
	public String viewJiabanApply(@PathVariable int id, HttpServletRequest request, Model model) {
		infoSetting(request, "jiabanApply", model);
		
		Jiaban jb = this.jiabanService.get(id);
		model.addAttribute("jb", jb);
		
		return "jiabanApply/show";
	}
	
	
	/**
	 * 加班申请修改
	 */
	@Auth("jiaban/update")
	@RequestMapping(value="/jiabanApply_edit/{id}", method=RequestMethod.GET)
	public String editJiabanApply(@PathVariable int id, HttpServletRequest request, Model model) {
		infoSetting(request, "jiabanApply", model);
		
		Jiaban jb = this.jiabanService.get(id);
		model.addAttribute("jb", jb);
		
		return "jiabanApply/edit";
	}
	
	/**
	 * 加班申请修改提交
	 */
	@LogText("修改加班申请")
	@Auth("jiaban/update")
	@RequestMapping("/jiabanApply_edit_submit")
	public String editJiabanApplySubmit(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		
		Jiaban jb = this.jiabanService.get(id);
		jb.setStartTime(request.getParameter("start_time"));
		jb.setEndTime(request.getParameter("end_time"));
		jb.setDayNum(Integer.parseInt(request.getParameter("day_num")));
		jb.setHourNum(Integer.parseInt(request.getParameter("hour_num")));
		jb.setJbReason(request.getParameter("reason"));
		
		this.jiabanService.update(jb);
		
		return "redirect:/jiabanApply";
	}
	
	
	/**
	 * 加班申请删除
	 */
	@LogText("删除加班申请")
	@Auth("jiaban/delete")
	@RequestMapping(value="/jiabanApply_del/{id}", method=RequestMethod.GET)
	public @ResponseBody boolean delJiabanApply(@PathVariable int id, Model model) {
		this.jiabanService.delete(id);
		
		return true;
	}
	
	
	/**
	 * 加班审批列表， 这里不需要权限拦截，在代码中判断
	 * @param request
	 * @param model
	 * @return
	 * @throws PermissionDeniedException 
	 */
	@RequestMapping("/jiabanApproval")
	public String jiabanApproval(HttpServletRequest request, Model model) throws PermissionDeniedException {
		infoSetting(request, "jiabanApproval", model);
		
		String filter = request.getParameter("filter");
		int empId = Integer.parseInt(request.getSession().getAttribute("empId").toString());
		int deptId = super.getFzrDeptId(empId);
		
		//具有审批资格，获取deptId指定的部门中的员工id列表
		List<Integer> empIdList = this.employeeService.getEmpIdsByDeptId(deptId);
		
		List<Jiaban> jbList = this.jiabanService.getListByEmpIds(empIdList, filter);
		model.addAttribute("jbList", jbList);
		
		filter = filter == null? "all" : filter;
		model.addAttribute("filter", filter);
		
		return "jiabanApproval/list";
	}
	
	
	/**
	 * 批准加班
	 * @param id
	 * @param request
	 * @return
	 * @throws PermissionDeniedException 
	 */
	@LogText("批准加班")
	@RequestMapping("/jiabanApproval_approve/{id}")
	public @ResponseBody boolean jiabanApprovalApprove(@PathVariable int id, HttpServletRequest request) throws PermissionDeniedException {
		approvalJiaban(request, id, AuditStatus.APPROVE);
		
		//发送提醒消息
		Jiaban jiaban = this.jiabanService.get(id);
		String username = this.userService.getUsernameByEmpName( jiaban.getEmpName() );
		String text = "✔你在" + jiaban.getSubmitTime() + "的加班申请已被批准！<a id='see' target='_blank' href='" + request.getContextPath() + "/jiabanApply/" + id + "'>查看详情</a>";
		TextMessage msg = new TextMessage(text);
		systemWebSocketHandler().sendMessageToUser(username, msg);
		
		return true;
	}
	
	
	/**
	 * 不批准加班
	 * @param id
	 * @param request
	 * @return
	 * @throws PermissionDeniedException 
	 */
	@LogText("不批准加班")
	@RequestMapping("/jiabanApproval_against/{id}")
	public @ResponseBody boolean jiabanApprovalAgainst(@PathVariable int id, HttpServletRequest request) throws PermissionDeniedException {
		approvalJiaban(request, id, AuditStatus.AGAINST);
		
		//发送提醒消息
		Jiaban jiaban = this.jiabanService.get(id);
		String username = this.userService.getUsernameByEmpName( jiaban.getEmpName() );
		String text = "✘你在" + jiaban.getSubmitTime() + "的加班申请没有被批准！<a id='see' target='_blank' href='" + request.getContextPath() + "/jiabanApply/" + id + "'>查看详情</a>";
		TextMessage msg = new TextMessage(text);
		systemWebSocketHandler().sendMessageToUser(username, msg);
		
		return true;
	}
	
	
	private void approvalJiaban(HttpServletRequest request, int id, AuditStatus status) throws PermissionDeniedException {
		int empId = Integer.parseInt(request.getSession().getAttribute("empId").toString());
		String empName = request.getSession().getAttribute("empName").toString();
		
		List<Integer> frzIdList = this.departmentService.getAllFzrEmpIdList();
		if(frzIdList.contains(empId)) {
			this.jiabanService.updateJiabanAuditStatus(id, status, empName);
		}
		else {
			throw new PermissionDeniedException("你没有权限访问此功能！");
		}
	}
}
