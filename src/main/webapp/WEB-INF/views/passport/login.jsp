<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>欢迎回来</title>

<!-- Bootstrap -->
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<link rel="icon" type="image/x-icon" href="/resource/pic/title.png" />

</head>
<body>
	<jsp:include page="/WEB-INF/views/common/top.jsp"></jsp:include>
	<!-- 登录注册页面 -->
	<div class="container" style="margin-top: 10px">
		<div class="row passport_bg">
			<div class="col-md-6">
				<div class="card"
					style="width: 26rem; height: 20rem; margin-top: 10px">
					<div class="card-header" style="height: 40px">
						<h5 align="center">用户登录</h5>
					</div>
					<div class="card-body">
						<span style="color: red">${message }</span>
						<form id="form1" action="/passport/login" method="post">
							<div class="form-group">
								<label for="username">用户名:</label> <input id="username"
									class="form-control" type="text" name="username"
									value="${username }">
							</div>
							<div class="form-group">
								<label for="password">密码:</label> <input id="password"
									class="form-control" type="password" name="password">
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-success">登录</button>
								<button type="reset" class="btn btn-warning">重置</button>
							</div>
						</form>
					</div>

				</div>
			</div>
			<div class="col-md-6">
				<div class="passport_r">
					<h3>最新加入的用户：</h3>
					<p align="center">
						<img src="/resource/images/guest.jpg" alt="..."
							class="rounded-circle img-thumbnail" /> &nbsp;&nbsp;&nbsp;&nbsp;
						<img src="/resource/images/guest1.jpg" alt="..."
							class="rounded-circle img-thumbnail" />
					</p>
				</div>
			</div>
		</div>
	</div>
	<div>
		<br /> <br />
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" />


	<script type="text/javascript">
	 $(function(){
		 $("#form1").validate({
		   //1.定义校验规则	 
		     rules:{
		    	 username:{
		    		  required:true,//用户名不能为空
		    		  rangelength:[2,5],//用户名在2-5之间
		    	 },
		    	 password:{
		    		  required:true,//密码不能为空
		    		  rangelength:[6,10],//密码在6-10之间
		    	 },
		    	 
		    	 
		     },
				//2.提示信息 
		     messages:{
		    	 username:{
		    		 required:"用户名不能为空",
		    		 rangelength:"用户名在2-5之间",
		    		 
		    	 },
	    	 password:{
	    		  required:"密码不能为空",
	    		  rangelength:"密码在6-10之间",
	    	 },
	    	
		     }
		
		 });
		 
		 
		 
	 });
	
		
	</script>
</body>
</html>