<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="my-page-wrap">
	<h5>마이페이지</h5>
	<ul class="nav nav-tabs" id="myPageTab">
		<li class="nav-item">
			<button class="nav-link active" id="sale-history-tab" data-toggle="tab"
				data-target="#saleHistory" type="button">나의 판매내역</button>
		</li>
		<li class="nav-item">
			<button class="nav-link" id="buy-history-tab" data-toggle="tab"
				data-target="#buyHistory" type="button">나의 구매내역</button>
		</li>
	</ul>
	<div class="tab-content" id="myPageTabContent">
		<!-- 판매내역 -->
		<div class="tab-pane fade show active" id="saleHistory">
			<div class="tab-nav-box">
				<input type="radio" class="tab-radio" name="sale-tab-btn" id="allSaleHistory" checked>
				<label for="allSaleHistory" class="tab-label">전체</label>
				<!-- 반복문 질문할것: 게시글이 하나만 보여짐 -->
				<div class="tab-content-box">
				<table>
					<thead>
						<tr>
							<th>제목</th>
							<th>가격</th>
							<th>날짜</th>
							<th>상태</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach items="${postList}" var="post">
						<tr>
							<td>${post.subject}</td>
							<td>${post.price}원</td>
							<td>
								<fmt:parseDate value="${post.createdAt}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedCreatedAt" />
								<fmt:formatDate value="${parsedCreatedAt}" pattern="yyyy-MM-dd" />
							</td>
							<td>${post.status}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				</div>
				<input type="radio" class="tab-radio" name="sale-tab-btn" id="saleProgressHistory">
				<label for="saleProgressHistory" class="tab-label">판매중</label>
				<div class="tab-content-box">
					판매중
				</div>
				<input type="radio" class="tab-radio" name="sale-tab-btn" id="closeSaleHistory">
				<label for="closeSaleHistory" class="tab-label">판매완료</label>
				<div class="tab-content-box">
					판매완료
				</div>
			</div>
		</div>
		
		<!-- 구매내역 -->
		<div class="tab-pane fade" id="buyHistory">
			<div class="tab-nav-box">
				<input type="radio" class="tab-radio" name="buy-tab-btn" id="allBuyHistory" checked>
				<label for="allBuyHistory" class="tab-label">전체</label>
				<div class="tab-content-box">
					구매전체
				</div>
				<input type="radio" class="tab-radio" name="buy-tab-btn" id="buyProgressHistory">
				<label for="buyProgressHistory" class="tab-label">구매중</label>
				<div class="tab-content-box">
					구매중
				</div>
				<input type="radio" class="tab-radio" name="buy-tab-btn" id="closeBuyHistory">
				<label for="closeBuyHistory" class="tab-label">구매완료</label>
				<div class="tab-content-box">
					구매완료
				</div>
			</div>
		</div>
	</div>
</div>
