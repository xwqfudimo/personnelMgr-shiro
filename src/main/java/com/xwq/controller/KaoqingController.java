package com.xwq.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xwq.model.Kaoqing;

@Controller
public class KaoqingController extends BaseController {
	/**
	 * 考勤记录
	 */
	@RequestMapping(value="/viewKaoqingList", method=RequestMethod.GET)
	public String viewKaoqingList(HttpServletRequest request, Model model) {
		infoSetting(request, "viewKaoqingList", model);
		
		String filter = request.getParameter("filter");
		int empId = Integer.parseInt(request.getSession().getAttribute("empId").toString());
		List<Kaoqing> kaoqingList = this.kaoqingService.getListByEmpId(empId, filter);
		model.addAttribute("kaoqingList", kaoqingList);
		
		if(filter == null) filter = "this-month";
		model.addAttribute("filter", filter);
		
		return "kaoqing/list";
	}
	
}
