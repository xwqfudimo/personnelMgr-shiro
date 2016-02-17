package com.xwq.vo;

public class YjReportVo {
	private int id;
	private String title;
	private String submitDate;
	private boolean audited;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSubmitDate() {
		return submitDate;
	}
	public void setSubmitDate(String submitDate) {
		this.submitDate = submitDate;
	}
	public boolean isAudited() {
		return audited;
	}
	public void setAudited(boolean audited) {
		this.audited = audited;
	}
}	
