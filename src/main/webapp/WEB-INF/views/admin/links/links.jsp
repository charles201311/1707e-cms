<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>友情链接</title>
<script type="text/javascript" src="/resource/js/cms.js"></script>
 <script type="text/javascript">
  function add(){
	  $("#center").load("/admin/links/add");
  }
 
 
 </script>
</head>
<body>
	<div style="text-align: center;">
		<table class="table table-hover  table-bordered">
			<thead class="thead-light">
				<tr>
					<th>序号</th>
					<th>链接名称</th>
					<th>url</th>
					<th>创建时间</th>
					<th>操作<button class="btn btn-info" onclick="add()">增加链接</button></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${info.list}" var="l" varStatus="i">
					<tr>
						<td>${(info.pageNum-1) * info.pageSize+i.index+1 }</td>
						<td>${l.text }</td>
						<td>${l.url}</td>
						<td><fmt:formatDate value="${l.created }"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>浏览</td>
					</tr>


				</c:forEach>
			</tbody>

		</table>
		<!-- 引入分页信息 -->
		<jsp:include page="/WEB-INF/views/common/pages.jsp" />

	</div>

	<script type="text/javascript">
		function goPage(page) {
			var url = "/admin/links/links?page=" + page;
			//在中间区域加载分页页面
			$("#center").load(url);

		}
	</script>

</body>
</html>