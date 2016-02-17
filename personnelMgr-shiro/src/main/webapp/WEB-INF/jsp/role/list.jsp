<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.xwq.enums.AuditStatus"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${columnName }</title>
    <link rel="stylesheet" type="text/css" href="${ctxPath }/resources/pagination/css/pagination.css">
    <script type="text/javascript" src="${ctxPath }/resources/pagination/js/jquery.pagination.js"></script>
</head>
<body>
	
    <!--/sidebar-->
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe000;</i><span>${columnName }</span></div>
        </div>
        
      	<div class="result-wrap">
      		<div class="result-title">
                <h1>角色列表</h1>
            </div>
            <form method="get">
                <div class="result-title">
                    <div class="result-list">
                        <a href="${ctxPath }/role_add"><i class="icon-font"></i>添加角色</a>
                    </div>
                </div>
                <div class="result-content">
                    <table class="result-tab grid-data" width="100%">
                        <tr>
                            <th>角色标识名称</th>
                            <th>角色描述</th>
                            <th width="250px">操作</th>
                        </tr>

                   		<c:forEach items="${roles }" var="role">
                   			<tr>
                   				<td>${role.name }</td>
                   				<td>${role.desc }</td>
                   				<td>
                  					<a class="link-update" href="${ctxPath }/role/${role.id}">详细</a>
                  					<a class="link-update" href="${ctxPath }/role_edit/${role.id}">修改</a>
                                   	<a class="link-del" href="javascript:void(0)" onclick="del(${role.id})">删除</a>
                                </td>
                   			</tr>
                   		</c:forEach>

                    </table>
                    <div class="pages">
				        <div id="Pagination"></div>
				        <div class="searchPage">
				          <span class="page-sum">共<strong class="allPage">${pageCount }</strong>页</span>
				          <span class="page-go">跳转<input type="text" id="pageNo">页</span>
				          <a href="javascript:;" class="btn"  onclick="go()">GO</a>
				        </div>
				    </div>
                </div>
            </form>
        </div>
 
    </div>
    <!--/main-->
<script type="text/javascript">
var pageCount = <c:out value="${pageCount}"/>;
var page = <c:out value="${pageIndex-1}"/>;

function del(id) {
	 layer.confirm('确定删除数据吗？', {title: '提示', btn:['确定', '取消']}, function(){
         var url = '${ctxPath }/role_del/'+ id;
         $.get(url, function(result) {
        	 if(result) {
        		 layer.msg('删除成功！', {time:2000});
                 window.location.reload();
        	 }
         });
     });
}
</script>   

<script type="text/javascript" src="${ctxPath }/resources/pagination/pagination.js"></script> 
    
</body>
</html>