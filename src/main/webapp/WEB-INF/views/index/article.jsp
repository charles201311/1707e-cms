<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文章详情</title>
<!-- <script type="text/javascript" src="/resource/js/cms.js"></script> -->
</head>
<body>

	<div style="text-align: center">
		<dl>
			<dt>
			  <h2>${article.title }</h2>
			</dt>
			
			<hr>
			<dd>
			<!-- <button type="button" class="btn btn-info" onclick="close()">关闭</button> -->
			</dd>
			<dd><fmt:formatDate value="${aritcle.updated }" pattern="yyyy-MM-dd HH:mm:ss"/> </dd>
			<dd>${article.content }</dd>

		</dl>

	</div>
	
	<script type="text/javascript">
	 
	 function close(){
		this.close();
	 }
	
	</script>
</body>
</html>