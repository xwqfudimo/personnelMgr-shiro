package com.xwq.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.Parameter;
import org.hibernate.annotations.Type;

import com.xwq.enums.Gender;

@Entity
public class Employee {
	@Id
	@GeneratedValue
	private int id;
	private String name;
	@ManyToOne
	@JoinColumn(name="dept_id")
	private Department department;

	@Type(type="com.xwq.enums.MyEnumType", 
			parameters={@Parameter(name="enumClass", value="com.xwq.enums.Gender")})
	private Gender sex;
	private String birthdate;
	private String nationality;
	//政治面貌
	private String zzmm;
	private String marriage;
	private String address;
	//入职时间
	private String rzsj;
	//学历
	private String xl;
	private String phone;
	private String email;
	//身份证号码
	private String card;
	private String resume;
	@Column(name="self_intro")
	private String selfIntro;
	private String beizhu;
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="role_id")
	private Role role;
	
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
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	public String getSex() {
		return sex.getPersistedValue();
	}
	public void setSex(Gender sex) {
		this.sex = sex;
	}
	public String getBirthdate() {
		return birthdate;
	}
	public void setBirthdate(String birthdate) {
		this.birthdate = birthdate;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getZzmm() {
		return zzmm;
	}
	public void setZzmm(String zzmm) {
		this.zzmm = zzmm;
	}
	public String getMarriage() {
		return marriage;
	}
	public void setMarriage(String marriage) {
		this.marriage = marriage;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRzsj() {
		return rzsj;
	}
	public void setRzsj(String rzsj) {
		this.rzsj = rzsj;
	}
	public String getXl() {
		return xl;
	}
	public void setXl(String xl) {
		this.xl = xl;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCard() {
		return card;
	}
	public void setCard(String card) {
		this.card = card;
	}
	public String getResume() {
		return resume;
	}
	public void setResume(String resume) {
		this.resume = resume;
	}
	public String getSelfIntro() {
		return selfIntro;
	}
	public void setSelfIntro(String selfIntro) {
		this.selfIntro = selfIntro;
	}
	public String getBeizhu() {
		return beizhu;
	}
	public void setBeizhu(String beizhu) {
		this.beizhu = beizhu;
	}
	public Role getRole() {
		return role;
	}
	public void setRole(Role role) {
		this.role = role;
	}
	@Override
	public String toString() {
		return "Employee [id=" + id + ", name=" + name + ", department="
				+ department + ", sex=" + sex + ", birthdate=" + birthdate
				+ ", nationality=" + nationality + ", zzmm=" + zzmm
				+ ", marriage=" + marriage + ", address=" + address + ", rzsj="
				+ rzsj + ", xl=" + xl + ", phone=" + phone + ", email=" + email
				+ ", card=" + card + ", resume=" + resume + ", selfIntro="
				+ selfIntro + ", beizhu=" + beizhu + ", role=" + role + "]";
	}
}
