<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.xwq.enums.AuditStatus"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<c:set var="APPROVE" value="<%=AuditStatus.APPROVE %>"/> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的月工资详情</title>

</head>
<body>

    <!--/sidebar-->
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe000;</i><span>${columnName }</span></div>
        </div>
        
        <div class="result-wrap">
            <div class="result-title">
                <h1>工资详情</h1>
            </div>
            <div class="result-content">
                <ul class="sys-info-list">
                    <li>
                        <label class="res-lab">日期</label><span class="res-info">${salary.date }</span>
                    </li>
                    <li>
                        <label class="res-lab">基本工资</label><span class="res-info">${salary.basicSalary }</span>
                    </li>
                    <li>
                        <label class="res-lab">补贴</label><span class="res-info">${salary.butie }</span>
                    </li>
                    <li>
                        <label class="res-lab">奖金</label><span class="res-info">${salary.bonus }</span>
                    </li>
                    <li>
                        <label class="res-lab">加班工资</label><span class="res-info">+${salary.jiabanPlus }</span>
                    </li>
                    <li>
                        <label class="res-lab">考勤扣减</label><span class="res-info">-${salary.kaoqingMinus }</span>
                    </li>
                    <li>
                        <label class="res-lab">公积金</label><span class="res-info">${salary.gongjijin }</span>
                    </li>
                    <li>
                        <label class="res-lab">社保</label><span class="res-info">${salary.shebao }</span>
                    </li>
                    <li>
                        <label class="res-lab">应得工资</label><span class="res-info">${salary.yingdeMoney }</span>
                    </li>
                    <li>
                        <label class="res-lab">实发工资</label><span class="res-info">${salary.shifaMoney }</span>
                    </li>
                    
                </ul>
            </div>
        </div>
 
    </div>
    <!--/main-->
</body>
</html>