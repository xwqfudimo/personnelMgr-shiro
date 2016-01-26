package com.xwq.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * 业绩报告
 */
@Entity
@Table(name="yj_report")
public class YjReport {
	@Id
	@GeneratedValue
	private int id;
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="emp_id")
	private Employee employee;
	@Column(name="emp_name")
	private String empName;
	@Column(name="dept_name")
	private String deptName;
	private String title;
	@Column(name="finish_situation")
	private String finishSituation;
	
	@Column(name="job_summary")
	private String jobSummary;
	
	@Column(name="submit_date")
	private String submitDate;
	private boolean audited;
	@Column(name="audit_person")
	private String auditPerson;
	
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
	public String getJobSummary() {
		return jobSummary;
	}
	public void setJobSummary(String jobSummary) {
		this.jobSummary = jobSummary;
	}
	
	public String getSubmitDate() {
		return submitDate;
	}
	public void setSubmitDate(String submitDate) {
		this.submitDate = submitDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public boolean isAudited() {
		return audited;
	}
	public void setAudited(boolean audited) {
		this.audited = audited;
	}

	public String getFinishSituation() {
		return finishSituation;
	}
	public void setFinishSituation(String finishSituation) {
		this.finishSituation = finishSituation;
	}
	public String getAuditPerson() {
		return auditPerson;
	}
	public void setAuditPerson(String auditPerson) {
		this.auditPerson = auditPerson;
	}
}
