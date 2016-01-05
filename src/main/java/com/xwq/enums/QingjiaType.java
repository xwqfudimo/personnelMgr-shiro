package com.xwq.enums;

import java.util.Map;
import java.util.TreeMap;

public enum QingjiaType implements PersistEnum<QingjiaType> {
	SICK("病假"),
	AFFAIR("事假"),
	MARRIAGE("婚假"),
	FUNERAL("丧假"),
	MATERNITY("产假"),
	PUBLIC("公假");
	
	private static final Map<String, QingjiaType> map = new TreeMap<String, QingjiaType>();
	
	static {
		map.put(SICK.getType(), SICK);
		map.put(AFFAIR.getType(), AFFAIR);
		map.put(MARRIAGE.getType(), MARRIAGE);
		map.put(FUNERAL.getType(), FUNERAL);
		map.put(MATERNITY.getType(), MATERNITY);
		map.put(PUBLIC.getType(), PUBLIC);
	}
	
	private String type;
	
	private QingjiaType(String type) {
		this.type = type;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String getPersistedValue() {
		return type;
	}

	@Override
	public QingjiaType returnEnum(String persistedValue) {
		return map.get(persistedValue);
	}

	@Override
	public Map<String, QingjiaType> getAllValueMap() {
		return map;
	}

}
