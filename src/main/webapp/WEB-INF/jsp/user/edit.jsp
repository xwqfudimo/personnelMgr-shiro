<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.xwq.enums.QingjiaType"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${columnName }</title>
</head>
<body>
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe000;</i><span>${columnName }</span></div>
        </div>
        
      	<div class="result-wrap">
      		<div class="result-title">
                <h1>编辑用户</h1>
            </div>
            <form method="post" action="${ctxPath }/user_edit_submit">
                	用户名：<input type="text" class="common-text2" name="username" value="${user.username }" size="18">
                	<br><br>
                	密码：<input type="password" class="common-text2" name="password" id="password" value="${user.password }" size="32"> <a href="#" id="emptyPwd">清空</a>
                	<br><br>
                	所属员工：
					<select name="empId">
						<option value="-1">请选择</option>
						<c:forEach items="${empVoList }" var="emp">
							<option value="${emp.id }" <c:if test="${emp.id == user.employee.id }"> selected </c:if> >${emp.name }</option>
						</c:forEach>
					</select>
                	<br><br>
                	 <input type="hidden" name="id" value="${user.id }">
                	 <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                     <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
            </form>
        </div>
 
    </div>    
  
  <script type="text/javascript">
  $(document).ready(function() {
		$("#emptyPwd").click(function() {
			$('#password').attr("value", "");
		});	  
  });
  </script>  
    
</body>
</html>