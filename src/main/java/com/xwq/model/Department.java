package com.xwq.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

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
	@ManyToOne
	@JoinColumn(name="fzr_emp_id")
	private Employee fzr;
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
	public Employee getFzr() {
		return fzr;
	}
	public void setFzr(Employee fzr) {
		this.fzr = fzr;
	}
	public int getSort() {
		return sort;
	}
	public void setSort(int sort) {
		this.sort = sort;
	}
}
