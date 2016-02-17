package com.xwq.controller;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xwq.annotation.Auth;
import com.xwq.annotation.LogText;
import com.xwq.comparator.FilenameComparator;
import com.xwq.quartz.DbJobTask;
import com.xwq.util.Pagination;

@Controller
public class DataBackupRestoreController extends BaseController {

	/**
	 * 数据备份与恢复
	 * @param request
	 * @param model
	 * @return
	 * @throws IOException
	 */
	@Auth("data/backupRestore")
	@RequestMapping("/dataBackupRestore")
	public String dataBackupRestore(HttpServletRequest request, Model model) throws IOException {
		infoSetting(request, "dataBackupRestore", model);
		
		//已备份的文件列表
		List<String> filenameList = DbJobTask.getHadBackupFilenameList();
		Collections.sort(filenameList, new FilenameComparator());
		
		//分页
		Pagination.setTotalCount(filenameList.size());
		int start = Pagination.getOffset();
		int end = start + Pagination.getPageSize();
		end = end > filenameList.size()? filenameList.size() : end;
		filenameList = filenameList.subList(start, end);
		
		model.addAttribute("filenameList", filenameList);
		
		return "dataBackupRestore";
	}
	
	/**
	 * 查看sql文件内容
	 * @param name
	 * @param request
	 * @param model
	 * @return
	 * @throws IOException
	 */
	@Auth("data/backupRestore")
	@RequestMapping("/dataBR_show/{name}")
	public String showSql(@PathVariable String name, HttpServletRequest request, Model model) throws IOException {
		infoSetting(request, "dataBackupRestore", model);
		String filename = name + ".sql";
		
		String fileContent = DbJobTask.getSqlFileContent(filename);
		model.addAttribute("fileContent", fileContent);
		model.addAttribute("fileName", filename);
		
		return "showSql";
	}
	
	/**
	 * 手动备份数据库
	 * @return
	 */
	@LogText("手动备份数据库")
	@Auth("data/backupRestore")
	@RequestMapping("/backupByHand")
	public @ResponseBody boolean backupByHand() {
		return DbJobTask.backupDb();
	}
	
	/**
	 * 数据库恢复
	 * @param name
	 * @param request
	 * @return
	 */
	@LogText("数据库恢复")
	@Auth("data/backupRestore")
	@RequestMapping("/restore/{name}")
	public @ResponseBody boolean restore(@PathVariable String name, HttpServletRequest request) {
		String filename = name + ".sql";
		
		return DbJobTask.restore(filename);
	}
}
