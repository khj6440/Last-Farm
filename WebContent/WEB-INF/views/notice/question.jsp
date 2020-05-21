
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
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>



<style>
.community_body {
	margin: 0 auto;
	width: 1280px;
	magin-right: -100px;
	font-family: 'Jua', sans-serif;
}

.community_sideTap {
	width: 20%;
	float: left;
	margin-top: 12%;
}

.community_content {
	width: 70%;
	height:900px;
	margin-left: 20%;
}

.question {
	width: 90%;
	height: 75%;
	margin-left: 5%;
}

.question_h1 {
	text-align: center;
}

.question_List {
	height: 58px;
	line-height: 58px;
	
}

.question_sub1 {
	list-style: none;
	position: relative;
	margin-left: -5%;
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
	width: 102.2%;
	margin-left: -2%;
	background-color: #dee2e6;
}


.question_search {
	margin-left: 513px;
	
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

.question_li2 {
	border-top: 0.1px solid #D9D4CF;
}

.question_add {
	position:absolute;
	text-decoration: none;
	color: white;
	border:0.1px  solid black;
	margin-left:40px;
}
#pageNavi{
	font-size:30px;
	text-align: center;
	width: 1000px;
	margin: 0 auto;
	margin-top: -80px;
}
.d1{
	text-align:right;
	margin-top:-7%;
	
}
.dd1{
	margin:20px;
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
	
	
	function deleteQuestion(questionNo){
		location.href="/questionDelete?questionNo="+questionNo;
	}
	
	function updateQuestion(questionNo){	
		location.href="/questionUpdateFrm?questionNo="+questionNo;
	}
	
	$(function() {
		$(".question_li1").click(function() {
			$(this).find(".question_sub2").toggle();
			$("#pageNavi").css("margin-top","0px");
			$(".community_content").css("height","1000px");
		});
	});
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<section class="container1">
	<div class="community_body">
		<div class="community_sideTap">
			<div class="sideTap_a1">
				<a href="/noticeList?reqPage=1" class="question_tap1">공지사항</a>
			</div>
			<div class="sideTap_a1">
				<a href="/questionList?reqPage=1" class="question_tap question_tap1">자주 묻는 질문</a>
			</div>
			<div class="sideTap_a1">
				<a href="reviewList?reqPage=1" class="question_tap1" >리뷰게시판</a>
			</div>
		</div>
		<div class="community_content">
			<br><br>
			<h1 class="question_h1" style="font-weight: bold">자주 묻는 질문</h1><br>
			
			
			<form action="/searchKeyword" method="post">
			<input type="hidden" name="reqPage" value="1">
			<c:if test="${sessionScope.member.memberId=='admin' }">
			<a class="question_add btn btn-dark" href="/questionWriteFrm">글쓰기</a>
			</c:if>
			<input type="text" class="question_search" name="keyword" value="${keyword }" placeholder="제목을 입력해주세요">
			<button type="submit" class="btn btn-outline-primary">검색</button>
			<a href="/questionList?reqPage=1" class="btn btn-outline-primary">전체 목록보기</a>
			</form>
			<!--<c:if test="${sessionScope.member.memberId=='admin' }">
				<a class="question_add" href="insertQuestion">글쓰기</a>
			</c:if>-->
			
			<div class="question">
				<ul class="question_sub1">
					<c:forEach items="${list }" var="n">
						<li class="question_li1 question_li2">
							<div class="question_List">
								<a style="font-weight: bold">Q${n.questionNo}. ${n.questionTitle }</a>
								<div class="d1">
									<c:if test="${sessionScope.member.memberId=='admin' }">
									<a class="question_update btn btn-outline-dark" href="javascript:void(0)" onclick="updateQuestion('${n.questionNo}')">수정</a>	
									<a class="question_del btn btn-outline-dark" href="javascript:void(0)" onclick="deleteQuestion('${n.questionNo}')">삭제</a>	
									</c:if>
								</div>
							</div>
							<ul class="question_sub2">
								<li class="question_li3"><div class="dd1"><a>${n.contentBr }</a></div></li>
							</ul>
						</li>
					</c:forEach>
					
				</ul>
			
			</div>
		
		</div>
	<div id="pageNavi">${pageNavi }</div><br><br>	
	</div>
	
	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	
</body>
</html>