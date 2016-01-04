<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
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
                <h1>本月考勤记录</h1>
            </div>
            <form method="get">
                <div class="result-content">
                	<div class="list-title">考勤记录列表：</div>
                	<div class="result-bar">
                		筛选：
	                	<input type="radio" class="common-radio" name="filter" value="this-month"  <c:if test="${filter == 'this-month' }">checked="checked"</c:if>>本月&nbsp;
	                	<input type="radio" class="common-radio" name="filter" value="last-month"  <c:if test="${filter == 'last-month' }">checked="checked"</c:if>>上月&nbsp;
	                	<input type="radio" class="common-radio" name="filter" value="all"  <c:if test="${filter == 'all' }">checked="checked"</c:if>>全部
                	</div>  
                    <table class="result-tab grid-data" width="100%">
                        <tr>
                            <th width="200px">日期</th>
                            <th width="200px">上午签到时间</th>
                            <th width="200px">下午签到时间</th>
                           
                        </tr>

                   		<c:forEach items="${kaoqingList }" var="kq">
                   			<tr>
                   				<td>${kq.date }</td>
                   				<td>${kq.moringSignTime }</td>
                   				<td>${kq.afternoonSignTime }</td>
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