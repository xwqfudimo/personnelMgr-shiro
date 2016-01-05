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
</head>
<body>
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe000;</i><span>${columnName }</span></div>
        </div>
        
      	<div class="result-wrap">
      		<div class="result-title">
                <h1>请假申请</h1>
            </div>
            <form method="get">
                <div class="result-title">
                    <div class="result-list">
                        <a href="<%=request.getContextPath()%>/qingjiaApply_add"><i class="icon-font"></i>申请请假</a>
                    </div>
                </div>
                <div class="result-content">
                	<div class="list-title">我的请假申请列表：</div>
                	<div class="result-bar">
                		筛选：
	                	<input type="radio" class="common-radio" name="filter"  value="all-apply"  <c:if test="${filter == 'all-apply' }">checked="checked"</c:if>>全部&nbsp;
	                	<input type="radio" class="common-radio" name="filter" value="null-apply"  <c:if test="${filter == 'null-apply' }">checked="checked"</c:if>>未审批&nbsp;
	                	<input type="radio" class="common-radio" name="filter" value="yes-apply"  <c:if test="${filter == 'yes-apply' }">checked="checked"</c:if>><span class="approve">✔已批准</span>&nbsp;
	                	<input type="radio" class="common-radio" name="filter" value="no-apply"  <c:if test="${filter == 'no-apply' }">checked="checked"</c:if>><span class="against">✘未批准</span>
                	</div>  
                    <table class="result-tab grid-data" width="100%">
                        <tr>
                            <th width="50px">ID</th>
                            <th width="180px">起始时间</th>
                            <th width="180px">结束时间</th>
                            <th width="200px">总时间</th>
                            <th width="100px">请假类型</th>
                            <th style="text-align:left;">请假理由</th>
                            <th width="180px">提交时间</th>
                            <th width="150px">审批状态</th>
                            <th width="200px">操作</th>
                        </tr>

                   		<c:forEach items="${qingjiaList }" var="qj">
                   			<tr>
                   				<td>${qj.id }</td>
                   				<td><c:out value="${fn:substring(qj.startTime, 0, 19) }"/></td>
                   				<td><c:out value="${fn:substring(qj.endTime, 0, 19) }"/></td>
                   				<td>${qj.dayNum }天${qj.hourNum }小时</td>
                   				<td>${qj.qjType }</td>
                   				<td style="text-align:left;">${qj.qjReason }</td>
                   				<td><c:out value="${fn:substring(qj.submitTime, 0, 19) }"/></td>
                   				<td>
                   					<c:set var="APPROVE" value="<%=AuditStatus.APPROVE %>"/>
                   					<c:choose>
                   						<c:when test="${qj.auditStatus == null }">未审批</c:when>
                   						<c:when test="${qj.auditStatus == APPROVE }"><span class="approve">✔批准</span></c:when>
                   						<c:otherwise><span class="against">✘不批准</span></c:otherwise>
                   					</c:choose>
                   				</td>
                   				
                   				<td>
                   					<a class="link-update" target="_blank" href="<%=request.getContextPath() %>/qingjiaApply/${qj.id}">查看</a>
                   					
                   					<c:if test="${qj.auditStatus == null }">
                   					 	<a class="link-update" href="<%=request.getContextPath() %>/qingjiaApply_edit/${qj.id}">修改</a>
                                    	<a class="link-del" href="javascript:void(0)" onclick="del(${qj.id})">删除</a>
                   					</c:if>
                                </td>
                   			</tr>
                   		</c:forEach>

                    </table>
                    <div class="list-page"> 2 条 1/1 页</div>
                </div>
            </form>
        </div>
 
    </div>

<script type="text/javascript">
$(document).ready(function(){
	$(":radio").change(function(){
		$("form").submit();
	});
});

function del(id) {
	 layer.confirm('确定删除数据吗？', {title: '提示', btn:['确定', '取消']}, function(){
        var url = '${pageContext.request.contextPath}/qingjiaApply_del/'+ id;
        $.get(url);
        layer.msg('删除成功！', {time:2000});
        window.location.reload();
    });
}
</script>    
    
</body>
</html>