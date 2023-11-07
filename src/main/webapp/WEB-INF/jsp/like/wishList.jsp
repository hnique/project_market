<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="d-flex justify-content-center">
	<div class="wish-list-box">
		<h5>${userName}님의 찜 목록</h5>
		<table class="table">
			<thead>
			<tr>
				<th><input type="checkbox" id="allCheck" name="allCheck">전체선택</th>
				<th class="subject">제목</th>
				<th class="price">가격</th>
				<th class="delete"><button type="button" id="deleteBtn">삭제</button></th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${postList}" var="post">
			<tr>
				<td><input type="checkbox" name="rowCheck" value="${post.id}"></td>
				<td class="subject"><a href="/post/post_detail_view?postId=${post.id}">${post.subject}</a></td>
				<td class="price">${post.price}원</td>
				<td></td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
		<!-- 찜한 상품이 0개일 시 노출 -->
		<c:if test="${empty postList}">
			<div class="text-center">
				<div>찜한 상품이 없습니다.</div>
				<a href="/market/main_view"><button type="button" id="mainBtn">메인 이동</button></a>
			</div>
		</c:if>
	</div>
</div>

<script>
$(document).ready(function() {
	// 전체선택 클릭
	$("#allCheck").on('click', function() {
		var chk = $(this).is(':checked');
		console.log(chk);
		
		$("input[type=checkbox]").prop("checked", chk);
	});
	
	// 찜 목록 삭제
	$("#deleteBtn").on('click', function() {
		var chk = $("input[type=checkbox]:checked");
		
		if (chk.length < 1) {
			alert("삭제할 글을 선택해주세요.");
			return false;
		}
		
		var idList = new Array();
		$.each(chk, function(k, v) {
			idList.push($(this).val());
		});
		console.log(idList);
		
		$.ajax({
			type:"delete",
			url:"/like/delete",
			data:{"idList":idList},
			success:function(data) {
				if (data.code == 1) {
					alert("선택한 게시글을 삭제했습니다.");
					location.reload();
				} else {
					alert(data.errorMessage);
				}
			}
		});
	});
});
</script>