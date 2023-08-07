<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- top menu -->
<div class="top-menu">
	<!-- 로그인 전 -->
	<div class="d-flex justify-content-end align-items-end">
		<a href="#" id="signUpBtn">회원가입</a>
		<button id="signInBtn" type="button" class="btn btn-white">로그인</button>
	</div>
	<!-- 로그인 후 -->
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
			<a href="#"><img src="https://www.iconninja.com/files/66/635/783/user-icon.png" alt="프로필아이콘" width="35px"></a>
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
<nav>

</nav>

<script>
$(document).ready(function() {
	$("#searchBtn").on('click', function() {
		alert("버튼클릭");
	});
});
</script>