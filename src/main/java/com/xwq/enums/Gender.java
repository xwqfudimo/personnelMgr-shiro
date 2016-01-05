package com.xwq.enums;

import java.util.Map;
import java.util.TreeMap;

public enum Gender implements PersistEnum<Gender> {
	MALE("男"),
	FEMALE("女");
	
	private static final Map<String, Gender> map = new TreeMap<String, Gender>();
	
	static {
		map.put(MALE.getSex(), MALE);
		map.put(FEMALE.getSex(), FEMALE);
	}
	
	private String sex;
	
	private Gender(String sex) {
		this.sex = sex;
	}

	public String getSex() {
		return sex;
	}
	
	public void setSex(String sex) {
		this.sex = sex;
	}

	@Override
	public String getPersistedValue() {
		return sex;
	}

	@Override
	public Gender returnEnum(String persistedValue) {
		return map.get(persistedValue);
	}

	@Override
	public Map<String, Gender> getAllValueMap() {
		return map;
	}
}
