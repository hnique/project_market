<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div>
	<!-- 내용 -->
	<div class="d-flex justify-content-center">
		<div class="post-detail-box">
			<span id="category">[${postView.category}]</span>
			<div class="d-flex justify-content-between mt-1">
				<span id="subject">${postView.post.subject}</span>
				<span id="userLoginId">${postView.user.loginId}</span>
			</div>
			<div class="d-flex justify-content-between align-items-center">
				<span id="submitDate">
					<fmt:parseDate value="${postView.post.createdAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedCreatedAt"/>
					<fmt:formatDate value="${parsedCreatedAt}" pattern="yyyy-MM-dd HH:mm"/>
				</span>
				<div class="d-flex align-items-center">
					<span id="price">${postView.post.price}원</span>
					<span id="status">[${postView.post.status}]</span>
				</div>
			</div>
			<hr>
			<c:if test="${not empty postView.post.imagePath}">
				<div class="mb-2">
					<img src="${postView.post.imagePath}" alt="업로드 된 이미지" width="100%">
				</div>
			</c:if>
			<span id="content">${postView.post.content}</span>
			<div class="d-flex justify-content-between mt-5">
				<a href="#"><button type="button" id="listBtn">목록</button></a>
				<div class="d-flex align-items-center">
					<a href="#"><button type="button" id="updateBtn">수정</button></a>
					<button type="button" id="deleteBtn">삭제</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 댓글 목록 -->
	<div class="d-flex justify-content-center">
		<div class="post-comment-box">
			<!-- 메뉴 -->
			<div class="d-flex justify-content-between mb-3">
				<div class="d-flex">
					<div class="d-flex align-items-center">
						<i class='bx bxs-chat'></i><span id="comment">댓글(1)</span>
					</div>
					<div class="d-flex align-items-center ml-4">
						<i class='bx bx-heart'></i><span id="like">찜하기</span>
					</div>
				</div>
				<button type="button" id="chatBtn">채팅하기</button>
			</div>
			<!-- 댓글 내용 -->
			<c:forEach items="${postView.commentList}" var="commentView">
			<div class="d-flex justify-content-between mt-2">
				<div>
					<span id="commentUserId">${commentView.user.loginId}</span>
					<span id="commentContent">${commentView.comment.content}</span>
				</div>
				<div class="d-flex align-items-center">
					<span id="commentDate">
						<fmt:parseDate value="${commentView.comment.createdAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedCreatedAt"/>
						<fmt:formatDate value="${parsedCreatedAt}" pattern="yyyy-MM-dd"/>
					</span>
					<i class='bx bx-x'></i>
				</div>
			</div>
			</c:forEach>
			<!-- 댓글 작성 -->
			<div class="d-flex mt-3 write-comment-box">
				<input type="text" class="form-control" placeholder="댓글을 입력해주세요">
				<span id="commentSubmitBtn" data-post-id="${postView.post.id}">등록</span>
			</div>
		</div>
	</div>
</div>
<!-- TODO: 게시글삭제, 댓글삭제, 댓글개수표시, 찜하기 구현 -->
<script>
$(document).ready(function() {
	// 게시글 삭제
	
	// 댓글 작성
	$("#commentSubmitBtn").on('click', function() {
		let postId = $(this).data('post-id');
		let comment = $(this).prev().val().trim();
		
		$.ajax({
			type:"post"
			, url:"/comment/create"
			, data:{"postId":postId, "content":comment}
			, success:function(data) {
				if (data.code == 1) {
					location.reload(true);
				} else if (data.code == 300) {
					alert(data.errorMessage);
				}
			}
			, error:function(request, status, error) {
				alert("댓글을 등록하는데 실패했습니다.")
			}
		});
	});
});
</script>