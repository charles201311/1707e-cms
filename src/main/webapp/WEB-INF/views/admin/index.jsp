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
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
<script type="text/javascript" src="/resource/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container-fluid">
		<div class="row" style="margin-top: 2px; min-height: 50px">
			<div class="col-md-12" style="background-color: #000">
				<a class="navbar-brand mr-1" href="index.html">CMS系统后台</a>

			</div>
		</div>
		<div class="row" style="padding-top: 3px; min-height: 500px">
			<div class="col-md-2">
				<ul class="nav flex-column">
					<li class="nav-item"><a class="nav-link"
						href="#" data="/users">用户管理</a></li>
					<li class="nav-item"><a class="nav-link" href="#">文章管理</a></li>
					<li class="nav-item"><a class="nav-link" href="#">分类管理</a></li>
					<li class="nav-item"><a class="nav-link " href="#">系统设置</a></li>
				</ul>



			</div>
			<div class="col-md-10 min_h_500 split" id="center">
			
			
			
			
			</div>


		</div>

	</div>
	<script type="text/javascript">
       $(function(){
    	   
    	  $(".nav-link").click(function(){
    		  var url=$(this).attr("data");
             $("#center").load(url);    		  
    	  })   
    	   
       })
  

</script>
</body>
</html>