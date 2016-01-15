<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.xwq.enums.QingjiaType"%>
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
                <h1>新增请假申请</h1>
            </div>
            <form method="post">
            		请假类型：
            		<select name="type">
            			<option value="<%=QingjiaType.SICK%>">病假</option>
            			<option value="<%=QingjiaType.AFFAIR%>">事假</option>
            			<option value="<%=QingjiaType.MARRIAGE%>">婚假</option>
            			<option value="<%=QingjiaType.FUNERAL%>">丧假</option>
            			<option value="<%=QingjiaType.MATERNITY%>">产假</option>
            			<option value="<%=QingjiaType.PUBLIC%>">公假</option>
            		</select>
            		<br><br>
                	起始时间：<input type="text" class="common-text2 laydate-icon" name="start_time" id="start_time" size="18" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
                	&nbsp;&nbsp;
                	结束时间：<input type="text" class="common-text2 laydate-icon" name="end_time" id="end_time" size="18" onclick="laydate({istime: true, format: 'YYYY-MM-DD hh:mm:ss'})">
                	<br><br>
                	共 <input type="text" name="day_num" class="common-text2" size="2"> 天 <input type="text" name="hour_num" class="common-text2" size="2"> 小时
                	<br><br>
                	<div>
                		<div style="display:inline-block;vertical-align: top;">请假理由：</div>
                		<div style="display:inline-block;vertical-align: top;"><textarea name="reason" class="common-textarea" cols="50"></textarea></div>
                	</div>
                	<br>
                	 <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                     <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
            </form>
        </div>
 
    </div>
</body>
</html>