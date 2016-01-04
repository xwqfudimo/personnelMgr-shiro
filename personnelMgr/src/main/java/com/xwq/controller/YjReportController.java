package com.xwq.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xwq.model.YjReport;
import com.xwq.util.DateUtil;
import com.xwq.vo.YjReportVo;

@Controller
public class YjReportController extends BaseController {
	/**
	 * 业绩报告
	 */
	@RequestMapping(value="/yjReport", method=RequestMethod.GET)
	public String yjReport(HttpServletRequest request, Model model) {
		infoSetting("yjReport", model);
		
		String filter = request.getParameter("audited");
		int empId = Integer.parseInt(request.getSession().getAttribute("empId").toString());
		List<YjReportVo> yjList = this.employeeService.getYjReportListByEmpId(empId, filter);
		model.addAttribute("yjList", yjList);
		
		if(filter == null) filter = "all";
		model.addAttribute("audited", filter);
		
		return "yjReport";
	}
	
	
	/**
	 * 新增业绩报告
	 */
	@RequestMapping(value="/yjReport_add", method=RequestMethod.GET)
	public String yjReportAdd(HttpServletRequest request, Model model) {
		infoSetting("yjReport", model);
		
		return "yjReport_add";
	}
	
	/**
	 * 新增业绩报告提交
	 */
	@RequestMapping(value="/yjReport_add", method=RequestMethod.POST)
	public String yjReportAddSubmit(HttpServletRequest request, Model model) {
		String title = request.getParameter("title");
		
		if(title != null && !"".equals(title.trim())) {
			HttpSession session = request.getSession();
			
			YjReport yjReport = new YjReport();
			yjReport.setAudited(false);
			yjReport.setDate(DateUtil.getToday());
			yjReport.setDeptName(session.getAttribute("deptName").toString());
			yjReport.setEmployee(this.employeeService.get(Integer.parseInt(session.getAttribute("empId").toString())));
			yjReport.setEmpName(session.getAttribute("empName").toString());
			yjReport.setFinishState(request.getParameter("finish_state"));
			yjReport.setJobSummary(request.getParameter("job_summary"));
			yjReport.setTitle(title);
			
			this.employeeService.addYjReport(yjReport);
		}
		
		return "redirect:/column/yjReport";
	}
}
