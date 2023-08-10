<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="write-post-wrap">
	<h5>물건 구매하기</h5>
	<div class="write-post-box">
		<div class="input-box">
			<span>제목</span> 
			<input type="text" id="subject" class="form-control col-10" placeholder="제목을 입력하세요">
		</div>
		<div class="input-box">
			<span>구매 가격</span>
			<input type="text" id="price" class="form-control col-3 mr-2" placeholder="가격을 입력하세요">원
		</div>
		<div class="input-box">
			<span>카테고리</span>
			<select id="categoryId" class="form-control col-4">
				<option value="카테고리 선택">카테고리 선택</option>
				<option value=1>전자기기</option>
			</select>
			<select id="status" class="selectPostStatus form-control col-2">
				<option value="구매중" selected>구매중</option>
				<option value="구매완료">구매완료</option>
			</select>
		</div>
		<div class="d-flex">
			<span>상세 설명</span>
			<textarea id="summernote"></textarea>
		</div>

		<input type="text" id="postType" value="구매글" class="d-none">
		<button type="button" id="postWriteBtn">등록</button>
	</div>
</div>

<script>
$(document).ready(function() {
	// summernote 라이브러리
	$('#summernote').summernote({
		lang: 'ko-KR',
		placeholder: '내용을 작성해주세요',
		tabsize: 2,
		width: 950,
		minHeight: 400,
		maxHeight: 500,
		callbacks: {
			onImageUpload: function(files) {
				
			}
		}
	});
});
</script>