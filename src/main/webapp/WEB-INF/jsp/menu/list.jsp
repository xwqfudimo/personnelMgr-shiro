<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${columnName }</title>
	<link rel="stylesheet" type="text/css" href="${ctxPath }/resources/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="${ctxPath }/resources/css/main.css"/>
    <script type="text/javascript" src="${ctxPath }/resources/js/modernizr.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${ctxPath }/resources/zTree/css/zTreeStyle/zTreeStyle.css"/>
    <script type="text/javascript" src="${ctxPath }/resources/zTree/js/jquery-1.4.4.min.js"></script>
    
    <script>var $144 = $;</script>
    
    <script type="text/javascript" src="${ctxPath }/resources/zTree/js/jquery.ztree.core-3.5.js"></script>
    <script type="text/javascript" src="${ctxPath }/resources/zTree/js/jquery.ztree.excheck-3.5.js"></script>
	<script type="text/javascript" src="${ctxPath }/resources/zTree/js/jquery.ztree.exedit-3.5.js"></script>
	
	<script type="text/javascript" src="${ctxPath }/resources/js/jquery-1.11.3.min.js"></script> 
	<script type="text/javascript" src="${ctxPath }/resources/js/layer/layer.js"></script>
</head>
<body>

<jsp:include page="../header.jsp"></jsp:include>

<div class="container clearfix">
	
	<jsp:include page="../left_nav.jsp"></jsp:include>

    <!--/sidebar-->
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe000;</i><span>${columnName }</span></div>
        </div>
        
        <div class="result-wrap">
            <div class="result-title">
                <h1>系统菜单</h1>
            </div>
            <div class="tip"><p>提示：菜单项括号(num)中的数字为该菜单项的排序号</p></div>
            
         	<div id="menuTree" style="display:none;">${menuTree }</div><br>
         	<div>
         		<a href="#" style="font-size:14px;" onclick="javascript:add_top_menu()">
         			<span class="pxtop" style="margin-top:4px;"><img src="${ctxPath }/resources/images/add.jpg" width="14px"></span><span class="pxtop">一级菜单</span>
         		</a>
         	</div>
         	
            <ul id="menu" class="ztree"></ul>
        </div>
        
    </div>
    <!--/main-->
</div>

<script type="text/javascript">
var setting = {
		view: {
			addHoverDom: addHoverDom,
			removeHoverDom: removeHoverDom,
			selectedMulti: false
		},
		edit: {
			enable: true,
			renameTitle: '编辑',
			removeTitle: '删除'
		},
		data: {
			simpleData: {
				enable: true
			}
		},
		callback: {
			beforeDrag: beforeDrag,
			beforeEditName: beforeEditName,
			beforeRemove: beforeRemove
		}
};

var menuTree = $("#menuTree").html();
var zNodes = eval('(' + menuTree + ')');
	
function beforeDrag(treeId, treeNodes) {
	return false;
}

//更新菜单
function beforeEditName(treeId, treeNode) {
	layer.open({
	    type: 2,
	    area: ['350px', '250px'],
	    skin: 'layui-layer-rim', //加上边框
	    content: ['${ctxPath}/menu_edit/' + treeNode.id, 'no']
	});
	return false;
}

//删除菜单
function beforeRemove(treeId, treeNode) {
	 layer.confirm('确定删除菜单："'+ treeNode.name +'"吗？', {title: '提示', btn:['确定', '取消']}, function(){
         var url = '${ctxPath }/menu_del/'+ treeNode.id;
         $.get(url);
         layer.msg('删除成功！', {time:1000});
         window.location.reload();
     }, function() {
    	 window.location.reload();
     });
}

var newCount = 1;
function addHoverDom(treeId, treeNode) {
	if(treeNode.getParentNode() == null) {
		var sObj = $144("#" + treeNode.tId + "_span");
		if (treeNode.editNameFlag || $144("#addBtn_"+treeNode.tId).length>0) return;
		var addStr = "<span class='button add' id='addBtn_" + treeNode.tId
			+ "' title='新增子菜单' onfocus='this.blur();'></span>";
		sObj.after(addStr);
		var btn = $144("#addBtn_"+treeNode.tId);
		if (btn) btn.bind("click", function(){
			layer.open({
			    type: 2,
			    area: ['350px', '250px'],
			    skin: 'layui-layer-rim', //加上边框
			    content: ['${ctxPath}/menu_add/' + treeNode.id, 'no']   //treeNode.id <=> 父id
			});
			return false;
		});
	} else {
		return false;
	}
};
function removeHoverDom(treeId, treeNode) {
	$144("#addBtn_"+treeNode.tId).unbind().remove();
};

$(document).ready(function(){
	$144.fn.zTree.init($("#menu"), setting, zNodes);
});


//新增一级菜单
function add_top_menu() {
	layer.open({
	    type: 2,
	    area: ['350px', '250px'],
	    skin: 'layui-layer-rim', //加上边框
	    content: ['${ctxPath}/menu_add_top', 'no']   //treeNode.id <=> 父id
	});
}

</script>

</body>
</html>


