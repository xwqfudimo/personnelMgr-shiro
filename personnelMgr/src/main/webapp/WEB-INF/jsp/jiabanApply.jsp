<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.xwq.enums.AuditStatus"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${columnName }</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/main.css"/>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/modernizr.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-1.11.3.min.js"></script>
</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="index.html" class="navbar-brand">后台管理</a></h1>
            <ul class="navbar-list clearfix">
            	<c:forEach items="${modules }" var="m">
            		<li><a href="<%=request.getContextPath()%>/module/${m.id}"  <c:if test="${m.id == module.id }">class="on"</c:if>  >${m.name}</a></li>
            	</c:forEach>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li><a href="<%=request.getContextPath()%>/logout">退出</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            	欢迎你，${empName }
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
               	
               	<li>
               		<a href="#"><i class="icon-font">&#xe003;</i>菜单</a>
               		<ul class="sub-menu">
		               	<c:forEach items="${columns }" var="column">
		               		 <li><a href="<%=request.getContextPath()%>/${column.href}">${column.name}</a></li>
		               	</c:forEach>
		            </ul>   	
	            </li>   	
                 
            </ul>
        </div>
    </div>
    <!--/sidebar-->
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe000;</i><span>${columnName }</span></div>
        </div>
        
      	<div class="result-wrap">
      		<div class="result-title">
                <h1>加班申请</h1>
            </div>
            <form method="get">
                <div class="result-title">
                    <div class="result-list">
                        <a href="<%=request.getContextPath()%>/jiabanApply_add"><i class="icon-font"></i>申请加班</a>
                    </div>
                </div>
                <div class="result-content">
                	<div class="list-title">我的加班申请列表：</div>
                	<div class="result-bar">
                		筛选：
	                	<input type="radio" class="common-radio" name="filter"  value="all-apply"  <c:if test="${filter == 'all-apply' }">checked="checked"</c:if>>全部&nbsp;
	                	<input type="radio" class="common-radio" name="filter" value="null-apply"  <c:if test="${filter == 'null-apply' }">checked="checked"</c:if>>未审批&nbsp;
	                	<input type="radio" class="common-radio" name="filter" value="yes-apply"  <c:if test="${filter == 'yes-apply' }">checked="checked"</c:if>><span class="approve">✔已批准</span>&nbsp;
	                	<input type="radio" class="common-radio" name="filter" value="no-apply"  <c:if test="${filter == 'no-apply' }">checked="checked"</c:if>><span class="against">✘未批准</span>
                	</div>  
                    <table class="result-tab grid-data" width="100%">
                        <tr>
                            <th width="50px">ID</th>
                            <th width="200px">起始时间</th>
                            <th width="200px">结束时间</th>
                            <th width="200px">总时间</th>
                            <th style="text-align:left;">加班理由</th>
                            <th width="150px">审批状态</th>
                        </tr>

                   		<c:forEach items="${jiabanList }" var="jb">
                   			<tr>
                   				<td>${jb.id }</td>
                   				<td><c:out value="${fn:substring(jb.startTime, 0, 19) }"/></td>
                   				<td><c:out value="${fn:substring(jb.endTime, 0, 19) }"/></td>
                   				<td>${jb.dayNum }天${jb.hourNum }小时</td>
                   				<td style="text-align:left;">${jb.jbReason }</td>
                   				<td>
                   					<c:set var="APPROVE" value="<%=AuditStatus.APPROVE %>"/>
                   					<c:choose>
                   						<c:when test="${jb.auditStatus == null }">未审批</c:when>
                   						<c:when test="${jb.auditStatus == APPROVE }"><span class="approve">✔批准</span></c:when>
                   						<c:otherwise><span class="against">✘不批准</span></c:otherwise>
                   					</c:choose>
                   				</td>
                   			</tr>
                   		</c:forEach>

                    </table>
                    <div class="list-page"> 2 条 1/1 页</div>
                </div>
            </form>
        </div>
 
    </div>
    <!--/main-->
</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	$(":radio").change(function(){
		$("form").submit();
	});
});
</script>
</html>