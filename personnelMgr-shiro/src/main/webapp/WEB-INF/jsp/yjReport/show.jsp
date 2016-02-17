<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查看业绩报告</title>
</head>
<body>
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe000;</i><span>${columnName }</span></div>
        </div>
        
        <div class="result-wrap">
            <div class="result-title">
                <h1>查看业绩报告</h1>
            </div>
            <div class="result-content">
                <ul class="sys-info-list">
                	<li>
                        <label class="res-lab">标题</label><span class="res-info">${report.title }</span>
                    </li>
                    <li>
                        <label class="res-lab">本月完成情况</label><span class="res-info">${report.finishSituation }</span>
                    </li>
                    <li>
                        <label class="res-lab">月工作总结</label><span class="res-info">${report.jobSummary }</span>
                    </li>
                    <li>
                        <label class="res-lab">审批状态</label>
                        <span class="res-info">
              					<c:choose>
              						<c:when test="${report.audited == true }"><span class="approve">✔已审核</span></c:when>
              						<c:otherwise>未审核</c:otherwise>
              					</c:choose>
                        </span>
                    </li>
                    
                    <c:if test="${report.audited == true }">
	                    <li>
	                        <label class="res-lab">审核人</label><span class="res-info">${report.auditPerson }</span>
	                    </li>
                    </c:if>
                </ul>
            </div>
        </div>
 
    </div>
</body>
</html>