package com.xwq.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 * 考勤
 */
@Entity
public class Kaoqin {
	@Id
	@GeneratedValue
	private int id;
	@ManyToOne
	@JoinColumn(name="emp_id")
	private Employee employee;
	@Column(name="emp_name")
	private String empName;
	@Column(name="dept_name")
	private String deptName;
	@Column(name="morning_sign_time")
	private String morningSignTime;
	@Column(name="afternoon_sign_time")
	private String afternoonSignTime;
	@Column(name="t_date")
	private String date;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public String getMorningSignTime() {
		return morningSignTime;
	}
	public void setMorningSignTime(String morningSignTime) {
		this.morningSignTime = morningSignTime;
	}
	public String getAfternoonSignTime() {
		return afternoonSignTime;
	}
	public void setAfternoonSignTime(String afternoonSignTime) {
		this.afternoonSignTime = afternoonSignTime;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
}
