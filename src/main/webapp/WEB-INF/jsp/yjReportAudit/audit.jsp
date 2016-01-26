<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>审核业绩报告</title>
 <script type="text/javascript" src="${ctxPath }/resources/js/layer/layer.js"></script>
 <link rel="stylesheet" type="text/css" href="${ctxPath }/resources/css/btn_style.css">
 <style type="text/css">
 	a:hover {text-decoration: none; color: #e8f0de;}
 </style>
</head>
<body>
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe000;</i><span>${columnName }</span></div>
        </div>
        
        <div class="result-wrap">
            <div class="result-title">
                <h1>审核业绩报告</h1>
            </div>
            <div class="result-content">
                <ul class="sys-info-list">
                	<li>
                        <label class="res-lab">标题</label><span class="res-info">${report.title }</span>
                    </li>
                    <li>
                        <label class="res-lab">本月完成情况</label><span class="res-info">${report.finishSituation }</span>
                    </li>
                    <li>
                        <label class="res-lab">月工作总结</label><span class="res-info">${report.jobSummary }</span>
                    </li>
                    <li>
                        <label class="res-lab">审批状态</label>
                        <span class="res-info">
                        	<c:choose>
	                        	<c:when test="${report.audited == false }">
	              					<a href="#" class="button green" onclick="approve(${report.id})">✔审核通过</a>
	              				</c:when>
	              				<c:otherwise>
	              					<span class="approve">✔已审核</span>
	              				</c:otherwise>
              				</c:choose>	
                        </span>
                    </li>
                </ul>
            </div>
        </div>
 
    </div>
<script>
function approve(id) {
	 layer.confirm('确定业绩报告审核通过吗？', {title: '提示', btn:['确定', '取消']}, function(){
        var url = '${ctxPath }/yjReport_audited/'+ id;
        $.get(url, function(result) {
       	 if(result) {
       		 layer.msg('操作成功！', {time:2000});
                window.location.reload();
       	 }
        });
    });
}
</script>    
    
</body>
</html>