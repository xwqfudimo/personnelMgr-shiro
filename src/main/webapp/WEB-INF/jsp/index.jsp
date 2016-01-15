<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理首页</title>

</head>
<body>
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe06b;</i><span>欢迎使用人事管理系统</span></div>
        </div>
        
        <div class="result-wrap">
            <div class="result-title">
                <h1>系统基本信息</h1>
            </div>
            <div class="result-content">
                <ul class="sys-info-list">
                    <li>
                        <label class="res-lab">操作系统</label><span class="res-info">${osName }  ${osVersion }——${osArch }</span>
                    </li>
                    <li>
                        <label class="res-lab">运行环境</label><span class="res-info">${runtimeName } ${javaVersion }</span>
                    </li>
                    <li>
                        <label class="res-lab">北京时间</label><span class="res-info" id="nowTime"></span>
                    </li>
                </ul>
            </div>
        </div>
 
    </div>

<script type="text/javascript">
function getNowDateTime() {
    var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    var second = date.getSeconds();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    if (second >= 0 && second <= 9) {
    	second = "0" + second;
    }
    
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + date.getHours() + seperator2 + date.getMinutes()
            + seperator2 + second;
    return currentdate;
}

document.getElementById("nowTime").innerHTML = getNowDateTime();
</script>
    
    
</body>
</html>