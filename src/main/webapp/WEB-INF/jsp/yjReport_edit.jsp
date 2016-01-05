<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改业绩报告</title>
</head>
<body>
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe000;</i><span>${columnName }</span></div>
        </div>
        
      	<div class="result-wrap">
      		<div class="result-title">
                <h1>修改业绩报告</h1>
            </div>
            <form method="post" action="<%=request.getContextPath() %>/yjReport_edit_submit">
                	标题：<input type="text" class="common-text" name="title" size="50" value="${report.title }">
                	<br><br>
                	<div>
                		<div style="display:inline-block;vertical-align: top;">本月完成情况：</div>
                		<div style="display:inline-block;vertical-align: top;"><textarea name="finish_state" class="common-textarea" cols="50" rows="8">${report.finishState }</textarea></div>
                	</div>
                	<br>
                	<div>
                		<div style="display:inline-block;vertical-align: top;">月工作总结：</div>
                		<div style="display:inline-block;vertical-align: top;"><textarea name="job_summary" class="common-textarea" cols="50">${report.jobSummary }</textarea></div>
                	</div>
                	<br>
                	 <input type="hidden" name="id" value="${report.id }">
                	 <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                     <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
            </form>
        </div>
 
    </div>
</body>
</html>