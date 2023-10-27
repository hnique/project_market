<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="d-flex justify-content-center">
	<div class="post-list-box">
		<span>홈 &nbsp;>&nbsp; 검색 &nbsp;></span>
		<span class="key-word">${keyword}</span>
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
			<c:forEach items="${searchList}" var="search">
			<tr>
				<td>[${search.category}]</td>
				<td class="subject"><a href="/post/post_detail_view?postId=${search.post.id}">${search.post.subject}</a></td>
				<td class="price">${search.post.price}원</td>
				<td class="date-td">
					<fmt:parseDate value="${search.post.createdAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedCreatedAt"/>
					<fmt:formatDate value="${parsedCreatedAt}" pattern="yyyy-MM-dd"/>
				</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
		<!-- 검색 결과가 0개일 시 노출 -->
		<c:if test="${empty searchList}">
			<div class="text-center mt-5">
				<div>검색 결과가 없습니다.</div>
				<a href="/market/main_view"><button type="button" id="mainBtn">메인 이동</button></a>
			</div>
		</c:if>
	</div>
</div>
