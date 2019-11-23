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
function save(){
	$.post("/admin/links/add",$("#form1").serialize(),function(flag){
		if(flag.code==0){
			alert(flag.msg);
			$("#center").load("/admin/links/selects");
		}else{
			alert(flag.msg);
		}
	})
	
	
	
}


</script>
</head>
<body>
	<div>
		<form action="" id="form1">
			<div class="form-group">
				<label for="text">链接名称:</label> <input class="form-control"
					type="text" name="text" id="text">
			</div>
			<div class="form-group">
				<label for="url">链接url:</label> <input class="form-control"
					type="text" name="url" id="url">
			</div>
			
			<div class="form-group">
				<button class="btn btn-success" type="button" onclick="save()"> 保存</button>
				<button  class="btn btn-info" type="reset"> 重置</button>
			</div>
		</form>


	</div>

</body>
</html>