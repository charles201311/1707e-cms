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
<title></title>
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
</head>
<body>
	<br>
	<div class="container">
	<form id="form1" >
	
	 <button type="button" onclick="addCard()" class="btn btn-info">添加card</button>
	 <button type="button" onclick="publishPic()" class="btn btn-info">发布图片</button>
		<div class="form-group">
			<label for="title">标题</label> <input type="text" class="form-control"
				name="title" id="title">
		</div>
		<hr>

		<div id="mdiv" style="border: 1px solid red">
			<div id="card1" style="float: left">
				<div class="card" style="width: 15rem;">
					<div class="card-header">
						<label for="title">标题图片</label> <input type="file"
							class="form-control" name="files" id="file">
					</div>
					<div class="card-body">
						图片描述:
						<textarea rows="5" cols="" name="descr" style="width: 13rem;"></textarea>
					</div>
				</div>
			</div>
		</div>
	</form>


</div>

<script type="text/javascript">
function addCard(){
	$("#mdiv").append($("#card1").html());
}

//发布图片集
function publishPic(){
	 var formData = new FormData($( "#form1" )[0]);
	 $.ajax({
		 type:"post",
		 url:"/my/publishpic",
		 data : formData,
		// 告诉jQuery不要去处理发送的数据
		 processData : false,
		 // 告诉jQuery不要去设置Content-Type请求头
		 contentType : false,
		 success:function(flag){
			 if(flag){
				 alert("发布成功");
				 location.href="/my"
			 }else{
				 alert("发布失败,试试重新登录后再发布")
			 }
		 }
		 
	 })
	
	
}

</script>
</body>
</html>