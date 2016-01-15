<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${columnName }</title>
    <script type="text/javascript" src="${ctxPath }/resources/js/layer/layer.js"></script>
</head>
<body>
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe000;</i><span>${columnName }</span></div>
        </div>
        
      	<div class="result-wrap">
      		<div class="result-title">
                <h1>我的业绩报告</h1>
            </div>
            <form method="get">
                <div class="result-title">
                    <div class="result-list">
                        <a href="${ctxPath }/yjReport_add"><i class="icon-font"></i>新增业绩报告</a>
                    </div>
                </div>
                <div class="result-content">
                	<div class="list-title">我的月业绩报告列表：</div>
                	<div class="result-bar">
                		筛选：
	                	<input type="radio" class="common-radio" name="audited"  value="all"  <c:if test="${audited == 'all' }">checked="checked"</c:if>>全部&nbsp;
	                	<input type="radio" class="common-radio" name="audited" value="yes"  <c:if test="${audited == 'yes' }">checked="checked"</c:if>><span class="approve">✔已审核</span>&nbsp;
	                	<input type="radio" class="common-radio" name="audited" value="no"  <c:if test="${audited == 'no' }">checked="checked"</c:if>>未审核
                	</div>  
                    <table class="result-tab grid-data" width="100%">
                        <tr>
                            <th style="text-align:left;">标题</th>
                            <th width="200px">提交日期</th>
                            <th width="200px">是否审核</th>
                            <th width="200px">操作</th>
                        </tr>

                   		<c:forEach items="${yjList }" var="yj">
                   			<tr>
                   				<td style="text-align:left;"><a target="_blank" href="<%=request.getContextPath() %>/yjReport/${yj.id}" class="title_a">${yj.title }</a></td>
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
                   					<a class="link-update" target="_blank" href="<%=request.getContextPath() %>/yjReport/${yj.id}">查看</a>
                   					
                   					<c:if test="${yj.audited == false }">
                   					 	<a class="link-update" href="<%=request.getContextPath() %>/yjReport_edit/${yj.id}">修改</a>
                                    	<a class="link-del" href="javascript:void(0)" onclick="del(${yj.id})">删除</a>
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
       var url = '${ctxPath }/yjReport_del/'+ id;
       $.get(url);
       layer.msg('删除成功！', {time:2000});
       window.location.reload();
   });
}
</script>    
    
</body>
</html>