package com.xwq.quartz;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

import com.xwq.listener.SpringContext;
import com.xwq.util.DateUtil;

public class DbJobTask {
	private static String host;
	private static String port;
	private static String dbname;
	private static String username;
	private static String password;
	
	private static String sqlFileSavePath = "d:/dump";
	
	
	static {
		//获取数据库相关信息
		BasicDataSource dataSource = (BasicDataSource) SpringContext.getApplicationContext().getBean("dataSource");
		
		String url = dataSource.getUrl();
		username = dataSource.getUsername();
		password = dataSource.getPassword();
		
		String start = "jdbc:mysql://";
		url = url.substring(start.length());
		String[] strs = url.split("/");
		
		if(!strs[0].contains(":")) throw new RuntimeException("jdbc url not specify port!");
		String[] hostStrs = strs[0].split(":");
		host = hostStrs[0];
		port = hostStrs[1];
		
		dbname = strs[1].contains("?")? (strs[1].split("?"))[0] : strs[1];
	}
	
	/**
	 * 备份数据库
	 */
	public static boolean backupDb() {
		//调用mysqldump命令备份数据库
		Runtime rt = Runtime.getRuntime();
		String command = "mysqldump -u" + username + " -p" + password + " -h " + host + " -P " + port + " " + dbname;
		BufferedReader reader = null;
		PrintWriter writer = null;
		try {
			Process proc = rt.exec(command);
			
			reader = new BufferedReader(new InputStreamReader(proc.getInputStream(), "utf-8"));
			File savePath = new File(sqlFileSavePath);
			if(!savePath.exists()) savePath.createNewFile();
			File sqlFile = new File(savePath, DateUtil.getToday() + ".sql");
			writer = new PrintWriter(new OutputStreamWriter(new FileOutputStream(sqlFile), "utf-8"));
			
			IOUtils.copy(reader, writer);
			
			System.out.println("数据库备份完成！");
			System.out.println("备份文件保存为：" + sqlFile.getAbsolutePath());
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if(writer != null) writer.close();
				if(reader != null) reader.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return true;
	}
	
	
	
	/**
	 * 恢复数据库
	 * @param sqlFile
	 * @return
	 */
	public static boolean restore(String sqlFile) {
		//调用mysql命令恢复数据库
		Runtime rt = Runtime.getRuntime();
		String command = "mysql -u" + username + " -p" + password + " -h " + host + " -P " + port + " " + dbname;
		
		PrintWriter out = null;
		BufferedReader reader = null;
		try {
			Process proc = rt.exec(command);
			
			out = new PrintWriter(new OutputStreamWriter(proc.getOutputStream(), "utf-8"));
			File file = new File(sqlFileSavePath, sqlFile);
			if(!file.exists()) throw new IOException("sql文件不存在");
			
			reader = new BufferedReader(new InputStreamReader(new FileInputStream(file), "utf-8"));
			
			IOUtils.copy(reader, out);

			System.out.println("数据库恢复sql文件：" + file.getAbsolutePath());
			System.out.println("数据库恢复完成！");
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		} finally {
			try {
				if(out != null) out.close();
				if(reader != null) reader.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return true;
	}
	
	/**
	 * 获取已备份文件的文件名称列表
	 * @return
	 * @throws IOException 
	 */
	public static List<String> getHadBackupFilenameList() throws IOException {
		File file = new File(sqlFileSavePath);

		if(!file.exists()) throw new IOException("备份文件保存目录不存在"); 
		
		int fileNum = file.listFiles().length;
		if(fileNum == 0) return null;

		List<String> filenameList = new ArrayList<String>();
		for(File f : file.listFiles()) {
			filenameList.add(f.getName());
		}
		return filenameList;
	}
	
	/**
	 * 获取sql文件内容
	 * @param filename
	 * @return
	 * @throws IOException 
	 */
	public static String getSqlFileContent(String filename) throws IOException {
		File file = new File(sqlFileSavePath, filename);
		if(!file.exists()) throw new IOException("sql文件不存在");
		
		return FileUtils.readFileToString(file, "utf-8");
	}
}
