package com.xwq;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.io.FileUtils;
import org.junit.Test;

public class IcomoonParse {

	@Test
	public void parse() throws IOException {
		List<String> lines = FileUtils.readLines(new File("D:\\JavaProject\\personnelMgr\\src\\test\\java\\com\\xwq\\icomoon.svg"));
		Pattern pattern = Pattern.compile("unicode=\"([^\"]+;)\"");
		
		int index = 0;
		for(String line : lines) {
			Matcher m = pattern.matcher(line);
			if(m.find()) {
				System.out.println("<li><a href=\"#\"><i class=\"icon-font\">" + m.group(1) + "</i>" + (index++) + "</a></li>");
			}
		}
	}
}
