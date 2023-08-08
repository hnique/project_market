<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="d-flex justify-content-center">
	<div class="user-info-wrap">
		<div class="d-flex justify-content-center">
			<h5>회원정보 수정</h5>
		</div>
		<form id="updateInfoForm" action="/user/update_info" method="post">
			<div class="user-info-box">
				<span>신규 비밀번호</span>
				<input type="password" name="password">
			</div>
			<div class="user-info-box">
				<span>비밀번호 확인</span>
				<input type="password" name="confirmPassword">
			</div>
			<div class="user-info-box">
				<span>휴대폰 번호</span>
				<input type="text" name="phoneNumber" value="${user.phoneNumber}">
			</div>
			<div class="user-info-box">
				<span>이메일</span>
				<input type="text" name="email" value="${user.email}">
			</div>
			
			<div class="user-info-btn-box mt-5">
				<div>
					<a href="/market/main_view">
						<button type="button" class="cancelUpdateInfoBtn">취소</button>
					</a>
				</div>
				<div><button type="submit" class="updateInfoBtn">수정완료</button></div>
			</div>
		</form> 
	</div>
</div>

<script>
$(document).ready(function() {
	// 수정완료
	$("#updateInfoForm").on('submit', function(e) {
		e.preventDefault();

		let password = $('input[name=password]').val();
		let confirmPassword = $('input[name=confirmPassword]').val();
		let phoneNumber = $('input[name=phoneNumber]').val().trim();
		let email = $('input[name=email]').val().trim();

		// validation
		if (password != confirmPassword) {
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
		if (!phoneNumber) {
			alert("휴대폰 번호를 입력해주세요.");
			return false;
		}
		if (!email) {
			alert("이메일을 입력해주세요.");
			return false;
		}
		
		// AJAX 요청
		let url = $(this).attr('action');
		let params = $(this).serialize();
		
		$.post(url, params)
		.done(function(data) {
			if (data.code == 1) {
				alert("회원정보가 수정되었습니다.")
				location.reload(true);
			} else {
				alert("회원정보를 수정하는데 실패했습니다.");
			}
		});
	});
});
</script>