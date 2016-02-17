<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
                <h1>备份文件列表</h1>
            </div>
            <form method="get">
            	<a href="#" id="backupByHand" class="btn btn-info">手动备份</a><br><br>
                <div class="result-content">
                    <table class="result-tab grid-data" width="100%">
                        <tr>
                            <th>文件名称</th>
                            <th width="200px">操作</th>
                        </tr>

                   		<c:forEach items="${filenameList }" var="name">
                   			<tr>
                   				<td>${name }</td>
                   				<td>
                  					<a class="link-update" href="${ctxPath }/dataBR_show/${name}">查看</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  					<a class="link-update restore" href="#" style="color:red;" data="${fn:substring(name, 0, 10) }">导入恢复</a>
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


$(document).ready(function(){
	$(".restore").click(function(){
		var name = $(this).attr('data');
		
		 layer.confirm("确定导入恢复" + name +".sql文件吗？", {title: '提示', btn:['确定', '取消']}, function(){
	         var url = '${ctxPath }/restore/'+ name;
	         var index = layer.load(1, { //loading提示
	        	    shade: [0.1,'#fff'] 
	        	});
	         $.get(url, function(result) {
	        	 if(result) {
	        		 layer.alert('恢复成功！', {icon:1});
	        	 }
	        	 else {
	        		 layer.alert('恢复失败！', {icon:2});
	        	 }
	         });
	        
	     });
	});
	
	
	$("#backupByHand").click(function(){
		layer.confirm("确定手动备份数据库吗？", {title: '提示', btn:['确定', '取消']}, function(){
	         var url = '${ctxPath }/backupByHand';
	         var index = layer.load(1, { //loading提示
	        	    shade: [0.1,'#fff'] 
	        	});
	         $.get(url, function(result) {
	        	 if(result) {
	        		 layer.alert('备份成功！', {icon:1});
	                 window.location.reload(); 
	        	 }
	        	 else {
	        		 layer.alert('备份失败！', {icon:2});
	        	 }
	         });
	        
	     });
	});
});
</script>    

<script type="text/javascript" src="${ctxPath }/resources/pagination/pagination.js"></script>
    
</body>
</html>