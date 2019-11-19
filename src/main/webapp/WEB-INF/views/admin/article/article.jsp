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
<script type="text/javascript">
	function query() {
		//在中间区域加载用户页面
		$("#center").load("/admin/article/articles?title=" + $("[name='title']").val());
	}
</script>
</head>
<body>

	<div style="text-align: center">
		<dl>
			<dt>
			  <h2>${article.title }</h2>
			</dt>
			
			<hr>
			<dd>
			<button type="button" class="btn btn-success" onclick="update(${article.id},1)">同意</button>
			<button type="button" class="btn btn-danger" onclick="update(${article.id},-1)">驳回</button>
			<button type="button" class="btn btn-info" onclick="back()">返回列表</button>
			
			</dd>
			<dd><fmt:formatDate value="${aritcle.updated }" pattern="yyyy-MM-dd HH:mm:ss"/> </dd>
			<dd>${article.content }</dd>

		</dl>

	</div>
	
	<script type="text/javascript">
	 function update(id,status){
		 $.post("/admin/article/update",{id:id,status:status},function(flag){
			 if(flag){
				 alert("操作成功") ;
				  $("#center").load("/admin/article/articles")
			 }
		 })
		 
	 }
	 function back(){
		 $("#center").load("/admin/article/articles")
	 }
	
	</script>
</body>
</html>