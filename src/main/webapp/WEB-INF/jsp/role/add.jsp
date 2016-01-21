<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${columnName }</title>
	<link rel="stylesheet" type="text/css" href="${ctxPath }/resources/zTree/css/zTreeStyle/zTreeStyle.css"/>
    <script type="text/javascript" src="${ctxPath }/resources/zTree/js/jquery-1.4.4.min.js"></script>
    
    <script>var $144 = $;</script>
    
    <script type="text/javascript" src="${ctxPath }/resources/zTree/js/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" src="${ctxPath }/resources/zTree/js/jquery.ztree.excheck-3.5.js"></script>
	<script type="text/javascript" src="${ctxPath }/resources/zTree/js/jquery.ztree.exedit-3.5.js"></script>

	<link rel="stylesheet" type="text/css" href="${ctxPath }/resources/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${ctxPath }/resources/css/main.css"/>
    <script type="text/javascript" src="${ctxPath }/resources/js/modernizr.min.js"></script>
    <script type="text/javascript" src="${ctxPath }/resources/js/jquery-1.11.3.min.js"></script> 
  	<link rel="stylesheet" href="${ctxPath }/resources/jquery-ui/jquery-ui.min.css">
  	<script type="text/javascript" src="${ctxPath }/resources/jquery-ui/jquery-ui.min.js"></script>
  	
  	<style>
  		.accordion a { font-size: 13px; color:#428bca;}
  		ul.auths li {display: inline-block; margin-right: 20px; line-height: 25px;}
 	</style>
</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>

<div class="container clearfix">
  
  	<jsp:include page="../left_nav.jsp"></jsp:include>
  	
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe000;</i><span>${columnName }</span></div>
        </div>
        
      	<div class="result-wrap">
      		<div class="result-title">
                <h1>新增角色</h1>
            </div>
            <form method="post">
                	角色标识名称：<input type="text" class="common-text2" name="name" size="16" id="name">
                	<br><br>
                	角色描述：<input type="text" class="common-text2" name="desc" size="16" id="desc">
                	<br><br>
                	菜单：
                	<div id="menuTree" style="display:none;">${menuTree }</div><br>
                	<ul id="menu" class="ztree"></ul>
                	<br><br>
                	权限：
                	<div style="height:auto;">
                	<ul class="auths">
                		
                		<c:forEach items="${pMap }" var="map">
	                		<li>
			                	<div class="accordion">
			                		<h3 style="width:126px">${map.key }</h3>
			                		<div style="width:100px">
			                			<p>
			                				<ul>
			                					<c:forEach items="${map.value }" var="p">
			                						<li><input type="checkbox" name="privilegeId" value="${p.id }" class="privilegeId"> ${p.name }</li><br>
			                					</c:forEach>
			                				</ul>
			                				<a href="javascript:;" class="selectAll">全选</a> / <a href="javascript:;" class="selectInverse">反选</a>
			                			</p>
			                		</div>
			                	</div>
			                </li>
			            </c:forEach>  
			              
                	</ul>
                	</div>
                	<br><br>
                	<input type="hidden" name="menuIds" id="menuIds">
               	    <input class="btn btn-primary btn6 mr10" value="提交" type="submit" id="submit">
                    <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
            </form>
        </div>
 
    </div>

<script>
  $(function() {
    $( ".accordion" ).accordion({collapsible: true});
    
    $(".selectAll").click(function(){
    	$(this).prev("ul").children("li").children(":checkbox").prop("checked", true);
    });
    
    $(".selectInverse").click(function(){
    	$.each($(this).prevAll("ul").children("li").children(":checkbox"), function(i, n){
    		if($(n).prop("checked") == true) {
    			$(n).removeAttr("checked");
    		} 
    		else {
    			$(n).prop("checked", true);
    		}
    	});
    });
  });
  
  

var setting = {
	view: {
		selectedMulti: false
	},
	check: {
		enable: true
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

$(document).ready(function() {
	
	$("#submit").click(function(e) {
		//菜单
		var menuIds = "";
		var zTree = $144.fn.zTree.getZTreeObj("menu");
		var nodes = zTree.getCheckedNodes(true);
		
		for(var i=0; i<nodes.length; i++) {
			var ns = nodes[i];
			menuIds += "," + ns.id;
			var childs = zTree.getNodesByParam("checked", true, ns);
			for(var j=0; j<childs.length; j++) {
				var c = childs[j];
				menuIds += "," + c.id;
			}
		}
		menuIds = menuIds.substr(1);
		$("#menuIds").val(menuIds);
		
		//其他数据
		var name = $("#name").val();
		var desc = $("#desc").val();
		var privilegeIds = new Array(); 
		$.each($(".privilegeId:checked"), function(i, n){
			privilegeIds.push($(n).val());
		});
		
		var data = {'name':name, 'desc':desc, 'menuIds':menuIds, 'privilegeIds':privilegeIds};
		$("form").submit(data);
	});
	
});	
	
</script>    
    
</div>    
</body>
</html>