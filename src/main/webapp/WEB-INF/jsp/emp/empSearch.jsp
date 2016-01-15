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
    <script type="text/javascript" src="${ctxPath }/resources/zTree/js/jquery.ztree.core-3.5.js"></script>
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
                <h1>员工查询</h1>
            </div>
            <div class="search-wrap">
	            <div class="search-content">
	                <form method="post">
	                    <table class="search-tab">
	                        <tr>
	                            <th width="70">员工姓名:</th>
	                            <td><input class="common-text" placeholder="员工姓名" name="empName" type="text" id="empName"></td>
	                            <td><input class="btn btn-primary btn2" name="sub" value="查询" type="submit" id="empSearch"></td>
	                            <td style="display:none;" id="emp-search-tip"></td>
	                        </tr>
	                    </table>
	                </form>
	            </div>
	        </div>
            <br>
            <div class="result-content">
            		<div class="emp-list">员工列表：</div>
            		<div class="emp-tree">
	            		<span id="data" style="display:none">${data}</span>
	               	 	<ul id="deptEmps" class="ztree"></ul>
               	 	</div>
            </div>
        </div>
        
        <div class="result-wrap" id="resultList" style="display:none;">
            <div class="result-title">
               	查询结果—员工列表：
            </div>
            <div class="result-content">
                <ul class="result-emp-list" id="result-emp-list">
                
                </ul>
            </div>
        </div>
        
        <div class="result-wrap" id="searchResult" style="display:none;">
            <div class="result-title">
               	查询结果—员工资料：
            </div>
            <div class="result-content">
                <ul class="sys-info-list" id="empInfo">
                   
                </ul>
            </div>
        </div>
 
    </div>
    <!--/main-->
</div>

<script type="text/javascript">
var setting = {
		data: {
			simpleData: {
				enable: true
			}
		}
};

	
$(document).ready(function(){
	var data = $("#data").html();
	var zNodes = eval('(' + data + ')');
	
	$.fn.zTree.init($("#deptEmps"), setting, zNodes);
	
	
	//员工查询-结果列表
	$("#empSearch").click(function(e){
		e.preventDefault();
		
		var empName = $.trim($("#empName").val());
		
		if(empName == '') {
			$("#emp-search-tip").empty();
			$("#emp-search-tip").html("员工姓名不能为空！");
			$("#emp-search-tip").css('display', 'inline');
			return;
		} 
		
		$.post(window.location.href, {'empName' : empName}, function(empList) {
			var searchResult = '';
			if(empList == "[]") {
				searchResult = "<li>没有此员工！</li>";
			}
			else {
				for(var i=0; i<empList.length; i++) {
					searchResult += "<li><a href='#' empId='" + empList[i].id + "' class='emp'>" + empList[i].name + "</a></li>";
				}
			}
			
			$("#result-emp-list").empty();
			$("#result-emp-list").html(searchResult);
			
			$("#resultList").css("display", "block");
		}, "json");
	});
	
	
	//员工查询-具体员工资料
	$(".emp").live("click", function(){
		var empId = $(this).attr('empId');
		
		$.get("${ctxPath }/emp/" + empId, function(emp){
			var empInfo = "";
			empInfo += "<li><label class='res-lab'>姓名</label><span class='res-info'>" + emp.name + "</span></li>";
			empInfo += "<li><label class='res-lab'>性别</label><span class='res-info'>" + emp.sex + "</span></li>";
			empInfo += "<li><label class='res-lab'>部门</label><span class='res-info'>" + emp.department.name + "</span></li>";
			empInfo += "<li><label class='res-lab'>电话</label><span class='res-info'>" + emp.phone + "</span></li>";
			empInfo += "<li><label class='res-lab'>邮箱</label><span class='res-info'>" + emp.email + "</span></li>";
			empInfo += "<li><label class='res-lab'>自我介绍</label><span class='res-info'>" + emp.selfIntro + "</span></li>";
			
			$("#empInfo").empty();
			$("#empInfo").html(empInfo);
			$("#searchResult").css('display', 'block');
			
		}, "json");
	});
});
</script>

</body>
</html>


