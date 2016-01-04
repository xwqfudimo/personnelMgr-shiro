package com.xwq.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xwq.model.Jiaban;

@Controller
public class JiabanController extends BaseController {
	/**
	 * 加班申请列表
	 */
	@RequestMapping(value="/jiabanApply", method=RequestMethod.GET)
	public String jiabanApply(HttpServletRequest request, Model model) {
		infoSetting("jiabanApply", model);
		
		String filter = request.getParameter("filter");
		int empId = Integer.parseInt(request.getSession().getAttribute("empId").toString());
		List<Jiaban> list = this.jiabanService.getListByEmpId(empId, filter);
		model.addAttribute("jiabanList", list);
		
		if(filter == null) filter = "all-apply";
		model.addAttribute("filter", filter);
		
		return "jiabanApply";
	}
	
	/**
	 * 新增加班申请
	 */
	@RequestMapping(value="/jiabanApply_add", method=RequestMethod.GET)
	public String addJiabanApply(Model model) {
		infoSetting("jiabanApply", model);
		
		return "jiabanApply_add";
	}
	
	/**
	 * 新增加班申请提交
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/jiabanApply_add", method=RequestMethod.POST)
	public String addJiabanApply(HttpServletRequest request, Model model) {
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
		
		this.jiabanService.add(jiaban);
		
		return "redirect:/column/jiabanApply";
	}
	
	
}
