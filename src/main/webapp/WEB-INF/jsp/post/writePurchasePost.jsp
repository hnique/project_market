<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="write-post-wrap">
	<h5>물건 구매하기</h5>
	<div class="write-post-box">
		<form id="postWriteForm" action="/post/write" method="post">
			<div class="input-box">
				<span>제목</span>
				<input type="text" name="subject" class="form-control col-10" placeholder="제목을 입력해주세요">
			</div>
			<div class="input-box">
				<span>구매 가격</span>
				<input type="text" name="price" class="form-control col-3 mr-2" placeholder="가격을 입력해주세요">원
			</div>
			<div class="input-box">
				<span>카테고리</span>
				<select name="categoryId" class="form-control col-4">
					<option selected>카테고리 선택</option>
					<option>카테고리</option>
				</select>
			</div>
			<div class="d-flex">
				<span>상세 설명</span>
				<textarea id="summernote" name="content"></textarea>
			</div>
			
			<button type="submit" class="writePostBtn">등록</button>
		</form>
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