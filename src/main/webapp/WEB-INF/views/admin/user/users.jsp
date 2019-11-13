<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户列表</title>

<script type="text/javascript">
	function query() {
      //在中间区域加载用户页面
		$("#center").load("/users?username=" + $("[name='username']").val());
	}
</script>
</head>
<body>
	<div style="text-align: center;">
		<div class="form-group form-inline">
			<label for="username"> 用户名:</label> <input id="username" type="text"
				class="form-control form-control-sm" name="username"
				value="${user.username }">&nbsp;
			<button type="button" class="btn btn-success btn-sm"
				onclick="query()">查询</button>
		</div>
		<table class="table table-hover  table-bordered">
			<thead class="thead-dark">
				<tr>
					<th>序号</th>
					<th>用户名</th>
					<th>昵称</th>
					<th>性别</th>
					<th>生日</th>
					<th>注册时间</th>
					<th>更新时间</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${users}" var="u" varStatus="i">
					<tr>
						<td>${i.index+1 }</td>
						<td>${u.username }</td>
						<td>${u.nickname }</td>
						<td>${u.gender==0?"男":"女" }</td>
						<td><fmt:formatDate value="${u.birthday}"
								pattern="yyyy-MM-dd" /></td>
						<td><fmt:formatDate value="${u.created }"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td><fmt:formatDate value="${u.updated }"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>启用</td>
					</tr>


				</c:forEach>
			</tbody>

		</table>
	</div>
</body>
</html>