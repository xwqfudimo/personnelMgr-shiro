<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${columnName }</title>
    <script type="text/javascript" src="${ctxPath }/resources/js/layer/layer.js"></script>
</head>
<body>
	
    <!--/sidebar-->
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe000;</i><span>${columnName }</span></div>
        </div>
        
      	<div class="result-wrap">
      		<div class="result-title">
                <h1>权限列表</h1>
            </div>
            <form method="get">
                <div class="result-title">
                    <div class="result-list">
                        <a href="${ctxPath }/auth_add"><i class="icon-font"></i>添加权限</a>
                    </div>
                </div>
                <div class="result-content">
                    <table class="result-tab grid-data" width="100%">
                        <tr>
                            <th>权限名称</th>
                            <th>uri</th>
                            <th>权限组名称</th>
                            <th width="200px">操作</th>
                        </tr>

                   		<c:forEach items="${auths }" var="auth">
                   			<tr>
                   				<td>${auth.name }</td>
                   				<td>${auth.uri }</td>
                   				<td>${auth.group}</td>
                   				<td>
                  					<a class="link-update" href="<%=request.getContextPath() %>/auth_edit/${auth.id}">修改</a>
                                   	<a class="link-del" href="javascript:void(0)" onclick="del(${auth.id})">删除</a>
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
         var url = '${ctxPath }/auth_del/'+ id;
         $.get(url);
         layer.msg('删除成功！', {time:2000});
         window.location.reload();
     });
}
</script>    
    
</body>

</html>