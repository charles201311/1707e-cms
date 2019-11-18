<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>我的个人空间</title>

</head>
<body>
	<!-- 头 -->
	<jsp:include page="/WEB-INF/views/common/top.jsp"></jsp:include>
	<br />
	<!-- 横幅 -->
	<div class="container">
		<div class="row">
			<div class="col-md-12 my_banner"></div>
		</div>
	</div>
	<br />
	<!-- 主体内容区 -->
	<div class="container">
		<div class="row">
			<div class="col-md-3">
				<!-- 导航条 -->
				<jsp:include page="/WEB-INF/views/my/left.jsp"></jsp:include>
				<br />
			</div>
			<div class="col-md-9" id="center">
				 <!--引入富文本编辑器  -->
				 <div style="display: none">
				 <jsp:include page="/resource/kindeditor/jsp/demo.jsp"></jsp:include>
				 </div>
			
			</div>
		</div>
	</div>
	
	

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />

 <script type="text/javascript">
 $(function(){
	 
	 //页面加载时让为左侧菜单默认点击 我的文章
	  
	 $("#myArticle").click();
  //  $("#center").load("/my/articles")
	 
     
    
	 $(".channel").click(function(){

		 var li =$("ul li");
		//先移除所有的list-group-item-info样式
		li.removeClass("list-group-item-info");
		//为左侧菜单添加动态点击样式 
		$(this).parent().addClass("list-group-item-info");
		 var url =$(this).attr("data");
		 $("#center").load(url);
	 })
	
	 

 })
 
 
 
 </script>
 




</body>
</html>