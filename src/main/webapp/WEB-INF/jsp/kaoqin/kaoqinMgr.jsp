<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <h1>考勤管理</h1>
            </div>
            <form method="get">
            	<div class="result-title">
                    <div class="result-list">
                        <a href="${ctxPath }/kaoqin_add"><i class="icon-font"></i>新增考勤记录</a>
                    </div>
                </div>
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
                        	<th width="100px">员工</th>
                            <th width="200px">日期</th>
                            <th width="200px">上午签到时间</th>
                            <th width="200px">下午签到时间</th>
                            <th width="200px">操作</th>
                        </tr>

                   		<c:forEach items="${kaoqinList }" var="kq">
                   			<tr>
                   				<td>${kq.empName }</td>
                   				<td>${kq.date }</td>
                   				<td>${kq.morningSignTime }</td>
                   				<td>${kq.afternoonSignTime }</td>
                   				<td>
                   					<a class="link-update" href="${ctxPath }/kaoqin_edit/${kq.id}">修改</a>
                                   	<a class="link-del" href="javascript:void(0)" onclick="del(${kq.id})">删除</a>
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

<script type="text/javascript">
var pageCount = <c:out value="${pageCount}"/>;
var page = <c:out value="${pageIndex-1}"/>;

$(document).ready(function(){
	$(":radio").change(function(){
		$("form").submit();
	});
});

function del(id) {
	 layer.confirm('确定删除数据吗？', {title: '提示', btn:['确定', '取消']}, function(){
        var url = '${ctxPath }/kaoqin_del/'+ id;
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