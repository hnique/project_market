<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="d-flex justify-content-center">
	<div class="wish-list-box">
		<h5>userId님의 찜 목록(n개)</h5>
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
				<td><input type="checkbox" name="rowCheck"></td>
				<td class="subject"><a href="/post/post_detail_view?postId=${post.id}">${post.subject}</a></td>
				<td class="price">${post.price}원</td>
				<td class="delete"><i class='delete-btn bx bx-x'></i></td>
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
	// 삭제 구현 (전체, 선택삭제)
});
</script>