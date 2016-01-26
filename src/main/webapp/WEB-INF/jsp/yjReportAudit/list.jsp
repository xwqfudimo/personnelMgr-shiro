<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${columnName }</title>
    <script type="text/javascript" src="${ctxPath }/resources/js/layer/layer.js"></script>
    
    <link rel="stylesheet" type="text/css" href="${ctxPath }/resources/pagination/css/pagination.css">
 	<script type="text/javascript" src="${ctxPath }/resources/pagination/js/jquery.pagination.js"></script>
</head>
<body>
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe000;</i><span>${columnName }</span></div>
        </div>
        
      	<div class="result-wrap">
      		<div class="result-title">
                <h1>业绩报告审核</h1>
            </div>
            <form method="get">
                <div class="result-content">
                	<div class="list-title">业绩报告审核列表：</div>
                	<div class="result-bar">
                		筛选：
	                	<input type="radio" class="common-radio" name="filter"  value="all"  <c:if test="${filter == 'all' }">checked="checked"</c:if>>全部&nbsp;
	                	<input type="radio" class="common-radio" name="filter" value="yes"  <c:if test="${filter == 'yes' }">checked="checked"</c:if>><span class="approve">✔已审核</span>&nbsp;
	                	<input type="radio" class="common-radio" name="filter" value="no"  <c:if test="${filter == 'no' }">checked="checked"</c:if>>未审核
                	</div>  
                    <table class="result-tab grid-data" width="100%">
                        <tr>
                        	<th width="100px">提交人</th>
                            <th style="text-align:left;">标题</th>
                            <th width="200px">提交日期</th>
                            <th width="200px">是否审核</th>
                            <th width="200px">操作</th>
                        </tr>

                   		<c:forEach items="${yjList }" var="yj">
                   			<tr>
                   				<td>${yj.empName }</td>
                   				<td style="text-align:left;"><a target="_blank" href="${ctxPath}/yjReport_audit/${yj.id}" class="title_a">${yj.title }</a></td>
                   				<td>${yj.submitDate }</td>
                   				<td>
                   					<c:choose>
                   						<c:when test="${yj.audited == true }">
                   							<span class="approve">✔已审核</span>
                   						</c:when>
                   						<c:otherwise>
                   							未审核
                   						</c:otherwise>
                   					</c:choose>
                   				</td>
                   				<td>
                   					<c:if test="${yj.audited == false }">
                   						<a class="link-update" target="_blank" href="${ctxPath}/yjReport_audit/${yj.id}">审核</a>
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

</script>    
    
<script type="text/javascript" src="${ctxPath }/resources/pagination/pagination.js"></script>        
    
</body>
</html>