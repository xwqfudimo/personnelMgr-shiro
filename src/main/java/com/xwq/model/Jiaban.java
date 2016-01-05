package com.xwq.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.xwq.enums.AuditStatus;

@Entity
public class Jiaban {
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
	
	@Column(name="start_time")
	private String startTime;
	
	@Column(name="end_time")
	private String endTime;
	
	@Column(name="day_num")
	private int dayNum;
	
	@Column(name="hour_num")
	private int hourNum;
	
	@Column(name="jb_reason")
	private String jbReason;
	
	@Column(name="audit_status")
	@Enumerated(EnumType.ORDINAL)
	private AuditStatus auditStatus;
	
	@Column(name="audit_person")
	private String auditPerson;
	
	@Column(name="submit_time")
	private String submitTime;
	
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
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public int getDayNum() {
		return dayNum;
	}
	public void setDayNum(int dayNum) {
		this.dayNum = dayNum;
	}
	public int getHourNum() {
		return hourNum;
	}
	public void setHourNum(int hourNum) {
		this.hourNum = hourNum;
	}
	public String getJbReason() {
		return jbReason;
	}
	public void setJbReason(String jbReason) {
		this.jbReason = jbReason;
	}
	
	public String getAuditPerson() {
		return auditPerson;
	}
	public void setAuditPerson(String auditPerson) {
		this.auditPerson = auditPerson;
	}
	public AuditStatus getAuditStatus() {
		return auditStatus;
	}
	public void setAuditStatus(AuditStatus auditStatus) {
		this.auditStatus = auditStatus;
	}
	public String getSubmitTime() {
		return submitTime;
	}
	public void setSubmitTime(String submitTime) {
		this.submitTime = submitTime;
	}
}
