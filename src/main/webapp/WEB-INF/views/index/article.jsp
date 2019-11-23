<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>文章详情</title>
<script type="text/javascript" src="/resource/js/jquery-3.2.1.js"></script>
<script type="text/javascript">
	function collect() {
		var text = '${article.title}';//收藏的标题
		var url = window.location.href;//收藏的地址

		$.post("/collect", {
			text : text,
			url : url
		}, function(flag) {
			if (flag.code == 0) {
				alert(flag.msg);
				$("#mc").html(
						"<span style='font-size: 20px;color: red'>★(已收藏)</span>")
			} else {
				alert(flag.msg);

			}
		})

	}
</script>
</head>
<body>

	<div style="text-align: center">
		<dl>
			<dt>
				<h2>${article.title }</h2>
			</dt>

			<hr>
			<dd id="mc">

				<c:if test="${isCollect==1}">
					<span style="font-size: 20px; color: red">★ (已收藏)</span>
				</c:if>
				
				
				<c:if test="${isCollect!=1}">
					<span style="font-size: 20px; color: blue;"> <a
						href="javascript:collect()">☆ (未收藏)</a>
					</span>
				</c:if>


			</dd>
			<dd>
				<!-- <button type="button" class="btn btn-info" onclick="close()">关闭</button> -->
			</dd>
			<dd>
				<fmt:formatDate value="${aritcle.updated }"
					pattern="yyyy-MM-dd HH:mm:ss" />
			</dd>
			<dd>${article.content }</dd>

		</dl>

	</div>

	<script type="text/javascript">
		function close() {
			this.close();
		}
	</script>
</body>
</html>