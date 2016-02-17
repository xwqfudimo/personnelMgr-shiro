<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   

 <div class="sidebar-wrap">
       <div class="sidebar-title">
           	欢迎你，${empName }
       </div>
       <div class="sidebar-content">
           <ul class="sidebar-list">
              	<c:forEach items="${menus }" var="m">
                <li>
                    <a class="menu">${m.name } <span class="menu-jt">▲</span></a>
                    
                    <c:if test="${m.children != null }">
	                    <ul class="sub-menu">
	                    	<c:forEach items="${m.children }" var="c">
	                        	<li><a href="<%=request.getContextPath()%>${c.href}">${c.name }</a></li>
	                        </c:forEach>
	                    </ul>
                    </c:if>
                </li>
              	</c:forEach>
           </ul>
       </div>
  </div>    
  
  
<script type="text/javascript">
$(document).ready(function(){
	$("a.menu").click(function(){
		var ul = $(this).next("ul.sub-menu");
		var jt = $(this).children(".menu-jt");
		
		if(ul.css("display") == "none") {
			ul.css("display", "block");
			
			jt.empty();
			jt.html("▲");
		}
		else {
			ul.css("display", "none");
			
			jt.empty();
			jt.html("▼");
		}
		
	});
});
</script>