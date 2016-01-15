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
                <h1>修改员工</h1>
            </div>
            <form method="post" action="<%=request.getContextPath() %>/emp_edit_submit">
                	姓名：<input type="text" class="common-text2" name="name" size="8" value="${emp.name }">
                	<br><br>
                	部门：
                	<select name="deptId">
                		<c:forEach items="${depts }" var="dept">
                			<option value=${dept.id } <c:if test="${dept.id == emp.department.id }">selected</c:if> >${dept.name}</option>
                		</c:forEach>
                	</select>
                	<br><br>
                	性别：
					<input type="radio" name="sex" value="MALE" <c:if test="${emp.sex == '男' }">checked</c:if>>男   
					<input type="radio" name="sex" value="FEMALE" <c:if test="${emp.sex == '女' }">checked</c:if>>女   
                	<br><br>
                	出生日期：
					<input type="text" class="common-text2 laydate-icon" name="birthdate"  size="12" onclick="laydate()" value="${emp.birthdate }">
                	<br><br>
                	民族：
                	<select name="nationality">
                		<option value="汉族" <c:if test="${emp.nationality == '汉族' }">selected</c:if> >汉族</option>
                	</select>
                	<br><br>
                	政治面貌：
                	<select name="zzmm">
                		<option value="群众" <c:if test="${emp.zzmm == '群众' }">selected</c:if>>群众</option>
                		<option value="党员" <c:if test="${emp.zzmm == '党员' }">selected</c:if>>党员</option>
                	</select>
                	<br><br>
                	婚姻：
                	<select name="marriage">
                		<option value="未婚" <c:if test="${emp.marriage == '未婚' }">selected</c:if>>未婚</option>
                		<option value="已婚" <c:if test="${emp.marriage == '已婚' }">selected</c:if>>已婚</option>
                		<option value="离异" <c:if test="${emp.marriage == '离异' }">selected</c:if>>离异</option>
                	</select>
                	<br><br>
                	<div>
                		<div class="pxtop">住址：</div>
                		<div class="pxtop"><textarea name="address" class="common-textarea" cols="30">${emp.address }</textarea></div>
                	</div>
                	<br>
                	入职日期：
                	<input type="text" class="common-text2 laydate-icon" name="rzsj"  size="12" onclick="laydate()" value="${emp.rzsj }">
                	<br><br>
                	学历：
                	<select name="xl">
                		<option value="高中">高中</option>
                		<option value="大专">大专</option>
                		<option value="本科">本科</option>
                		<option value="硕士">硕士</option>
                		<option value="博士">博士</option>
                	</select>
                	<br><br>
                	电话：<input type="text" class="common-text2" name="phone" size="11" value="${emp.phone }">
                	<br><br>
                	邮箱：<input type="text" class="common-text2" name="email" size="16" value="${emp.email }">
                	<br><br>
                	身份证：<input type="text" class="common-text2" name="card" size="18" value="${emp.card }">
          			<br><br>
          			<div>
                		<div class="pxtop">备注：</div>
                		<div class="pxtop"><textarea name="beizhu" class="common-textarea">${emp.beizhu }</textarea></div>
                	</div>
                	<br><br>
                	<input type="hidden" name="id" value="${emp.id }">
               	    <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                    <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
            </form>
        </div>
 
    </div>
</body>
</html>