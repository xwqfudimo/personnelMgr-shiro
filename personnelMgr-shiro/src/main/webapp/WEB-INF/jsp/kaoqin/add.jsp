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
            <form method="post">
                	员工：
                	<select name="emp_id">
                		<option value="-1">请选择..</option>
                		<c:forEach items="${emps }" var="emp">
                			<option value="${emp.id }">${emp.name }</option>
                		</c:forEach>
                	</select>
                	<br><br>
                	上午签到时间：<input type="text" class="common-text2" name="morning_sign_time" id="morning_sign_time" size="9">
                	<br><br>
                	下午签到时间：<input type="text" class="common-text2" name="afternoon_sign_time" id="afternoon_sign_time" size="9">
                	<br><br>
                	日期：<input type="text" class="common-text2 laydate-icon" name="date" id="date" size="11" onclick="laydate({format: 'YYYY-MM-DD'})">
                	<br><br>
               	    <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                    <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
            </form>
        </div>
 
    </div>
</body>
</html>