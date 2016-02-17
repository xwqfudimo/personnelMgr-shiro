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
import com.xwq.exception.PermissionDeniedException;
import com.xwq.model.YjReport;
import com.xwq.util.DateUtil;
import com.xwq.vo.YjReportVo;

@Controller
public class YjReportController extends BaseController {
	/**
	 * 业绩报告
	 */
	@Auth("yj/list")
	@RequestMapping(value="/yjReport", method=RequestMethod.GET)
	public String yjReport(HttpServletRequest request, Model model) {
		infoSetting(request, "yjReport", model);
		
		String filter = request.getParameter("audited");
		int empId = Integer.parseInt(request.getSession().getAttribute("empId").toString());
		List<YjReportVo> yjList = this.employeeService.getYjReportListByEmpId(empId, filter);
		model.addAttribute("yjList", yjList);
		
		if(filter == null) filter = "all";
		model.addAttribute("audited", filter);
		
		return "yjReport/list";
	}
	
	
	/**
	 * 新增业绩报告
	 */
	@Auth("yj/add")
	@RequestMapping(value="/yjReport_add", method=RequestMethod.GET)
	public String yjReportAdd(HttpServletRequest request, Model model) {
		infoSetting(request, "yjReport", model);
		
		return "yjReport/add";
	}
	
	/**
	 * 新增业绩报告提交
	 */
	@LogText("新增业绩报告")
	@Auth("yj/add")
	@RequestMapping(value="/yjReport_add", method=RequestMethod.POST)
	public String yjReportAddSubmit(HttpServletRequest request, Model model) {
		String title = request.getParameter("title");
		
		if(title != null && !"".equals(title.trim())) {
			HttpSession session = request.getSession();
			
			YjReport yjReport = new YjReport();
			yjReport.setAudited(false);
			yjReport.setSubmitDate(DateUtil.getToday());
			yjReport.setDeptName(session.getAttribute("deptName").toString());
			yjReport.setEmployee(this.employeeService.get(Integer.parseInt(session.getAttribute("empId").toString())));
			yjReport.setEmpName(session.getAttribute("empName").toString());
			yjReport.setFinishSituation(request.getParameter("finish_situation"));
			yjReport.setJobSummary(request.getParameter("job_summary"));
			yjReport.setTitle(title);
			
			this.employeeService.addYjReport(yjReport);
		}
		
		return "redirect:/yjReport";
	}
	
	
	/**
	 * 查看业绩报告
	 */
	@Auth("yj/view")
	@RequestMapping(value="/yjReport/{id}", method=RequestMethod.GET)
	public String yjReportShow(@PathVariable int id, HttpServletRequest request, Model model) {
		infoSetting(request, "yjReport", model);
		
		YjReport report = this.employeeService.getYjReport(id);
		model.addAttribute("report", report);
		
		return "yjReport/show";
	}
	
	/**
	 * 修改业绩报告
	 */
	@Auth("yj/update")
	@RequestMapping(value="/yjReport_edit/{id}", method=RequestMethod.GET)
	public String yjReportEdit(@PathVariable int id, HttpServletRequest request, Model model) {
		infoSetting(request, "yjReport", model);
		
		YjReport report = this.employeeService.getYjReport(id);
		model.addAttribute("report", report);
		
		return "yjReport/edit";
	}
	
	/**
	 * 修改提交业绩报告
	 */
	@LogText("修改业绩报告")
	@Auth("yj/update")
	@RequestMapping(value="/yjReport_edit_submit", method=RequestMethod.POST)
	public String yjReportEditSubmit(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		
		YjReport report = this.employeeService.getYjReport(id);
		report.setTitle(request.getParameter("title"));
		report.setFinishSituation(request.getParameter("finish_situation"));
		report.setJobSummary(request.getParameter("job_summary"));
		
		this.employeeService.updateYjReport(report);
		
		return "redirect:/yjReport";
	}
	
	/**
	 * 删除业绩报告
	 */
	@LogText("删除业绩报告")
	@Auth("yj/delete")
	@RequestMapping(value="/yjReport_del/{id}", method=RequestMethod.GET)
	public @ResponseBody boolean yjReportDel(@PathVariable int id) {
		this.employeeService.deleteYjReport(id);
		
		return true;
	}
	
	/**
	 * 业绩报告审核列表
	 * @param request
	 * @param model
	 * @return
	 * @throws PermissionDeniedException 
	 */
	@RequestMapping("/yjReportAudit")
	public String yjReportAuditList(HttpServletRequest request, Model model) throws PermissionDeniedException {
		infoSetting(request, "yjReportAudit", model);
		
		String filter = request.getParameter("filter");
		int empId = Integer.parseInt(request.getSession().getAttribute("empId").toString());
		int deptId = super.getFzrDeptId(empId);
		
		//具有审批资格，获取deptId指定的部门中的员工id列表
		List<Integer> empIdList = this.employeeService.getEmpIdsByDeptId(deptId);

		List<YjReport> yjList = this.employeeService.getYjReportListByEmpIds(empIdList, filter);
		model.addAttribute("yjList", yjList);
		
		filter = filter == null? "all" : filter;
		model.addAttribute("filter", filter);
		
		return "yjReportAudit/list";
	}
	
	
	/**
	 * 审核业绩报告
	 * @throws PermissionDeniedException 
	 */
	@RequestMapping(value="/yjReport_audit/{id}", method=RequestMethod.GET)
	public String yjReportAudit(@PathVariable int id, HttpServletRequest request, Model model) throws PermissionDeniedException {
		infoSetting(request, "yjReportAudit", model);
		
		int empId = Integer.parseInt(request.getSession().getAttribute("empId").toString());
		
		List<Integer> frzIdList = this.departmentService.getAllFzrEmpIdList();
		if(!frzIdList.contains(empId)) {
			throw new PermissionDeniedException("你没有权限访问此功能！");
		}
		
		YjReport report = this.employeeService.getYjReport(id);
		model.addAttribute("report", report);
		
		return "yjReportAudit/audit";
	}
	
	
	/**
	 * 审核业绩报告通过
	 * @throws PermissionDeniedException 
	 */
	@RequestMapping(value="/yjReport_audited/{id}", method=RequestMethod.GET)
	public @ResponseBody boolean yjReportAudited(@PathVariable int id, HttpServletRequest request) throws PermissionDeniedException {
		int empId = Integer.parseInt(request.getSession().getAttribute("empId").toString());
		String empName = request.getSession().getAttribute("empName").toString();
		
		List<Integer> frzIdList = this.departmentService.getAllFzrEmpIdList();
		if(!frzIdList.contains(empId)) {
			throw new PermissionDeniedException("你没有权限访问此功能！");
		}
		
		this.employeeService.auditedYjReport(id, empName);
		
		//发送提醒消息
		YjReport report = this.employeeService.getYjReport(id);
		String username = this.userService.getUsernameByEmpName( report.getEmpName() );
		String text = "你的标题为" + report.getTitle() + "的业绩报告已被审核通过！<a id='see' target='_blank' href='" + request.getContextPath() + "/yjReport/" + id + "'>查看详情</a>";
		TextMessage msg = new TextMessage(text);
		systemWebSocketHandler().sendMessageToUser(username, msg);
		
		return true;
	}
}
