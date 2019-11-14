 // 分页工具类
 $(function(){
	   $(".page-link").click(function(){
		   var url=$(this).attr("data");
		   $("#center").load(url);
	   })
	   
   })