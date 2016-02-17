package com.xwq.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xwq.model.Log;
import com.xwq.util.JsonUtil;

@Controller
public class LogController extends BaseController {
	/**
	 * 日志列表
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/syslog")
	public String list(HttpServletRequest request, Model model) {
		infoSetting(request, "syslog", model);
		
		String keyword = request.getParameter("keyword") == null? "" : request.getParameter("keyword");
		List<Log> logList = this.logService.listByPage(keyword);
		model.addAttribute("logList", logList);
		
		return "log/syslog";
	}
	
	/**
	 * 日志详情
	 * @param id
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/log/{id}")
	@SuppressWarnings("unchecked")
	public String show(@PathVariable int id, HttpServletRequest request, Model model) {
		infoSetting(request, "syslog", model);
		
		Log log = this.logService.get(id);
		model.addAttribute("log", log);
		
		//请求参数转化成map
		Map<String,String> paramMap = (Map<String,String>) JsonUtil.fromJson(log.getParam(), Map.class);
		model.addAttribute("paramMap", paramMap);
		
		return "log/show";
	}
}
