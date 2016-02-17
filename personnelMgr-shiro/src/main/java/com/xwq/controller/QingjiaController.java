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
import com.xwq.enums.QingjiaType;
import com.xwq.exception.PermissionDeniedException;
import com.xwq.model.Qingjia;
import com.xwq.util.DateUtil;

@Controller
public class QingjiaController extends BaseController {
	/**
	 * 请假申请列表
	 */
	@Auth("qingjia/list")
	@RequestMapping(value="/qingjiaApply", method=RequestMethod.GET)
	public String qingjiaApply(HttpServletRequest request, Model model) {
		infoSetting(request, "qingjiaApply", model);
		
		String filter = request.getParameter("filter");
		int empId = Integer.parseInt(request.getSession().getAttribute("empId").toString());
		List<Qingjia> list = this.qingjiaService.getListByEmpId(empId, filter);
		model.addAttribute("qingjiaList", list);
		
		if(filter == null) filter = "all-apply";
		model.addAttribute("filter", filter);
		
		return "qingjiaApply/list";
	}
	
	/**
	 * 新增请假申请
	 */
	@Auth("qingjia/add")
	@RequestMapping(value="/qingjiaApply_add", method=RequestMethod.GET)
	public String addQingjiaApply(HttpServletRequest request, Model model) {
		infoSetting(request, "qingjiaApply", model);
		
		return "qingjiaApply/add";
	}
	
	/**
	 * 新增请假申请提交
	 */
	@LogText("新增请假申请")
	@Auth("qingjia/add")
	@RequestMapping(value="/qingjiaApply_add", method=RequestMethod.POST)
	public String addQingjiaApplySubmit(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		
		Qingjia qj = new Qingjia();
		qj.setQjType(QingjiaType.valueOf(request.getParameter("type")));
		qj.setStartTime(request.getParameter("start_time"));
		qj.setEndTime(request.getParameter("end_time"));
		qj.setDayNum(Integer.parseInt(request.getParameter("day_num")));
		qj.setHourNum(Integer.parseInt(request.getParameter("hour_num")));
		qj.setQjReason(request.getParameter("reason"));
		qj.setEmployee(this.employeeService.get(Integer.parseInt(session.getAttribute("empId").toString())));
		qj.setEmpName(session.getAttribute("empName").toString());
		qj.setDeptName(session.getAttribute("deptName").toString());
		qj.setSubmitTime(DateUtil.getCurrentTime());
		
		this.qingjiaService.add(qj);
		
		return "redirect:/qingjiaApply";
	}
	
	/**
	 * 查看请假申请
	 */
	@Auth("qingjia/view")
	@RequestMapping(value="/qingjiaApply/{id}", method=RequestMethod.GET)
	public String viewQingjiaApply(@PathVariable int id, HttpServletRequest request, Model model) {
		infoSetting(request, "qingjiaApply", model);
		
		Qingjia qj = this.qingjiaService.get(id);
		model.addAttribute("qj", qj);
		
		return "qingjiaApply/show";
	}
	
	
	/**
	 * 请假申请修改
	 */
	@Auth("qingjia/update")
	@RequestMapping(value="/qingjiaApply_edit/{id}", method=RequestMethod.GET)
	public String editQingjiaApply(@PathVariable int id, HttpServletRequest request, Model model) {
		infoSetting(request, "qingjiaApply", model);
		
		Qingjia qj = this.qingjiaService.get(id);
		model.addAttribute("qj", qj);
		
		return "qingjiaApply/edit";
	}
	
