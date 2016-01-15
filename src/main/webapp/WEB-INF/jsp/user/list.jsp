<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.xwq.enums.AuditStatus"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${columnName }</title>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/layer/layer.js"></script>
</head>
<body>
	
    <!--/sidebar-->
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe000;</i><span>${columnName }</span></div>
        </div>
        
      	<div class="result-wrap">
      		<div class="result-title">
                <h1>用户列表</h1>
            </div>
            <form method="get">
                <div class="result-title">
                    <div class="result-list">
                        <a href="${ctxPath }/user_add"><i class="icon-font"></i>添加用户</a>
                    </div>
                </div>
                <div class="result-content">
                    <table class="result-tab grid-data" width="100%">
                        <tr>
                            <th>用户名</th>
                            <th>密码</th>
                            <th>员工ID</th>
                            <th>员工名</th>
                            <th width="200px">操作</th>
                        </tr>

                   		<c:forEach items="${users }" var="user">
                   			<tr>
                   				<td>${user.username }</td>
                   				<td>${user.password }</td>
                   				<td>${user.employee.id }</td>
                   				<td>${user.employee.name }</td>
                   				<td>
                  					<a class="link-update" href="<%=request.getContextPath() %>/user_edit/${user.id}">修改</a>
                                   	<a class="link-del" href="javascript:void(0)" onclick="del(${user.id})">删除</a>
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
<script type="text/javascript">

function del(id) {
	 layer.confirm('确定删除数据吗？', {title: '提示', btn:['确定', '取消']}, function(){
         var url = '${ctxPath }/user_del/'+ id;
         $.get(url);
         layer.msg('删除成功！', {time:2000});
         window.location.reload();
     });
}
</script>    
    
</body>

</html>