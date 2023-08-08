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