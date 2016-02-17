package com.xwq.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * 日志
 */
@Entity
public class Log {
	@Id
	@GeneratedValue
	private int id;
	//操作用户名
	private String uname;
	//请求url
	private String url;
	//请求参数
	private String param;
	@Column(name="log_msg")
	private String logMsg;
	@Column(name="record_time")
	private String recordTime;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getLogMsg() {
		return logMsg;
	}
	public void setLogMsg(String logMsg) {
		this.logMsg = logMsg;
	}
	public String getRecordTime() {
		return recordTime;
	}
	public void setRecordTime(String recordTime) {
		this.recordTime = recordTime;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getParam() {
		return param;
	}
	public void setParam(String param) {
		this.param = param;
	}
}
