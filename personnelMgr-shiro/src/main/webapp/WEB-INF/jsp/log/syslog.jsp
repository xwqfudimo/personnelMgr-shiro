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
                <h1>日志列表</h1>
            </div>
            <form method="get">
	            <div class="search-wrap">
		            <div class="search-content">
		                    <table class="search-tab">
		                        <tr>
		                            <th width="70">关键字:</th>
		                            <td><input class="common-text" placeholder="动作关键字" name="keyword" value="" type="text"></td>
		                            <td><input class="btn btn-primary btn2" name="sub" value="查询" type="submit"></td>
		                        </tr>
		                    </table>
		            </div>
		        </div>
            
                <div class="result-content">
                    <table class="result-tab grid-data" width="100%">
                        <tr>
                         	<th width="200px">时间</th>
                         	<th>动作</th>
                            <th width="100px">用户</th>
                            <th>请求url</th>
                            <th>请求参数</th>
                            <th width="100px">操作</th>
                        </tr>

                   		<c:forEach items="${logList }" var="log">
                   			<tr>
                   				<td><c:out value="${fn:substring(log.recordTime, 0, 19) }"/></td>
                   				<td>${log.logMsg }</td>
                   				<td>${log.uname }</td>
                   				<td  style="text-align: left;">${log.url }</td>
                   				<td style="text-align: left;">${log.param }</td>
                   				<td>
                  					<a class="link-update" target="_blank" href="${ctxPath }/log/${log.id}">详细</a>
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

</script>    

<script type="text/javascript" src="${ctxPath }/resources/pagination/pagination.js"></script>
    
</body>
</html>