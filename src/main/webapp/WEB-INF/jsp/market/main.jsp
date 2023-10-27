<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="img-box">
	<span>배너</span>
</div>
<div class="goods-list d-flex flex-wrap justify-content-between">
	<c:forEach var="post" items="${postList}">
		<div class="goods-box">
			<div><img src=""></div>
			<div><span>${post.subject}</span></div>
			<div><span>${post.price}원</span></div>
		</div>
	</c:forEach>
</div>