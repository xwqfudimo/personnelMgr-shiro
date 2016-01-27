<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.xwq.enums.AuditStatus"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${columnName }</title>
	<link rel="stylesheet" href="${ctxPath }/resources/syntaxhighlighter/styles/shCore.css" type="text/css"/>
	<link rel="stylesheet" href="${ctxPath }/resources/syntaxhighlighter/styles/shThemeDefault.css" type="text/css"/>
	<script type="text/javascript" src="${ctxPath }/resources/syntaxhighlighter/scripts/shCore.js"></script>
	<script type="text/javascript" src="${ctxPath }/resources/syntaxhighlighter/scripts/shBrushSql.js"></script>
</head>
<body>

    <!--/sidebar-->
    <div class="main-wrap">
        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font">&#xe000;</i><span>${columnName }</span></div>
        </div>
        
        <div class="result-wrap">
            <div class="result-title">
                <h1>数据库备份文件内容</h1>
            </div>
            <a href="#" onclick="history.go(-1)" class="btn">返回</a>
            <div class="result-content">
                <pre class="brush: sql">
					${fileContent}
				</pre>
            </div>
        </div>
 
    </div>
    <!--/main-->

<script type="text/javascript">
	SyntaxHighlighter.defaults['title'] = '${fileName}';
	SyntaxHighlighter.defaults['quick-code'] = true;
	SyntaxHighlighter.defaults['toolbar'] = false;
    SyntaxHighlighter.all()
</script>
    
</body>
</html>