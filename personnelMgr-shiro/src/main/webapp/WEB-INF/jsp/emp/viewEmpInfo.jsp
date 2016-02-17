<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${columnName }</title>
</head>
<body>

    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe000;</i><span>${columnName }</span></div>
        </div>
        
        <div class="result-wrap">
            <div class="result-title">
                <h1>员工详细资料</h1>
            </div>
            <div class="result-content">
                <ul class="sys-info-list">
                    <li>
                        <label class="res-lab">姓名</label><span class="res-info">${emp.name }</span>
                    </li>
                    <li>
                        <label class="res-lab">登录账户</label><span class="res-info">${loginUser }</span>
                    </li>
                    <li>
                        <label class="res-lab">部门</label><span class="res-info">${deptName }</span>
                    </li>
                    <li>
                        <label class="res-lab">学历</label><span class="res-info">${emp.xl }</span>
                    </li>
                    <li>
                        <label class="res-lab">性别</label><span class="res-info">${emp.sex }</span>
                    </li>
                    <li>
                        <label class="res-lab">出生日期</label><span class="res-info">${emp.birthdate }</span>
                    </li>
                    <li>
                        <label class="res-lab">民族</label><span class="res-info">${emp.nationality }</span>
                    </li>
                    <li>
                        <label class="res-lab">政治面貌</label><span class="res-info">${emp.zzmm }</span>
                    </li>
                    <li>
                        <label class="res-lab">婚姻情况</label><span class="res-info">${emp.marriage }</span>
                    </li>
                    <li>
                        <label class="res-lab">现在住址</label><span class="res-info">${emp.address }</span>
                    </li>
                    <li>
                        <label class="res-lab">入职时间</label><span class="res-info">${emp.rzsj }</span>
                    </li>
                    <li>
                        <label class="res-lab">联系电话</label><span class="res-info">${emp.phone }</span>
                    </li>
                    <li>
                        <label class="res-lab">电子邮箱</label><span class="res-info">${emp.email }</span>
                    </li>
                    <li>
                        <label class="res-lab">身份证号码</label><span class="res-info">${emp.card }</span>
                    </li>
                    <li>
                        <label class="res-lab">自我介绍</label><span class="res-info">${emp.selfIntro }</span>
                    </li>
                </ul>
            </div>
        </div>
 
    </div>
</body>
</html>