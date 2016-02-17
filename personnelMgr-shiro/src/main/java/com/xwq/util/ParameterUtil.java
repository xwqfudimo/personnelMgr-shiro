package com.xwq.util;

public class ParameterUtil {
	
	public static boolean parameterOK(String...params) {
		boolean result = true;
		
		for(String param : params) {
			result = result && (param != null) && (!"".equals(param.trim()));
		}
		
		return result;
	}
}
