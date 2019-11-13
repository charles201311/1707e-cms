<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div>
	<nav aria-label="Page navigation example">
		<ul class="pagination">
			<li class="page-item"><a class="page-link" href="#"
				data="/${param.url }?page=${info.prePage==0?1:info.prePage }"
				aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
			</a></li>
			<c:forEach items="${nums}" var="n">
				<li class="page-item"><a class="page-link" href="#"
					data="/${param.url }?page=${n}">${n}</a></li>
			</c:forEach>

			<li class="page-item"><a class="page-link" href="#"
				data="/${param.url }?page=${info.nextPage ==0?info.pages:info.nextPage}"
				aria-label="Next"> <span aria-hidden="true">&raquo;</span>
			</a></li>
		</ul>
	</nav>

</div>
