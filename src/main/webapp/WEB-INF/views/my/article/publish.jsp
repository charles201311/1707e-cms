<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String htmlData = request.getParameter("content1") != null ? request.getParameter("content1") : "";
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<title>KindEditor JSP</title>
<link rel="stylesheet"
	href="/resource/kindeditor/themes/default/default.css" />
<link rel="stylesheet"
	href="/resource/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8"
	src="/resource/kindeditor/plugins/code/prettify.js"></script>
<script charset="utf-8" src="/resource/kindeditor/kindeditor-all.js"></script>
    
<script charset="utf-8" src="/resource/kindeditor/lang/zh-CN.js"></script>
<script src="/resource/js/jquery-3.2.1.js"></script>

<script>
	KindEditor.ready(function(K) {
		window.editor1 = K.create('textarea[name="content1"]', {
			cssPath : '/resource/kindeditor/plugins/code/prettify.css',
			uploadJson : '/resource/kindeditor/jsp/upload_json.jsp',
			fileManagerJson : '/resource/kindeditor/jsp/file_manager_json.jsp',
			allowFileManager : true,
			afterCreate : function() {
				var self = this;
				K.ctrl(document, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
				K.ctrl(self.edit.doc, 13, function() {
					self.sync();
					document.forms['example'].submit();
				});
			}
		});
		prettyPrint();
	});
	function query() {
		alert(editor1.html())
		//alert( $("[name='content1']").attr("src"))
	}
</script>
</head>
<body>


	<form id="form1">
		<div class="form-group">
			<label for="title">文章标题:</label> <input
				class="form-control form-control-sm" id="title" type="text"
				name="title">
		</div>
		<div class="form-group">
			<textarea name="content1" cols="100" rows="8"
				style="width: 100%; height: 250px; visibility: hidden;"><%=htmlspecialchars(htmlData)%></textarea>
			<br />

		</div>
		<div class="form-group form-inline">

			所属栏目: <select class="form-control form-control-sm" id="channel"
				name="channelId">
				<option value="-1">请选择</option>

			</select> 所属分类: <select class="form-control form-control-sm" id="category"
				name="categoryId">
				<option>请选择</option>

			</select>

		</div>
		<div class="form-group">
			标题图片: <input type="file" name="file"
				class="form-control form-control-sm ">
		</div>

		<div class="form-group">
			<button type="button" class="btn btn-success" onclick="publish()">发布文章</button>
			<button type="reset" class="btn btn-warning">重置</button>

		</div>
	</form>
	<script type="text/javascript">
		//发布文章
		function publish() {

			//获取formDAta对象
			var formData = new FormData($("#form1")[0]);
			//单独封装富文本编辑中内容(html格式的)
			formData.set("content", editor1.html());

			$.ajax({
				type : "post",
				url : "/my/publish",
				data : formData,
				// 告诉jQuery不要去处理发送的数据
				processData : false,
				// 告诉jQuery不要去设置Content-Type请求头
				contentType : false,
				success : function(flag) {
					if (flag) {
						alert("发布成功");
						location.href="/my"
					} else {
						alert("发布失败,可能登录过期")
					}
				}

			})
		}

		//栏目.分类的下拉框的赋值
		$(function() {
			//先查询出所有栏目
			$.get("/channel/channels", function(obj) {
				var list =obj.data;
				for ( var i in list) {
					$("#channel").append(
							"<option value='"+list[i].id+"'>" + list[i].name
									+ "</option>");
				}

			})
			//为栏目绑定change事件
			$("#channel").change(
					function() {

						var channelId = $(this).val();
						$("#category").empty();
						if (channelId == -1) {
							//先清空栏目已有的值
							$("#category").html("<option>请选择</option>");
							//获取栏目ID.如果为-1 则不查询
							return;

						}

						//获取当前选中的栏目ID

						// alert(channelId);
						//去查询栏目下的分类并赋值到下拉框
						$.get("/category/selects", {
							channelId : channelId
						}, function(obj) {
							var list =obj.data;
							for ( var i in list) {
								$("#category").append(
										"<option value='"+list[i].id+"'>"
												+ list[i].name + "</option>");
							}

						})
					})

		})
	</script>
</body>
</html>


<%!private String htmlspecialchars(String str) {
		str = str.replaceAll("&", "&amp;");
		str = str.replaceAll("<", "&lt;");
		str = str.replaceAll(">", "&gt;");
		str = str.replaceAll("\"", "&quot;");
		return str;
	}%>