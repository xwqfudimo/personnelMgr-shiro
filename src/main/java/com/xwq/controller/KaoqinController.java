package com.xwq.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xwq.annotation.Auth;
import com.xwq.annotation.LogText;
import com.xwq.model.Employee;
import com.xwq.model.Kaoqin;
import com.xwq.vo.EmpVo;

@Controller
public class KaoqinController extends BaseController {
	/**
	 * 考勤记录
	 */
	@RequestMapping(value="/viewKaoqinList", method=RequestMethod.GET)
	public String viewKaoqinList(HttpServletRequest request, Model model) {
		infoSetting(request, "viewKaoqinList", model);
		
		String filter = request.getParameter("filter");
		int empId = Integer.parseInt(request.getSession().getAttribute("empId").toString());
		List<Kaoqin> kaoqinList = this.kaoqingService.getListByEmpId(empId, filter);
		model.addAttribute("kaoqinList", kaoqinList);
		
		if(filter == null) filter = "this-month";
		model.addAttribute("filter", filter);
		
		return "kaoqin/list";
	}
	
	/**
	 * 考勤管理
	 * @param request
	 * @param model
	 * @return
	 */
	@Auth("hr/kaoqinMgr")
	@RequestMapping("/kaoqinMgr")
	public String kaoqinMgr(HttpServletRequest request, Model model) {
		infoSetting(request, "kaoqinMgr", model);
		
		String filter = request.getParameter("filter");
		List<Kaoqin> kaoqinList = this.kaoqingService.listAllByPage(filter);
		model.addAttribute("kaoqinList", kaoqinList);
		
		if(filter == null) filter = "this-month";
		model.addAttribute("filter", filter);
		
		return "kaoqin/kaoqinMgr";
	}
	
	/**
	 * 新增考勤记录
	 * @param request
	 * @param model
	 * @return
	 */
	@Auth("hr/kaoqinMgr")
	@RequestMapping(value="/kaoqin_add", method=RequestMethod.GET)
	public String kaoqinAdd(HttpServletRequest request, Model model) {
		infoSetting(request, "kaoqinMgr", model);
		
		List<EmpVo> voList = this.employeeService.getAllEmpVo();
		model.addAttribute("emps", voList);
		
		return "kaoqin/add";
	}
	
	/**
	 * 新增考勤记录提交
	 * @param request
	 * @param model
	 * @return
	 */
	@LogText("新增考勤记录")
	@Auth("hr/kaoqinMgr")
	@RequestMapping(value="/kaoqin_add", method=RequestMethod.POST)
	public String kaoqinAdd(HttpServletRequest request) {
		int empId = Integer.parseInt(request.getParameter("emp_id"));
		Employee emp = this.employeeService.get(empId);
		
		if(emp != null) {
			Kaoqin kq = new Kaoqin();
			kq.setEmployee(emp);
			kq.setEmpName(emp.getName());
			kq.setDeptName(emp.getDepartment().getName());
			kq.setMorningSignTime(request.getParameter("morning_sign_time"));
			kq.setAfternoonSignTime(request.getParameter("afternoon_sign_time"));
			kq.setDate(request.getParameter("date"));
			
			this.kaoqingService.add(kq);
		}
		
		return "redirect:/kaoqinMgr";
	}
	
	/**
	 * 修改考勤记录
	 * @param id
	 * @param request
	 * @param model
	 * @return
	 */
	@Auth("hr/kaoqinMgr")
	@RequestMapping(value="/kaoqin_edit/{id}", method=RequestMethod.GET)
	public String edit(@PathVariable int id, HttpServletRequest request, Model model) {
		infoSetting(request, "kaoqinMgr", model);
		
		Kaoqin kq = this.kaoqingService.get(id);
		model.addAttribute("kq", kq);
		
		return "kaoqin/edit";
	}
	
	
	/**
	 * 修改考勤记录提交
	 * @param id
	 * @param request
	 * @param model
	 * @return
	 */
	@LogText("修改考勤记录")
	@Auth("hr/kaoqinMgr")
	@RequestMapping(value="/kaoqin_edit_submit", method=RequestMethod.POST)
	public String update(HttpServletRequest request, Model model) {
		int id = Integer.parseInt(request.getParameter("id"));
		
		Kaoqin kq = this.kaoqingService.get(id);
		if(kq != null) {
			kq.setMorningSignTime(request.getParameter("morning_sign_time"));
			kq.setAfternoonSignTime(request.getParameter("afternoon_sign_time"));
			kq.setDate(request.getParameter("date"));
			
			this.kaoqingService.update(kq);
		}
		
		return "redirect:/kaoqinMgr";
	}
	
	/**
	 * 删除考勤记录
	 * @param id
	 * @return
	 */
	@LogText("删除考勤记录")
	@Auth("hr/kaoqinMgr")
	@RequestMapping("/kaoqin_del/{id}")
	public @ResponseBody boolean delete(@PathVariable int id) {
		this.kaoqingService.delete(id);
		
		return true;
	}
} 
