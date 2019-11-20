<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>用户列表</title>
<!-- <script type="text/javascript" src="/resource/js/cms.js"></script> -->
<script type="text/javascript">

  //文档就绪函数.让下拉框回显
  
  $(function(){
	 $("#status").val('${article.status}'); 
  })
	function query() {
		//在中间区域加载用户页面
		var url ="/admin/article/articles?title=" + $("[name='title']").val()+"&status="+$("[name='status']").val();
		$("#center").load(url);
	}
</script>
</head>
<body>
	<div style="text-align: center;">
		<div class="form-group form-inline">
			<label for="title"> 标题:</label> <input id="title" type="text"
				class="form-control form-control-sm" name="title"
				value="${article.title }">&nbsp; 文章状态: <select
				class="form-control form-control-sm" name="status" id="status">
				<option value="0">待审</option>
				<option value="1">已审</option>
				<option value="-1">驳回</option>
				<option value="">全部</option>

			</select> &nbsp;

			<button type="button" class="btn btn-success btn-sm"
				onclick="query()">查询</button>
		</div>
		<table class="table table-hover  table-bordered">
			<thead class="thead-light">
				<tr>
					<th>序号</th>
					<th>文章标题</th>
					<th>作者</th>
					<th>是否热门</th>
					<th>所属栏目</th>
					<th>所属分类</th>
					<th>更新时间</th>
					<th>是否删除</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${info.list}" var="a" varStatus="i">
					<tr>
						<td>${(info.pageNum-1) * info.pageSize+i.index+1 }</td>
						<td>${a.title }</td>
						<td>${a.user.username }</td>
						<td><c:if test="${a.hot==0 }">
								<button type="button" class="btn btn-info"
									onclick="update(this,${a.id})">否</button>
							</c:if> <c:if test="${a.hot==1 }">
								<button type="button" class="btn btn-success"
									onclick="update(this,${a.id})">是</button>

							</c:if></td>
						<td>${a.channel.name }</td>
						<td>${a.category.name }</td>
						<td><fmt:formatDate value="${a.updated }"
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td><c:if test="${a.deleted==0 }">
								<button type="button" class="btn btn-warning"
									onclick="del(this,${a.id})">正常</button>
							</c:if> <c:if test="${a.deleted==1 }">
								<button type="button" class="btn btn-danger"
									onclick="del(this,${a.id})">已删除</button>

							</c:if></td>
						<td>

							<button type="button" class="btn btn-info"
								onclick="detail(${a.id})">详情</button>


						</td>
					</tr>


				</c:forEach>
			</tbody>

		</table>
		<!-- 引入分页信息 -->
		<jsp:include page="/WEB-INF/views/common/pages.jsp" />

	</div>


	<script>
	
	//文章详情
	function detail(id){
		
		$("#center").load("/admin/article/article?id="+id);
		
	}
	
	
	//删除文章
	function del(obj,id){
		
		  //0:正常 1:已删除
		  //如果当前状态为正常,则改为停用.如果是停用则改为正常
		
		  var deleted =$(obj).text()=="正常"?"1":"0";
		 
		  $.post("/admin/article/update",{id:id,deleted:deleted},function(flag){
	        if(flag.code==0){
	        //	alert("操作成功");
	        	$(obj).text(deleted==0?"正常":"已删除");//先改变按钮内容
	        	$(obj).attr("class",deleted=="1"?"btn btn-danger":"btn btn-warning")//改变按钮颜色
	        }else{
	        	alert(flag.msg)
	        }		  
		  })
		  
	  }
		
	
	
	
	//分页
		function goPage(page) {
			var url = "/admin/article/articles?page=" + page + "&title="
					+ $("[name='title']").val()
			$("#center").load(url);
		}
		
		//修改状态
		function update(obj,id){
			  //0:正常 1:停用
			  //如果当前状态为正常,则改为停用.如果是停用则改为正常
			
			  var hot =$(obj).text()=="否"?"1":"0";
			 
			  $.post("/admin/article/update",{id:id,hot:hot},function(flag){
		        if(flag){
		        //	alert("操作成功");
		        	$(obj).text(hot==0?"否":"是");//先改变按钮内容
		        	$(obj).attr("class",hot=="1"?"btn btn-success":"btn btn-info")//改变按钮颜色
		        }else{
		        	alert("操作失败")
		        }		  
			  })
			  
		  }
	</script>

</body>
</html>