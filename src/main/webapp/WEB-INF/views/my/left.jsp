<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="avatar">
	<img alt="" src="/resource/images/guest.jpg" class="img-thumbnail">
</div>
<br />
<div>
	<div class="list-group">
		<ul class="list-group">
			<li id="myArticle" class="list-group-item  text-center list-group-item-info"   >
			<a class="channel"
				href="javascript:void(0)"  data="/my/articles"  >我的文章
			</a></li>
			<li class="list-group-item  text-center" ><a class="channel"
				href="javascript:void(0)" data="/my/publish"
				class="list-group-item">发布文章</a></li>
				
			<li class="list-group-item  text-center"><a class="channel"
				href="javascript:void(0)" class="list-group-item">我的评论</a></li>
			<li class="list-group-item  text-center"><a class="channel"
				href="javascript:void(0)" class="list-group-item">上传头像</a></li>
			<li class="list-group-item  text-center"><a class="channel"
				href="javascript:void(0)"  data="/my/user/update" class="list-group-item">个人设置</a></li>
				<li class="list-group-item  text-center"><a class="channel"
				href="javascript:void(0)" data="/toCollectList" class="list-group-item">个人收藏</a></li>
			<li class="list-group-item  text-center"><a class="channel"
				href="javascript:void(0)" data="/blog/toBlog" class="list-group-item">写博客</a></li>
		
		<li class="list-group-item  text-center"><a class="channel"
				href="javascript:void(0)" data="/my/articlepic/publish" class="list-group-item">发布图片</a></li>
			
		<li class="list-group-item  text-center"><a class="channel"
				href="javascript:void(0)" data="/article/publishVote" class="list-group-item">发起投票</a></li>
		
		
		
		
		</ul>
	</div>
</div>
