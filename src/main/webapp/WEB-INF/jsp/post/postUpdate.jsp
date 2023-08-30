<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${post.postType eq '판매글'}">
<div class="write-post-wrap">
	<h5>물건 판매하기</h5>
	<div class="write-post-box">
		<input type="text" id="postType" value="판매글" class="d-none">
		<div class="input-box">
			<span>제목</span> 
			<input type="text" id="subject" class="form-control col-10" value="${post.subject}">
		</div>
		<div class="input-box">
			<span>판매 가격</span>
			<input type="text" id="price" class="form-control col-3 mr-2" value="${post.price}">원
		</div>
		<div class="input-box">
			<span>카테고리</span>
			<select id="categoryId" class="form-control col-4">
				<option value="${post.categoryId}">${category}</option>
				<option value=1>패션·뷰티</option>
				<option value=2>식품·건강</option>
				<option value=3>생활·주방</option>
				<option value=4>가구·인테리어</option>
				<option value=5>디지털·가전</option>
				<option value=6>게임·컴퓨터</option>
				<option value=7>스포츠·자동차</option>
				<option value=8>도서·여행</option>
				<option value=9>반려동물·취미</option>
				<option value=10>기타</option>
			</select>
			<select id="status" class="selectPostStatus form-control col-2">
				<option value="판매중" selected>판매중</option>
				<option value="판매완료">판매완료</option>
			</select>
		</div>
		<div class="d-flex">
			<span>상세 설명</span>
			<textarea id="content" class="form-control">${post.content}</textarea>
		</div>

		<div class="d-flex justify-content-between mt-3">
			<input type="file" id="file" accept=".jpg, .jpeg, .png, .gif">
			<div class="d-flex align-items-center mr-2">
				<a href="/post/post_detail_view?postId=${post.id}"><button type="button" id="cancelBtn">취소</button></a>
				<button type="button" id="updateBtn" data-post-id="${post.id}">수정완료</button>
			</div>
		</div>
	</div>
</div>
</c:if>

<c:if test="${post.postType eq '구매글'}">
<div class="write-post-wrap">
	<h5>물건 구매하기</h5>
	<div class="write-post-box">
		<input type="text" id="postType" value="구매글" class="d-none">
		<div class="input-box">
			<span>제목</span> 
			<input type="text" id="subject" class="form-control col-10" value="${post.subject}">
		</div>
		<div class="input-box">
			<span>구매 가격</span>
			<input type="text" id="price" class="form-control col-3 mr-2" value="${post.price}">원
		</div>
		<div class="input-box">
			<span>카테고리</span>
			<select id="categoryId" class="form-control col-4">
				<option value="카테고리 선택">카테고리 선택</option>
				<option value=1>패션·뷰티</option>
				<option value=2>식품·건강</option>
				<option value=3>생활·주방</option>
				<option value=4>가구·인테리어</option>
				<option value=5>디지털·가전</option>
				<option value=6>게임·컴퓨터</option>
				<option value=7>스포츠·자동차</option>
				<option value=8>도서·여행</option>
				<option value=9>반려동물·취미</option>
				<option value=10>기타</option>
			</select>
			<select id="status" class="selectPostStatus form-control col-2">
				<option value="구매중" selected>구매중</option>
				<option value="구매완료">구매완료</option>
			</select>
		</div>
		<div class="d-flex">
			<span>상세 설명</span>
			<textarea id="content" class="form-control">${post.content}</textarea>
		</div>

		<div class="d-flex justify-content-between mt-3">
			<input type="file" id="file" accept=".jpg, .jpeg, .png, .gif">
			<div class="d-flex align-items-center mr-2">
				<a href="/post/post_detail_view?postId=${post.id}"><button type="button" id="cancelBtn">취소</button></a>
				<button type="button" id="updateBtn" data-post-id="${post.id}">수정완료</button>
			</div>
		</div>
	</div>
</div>
</c:if>
<!-- TODO: select value 값 넣기, file 추가하지 않을 시 그대로 유지 -->
<script>
$(document).ready(function() {
	// 수정 버튼 클릭
	$("#updateBtn").on('click', function() {
		let postId = $(this).data('post-id');
		let postType = $("#postType").val();
		let subject = $("#subject").val();
		let price = $("#price").val().trim();
		let categoryId = $("#categoryId").val();
		let status = $("#status").val();
		let content = $("#content").val();
		let file = $("#file").val();
		
		// validation
		if (!subject) {
			alert("제목을 입력해주세요.");
			return;
		}
		if (!price) {
			alert("가격을 입력해주세요.");
			return;
		}
 		if (categoryId == "카테고리 선택") {
			alert("카테고리를 선택해주세요.");
			return;
		}
		if (!content) {
			alert("내용을 입력해주세요.");
			return;
		}
		
		// 파일이 업로드 된 경우에만 확장자 체크
		if (file) {
			let ext = file.split(".").pop().toLowerCase();
			if ($.inArray(ext, ['jpg', 'jpeg', 'png', 'gif']) == -1) {
				alert("이미지 파일만 업로드 할 수 있습니다.");
				$("#file").val('');
				return;
			}
		}
		
		// AJAX 요청
		let formData = new FormData();
		formData.append("postId", postId);
		formData.append("postType", postType);
		formData.append("subject", subject);
		formData.append("price", price);
		formData.append("categoryId", categoryId);
		formData.append("status", status);
		formData.append("content", content);
		formData.append("file", $("#file")[0].files[0]);
		
		$.ajax({
			type:"PUT"
			, url:"/post/update"
			, data:formData
			, enctype:"multipart/form-data"
			, processData:false
			, contentType:false
			, success:function(data) {
				if (data.code == 1) {
					alert("글이 수정되었습니다.");
					location.href = "/post/post_detail_view?postId=" + postId
				} else {
					alert(data.errorMessage);
				}
			}
			, error:function(request, status, error) {
				alert("글을 수정하는데 실패했습니다.");
			}
		});
	});
});
</script>