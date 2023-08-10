<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="write-post-wrap">
	<h5>물건 판매하기</h5>
	<div class="write-post-box">
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
				<option value=1>전자기기</option>
			</select>
			<select id="status" class="selectPostStatus form-control col-2">
				<option value="판매중" selected>판매중</option>
				<option value="판매완료">판매완료</option>
			</select>
		</div>
		<div class="d-flex">
			<span>상세 설명</span>
			<textarea id="summernote"></textarea>
		</div>

		<input type="text" id="postType" value="판매글" class="d-none">
		<button type="button" id="postWriteBtn">등록</button>
	</div>
</div>

<script>
$(document).ready(function() {
	// summernote 라이브러리
	$('#summernote').summernote({
		lang: 'ko-KR',
		placeholder: '내용을 작성하세요',
		tabsize: 2,
		width: 950,
		minHeight: 400,
		maxHeight: 500,
		callbacks: {
			onImageUpload: function(files) {
				uploadFile(files[0], this);
			}
		}
	});
	
	function uploadFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		
		$.ajax({
			data: data
			, type: "POST"
			, url: "/post/write"
			, enctype: "multipart/form-data"
			, contentType: false
			, processData: false
			, success: function(data) {
				$(editor).summernote("insertImage", data.url);
			}
		});
	}
	
	// 게시글 등록
	$("#postWriteBtn").on('click', function() {
		
		let subject = $("#subject").val();
		let price = $("#price").val().trim();
		let categoryId = $("#categoryId").val();
		let content = $("#summernote").val();
		let postType = $("#postType").val();
		let status = $("#status").val();
		
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
		
		// AJAX 요청
		let formData = new FormData();
		formData.append("subject", subject);
		formData.append("price", price);
		formData.append("categoryId", categoryId);
		formData.append("content", content);
		formData.append("postType", postType);
		formData.append("status", status);
		
		$.ajax({
			type: "POST"
			, url: "/post/write"
			, data: formData
			, success: function(data) {
				if (data.code == 1) {
					alert("판매글이 등록되었습니다.");
					location.href = "/market/main_view"
				} else {
					alert("게시글 등록에 실패했습니다.");
				}
			}
			, error: function(request, status, error) {
				alert("글을 저장하는데 실패했습니다.");
			}
		});
	});
});
</script>