<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.xwq.enums.AuditStatus"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> 
<c:set var="APPROVE" value="<%=AuditStatus.APPROVE %>"/> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${columnName }</title>
<script type="text/javascript" src="${ctxPath }/resources/laydate/laydate.js"></script>
</head>
<body>

    <!--/sidebar-->
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe000;</i><span>${columnName }</span></div>
        </div>
        
        <div class="result-wrap">
            <div class="result-title">
                <h1>新增薪资</h1>
            </div>
            <form method="post">
            <div class="result-content">
                <ul class="sys-info-list">
                	<li>
                        <label class="res-lab">员工</label>
                        <span class="res-info">
							<select name="empId">
								<option value="-1">请选择..</option>
								<c:forEach items="${emps }" var="emp">
									<option value="${emp.id }">${emp.name }</option>
								</c:forEach>
							</select>
						</span>
                    </li>
                    <li>
                        <label class="res-lab">日期</label>
                        <span class="res-info">
                        	<input type="text" class="common-text2 laydate-icon" name="date" id="date" size="11" onclick="laydate({format: 'YYYY-MM-DD'})">
                        </span>
                    </li>
                    <li>
                        <label class="res-lab">基本工资</label><span class="res-info"><input type="text" class="common-text2" name="basic_salary" size="8"></span>
                    </li>
                    <li>
                        <label class="res-lab">补贴</label><span class="res-info"><input type="text" class="common-text2" name="butie" size="8"></span>
                    </li>
                    <li>
                        <label class="res-lab">奖金</label><span class="res-info"><input type="text" class="common-text2" name="bonus" size="8"></span>
                    </li>
                    <li>
                        <label class="res-lab">加班工资</label><span class="res-info">+<input type="text" class="common-text2" name="jiaban_plus" size="8"></span>
                    </li>
                    <li>
                        <label class="res-lab">考勤扣减</label><span class="res-info">-<input type="text" class="common-text2" name="kaoqin_minus" size="8"></span>
                    </li>
                    <li>
                        <label class="res-lab">公积金</label><span class="res-info"><input type="text" class="common-text2" name="gongjijin" size="8"></span>
                    </li>
                    <li>
                        <label class="res-lab">社保</label><span class="res-info"><input type="text" class="common-text2" name="shebao" size="8"></span>
                    </li>
                    <li>
                        <label class="res-lab">应得工资</label><span class="res-info"><input type="text" class="common-text2" name="yingde_money" size="8"></span>
                    </li>
                    <li>
                        <label class="res-lab">实发工资</label><span class="res-info"><input type="text" class="common-text2" name="shifa_money" size="8"></span>
                    </li>
                </ul>
                <br><br>
                <input class="btn btn-primary btn6 mr10" value="提交" type="submit">
                <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
            </div>
            </form>
        </div>
 
    </div>
    <!--/main-->
</body>
</html>