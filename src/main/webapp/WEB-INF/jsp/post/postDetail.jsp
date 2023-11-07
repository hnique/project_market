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
				<a href="/category/post_list_view?categoryId=${postView.post.categoryId}"><button type="button" id="listBtn">목록</button></a>
				<c:if test="${userId eq postView.post.userId}">
					<div class="d-flex align-items-center">
						<a href="/post/post_update_view?postId=${postView.post.id}"><button type="button" id="updateBtn">수정</button></a>
						<button type="button" id="deleteBtn" data-post-id="${postView.post.id}">삭제</button>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	
	<!-- 댓글 목록 -->
	<div class="d-flex justify-content-center">
		<div class="post-comment-box">
			<!-- 메뉴 -->
			<div class="d-flex justify-content-between mb-3">
				<div class="d-flex">
					<!-- 댓글 -->
					<div class="d-flex align-items-center">
						<i class='bx bxs-chat'></i><span id="comment">댓글</span>
					</div>
					<!-- 찜하기 -->
					<div class="d-flex align-items-center ml-4">
						<c:if test="${postView.filledLike eq false}">
							<i class='like-btn bx bx-heart' data-post-id="${postView.post.id}"></i><span id="like">찜하기</span>
						</c:if>
						
						<c:if test="${postView.filledLike}">
							<i class='like-btn bx bxs-heart' data-post-id="${postView.post.id}"></i><span id="like">찜하기</span>
						</c:if>
					</div>
				</div>
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
					<c:if test="${userId == commentView.comment.userId}">
						<i class='commentDelBtn bx bx-x' data-comment-id="${commentView.comment.id}"></i>
					</c:if>
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
<!-- TODO: 댓글개수표시, 채팅하기 구현 -->
<script>
$(document).ready(function() {
	// 댓글 작성
	$("#commentSubmitBtn").on('click', function() {
		let postId = $(this).data('post-id');
		let comment = $(this).prev().val().trim();
		
		// validation
		if (!comment) {
			alert("댓글을 작성해주세요.");
			return;
		}
		
		$.ajax({
			type:"post"
			, url:"/comment/create"
			, data:{"postId":postId, "content":comment}
			, success:function(data) {
				if (data.code == 1) {
					location.reload(true);
				} else {
					alert(data.errorMessage);
				}
			}
			, error:function(request, status, error) {
				alert("댓글을 등록하는데 실패했습니다.")
			}
		});
	});
	
	// 댓글 삭제
	$(".commentDelBtn").on('click', function(e) {
		e.preventDefault();
		
		let commentId = $(this).data('comment-id');
		
		$.ajax({
			type:"delete"
			, url:"/comment/delete"
			, data:{"commentId":commentId}
			, success:function(data) {
				if (data.code == 1) {
					location.reload(true);
				} else {
					alert(data.errorMessage);
				}
			}
			, error:function(request, status, error) {
				alert("댓글을 삭제하는데 실패했습니다.")
			}
		});
	});
	
	// 찜하기, 찜해제 토글
	$(".like-btn").on('click', function(e) {
		e.preventDefault();
		
		let postId = $(this).data('post-id');
		
		$.ajax({
			url:"/like/" + postId
			, success:function(data) {
				if (data.code == 1) {
					location.reload();
				} else {
					alert(data.errorMessage);
				}
			}
			, error:function(request, status, error) {
				alert("좋아요를 하는데 실패했습니다.");
			}
		});
	});
	
	// 게시글 삭제
	$("#deleteBtn").on('click', function(e) {
		e.preventDefault();
		
		let postId = $(this).data('post-id');
		
		$.ajax({
			type:"delete"
			, url:"/post/delete"
			, data:{"postId":postId}
			, success:function(data) {
				if (data.code == 1) {
					alert("글이 삭제되었습니다.");
					location.href = "/market/main_view";
				} else {
					alert(data.errorMessage);
				}
			}
			, error:function(request, status, error) {
				alert("글을 삭제하는데 실패했습니다. 관리자에게 문의해주세요.");
			}
		});
	});
});
</script>