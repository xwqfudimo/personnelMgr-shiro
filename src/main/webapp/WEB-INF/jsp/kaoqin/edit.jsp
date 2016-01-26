<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${columnName }</title>
<script type="text/javascript" src="${ctxPath }/resources/laydate/laydate.js"></script>
</head>
<body>
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe000;</i><span>${columnName }</span></div>
        </div>
        
      	<div class="result-wrap">
      		<div class="result-title">
                <h1>新增考勤记录</h1>
            </div>
            <form method="post" action="${ctxPath }/kaoqin_edit_submit">
                	员工：${kq.empName }
                	<br><br>
                	上午签到时间：<input type="text" class="common-text2" name="morning_sign_time" id="morning_sign_time" size="9" value="${kq.morningSignTime}">
                	<br><br>
                	下午签到时间：<input type="text" class="common-text2" name="afternoon_sign_time" id="afternoon_sign_time" size="9"  value="${kq.afternoonSignTime}">
                	<br><br>
                	日期：<input type="text" class="common-text2 laydate-icon" name="date" id="date" size="11" onclick="laydate({istime: true, format: 'YYYY-MM-DD'})" value="${kq.date}">
                	<br><br>
                	<input type="hidden" name="id" value="${kq.id }">
               	    <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                    <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
            </form>
        </div>
 
    </div>
</body>
</html>