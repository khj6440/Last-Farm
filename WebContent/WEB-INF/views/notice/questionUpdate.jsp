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

<link rel="stylesheet" href="/css/header/header.css">
<link rel="stylesheet" href="/css/footer/footer.css">

<style>
		#insertFrm{
			width:1000px;
			margin:0 auto;
		}
		.textarea1{
		 height:600px;
		 resize: none;
		}
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
.question_table{
	width: 895px;
	
}
.question_tap{
background-color: #ffac05 ;
border-radius: 5px;
}
.question_tap1:hover{
	color:#4a2100;
}
	</style>
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
			<h1 class="question_h1" style="font-weight: bold">자주 묻는 질문 수정</h1><br>
		<form action="/questionUpdate" method="post" id="insertFrm">
			<table class="table table-bordered question_table">
			<input type="hidden" name="questionRef" value="${question.questionNo }">
				<tr>
					<th>제목</th>
					<td><input type="text" class="form-control" name="questionTitle" value="${question.questionTitle }"></td>
				</tr>
				
					<th>내용</th>
					<td><textarea class="textarea1" name="questionContent" rows="5" style="width:100%;">${question.questionContent }</textarea></td>
				</tr>
				<tr style="text-align:center;">
					<th colspan="2">
						<button type="submit" class="btn btn-outline-primary">등록</button>
						<button type="reset" href="/questionList" class="btn btn-outline-primary">취소</button>					
					</th>
				</tr>
			</table>
		</form>
		</div>
		</div><br>
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
		<script>
	$(function() {
		$(".question_li1").click(function() {

			$(".question_sub2").hide();
			$(this).find(".question_sub2").show();
			$("#pageNavi").css("margin-top","0px");
			$(".community_content").css("height","1000px");
		});
	});
	
	function deleteQuestion(questionNo){
		location.href="/questionDelete?questionNo="+questionNo;
	}
	
	function updateQuestion(questionNo){	
		location.href="/questionUpdateFrm?questionNo="+questionNo;
	}
</script>
</body>
</html>