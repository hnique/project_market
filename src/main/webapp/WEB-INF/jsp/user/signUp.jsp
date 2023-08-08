<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- bootstrap -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<!-- style sheet -->
<link rel="stylesheet" type="text/css" href="/static/css/style.css">
</head>
<body>
	<div class="container">
		<div class="sign-up-title text-center">
			<h5>회원가입</h5>
		</div>
		<form id="signUpForm" method="post" action="/user/sign_up">
			<div class="d-flex justify-content-center">
				<div class="sign-up-box">
					<!-- 아이디 -->
					<div class="d-flex align-items-center justify-content-between">
						<span class="sign-up-subject mr-4">아이디</span>
						<input type="text" id="loginId" name="loginId" class="form-control" placeholder="아이디를 입력하세요">
						<button type="button" id="loginIdCheckBtn">중복확인</button>
					</div>
					<div class="mb-3">
						<div id="idCheck" class="warning-text d-none">아이디를 입력해주세요</div>
						<div id="idCheckLength" class="warning-text d-none">아이디를 4자 이상 입력해주세요.</div>
						<div id="idCheckDuplicated" class="warning-text d-none">이미 존재하는 아이디 입니다</div>
						<div id="idCheckOk" class="accept-text d-none">사용 가능한 아이디 입니다!</div>
					</div>
					
					<!-- 비밀번호 -->
					<div class="d-flex align-items-center justify-content-between">
						<span class="sign-up-subject">비밀번호</span>
						<input type="password" name="password" class="form-control" placeholder="비밀번호를 입력하세요">
					</div>
					<div class="mb-3">
						<div id="passwordCheck" class="warning-text d-none">비밀번호를 입력해주세요</div>
					</div>
					<div class="d-flex align-items-center justify-content-between">
						<span class="sign-up-subject">비밀번호 확인</span>
						<input type="password" name="confirmPassword" class="form-control" placeholder="비밀번호를 다시 입력하세요">
					</div>
					<div class="mb-3">
						<div id="passwordConfirmCheck" class="warning-text d-none">비밀번호를 확인해주세요</div>
					</div>
					
					<!-- 이름 -->
					<div class="d-flex align-items-center justify-content-between">
						<span class="sign-up-subject">이름</span>
						<input type="text" name="name" class="form-control" placeholder="이름을 입력하세요">
					</div>
					<div class="mb-3">
						<div id="nameCheck" class="warning-text d-none">이름을 입력해주세요</div>
					</div>
					
					<!-- 휴대폰 번호 -->
					<div class="d-flex align-items-center justify-content-between">
						<span class="sign-up-subject">휴대폰 번호</span>
						<input type="text" name="phoneNumber" class="form-control" placeholder="휴대폰 번호를 입력하세요">
					</div>
					<div class="mb-3">
						<div id="phoneNumberCheck" class="warning-text d-none">휴대폰 번호를 입력해주세요</div>
					</div>
					
					<!-- 이메일 -->
					<div class="d-flex align-items-center justify-content-between">
						<span class="sign-up-subject">이메일</span>
						<input type="text" name="email" class="form-control" placeholder="이메일을 입력하세요">
					</div>
					<div class="mb-3">
						<div id="emailCheck" class="warning-text d-none">이메일을 입력해주세요</div>
					</div>
				</div>
			</div>
			
			<!-- 회원가입, 취소 버튼 -->
			<div class="sign-up-btn-box d-flex justify-content-center">
				<a href="/market/main_view"><button type="button" id="cancelSignUpBtn">취소</button></a>
				<button type="submit" id="signUpBtn">회원가입</button>
			</div>
		</form>
	</div>
	
<script>
$(document).ready(function(){
	// 중복확인 버튼 클릭
	$("#loginIdCheckBtn").on('click', function() {
		// 경고 문구 초기화
		$("#idCheckLength").addClass('d-none');
		$("#idCheckDuplicated").addClass('d-none');
		$("#idCheckOk").addClass('d-none');
		
		let loginId = $("#loginId").val().trim();
		if (loginId.length < 4) {
			$("#idCheckLength").removeClass('d-none');
			return;
		}
		
		// AJAX 통신 => 아이디 중복확인
		$.ajax({
			url:"/user/is_duplicated_id"
			, data:{"loginId":loginId}
			, success:function(data) {
				if (data.isDuplicatedId) {
					$("#idCheckDuplicated").removeClass('d-none');
				} else {
					$("#idCheckOk").removeClass('d-none');
				}
			}
			, error:function(request, status, error) {
				alert("중복확인에 실패했습니다.");
			}
		});
	});
	
	// 회원가입
	$("#signUpForm").on('submit', function(e){
		e.preventDefault();
		
		// 경고 문구 초기화
		$("#idCheck").addClass('d-none');
		$("#passwordCheck").addClass('d-none');
		$("#passwordConfirmCheck").addClass('d-none');
		$("#nameCheck").addClass('d-none');
		$("#phoneNumberCheck").addClass('d-none');
		$("#emailCheck").addClass('d-none');
		
		let loginId = $("#loginId").val().trim();
		let password = $("input[name=password]").val();		
		let confirmPassword = $("input[name=confirmPassword]").val();		
		let name = $("input[name=name]").val().trim();
		let phoneNumber = $("input[name=phoneNumber]").val().trim();
		let email = $("input[name=email]").val().trim();
		
		// validation
		if (!loginId) {
			$("#idCheck").removeClass('d-none');
			return false;
		}
		if (!password) {
			$("#passwordCheck").removeClass('d-none');
			return false;
		}
		if (password != confirmPassword) {
			$("#passwordConfirmCheck").removeClass('d-none');
			return false;
		}
		if (!name) {
			$("#nameCheck").removeClass('d-none');
			return false;
		}
		if (!phoneNumber) {
			$("#phoneNumberCheck").removeClass('d-none');
			return false;
		}
		if (!email) {
			$("#emailCheck").removeClass('d-none');
			return false;
		}
		
		// 아이디 중복확인 다시 체크
		if ($("#idCheckOk").hasClass('d-none')) {
			alert("아이디를 확인해주세요.");
			return false;
		}
		
		// AJAX 통신
		let url = $(this).attr('action');
		console.log(url);
		let params = $(this).serialize();
		console.log(params);
		
		$.post(url, params)
		.done(function(data) {
			if (data.code == 1) {
				alert("가입을 환영합니다! 로그인을 해주세요.");
				location.href = "/user/sign_in_view";
			} else {
				alert(data.errorMessage);
			}
		});
	});
});
</script>
</body>
</html>