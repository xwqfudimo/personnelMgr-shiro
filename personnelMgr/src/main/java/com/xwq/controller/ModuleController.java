package com.xwq.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xwq.model.Column;
import com.xwq.model.Module;
import com.xwq.service.ColumnService;
import com.xwq.service.ModuleService;

@Controller
public class ModuleController {
	@Autowired
	private ModuleService moduleService;
	@Autowired
	private ColumnService columnService;
	
	/**
	 * 模块
	 * @param id
	 * @param request
	 * @return
	 */
	@RequestMapping("/module/{id}")
	public String module(@PathVariable("id") int id, Model model) {
		
		if(this.moduleService.moduleIsExist(id)) {
			Module module = this.moduleService.get(id);
			model.addAttribute("module", module);
			
			List<Column> columns = this.columnService.getColumns(id);
			model.addAttribute("columns", columns);
		}
		
		return "module";
	}
}
