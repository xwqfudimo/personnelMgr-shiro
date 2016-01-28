<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.xwq.enums.AuditStatus" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${columnName }</title>
 <link rel="stylesheet" type="text/css" href="${ctxPath }/resources/pagination/css/pagination.css">
 <script type="text/javascript" src="${ctxPath }/resources/pagination/js/jquery.pagination.js"></script>
 
  <link rel="stylesheet" type="text/css" href="${ctxPath }/resources/css/btn_style.css">

 <style type="text/css">
 	.button a:hover { color: #e8f0de; } 
 	a:hover {text-decoration: none;}
 </style>
</head>
<body>
   
    <!--/sidebar-->
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe000;</i><span>${columnName }</span></div>
        </div>
        
      	<div class="result-wrap">
      		<div class="result-title">
                <h1>加班审批</h1>
            </div>
            <form method="get">
                <div class="result-content">
                	<div class="list-title">加班审批列表：</div>
                	<div class="result-bar">
                		筛选：
                		<input type="radio" class="common-radio" name="filter" value="all"  <c:if test="${filter == 'all' }">checked="checked"</c:if>>全部&nbsp;
	                	<input type="radio" class="common-radio" name="filter" value="null"  <c:if test="${filter == 'null' }">checked="checked"</c:if>>未审批&nbsp;
	                	<input type="radio" class="common-radio" name="filter" value="yes"  <c:if test="${filter == 'yes' }">checked="checked"</c:if>><span class="approve">✔已批准</span>&nbsp;
	                	<input type="radio" class="common-radio" name="filter" value="no"  <c:if test="${filter == 'no' }">checked="checked"</c:if>><span class="against">✘不批准</span>
                	</div>  
                    <table class="result-tab grid-data" width="100%">
                         <tr>
                         	<th width="150px">申请人</th>
                            <th width="180px">起始时间</th>
                            <th width="180px">结束时间</th>
                            <th width="200px">总时间</th>
                            <th style="text-align:left;">加班理由</th>
                            <th width="180px">提交时间</th>
                            <th width="100px">状态</th>
                            <th width="250px">操作</th>
                        </tr>

                   		<c:forEach items="${jbList }" var="jb">
                   			<tr>	
                   				<td>${jb.empName }</td>
                   				<td><c:out value="${fn:substring(jb.startTime, 0, 19) }"/></td>
                   				<td><c:out value="${fn:substring(jb.endTime, 0, 19) }"/></td>
                   				<td>${jb.dayNum }天${jb.hourNum }小时</td>
                   				<td style="text-align:left;">${jb.jbReason }</td>
                   				<td><c:out value="${fn:substring(jb.submitTime, 0, 19) }"/></td>
                   				<td>
                   					<c:set var="APPROVE" value="<%=AuditStatus.APPROVE %>"/>
                   					<c:choose>
                   						<c:when test="${jb.auditStatus == null }">未审批</c:when>
                   						<c:when test="${jb.auditStatus == APPROVE }"><span class="approve">✔批准</span></c:when>
                   						<c:otherwise><span class="against">✘不批准</span></c:otherwise>
                   					</c:choose>
                   				</td>
                   				<td>
                   					<c:if  test="${jb.auditStatus == null }">
                   						<a href="#" class="button green" onclick="approve(${jb.id})">✔批准</a>  <a href="#" class="button red" onclick="against(${jb.id})">✘不批准</a> 
                   					</c:if>
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

function approve(id) {
	 layer.confirm('确定批准加班申请吗？', {title: '提示', btn:['确定', '取消']}, function(){
         var url = '${ctxPath }/jiabanApproval_approve/'+ id;
         $.get(url, function(result) {
        	 if(result) {
        		 layer.msg('操作成功！', {time:2000});
                 window.location.reload();
        	 }
         });
     });
}
function against(id) {
	 layer.confirm('确定不批准加班申请吗？', {title: '提示', btn:['确定', '取消']}, function(){
        var url = '${ctxPath }/jiabanApproval_against/'+ id;
        $.get(url, function(result) {
       	 if(result) {
       		 layer.msg('操作成功！', {time:2000});
                window.location.reload();
       	 }
        });
    });
}
</script>    
    
<script type="text/javascript" src="${ctxPath }/resources/pagination/pagination.js"></script>    
    
</body>
</html>