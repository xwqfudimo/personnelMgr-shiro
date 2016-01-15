package com.xwq.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 * 薪资
 */
@Entity
public class Salary {
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
	@Column(name="basic_salary")
	private double basicSalary;
	private double butie;
	private double bonus;
	@Column(name="jiaban_plus")
	private double jiabanPlus;
	@Column(name="kaoqing_minus")
	private double kaoqingMinus;
	private double gongjijin;
	private double shebao;
	@Column(name="yingde_money")
	private double yingdeMoney;
	@Column(name="shifa_money")
	private double shifaMoney;
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
	public double getBasicSalary() {
		return basicSalary;
	}
	public void setBasicSalary(double basicSalary) {
		this.basicSalary = basicSalary;
	}
	public double getButie() {
		return butie;
	}
	public void setButie(double butie) {
		this.butie = butie;
	}
	public double getBonus() {
		return bonus;
	}
	public void setBonus(double bonus) {
		this.bonus = bonus;
	}
	public double getJiabanPlus() {
		return jiabanPlus;
	}
	public void setJiabanPlus(double jiabanPlus) {
		this.jiabanPlus = jiabanPlus;
	}
	public double getKaoqingMinus() {
		return kaoqingMinus;
	}
	public void setKaoqingMinus(double kaoqingMinus) {
		this.kaoqingMinus = kaoqingMinus;
	}
	public double getGongjijin() {
		return gongjijin;
	}
	public void setGongjijin(double gongjijin) {
		this.gongjijin = gongjijin;
	}
	public double getShebao() {
		return shebao;
	}
	public void setShebao(double shebao) {
		this.shebao = shebao;
	}
	public double getYingdeMoney() {
		return yingdeMoney;
	}
	public void setYingdeMoney(double yingdeMoney) {
		this.yingdeMoney = yingdeMoney;
	}
	public double getShifaMoney() {
		return shifaMoney;
	}
	public void setShifaMoney(double shifaMoney) {
		this.shifaMoney = shifaMoney;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
}
