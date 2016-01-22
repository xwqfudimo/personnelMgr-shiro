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
                <h1>修改部门</h1>
            </div>
            <form method="post" action="${ctxPath }/dept_edit_submit">
                	部门名称：<input type="text" class="common-text2" name="name" size="8" value="${dept.name }">
                	<br><br>
                	负责人：
                	<select name="fzr_id">
                		<c:forEach items="${emps}" var="emp">
                			<option value="${emp.id }" 
                				<c:if test="${emp.id == dept.fzr.id }">selected</c:if>
                				>${emp.name }</option>
                		</c:forEach>
                	</select>
                	<br><br>
                	排序：<input type="text" class="common-text2" name="sort" size="3" value="${dept.sort }">
                	<br><br>
                	<input type="hidden" name="id" value="${dept.id }">
               	    <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                    <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
            </form>
        </div>
 
    </div>
</body>
</html>