	/**
	 * 请假申请修改提交
	 */
	@LogText("修改请假申请")
	@Auth("qingjia/update")
	@RequestMapping("/qingjiaApply_edit_submit")
	public String editQingjiaApplySubmit(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		
		Qingjia qj = this.qingjiaService.get(id);
		qj.setStartTime(request.getParameter("start_time"));
		qj.setEndTime(request.getParameter("end_time"));
		qj.setDayNum(Integer.parseInt(request.getParameter("day_num")));
		qj.setHourNum(Integer.parseInt(request.getParameter("hour_num")));
		qj.setQjReason(request.getParameter("reason"));
		qj.setQjType(QingjiaType.valueOf(request.getParameter("type")));
		
		this.qingjiaService.update(qj);
		
		return "redirect:/qingjiaApply";
	}
	
	
	/**
	 * 请假申请删除
	 */
	@LogText("删除请假申请")
	@Auth("qingjia/delete")
	@RequestMapping(value="/qingjiaApply_del/{id}", method=RequestMethod.GET)
	public @ResponseBody boolean delQingjiaApply(@PathVariable int id, Model model) {
		this.qingjiaService.delete(id);
		
		return true;
	}
	
	
	/**
	 * 请假审批列表， 这里不需要权限拦截，在代码中判断
	 * @param request
	 * @param model
	 * @return
	 * @throws PermissionDeniedException 
	 */
	@RequestMapping("/qingjiaApproval")
	public String qingjiaApproval(HttpServletRequest request, Model model) throws PermissionDeniedException {
		infoSetting(request, "qingjiaApproval", model);
		
		String filter = request.getParameter("filter");
		int empId = Integer.parseInt(request.getSession().getAttribute("empId").toString());
		int deptId = super.getFzrDeptId(empId);
		
		//具有审批资格，获取deptId指定的部门中的员工id列表
		List<Integer> empIdList = this.employeeService.getEmpIdsByDeptId(deptId);
		
		List<Qingjia> qjList = this.qingjiaService.getListByEmpIds(empIdList, filter);
		model.addAttribute("qjList", qjList);
		
		filter = filter == null? "all" : filter;
		model.addAttribute("filter", filter);
		
		return "qingjiaApproval/list";
	}
	
	
	/**
	 * 批准请假
	 * @param id
	 * @param request
	 * @return
	 * @throws PermissionDeniedException 
	 */
	@LogText("批准请假")
	@RequestMapping("/qingjiaApproval_approve/{id}")
	public @ResponseBody boolean qingjiaApprovalApprove(@PathVariable int id, HttpServletRequest request) throws PermissionDeniedException {
		approvalqingjia(request, id, AuditStatus.APPROVE);
		
		//发送提醒消息
		Qingjia qj = this.qingjiaService.get(id);
		String username = this.userService.getUsernameByEmpName( qj.getEmpName() );
		String text = "✔你在" + qj.getSubmitTime() + "的请假申请已被批准！<a id='see' target='_blank' href='" + request.getContextPath() + "/qingjiaApply/" + id + "'>查看详情</a>";
		TextMessage msg = new TextMessage(text);
		systemWebSocketHandler().sendMessageToUser(username, msg);
		
		return true;
	}
	
	
	/**
	 * 不批准请假
	 * @param id
	 * @param request
	 * @return
	 * @throws PermissionDeniedException 
	 */
	@LogText("不批准请假")
	@RequestMapping("/qingjiaApproval_against/{id}")
	public @ResponseBody boolean qingjiaApprovalAgainst(@PathVariable int id, HttpServletRequest request) throws PermissionDeniedException {
		approvalqingjia(request, id, AuditStatus.AGAINST);
		
		//发送提醒消息
		Qingjia qj = this.qingjiaService.get(id);
		String username = this.userService.getUsernameByEmpName( qj.getEmpName() );
		String text = "✘你在" + qj.getSubmitTime() + "的请假申请没有被批准！<a id='see' target='_blank' href='" + request.getContextPath() + "/qingjiaApply/" + id + "'>查看详情</a>";
		TextMessage msg = new TextMessage(text);
		systemWebSocketHandler().sendMessageToUser(username, msg);
		
		return true;
	}
	
	
	private void approvalqingjia(HttpServletRequest request, int id, AuditStatus status) throws PermissionDeniedException {
		int empId = Integer.parseInt(request.getSession().getAttribute("empId").toString());
		String empName = request.getSession().getAttribute("empName").toString();
		
		List<Integer> frzIdList = this.departmentService.getAllFzrEmpIdList();
		if(frzIdList.contains(empId)) {
			this.qingjiaService.updateQingjiaAuditStatus(id, status, empName);
		}
		else {
			throw new PermissionDeniedException("你没有权限访问此功能！");
		}
	}
}
