<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.xwq.enums.AuditStatus"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${columnName }</title>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/layer/layer.js"></script>
    
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
                <h1>加班申请</h1>
            </div>
            <form method="get">
                <div class="result-title">
                    <div class="result-list">
                        <a href="${ctxPath }/jiabanApply_add"><i class="icon-font"></i>申请加班</a>
                    </div>
                </div>
                <div class="result-content">
                	<div class="list-title">我的加班申请列表：</div>
                	<div class="result-bar">
                		筛选：
	                	<input type="radio" class="common-radio" name="filter"  value="all-apply"  <c:if test="${filter == 'all-apply' }">checked="checked"</c:if>>全部&nbsp;
	                	<input type="radio" class="common-radio" name="filter" value="null-apply"  <c:if test="${filter == 'null-apply' }">checked="checked"</c:if>>未审批&nbsp;
	                	<input type="radio" class="common-radio" name="filter" value="yes-apply"  <c:if test="${filter == 'yes-apply' }">checked="checked"</c:if>><span class="approve">✔已批准</span>&nbsp;
	                	<input type="radio" class="common-radio" name="filter" value="no-apply"  <c:if test="${filter == 'no-apply' }">checked="checked"</c:if>><span class="against">✘不批准</span>
                	</div>  
                    <table class="result-tab grid-data" width="100%">
                        <tr>
                            <th width="180px">起始时间</th>
                            <th width="180px">结束时间</th>
                            <th width="200px">总时间</th>
                            <th style="text-align:left;">加班理由</th>
                            <th width="180px">提交时间</th>
                            <th width="150px">审批状态</th>
                            <th width="200px">操作</th>
                        </tr>

                   		<c:forEach items="${jiabanList }" var="jb">
                   			<tr>
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
                   					<a class="link-update" target="_blank" href="${ctxPath }/jiabanApply/${jb.id}">查看</a>
                   					
                   					<c:if test="${jb.auditStatus == null }">
                   					 	<a class="link-update" href="${ctxPath }/jiabanApply_edit/${jb.id}">修改</a>
                                    	<a class="link-del" href="javascript:void(0)" onclick="del(${jb.id})">删除</a>
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
    <!--/main-->
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
         var url = '${ctxPath }/jiabanApply_del/'+ id;
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