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
                <h1>修改权限</h1>
            </div>
            <form method="post" action="${ctxPath }/auth_edit_submit">
                	权限名称：<input type="text" class="common-text2" name="name" size="8" value="${res.name }">
                	<br><br>
                	uri：<input type="text" class="common-text2" name="uri" size="16" value="${res.uri }">
                	<br><br>
                	权限组名称：<input type="text" class="common-text2" name="group_name" size="12" value="${res.group }">
                	<br><br>
                	<input type="hidden" name="id" value="${res.id }">
               	    <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                    <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
            </form>
        </div>
 
    </div>
</body>
</html>