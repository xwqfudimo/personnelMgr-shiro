<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改加班申请</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/main.css"/>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/modernizr.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/My97DatePicker/WdatePicker.js"></script>
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
                <h1>修改加班申请</h1>
            </div>
            <form method="post" action="<%=request.getContextPath() %>/jiabanApply_edit_submit">
                	起始时间：<input type="text" class="common-text2 Wdate" name="start_time" value="${fn:substring(jb.startTime, 0, 16) }" id="start_time" size="18" onFocus="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm',alwaysUseStartDate:true})">
                	&nbsp;&nbsp;
                	结束时间：<input type="text" class="common-text2 Wdate" name="end_time" value="${fn:substring(jb.endTime, 0, 16) }" id="end_time" size="18" onFocus="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm',alwaysUseStartDate:true})">
                	<br><br>
                	共 <input type="text" name="day_num" class="common-text2" size="2" value="${jb.dayNum }"> 天 <input type="text" name="hour_num" class="common-text2" size="2" value="${jb.hourNum }"> 小时
                	<br><br>
                	<div>
                		<div style="display:inline-block;vertical-align: top;">加班理由：</div>
                		<div style="display:inline-block;vertical-align: top;"><textarea name="reason" class="common-textarea" cols="50">${jb.jbReason }</textarea></div>
                	</div>
                	<br>
                	 <input type="hidden" name="id" value="${jb.id }">
                	 <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                     <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
            </form>
        </div>
 
    </div>
    <!--/main-->
</div>
</body>
</html>