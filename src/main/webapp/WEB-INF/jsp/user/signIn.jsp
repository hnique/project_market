<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<!-- bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<!-- Box icons -->
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
<!-- style sheet -->
<link rel="stylesheet" type="text/css" href="/static/css/style.css">
</head>
<body>
	<div class="d-flex justify-content-center">
		<div class="sign-in-wrap">
			<form id="loginForm" action="/user/sign_in" method="post">
				<a href="/market/main_view"><h1>사이트명</h1></a>
				<div class="sign-in-box">
					<input type="text" name="loginId" placeholder="Username">
					<i class='bx bxs-user'></i>
				</div>
				<div class="sign-in-box">
					<input type="password" name="password" placeholder="Password">
					<i class='bx bxs-lock-alt'></i>
				</div>
				
				<button type="submit" class="loginBtn">로그인</button>
				<div class="sign-up-link">
					<a href="/user/sign_up_view">회원가입</a>
				</div>
			</form>
		</div>
	</div>
<script>
$(document).ready(function() {
	// 로그인
	$("#loginForm").submit(function(e) {
		e.preventDefault();
		
		let loginId = $('input[name=loginId]').val().trim();
		let password = $('input[name=password]').val();
		
		if (!loginId) {
			alert("아이디를 입력해주세요.");
			return;
		}
		if (!password) {
			alert("비밀번호를 입력해주세요.");
			return;
		}
		
		// AJAX로 서브밋
		let url = $(this).attr('action');
		let data = $(this).serialize();
		
		$.post(url,data)
		.done(function(data) {
			if (data.result == "성공") {
				location.href = "/market/main_view";
			} else {
				alert("아이디 또는 비밀번호가 일치하지 않습니다.");
			}
		});
	});
});
</script>
</body>
</html>