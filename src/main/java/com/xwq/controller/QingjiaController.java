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
import com.xwq.enums.QingjiaType;
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
	@Auth("qingjia/delete")
	@RequestMapping(value="/qingjiaApply_del/{id}", method=RequestMethod.GET)
	public @ResponseBody boolean delQingjiaApply(@PathVariable int id, Model model) {
		this.qingjiaService.delete(id);
		
		return true;
	}
}
