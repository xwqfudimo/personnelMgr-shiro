package com.xwq.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PropertiesUtil {
	private static String propertiesFile;
	private static PropertiesUtil instance;
	private static Properties prop;
	
	private PropertiesUtil(){
		InputStream is = PropertiesUtil.class.getClassLoader().getResourceAsStream(propertiesFile);
		prop = new Properties();
		try {
			prop.load(is);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static PropertiesUtil getInstance(String cfgFile) {
		if(instance == null) instance = new PropertiesUtil();
		propertiesFile = cfgFile;
		return instance;
	}
	
	public String getProperty(String key) {
		return prop.getProperty(key);
	}
}
