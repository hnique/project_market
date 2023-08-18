<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="d-flex justify-content-center">
	<div class="post-list-box">
		<span>홈 &nbsp;>&nbsp; 검색</span>
		<table class="table mt-2">
			<thead>
			<tr>
				<th class="category">카테고리</th>
				<th class="subject">제목</th>
				<th class="price">가격</th>
				<th class="date-th">등록일</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td>[반려동물·취미]</td>
				<td class="subject">가나다라마바사 제목입니다 제목~</td>
				<td class="price">1,500,000원</td>
				<td class="date-td">2023-08-24</td>
			</tr>
			</tbody>
		</table>
		<!-- 검색 결과가 0개일 시 노출 -->
		<c:if>
			<div class="text-center mt-5">
				<div>검색 결과가 없습니다.</div>
				<a href="/market/main_view"><button type="button" id="mainBtn">메인 이동</button></a>
			</div>
		</c:if>
	</div>
</div>