<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${ctxPath }/resources/js/jquery-1.11.3.min.js"></script> 
<style type="text/css">
#msg{font-size: 14px;width: 300px;}
</style>
</head>
<body>
<div id="msg">
${msg }
</div>

<script type="text/javascript">
$(document).ready(function(){
	$("#see").click(function(){
		window.parent.location.reload();
	});
});
</script>

</body>
</html>