<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>   
<head>
<title></title>
<link rel="stylesheet" type="text/css" href="${ctxPath }/resources/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${ctxPath }/resources/css/main.css"/>
<script type="text/javascript" src="${ctxPath }/resources/js/modernizr.min.js"></script>
<script type="text/javascript" src="${ctxPath }/resources/js/jquery-1.11.3.min.js"></script>     
<style type="text/css">
.main-content { margin-top: 10px; margin-left: 50px; }
</style>
</head>
<body>
<div class="main-content">
<form method="post">
       	菜单名：<input type="text" class="common-text" name="name" id="name" size="16">
       	<br><br>
       	链接：<input type="text" class="common-text" name="href" id="href" size="24">
       	<br><br>
       	排序：<input type="text" class="common-text" name="sort" id="sort" size="3">
       	<br><br>
      	<input class="btn btn-primary btn6 mr10" value="提交" type="submit" id="submit">
</form>
</div>

<script type="text/javascript">
$(document).ready(function() {
	$("#submit").click(function(e) {
		e.preventDefault();
			
		var name = $("#name").val();
		var href = $("#href").val();
		var sort = $("#sort").val();
		
		$.post("${ctxPath }/menu_add_top_submit", {'name':name, 'href':href, 'sort':sort}, function(data) {
			if(data == true) {
				window.parent.location.reload();
			}
		});
	});
});
</script>

</body>
</html>     