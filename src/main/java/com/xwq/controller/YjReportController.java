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

import com.xwq.annotation.Auth;
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
			yjReport.setFinishState(request.getParameter("finish_state"));
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
	@Auth("yj/update")
	@RequestMapping(value="/yjReport_edit_submit", method=RequestMethod.POST)
	public String yjReportEditSubmit(HttpServletRequest request) {
		int id = Integer.parseInt(request.getParameter("id"));
		
		YjReport report = this.employeeService.getYjReport(id);
		report.setTitle(request.getParameter("title"));
		report.setFinishState(request.getParameter("finish_state"));
		report.setJobSummary(request.getParameter("job_summary"));
		
		this.employeeService.updateYjReport(report);
		
		return "redirect:/yjReport";
	}
	
	/**
	 * 删除业绩报告
	 */
	@Auth("yj/delete")
	@RequestMapping(value="/yjReport_del/{id}", method=RequestMethod.GET)
	public @ResponseBody boolean yjReportDel(@PathVariable int id) {
		this.employeeService.deleteYjReport(id);
		
		return true;
	}
}
