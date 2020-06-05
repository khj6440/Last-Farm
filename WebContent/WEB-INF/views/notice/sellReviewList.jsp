<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>리뷰 게시판</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>



<style>
.community_body {
	margin: 0 auto;
	width: 1280px;
	magin-right: -100px;
	list-style: none;
	font-family: 'Jua', sans-serif;
}

.community_sideTap {
	width: 20%;
	float: left;
	margin-top: 12%;
	margin-left: -100px;
}

.community_content {
	width: 70%;
	margin-left: 15%;
}

.question {
	width: 100%;
}

.question_h1 {
	text-align: center;
}

.question_List {
	width:100%;
	height: 200px;
	line-height: 58px;
}

.question_sub1 {
	list-style: none;
	position: relative;
	margin-left: -10%;
}

.question_sub2 {
	padding: 0;
	display: none;
	margin-left: 2%;
}

.question_li3 {
	list-style: none;
	border: 1px solid gray;
	border-radius: 10px;
	width: 100%;
	margin-left: -2%;
}

.question_btn1 {
	margin-left: 55%;
}

.btn3 {
	margin-left: 87%;
	margin-top: 2%;
}

.question_li1 {
	border-bottom: 0.1px solid #D9D4CF;
}

.sideTap_a1 {
	border-bottom: 0.1px solid #D9D4CF;
	margin: 50px;
	text-align: center;
}

.sideTap_a1>a {
	text-decoration: none;
	font-size: 20px;
	font-weight: bold;
	color: black;
	display: block;
}

.question_add {
	position: absolute;
	text-decoration: none;
	color: white;
	border: 0.1px solid black;
	margin-left: 40px;
}

#pageNavi {
	font-size: 30px;
	text-align: center;
	width: 1000px;
	margin: 0 auto;
	margin-top: -80px;
}

.d2 {
	height: 200px;
	width: 200px;
	
}


.question_d1 {
	margin-left: 200px;
	margin-top: -200px;
}

.d3 {
	height: 90%;
	width: 500px;
}

.table {
	height: 100px;
}

.table-wrapper {
	width: 1000px;
	margin: 0 auto;
}

.table-wrapper th {
	width: 300px;
}

.d4 {
	height: 300px;;
	width: 500px;
	float: left;
}

.d1 {
	height: 100%;
	width: 810px;
	
}


.table-wrapper {
	width: 1000px;
	margin: 0 auto;
}

.table-wrapper th {
	width: 300px;
}

.table-wrapper, .comment-write, .comment-wrapper {
	width: 1000px;
	margin: 0 auto;
}

.commentList {
	width: 100%;
	clear: both;
	border: 1px solid #ccc;
	border-radius: 5px;
	overflow: hidden;
}

.commentList>li {
	float: left;
	color: black;
}

.question_select {
	position: static;
	margin-left: 365px;
	width: 100px;
	margin-top: 0px;
}

.question_tap {
	background-color: #ffac05;
	border-radius: 5px;
}

.question_tap1:hover {
	color: #4a2100;
}


.review_a11 {
	margin-left: 30px;
}

.d1_table{
	height: 14%;
}

</style>
<script>
	function sellContent(reviewBuyEndNo) {
		location.href = "/sellContentFrm?reviewBuyEndNo=" + reviewBuyEndNo;
	}
</script>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<section class="container1">
	<div class="community_body">
		 <div class="community_sideTap">
			<div class="sideTap_a1">
				<a href="#" class="question_tap1">공지사항</a>
			</div>
			<div class="sideTap_a1">
				<a href="/questionList?reqPage=1" class="question_tap1">자주 묻는 질문</a>
			</div>
			<div class="sideTap_a1">
				<a href="/reviewList?reqPage=1" class="question_tap question_tap1">리뷰게시판</a>
			</div>
		</div> 
		<div class="community_content">
			<br> <br>
			<h1 class="question_h1" style="font-weight: bold">판매 글</h1>
			<br>
			<table class="table table-striped">
				<tr>
					<td colspan="5"><div class="d4">
							<a class="a11"><img class="header_top_logo1"
								src="/imgs/${sessionScope.sellEnd.thumbnail }"></a>
						</div></td>
				</tr>
				<tr>
					<td colspan="4"><h1 style="font-weight: bold;">제목 :
							${sessionScope.sellEnd.sellEndTitle }</h1></td>
				</tr>
				<tr>
					<td colspan="4">내용 : ${sessionScope.sellEnd.sellEndContent }</td>
				</tr>
				<tr style="text-align: center;">
					<td>작성자 : ${sessionScope.sellEnd.sellEndWriter }</td>
					<td>판매 날짜 : ${sessionScope.sellEnd.sellDate }</td>
					<td>판매 완료 날짜 : ${sessionScope.sellEnd.sellEndDate }</td>
					<td>평점 : ${sessionScope.memberScore}점</td>
				</tr>
				<tr>
					<th colspan="4" style="text-align: center;"><h1
							style="font-weight: bold;">리뷰</h1></th>
				</tr>
			</table>
			<div class="question">
				
					<c:forEach items="${list }" var="n">
					<div class="d2">

									<c:if test="${not empty n.reviewFilepath }">
										<a class=""><img class="header_top_logo1"
											src="/imgs/${n.reviewFilepath }"></a>
									</c:if>
									<c:if test="${empty n.reviewFilepath }">
										<a class="">사진이 없습니다.</a>
									</c:if>
								</div>
							<div class="question_d1">
									<table class="table table-striped d1_table">
										<tr>
											<th><a class="review_a11" style="font-weight: bold">${n.reviewTitle }</a></th>
										</tr>
										<tr>
											<td colspan="3"><a class="review_a11">${n.reviewContent }</a></td>
										</tr>
										<tr class="ddddd">
											<td><a class="review_a11">작성자 : ${n.reviewWriter } |
													작성일 : ${n.reviewDate } | 평점 : ${n.reviewScore }점</a></td>
											</div>
										</tr>
									</table>
								</div>
	
					</c:forEach>
				
				 <br>
				<br>
				<br>
			</div>
		</div>

	</div>
	<form id="reviewInsertFrm">
		<input name="sellEndNo" type="hidden"> <input name="memberId"
			type="hidden"> <input name="sellEndWriter" type="hidden"
			value="${sessionScope.sellEnd.sellEndWriter}">
	</form>
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

	<script>
		function reviewInsert(sellEndNo) {
			var memberId = "${sessionScope.member.memberId}";
			var sellEndWriter = "${sessionScope.sellEnd.sellEndWriter}";
			var url = "/reviewInsertFrm";
			var title = "reviewInsertFrm";
			var status = "left=500px, top=100px, width=600px, height=550px, menubar=no, status=no, scrollbars=yes";
			var popup = window.open("", title, status);
			$("input[name=sellEndNo]").val(sellEndNo);
			$("input[name=memberId]").val(memberId);
			$("input[name=sellEndWriter]").val(sellEndWriter);
			$("#reviewInsertFrm").attr("action", url);
			$("#reviewInsertFrm").attr("method", "post");
			$("#reviewInsertFrm").attr("target", title);//새로 열린 popup창과 form태그를 연결
			$("#reviewInsertFrm").submit();
		}
	</script>

</body>

</html>