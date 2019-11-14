<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CMS后台中心</title>
<link rel="stylesheet" type="text/css"
	href="/resource/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="/resource/css/cms.css" />
<!-- 	<link rel="stylesheet" type="text/css"
	href="/resource/open-iconic/font/css/open-iconic-bootstrap.css" /> -->
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/resource/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container-fluid">
		<div class="row" style="margin-top: 2px; min-height: 50px">
			<div class="col-md-12" style="background-color: #000">
			  <img alt="" src="/resource/images/logo.jpg" class="rounded-circle">
			 <a class="navbar-brand mr-1" href="index.html">CMS系统后台</a>

			</div>
		</div>
		<div class="row" style="margin-top: 5px;min-height: 500px;">
			<div class="col-md-2" style="padding-top: 20px;background-color: #eceaea;">
				<ul class="navbar">
					<li class="navbar-brand"> <a class="nav-link"
						href="/admin/index"><span class="oi oi-monitor">&nbsp;后台首页</a></li>
					<li class="navbar-brand"> <a class="nav-link"
						href="#" data="/user/users"><span class="oi oi-star">&nbsp;用户管理</a></li>
					<li class="navbar-brand"><a class="nav-link" href="#" data="/article/articles"><span class="oi oi-sun">&nbsp;文章管理</a></li>
					<li class="navbar-brand"><a class="nav-link" href="#"><span class="oi oi-paperclip">&nbsp;友情链接</a></li>
					<li class="navbar-brand"><a class="nav-link" href="#"><span class="oi oi-zoom-in">&nbsp;分类管理</a></li>
					<li class="navbar-brand"><a class="nav-link " href="#"><span class="oi oi-wrench">&nbsp;系统设置</a></li>
				</ul>


			</div>
			
			<div class="col-md-10 split" id="center">
			<div align="center">
			  <img alt="" src="/resource/images/bg_admin.jpg" class="rounded-circle">
			</div>
			
			</div>


		</div>

	</div>
	<script type="text/javascript">
	

	//文档就绪函数
	 $(function(){
		 
		 //为左侧菜单添加点击事件
		 $(".nav-link").click(function(){
			 var li =$("ul li a");
			//先移除所有的list-group-item-info样式
			li.removeClass("list-group-item-danger");
			//为左侧菜单添加动态点击样式 
			$(this).addClass("list-group-item-danger");
			 //获取点击URL
	      var url = $(this).attr("data");
			 //在当前页面的中间区域执行url
	      $("#center").load(url);   
		 })
		 
	 })


	

</script>
</body>
</html>