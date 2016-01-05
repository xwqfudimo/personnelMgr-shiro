<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.xwq.enums.QingjiaType"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改加班申请</title>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe000;</i><span>${columnName }</span></div>
        </div>
        
      	<div class="result-wrap">
      		<div class="result-title">
                <h1>修改加班申请</h1>
            </div>
            <form method="post" action="<%=request.getContextPath() %>/qingjiaApply_edit_submit">
                	请假类型：
            		<select name="type">
            			<option value="<%=QingjiaType.SICK%>" <c:if test="${qj.qjType == QingjiaType.SICK }">selected</c:if> >病假</option>
            			<option value="<%=QingjiaType.AFFAIR%>" <c:if test="${qj.qjType == QingjiaType.AFFAIR }">selected</c:if> >事假</option>
            			<option value="<%=QingjiaType.MARRIAGE%>" <c:if test="${qj.qjType == QingjiaType.MARRIAGE }">selected</c:if> >婚假</option>
            			<option value="<%=QingjiaType.FUNERAL%>" <c:if test="${qj.qjType == QingjiaType.FUNERAL }">selected</c:if> >丧假</option>
            			<option value="<%=QingjiaType.MATERNITY%>" <c:if test="${qj.qjType == QingjiaType.MATERNITY }">selected</c:if> >产假</option>
            			<option value="<%=QingjiaType.PUBLIC%>" <c:if test="${qj.qjType == QingjiaType.PUBLIC }">selected</c:if> >公假</option>
            		</select>
            		<br><br>
                	起始时间：<input type="text" class="common-text2 Wdate" name="start_time" id="start_time" value="${fn:substring(qj.startTime, 0, 16) }" size="18" onFocus="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm',alwaysUseStartDate:true})">
                	&nbsp;&nbsp;
                	结束时间：<input type="text" class="common-text2 Wdate" name="end_time" id="end_time" value="${fn:substring(qj.endTime, 0, 16) }" size="18" onFocus="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm',alwaysUseStartDate:true})">
                	<br><br>
                	共 <input type="text" name="day_num" class="common-text2" size="2" value="${qj.dayNum }"> 天 <input type="text" name="hour_num" class="common-text2" size="2" value="${qj.hourNum }"> 小时
                	<br><br>
                	<div>
                		<div style="display:inline-block;vertical-align: top;">请假理由：</div>
                		<div style="display:inline-block;vertical-align: top;"><textarea name="reason" class="common-textarea" cols="50">${qj.qjReason }</textarea></div>
                	</div>
                	<br>
                     <input type="hidden" name="id" value="${qj.id }">
                	 <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                     <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
            </form>
        </div>
 
    </div>
</body>
</html>