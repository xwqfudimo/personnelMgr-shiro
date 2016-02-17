package com.xwq.quartz;

public class MyJob {
	
	public void work() {
		DbJobTask.backupDb();
	}
}
