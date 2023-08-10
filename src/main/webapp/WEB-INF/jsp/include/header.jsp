<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- top menu -->
<div class="top-menu">
	<!-- 로그인 전 -->
	<c:if test="${empty userId}">
		<div class="d-flex justify-content-end">
			<a href="/user/sign_up_view"><button id="signUpBtn" type="button" class="my-3">회원가입</button></a>
			<a href="/user/sign_in_view"><button id="signInBtn" type="button" class="mx-2 my-3">로그인</button></a>
		</div>
	</c:if>
	
	<!-- 로그인 후 -->
	<c:if test="${not empty userId}">
		<div class="d-flex justify-content-end pt-1">
			<span class="my-3">${userName}님</span>
			<a href="/user/sign_out"><button id="logoutBtn" type="button" class="ml-4 mr-2">로그아웃</button></a>
		</div>
	</c:if>
</div>

<div class="middle-menu d-flex">
	<!-- logo -->
	<div class="logo col-3 d-flex justify-content-center align-items-center">
		<a href="/market/main_view"><h2 class="font-weight-bold">사이트명</h2></a>
	</div>
	
	<!-- search bar -->
	<div class="search col-6 d-flex justify-content-center align-items-center">
		<input type="text" class="form-control" placeholder="어떤 상품을 찾으시나요?">
		<img id="searchBtn" src="https://www.iconninja.com/files/567/43/720/search-icon.png" alt="검색아이콘">
	</div>
	
	<!-- icon -->
	<div class="icon col-3 d-flex justify-content-around align-items-center">
		<!-- 회원정보 수정 -->
		<div class="userIcon">
			<a href="/user/update_info_view"><img src="https://www.iconninja.com/files/66/635/783/user-icon.png" alt="프로필아이콘" width="35px"></a>
		</div>
		
		<!-- 찜 목록 -->
		<div class="wishIcon">
			<a href="#"><img src="https://www.iconninja.com/files/937/385/150/hearts-icon.png" alt="찜목록아이콘" width="35px"></a>
		</div>
		
		<!-- 알림 목록 -->
		<div class="alarmIcon">
			<a href="#"><img src="https://www.iconninja.com/files/198/215/818/bell-2-icon.png" alt="알림목록아이콘" width="35px"></a>
		</div>
	</div>
</div>

<!-- nav -->
<nav class="menu">
	<ul class="nav nav-fill pt-1">
		<li id="categoryBtn"><a href="#" class="nav-link ml-3"><img src="/static/image/menu_icon.png" width="30px"></a></li>
		<li class="nav-item"><a href="/post/write_sale_post_view" class="nav-link menu-text">판매등록</a></li>
		<li class="nav-item"><a href="/post/write_purchase_post_view" class="nav-link menu-text">구매등록</a></li>
		<li class="nav-item"><a href="/post/my_page_view" class="nav-link menu-text">마이페이지</a></li>
		<li class="nav-item"><a href="#" class="nav-link menu-text">채팅</a></li>
	</ul>
</nav>

<script>
$(document).ready(function() {
	$("#searchBtn").on('click', function() {
		alert("검색클릭");
	});
});
</script>