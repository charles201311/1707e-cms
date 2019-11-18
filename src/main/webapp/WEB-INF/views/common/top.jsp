<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap -->
<link rel="stylesheet" type="text/css"
	href="/resource/css/bootstrap.min.css" />

<link rel="stylesheet" type="text/css"
	href="/resource/css/cms.css?v=1.1" />
	<link rel="stylesheet" type="text/css"
	href="/resource/css/jquery/screen.css" />

	
<div class="container-fulid">
	<nav class="navbar navbar-light bg-light">
		<a class="navbar-brand" href="/" title="cms"><img alt="cms"
			src="/resource/images/logo.jpg"  class="rounded-circle" style="height: 50px"></a>

		<!-- 搜索框：在专业高级二学完ElasticSearch后实现 -->
		<form class="form-inline">
			<div class="input-group">
				<input type="text" name="key" class="form-control"
					placeholder="输入关键字..." aria-label="key"
					aria-describedby="basic-addon1">
				<div class="input-group-prepend">
					<button class="input-group-btn btn btn-outline-primary"
						id="basic-addon1">搜索</button>
				</div>
			</div>
		</form>
		<!-- 右边登录注册 -->
		<ul class="nav">
			<c:choose>
				<%-- 登录显示用户菜单 --%>
				<c:when test="${sessionScope.user != null}">
					<li class="nav-item"><a class="nav-link" href="/my/home">
							<img alt="" src="/resource/images/default_avatar.png"
							style="max-height: 2.5rem" class="rounded img-fluid">
					</a></li>
					<li class="nav-item">
						<div class="dropdown" style="padding-top: 0.4rem;">
							<a href="#" class="nav-link dropdown-toggle" role="button"
								id="dropdownMenuButton" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <c:out
									value="${user.username}" default="cms-User" />
							</a>
							<div class="dropdown-menu dropdown-menu-left"
								aria-labelledby="dropdownMenuButton">
								<a class="dropdown-item" href="/my/">个人主页</a> <a
									class="dropdown-item" href="#">个人设置</a> <a
									class="dropdown-item" href="#">我的文章</a>
								<div class="dropdown-divider"></div>
								<a class="dropdown-item" href="/passport/logout">退出</a>
							</div>
						</div>
					</li>
				</c:when>
				<c:otherwise>
					<%-- 未登录显示登录注册链接 --%>
					<li class="nav-item"><a class="nav-link" href="/passport/reg">注册</a></li>
					<li class="nav-item"><a class="nav-link" href="/passport/login">登录</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</nav>
</div>