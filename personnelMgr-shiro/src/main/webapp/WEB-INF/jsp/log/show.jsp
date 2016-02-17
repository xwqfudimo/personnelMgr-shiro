<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.xwq.enums.AuditStatus"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<c:set var="APPROVE" value="<%=AuditStatus.APPROVE %>"/> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统日志详情</title>

</head>
<body>

    <!--/sidebar-->
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe000;</i><span>${columnName }</span></div>
        </div>
        
        <div class="result-wrap">
            <div class="result-title">
                <h1>日志详情</h1>
            </div>
            <div class="result-content">
                <ul class="sys-info-list">
                    <li>
                        <label class="res-lab">时间</label><span class="res-info">${fn:substring(log.recordTime, 0, 19) }</span>
                    </li>
                    <li>
                        <label class="res-lab">动作</label><span class="res-info">${log.logMsg }</span>
                    </li>
                    <li>
                        <label class="res-lab">用户</label><span class="res-info">${log.uname }</span>
                    </li>
                    <li>
                        <label class="res-lab">请求url</label><span class="res-info">${log.url }</span>
                    </li>
                    <li>
                        <label class="res-lab">请求参数</label>
                        <span class="res-info">
                        	<c:forEach items="${paramMap }" var="map" varStatus="mapS">${map.key }=${map.value[0] }<c:if test="${mapS.last==false}">&</c:if></c:forEach>
                        </span>
                    </li>
                </ul>
            </div>
        </div>
 
    </div>
    <!--/main-->
</body>
</html>