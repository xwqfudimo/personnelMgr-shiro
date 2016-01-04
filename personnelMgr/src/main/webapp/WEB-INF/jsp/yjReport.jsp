<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${columnName }</title>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/resources/css/main.css"/>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/modernizr.min.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/jquery-1.11.3.min.js"></script>
</head>
<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="index.html" class="navbar-brand">后台管理</a></h1>
            <ul class="navbar-list clearfix">
            	<c:forEach items="${modules }" var="m">
            		<li><a href="<%=request.getContextPath()%>/module/${m.id}"  <c:if test="${m.id == module.id }">class="on"</c:if>  >${m.name}</a></li>
            	</c:forEach>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix">
                <li><a href="<%=request.getContextPath()%>/logout">退出</a></li>
            </ul>
        </div>
    </div>
</div>
<div class="container clearfix">
    <div class="sidebar-wrap">
        <div class="sidebar-title">
            	欢迎你，${empName }
        </div>
        <div class="sidebar-content">
            <ul class="sidebar-list">
               	
               	<li>
               		<a href="#"><i class="icon-font">&#xe003;</i>菜单</a>
               		<ul class="sub-menu">
		               	<c:forEach items="${columns }" var="column">
		               		 <li><a href="<%=request.getContextPath()%>/${column.href}">${column.name}</a></li>
		               	</c:forEach>
		            </ul>   	
	            </li>   	
                 
            </ul>
        </div>
    </div>
    <!--/sidebar-->
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
                        <a href="<%=request.getContextPath()%>/yjReport_add"><i class="icon-font"></i>新增业绩报告</a>
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
                   				<td style="text-align:left;"><a href="<%=request.getContextPath() %>/column/yjReport/${yj.id}" class="title_a">${yj.title }</a></td>
                   				<td>${yj.date }</td>
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
                   					<a class="link-update" href="<%=request.getContextPath() %>/column/yjReport/${yj.id}">查看</a>
                   					
                   					<c:if test="${yj.audited == false }">
                   					 	<a class="link-update" href="<%=request.getContextPath() %>/column/yjReport_edit/${yj.id}">修改</a>
                                    	<a class="link-del" href="javascript:void(0)" onclick="del_yjReport(${yj.id}})">删除</a>
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
    <!--/main-->
</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	$(":radio").change(function(){
		$("form").submit();
	});
});
</script>
</html>