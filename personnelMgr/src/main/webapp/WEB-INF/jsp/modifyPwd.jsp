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
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/layer/layer.js"></script>
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
                <h1>修改登录密码</h1>
            </div>
            <div class="result-content">
                <form method="post">
                	 <table class="insert-tab" width="100%">
                			<tr><td width="120">原有密码：</td><td><input class="common-text" name="oldPwd" id="oldPwd" size="30" type="password"></td></tr>
                			<tr><td>新的密码：</td><td><input class="common-text" name="newPwd" id="newPwd" size="30" type="password"></td></tr>
                			<tr><td>再次输入：</td><td><input class="common-text" name="newPwd2" id="newPwd2" size="30" type="password"></td></tr>
					</table>                	
               		<br>
                	<input class="btn btn-primary btn6 mr10" value="提交" type="button" id="submit">
                </form>
            </div>
        </div>
 
    </div>
    <!--/main-->
</div>
</body>


<script type="text/javascript">
$(document).ready(function() {
	$("#submit").click(function(){
		var oldPwd = $("#oldPwd").val();
		var newPwd = $("#newPwd").val();
		var newPwd2 = $("#newPwd2").val();
		
		$.post("${pageContext.request.contextPath}/column/modifyPwd", 
				{'oldPwd':oldPwd, 'newPwd':newPwd, 'newPwd2':newPwd2}, function(data){
					if(data == 1) {
						layer.msg('修改成功！', {time: 2000});
						$("#oldPwd").val('');
						$("#newPwd").val('');
						$("#newPwd2").val('');
					} else {
						layer.alert('修改失败！');
					}
				}, 'json');
	});
});
</script>

</html>

