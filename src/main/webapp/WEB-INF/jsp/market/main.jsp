<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="img-box">
	<img src="/static/image/banner.png" alt="배너" width="100%" height="330px">
</div>
<div class="goods-list-content">
	<div class="goods-list d-flex flex-wrap">
		<c:forEach items="${postList}" var="post">
			<div class="goods-box">
			<c:if test="${not empty post.imagePath}">
				<div>
					<a href="/post/post_detail_view?postId=${post.id}">
						<img src="${post.imagePath}" id="thumbnail" alt="썸네일" width="198px">
					</a>
				</div>
			</c:if>
			<c:if test="${empty post.imagePath}">
				<div>
					<img src="https://digitalfinger.id/wp-content/uploads/2019/12/no-image-available-icon-6.png" id="thumbnail" alt="썸네일" width="198px">
				</div>
			</c:if>
				<div class="subject">
					<a href="/post/post_detail_view?postId=${post.id}">
						<span>${post.subject}</span>
					</a>
				</div>
				<div class="price"><span>${post.price}원</span></div>
			</div>
		</c:forEach>
	</div>
</div>
