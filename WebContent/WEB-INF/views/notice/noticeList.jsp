<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 부트스트림4 지원 메타 포트 -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트림4 지원 메타 포트 종료-->
<title>Insert title here</title>
<!--    부트스트랩(다운)과 jQuery 불러오기-->
<script type="text/javascript" src="/js/jquery-3.3.1.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
<link type="text/css" rel="stylesheet" href="/css/bootstrap.min.css" />
<!--    부트스트랩(다운)과 jQuery 불러오기 종료-->

<!-- 구글 폰트 링크-->
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Jua&display=swap" rel="stylesheet">
<!--구글 폰트 링크 종료-->

<!-- header,footer,noticeList 링크-->
<link rel="stylesheet" href="/css/notice/noticeList.css">
<link rel="stylesheet" href="/css/header/header.css">
<link rel="stylesheet" href="/css/footer/footer.css">

<!--  header,footer 종료  -->

</head>
<style>
* {
	font-family: 'Jua', sans-serif;
}
	.question_tap{
background-color: #ffac05 ;
border-radius: 5px;
}
.question_tap1:hover{
	color:#4a2100;
}
</style>
<script>
	function function1() {
		var type = document.getElementById("type");

		if (type.value == "none") {
			alert("검색할 타입을 설정해주세요.");
			$("#searchKeyword").val("");

			return false;
		}
		var searchKeyword = document.getElementById("searchKeyword");
		var regal;
		regal = /^[0-9]$/;

		if (type.value == "noticeNo" && (!regal.test(searchKeyword.value))) {

			alert("숫자를 입력하세요.");
			$("#searchKeyword").val("");

			return false;
		}

	}

	$(function() {
		$("#searchKeyword").focusin(function() {
			$(this).val("");

		});

	});

	function link() {
		location.href = "/noticeWrite";
	}
</script>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<div class="wrapped">
		<div class="title_notice">
			<h2 class="">공지사항</h2>
			<div class="form_div" >

				<c:if test="${sessionScope.member.memberId=='admin' }">
				<button class="btn btn-dark write " onclick="link();">글쓰기</button>
				</c:if>
				<form class="button_side f-right" action="/searchNotice"
					method="get">
					<select class="select_option" name="type" id="type">
						<option selected value="none">선택하기</option>
						<option value="noticeNo" id="noticeNo">글번호</option>
						<option value="noticeTitle">제목</option>
					</select> <input type="text" name="keyword" id="searchKeyword">
					<button type="submit"
						class="btn btn-dark notice_search notice_search"
						onclick="return function1();">검색</button>
				</form>
			</div>
		</div>
		<div class="community_sideTap" id="sideTap">
			<div class="sideTap_a1">
				<a href="/noticeList?reqPage=1" class="question_tap question_tap1">공지사항</a>
			</div>
			<div class="sideTap_a1">
				<a href="/questionList?reqPage=1" class="question_tap1">자주 묻는 질문</a>
			</div>
			<div class="sideTap_a1">
				<a href="reviewList?reqPage=1" class="question_tap1" >리뷰게시판</a>
			</div>
		</div>

		<div id="table">
			<table class="table table-striped">
				<thead>
					<tr>
						<th class="table_no fnt1">번호</th>
						<th class="table_title fnt1">제목</th>
						<th class="table_writer fnt1">작성자</th>
						<th class="table_date fnt1">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list }" var="n">
						<tr>
							<td class="table_no fnt1">${n.noticeNo }</td>
							<td class="table_title fnt1"><a class="notice_title fnt1"
								href="/noticeView?noticeNo=${n.noticeNo}">${n.noticeTitle }</a></td>
							<td class="table_writer fnt1">${n.noticeWriter }</td>
							<td class="table_date fnt1">${n.noticeDate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="pageNavi">
				<span>${pageNavi }</span><br><br>
			</div>

		</div>
	</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	

</body>

</html>
