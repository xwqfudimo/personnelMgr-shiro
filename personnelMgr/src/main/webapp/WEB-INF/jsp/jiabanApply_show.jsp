<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.xwq.enums.AuditStatus"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<c:set var="APPROVE" value="<%=AuditStatus.APPROVE %>"/> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看加班申请</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/main.css"/>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/modernizr.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-1.11.3.min.js"></script>
</head>
<body>

<jsp:include page="header.jsp"></jsp:include>

<div class="container clearfix">
	
	<jsp:include page="left_nav.jsp"></jsp:include>

    <!--/sidebar-->
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe000;</i><span>${columnName }</span></div>
        </div>
        
        <div class="result-wrap">
            <div class="result-title">
                <h1>查看加班申请</h1>
            </div>
            <div class="result-content">
                <ul class="sys-info-list">
                    <li>
                        <label class="res-lab">起始时间</label><span class="res-info">${fn:substring(jb.startTime, 0, 19) }</span>
                    </li>
                    <li>
                        <label class="res-lab">结束时间</label><span class="res-info">${fn:substring(jb.endTime, 0, 19) }</span>
                    </li>
                    <li>
                        <label class="res-lab">总时间</label><span class="res-info">${jb.dayNum }天${jb.hourNum }小时</span>
                    </li>
                    <li>
                        <label class="res-lab">加班理由</label><span class="res-info">${jb.jbReason }</span>
                    </li>
                    <li>
                        <label class="res-lab">提交时间</label><span class="res-info">${jb.submitTime }</span>
                    </li>
                    <li>
                        <label class="res-lab">审批状态</label>
                        <span class="res-info">
              					<c:choose>
              						<c:when test="${jb.auditStatus == null }">未审批</c:when>
              						<c:when test="${jb.auditStatus == APPROVE }"><span class="approve">✔批准</span></c:when>
              						<c:otherwise><span class="against">✘不批准</span></c:otherwise>
              					</c:choose>
                        </span>
                    </li>
                    
                    <c:if test="${jb.auditStatus != null }">
	                    <li>
	                        <label class="res-lab">审批人</label><span class="res-info">${jb.auditPerson }</span>
	                    </li>
                    </c:if>
                </ul>
            </div>
        </div>
 
    </div>
    <!--/main-->
</div>
</body>
</html>