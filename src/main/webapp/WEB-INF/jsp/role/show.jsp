<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${columnName }</title>
  <script type="text/javascript" src="${ctxPath }/resources/laydate/laydate.js"></script>

   <link rel="stylesheet" type="text/css" href="${ctxPath }/resources/zTree/css/zTreeStyle/zTreeStyle.css"/>
    <script type="text/javascript" src="${ctxPath }/resources/zTree/js/jquery-1.4.4.min.js"></script>
    
    <script>var $144 = $;</script>
    
    <script type="text/javascript" src="${ctxPath }/resources/zTree/js/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" src="${ctxPath }/resources/zTree/js/jquery.ztree.excheck-3.5.js"></script>
	<script type="text/javascript" src="${ctxPath }/resources/zTree/js/jquery.ztree.exedit-3.5.js"></script>

  <link rel="stylesheet" href="${ctxPath }/resources/jquery-ui/jquery-ui.min.css">
  <script type="text/javascript" src="${ctxPath }/resources/jquery-ui/jquery-ui.min.js"></script>
  <style>
  	.accordion a { font-size: 13px; color:#428bca;}
  	ul.auths li {display: inline-block; margin-right: 20px; line-height: 25px;}
  </style>
</head>
<body>
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe000;</i><span>${columnName }</span></div>
        </div>
        
      	<div class="result-wrap">
      		<div class="result-title">
                <h1>角色详细信息</h1>
            </div>
                	角色标识名称：${role.name }
                	<br><br>
                	角色描述：${role.desc }
                	<br><br>
                	菜单：
                	<div id="menuTree" style="display:none;">${roleMenuTree }</div><br>
                	<ul id="menu" class="ztree"></ul>
                	<br><br>
                	权限：
                	<div style="height:auto;">
                	<ul class="auths">
                		
                		<c:forEach items="${rolePrivilegeMap }" var="map">
	                		<li>
			                	<div class="accordion">
			                		<h3 style="width:126px">${map.key }</h3>
			                		<div style="width:100px">
			                			<p>
			                				<ul>
			                					<c:forEach items="${map.value }" var="p">
			                						<li>${p.name }</li><br>
			                					</c:forEach>
			                				</ul>
			                			</p>
			                		</div>
			                	</div>
			                </li>
			            </c:forEach>  
			              
                	</ul>
                	</div>
                	<br><br>
                    <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
        </div>
 
    </div>

<script>
  $(function() {
    $( ".accordion" ).accordion({collapsible: true});
  });
  
  

var setting = {
	view: {
		selectedMulti: false
	},
	check: {
		enable: false
	},
	data: {
		simpleData: {
			enable: true
		}
	}
};

var menuTree = $144("#menuTree").html();
var zNodes = eval('(' + menuTree + ')');

$144(document).ready(function(){
	$144.fn.zTree.init($144("#menu"), setting, zNodes);
});
</script>    
    
    
</body>
</html>