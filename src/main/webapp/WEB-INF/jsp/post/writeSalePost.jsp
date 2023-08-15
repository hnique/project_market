<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="write-post-wrap">
	<h5>물건 판매하기</h5>
	<div class="write-post-box">
		<input type="text" id="postType" value="판매글" class="d-none">
		<div class="input-box">
			<span>제목</span> 
			<input type="text" id="subject" class="form-control col-10" placeholder="제목을 입력하세요">
		</div>
		<div class="input-box">
			<span>판매 가격</span>
			<input type="text" id="price" class="form-control col-3 mr-2" placeholder="가격을 입력하세요">원
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
				<option value="판매중" selected>판매중</option>
				<option value="판매완료">판매완료</option>
			</select>
		</div>
		<div class="d-flex">
			<span>상세 설명</span>
			<textarea id="content" class="form-control"></textarea>
		</div>

		<div class="d-flex justify-content-between mt-3">
			<input type="file" id="file" class="filebtn" accept=".jpg, .jpeg, .png, .gif">
			<button type="button" id="postWriteBtn">등록</button>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	// 게시글 등록
	$("#postWriteBtn").on('click', function() {
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
		if (file != "") {
			let ext = file.split(".").pop().toLowerCase();
			if ($.inArray(ext, ['jpg', 'jpeg', 'png', 'gif']) == -1) {
				alert("이미지 파일만 업로드 할 수 있습니다.");
				$("#file").val('');
				return;
			}
		}
		
		// AJAX 요청
		let formData = new FormData();
		formData.append("postType", postType);
		formData.append("subject", subject);
		formData.append("price", price);
		formData.append("categoryId", categoryId);
		formData.append("status", status);
		formData.append("content", content);
		formData.append("file", $("#file")[0].files[0]);
		
		$.ajax({
			type: "POST"
			, url: "/post/write"
			, data: formData
			, enctype: "multipart/form-data"
			, processData: false
			, contentType: false
			, success: function(data) {
				if (data.code == 1) {
					alert("판매글이 등록되었습니다.");
					location.href = "/market/main_view" // 게시글 상세페이지로 변경하기
				} else {
					alert(data.errorMessage);
				}
			}
			, error: function(request, status, error) {
				alert("글을 저장하는데 실패했습니다.");
			}
		});
	});
});
</script>