<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户列表</title>
<!-- <script type="text/javascript" src="/resource/js/cms.js"></script> -->

<script type="text/javascript">

//分页
function goPage(page) {
	var url = "/my/collects?page=" + page 
	$("#center").load(url);
}

function deleteCollect(id){
	$.post("/my/deleteCollect",{id:id},function(flag){
		if(flag.code==0){
			alert(flag.msg)
			$("#center").load("/my/collects");
		}else{
			alert(flag.msg)
		}
	})
}
</script>
</head>
<body class="container">
	<h2>我的收藏夹</h2>
	<hr>
	<c:forEach items="${info.list}" var="c">
		<dl>
   
			<dt><h3><a href="${c.url}" target="_blank">${c.text }</a></h3></dt>
			<dd><fmt:formatDate value="${c.created}" pattern="yyyy-MM-dd HH:mm:ss"/> &nbsp; <button class="btn btn-info btn-sm" onclick="deleteCollect(${c.id})">删除</button></dd>
    <hr>
		</dl>
	</c:forEach>
    <jsp:include page="/WEB-INF/views/common/pages.jsp"></jsp:include>

</body>
</html>