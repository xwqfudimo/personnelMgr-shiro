<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><sitemesh:title/></title>
	<link rel="stylesheet" type="text/css" href="${ctxPath }/resources/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${ctxPath }/resources/css/main.css"/>
    <script type="text/javascript" src="${ctxPath }/resources/js/modernizr.min.js"></script>
    <script type="text/javascript" src="${ctxPath }/resources/js/jquery-1.11.3.min.js"></script> 
    <sitemesh:head/>  
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<div class="container clearfix">
  
  	<jsp:include page="left_nav.jsp"></jsp:include>
  
    <!--/sidebar-->
    <sitemesh:body/>  
    
    <!--/main-->
</div>
</body>
</html>