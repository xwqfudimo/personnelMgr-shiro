<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${columnName }</title>
    <script type="text/javascript" src="${ctxPath }/resources/js/layer/layer.js"></script>
</head>
<body>
    <!--/sidebar-->
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe000;</i><span>${columnName }</span></div>
        </div>
        
        <div class="result-wrap">
            <div class="result-title">
                <h1>修改登录密码</h1>
            </div>
            <div class="result-content">
                <form method="post">
                	 <table class="insert-tab" width="100%">
                			<tr><td width="120">原有密码：</td><td><input class="common-text" name="oldPwd" id="oldPwd" size="30" type="password"></td></tr>
                			<tr><td>新的密码：</td><td><input class="common-text" name="newPwd" id="newPwd" size="30" type="password"></td></tr>
                			<tr><td>再次输入：</td><td><input class="common-text" name="newPwd2" id="newPwd2" size="30" type="password"></td></tr>
					</table>                	
               		<br>
                	<input class="btn btn-primary btn6 mr10" value="提交" type="button" id="submit">
                </form>
            </div>
        </div>
 
    </div>
    
<script type="text/javascript">
$(document).ready(function() {
	$("#submit").click(function(){
		var oldPwd = $("#oldPwd").val();
		var newPwd = $("#newPwd").val();
		var newPwd2 = $("#newPwd2").val();
		
		$.post("${ctxPath }/modifyPwdSubmit", 
				{'oldPwd':oldPwd, 'newPwd':newPwd, 'newPwd2':newPwd2}, function(data){
					if(data == 1) {
						layer.msg('修改成功！', {time: 2000});
						$("#oldPwd").val('');
						$("#newPwd").val('');
						$("#newPwd2").val('');
					} else {
						layer.alert('修改失败！');
					}
				}, 'json');
	});
});
</script>
</body>
</html>


