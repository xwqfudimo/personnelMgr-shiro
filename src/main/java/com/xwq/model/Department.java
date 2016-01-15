package com.xwq.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * 部门
 */
@Entity
public class Department {
	@Id
	@GeneratedValue
	private int id;
	private String name;
	@Column(name="emp_num")
	private int empNum;
	//部门负责人
	private String fzr;
	@Column(name="fzr_phone")
	private String fzrPhone;
	private int sort;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getEmpNum() {
		return empNum;
	}
	public void setEmpNum(int empNum) {
		this.empNum = empNum;
	}
	public String getFzr() {
		return fzr;
	}
	public void setFzr(String fzr) {
		this.fzr = fzr;
	}
	public String getFzrPhone() {
		return fzrPhone;
	}
	public void setFzrPhone(String fzrPhone) {
		this.fzrPhone = fzrPhone;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
}
