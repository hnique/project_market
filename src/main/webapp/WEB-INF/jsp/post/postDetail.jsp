<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div>
	<!-- 내용 -->
	<div class="d-flex justify-content-center">
		<div class="post-detail-box">
			<span id="category">[${post.categoryId}]</span>
			<div class="d-flex justify-content-between mt-1">
				<span id="subject">${post.subject}</span>
				<span id="userLoginId">userLoginId</span>
			</div>
			<div class="d-flex justify-content-between align-items-center">
				<span id="submitDate">2023-08-12 18:23</span>
				<div class="d-flex align-items-center">
					<span id="price">${post.price}원</span>
					<span id="status">[${post.status}]</span>
				</div>
			</div>
			<hr>
			<c:if test="${not empty post.imagePath}">
				<div class="mb-2">
					<img src="${post.imagePath}" alt="업로드 된 이미지" width="100%">
				</div>
			</c:if>
			<span id="content">${post.content}</span>
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
			<div class="d-flex justify-content-between">
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
			<div class="d-flex justify-content-between mt-3">
				<div>
					<span id="commentUserId">userId</span>
					<span id="commentContent">안녕하세요 흥정 가능할까요?</span>
				</div>
				<div class="d-flex align-items-center">
					<span id="commentDate">2023-08-12</span>
					<i class='bx bx-x'></i>
				</div>
			</div>
			<!-- 댓글 작성 -->
			<div class="d-flex mt-2 write-comment-box">
				<input type="text" class="form-control" placeholder="댓글을 입력해주세요">
				<span id="commentSubmitBtn">등록</span>
			</div>
		</div>
	</div>
</div>