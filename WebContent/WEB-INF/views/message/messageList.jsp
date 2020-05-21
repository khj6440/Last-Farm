<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 부트스트림4 지원 메타 포트 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트림4 지원 메타 포트 종료-->
<title>Insert title here</title>
<!--    부트스트랩(다운)과 jQuery 불러오기-->
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet" href="/css/bootstrap.min.css" />
<!--    부트스트랩(다운)과 jQuery 불러오기 종료-->	

<!-- 구글 폰트 링크-->
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Jua&display=swap"
	rel="stylesheet">
<!--구글 폰트 링크 종료-->
</head>
<style>
	
</style>
<body>
	
	<div class="wrapped">
		<c:if test="${not empty check }">
			<button class="btn btn-dark" onclick="location.href='/messageList?reqPage=1&memberId=${sessionScope.member.memberId }'">받은쪽지함</button>
			<div class="title_notice">
				<h2 class="fnt2">보낸쪽지함</h2>
			</div>
			<div id="table">
				<table class="table table-striped">
					<thead>
						<tr>
							<th class="table_no fnt1">번호</th>
							<th class="table_title fnt1">제목</th>
							<th class="table_writer fnt1">받은사람</th>
							<th class="table_date fnt1">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="msg">
							<tr>
								<td class="table_no fnt1">${msg.msgNo }</td>
								<td class="table_title fnt1"><a class="notice_title fnt1"
									href="/#">${msg.msgTitle }</a></td>
								<td class="table_writer fnt1">${msg.msgReceiveId }</td>
								<td class="table_date fnt1">${msg.msgDate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="pageNavi">
					<span>${pageNavi }</span>
				</div>
		</c:if>
		<c:if test="${ empty check }">
			<button class="btn btn-dark" onclick="location.href='/messageList?check=1&reqPage=1&memberId=${sessionScope.member.memberId }'">보낸쪽지함</button>
			<div class="title_notice">
				<h2 class="fnt2">받은쪽지함</h2>
			</div>
			<div id="table">
				<table class="table table-striped">
					<thead>
						<tr>
							<th class="table_no fnt1">번호</th>
							<th class="table_title fnt1">제목</th>
							<th class="table_writer fnt1">보낸사람</th>
							<th class="table_date fnt1">작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${list }" var="msg">
							<tr>
								<td class="table_no fnt1">${msg.msgNo }</td>
								<td class="table_title fnt1"><a class="notice_title fnt1"
									href="/#">${msg.msgTitle }</a></td>
								<td class="table_writer fnt1">${msg.msgSendId }</td>
								<td class="table_date fnt1">${msg.msgDate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="pageNavi f-cnt">
					<span>${pageNavi }</span>
				</div>
		</c:if>
	</div>
</body>
</html>