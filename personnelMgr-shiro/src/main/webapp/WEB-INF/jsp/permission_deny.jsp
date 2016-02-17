<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>权限拒绝</title>
<style type="text/css">
.deny {margin: 50px 20px; color:red;}
</style>
</head>
<body>
<span class="deny">${ex.message }</span>
<c:if test="${ex.message == null }">
	<span class="deny">你无权访问该页面或功能！</span>
</c:if>
</body>
</html>