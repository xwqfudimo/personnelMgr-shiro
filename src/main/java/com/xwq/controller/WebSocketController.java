package com.xwq.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class WebSocketController {
	
	/**
	 * 消息iframe页面
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/message", method=RequestMethod.GET)
	public String test(HttpServletRequest request, Model model) {
		String data = request.getParameter("data");
		
		model.addAttribute("msg", data);
		
		return "message";
	}
}
