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
                <h1>新增员工</h1>
            </div>
            <form method="post">
                	姓名：<input type="text" class="common-text2" name="name" size="8">
                	<br><br>
                	部门：
                	<select name="deptId">
                		<c:forEach items="${depts }" var="dept">
                			<option value=${dept.id }>${dept.name}</option>
                		</c:forEach>
                	</select>
                	<br><br>
                	性别：
					<input type="radio" name="sex" value="MALE">男   
					<input type="radio" name="sex" value="FEMALE">女   
                	<br><br>
                	出生日期：
					<input type="text" class="common-text2 laydate-icon" name="birthdate"  size="12" onclick="laydate()">
                	<br><br>
                	民族：
                	<select name="nationality">
                		<option value="汉族">汉族</option>
                	</select>
                	<br><br>
                	政治面貌：
                	<select name="zzmm">
                		<option value="群众">群众</option>
                		<option value="党员">党员</option>
                	</select>
                	<br><br>
                	婚姻：
                	<select name="marriage">
                		<option value="未婚">未婚</option>
                		<option value="已婚">已婚</option>
                		<option value="离异">离异</option>
                	</select>
                	<br><br>
                	<div>
                		<div class="pxtop">住址：</div>
                		<div class="pxtop"><textarea name="address" class="common-textarea" cols="30"></textarea></div>
                	</div>
                	<br>
                	入职日期：
                	<input type="text" class="common-text2 laydate-icon" name="rzsj"  size="12" onclick="laydate()">
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
                	电话：<input type="text" class="common-text2" name="phone" size="11">
                	<br><br>
                	邮箱：<input type="text" class="common-text2" name="email" size="16">
                	<br><br>
                	身份证：<input type="text" class="common-text2" name="card" size="18">
          			<br><br>
          			<div>
                		<div class="pxtop">备注：</div>
                		<div class="pxtop"><textarea name="beizhu" class="common-textarea"></textarea></div>
                	</div>
                	<br><br>
               	    <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                    <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
            </form>
        </div>
 
    </div>
</body>
</html>