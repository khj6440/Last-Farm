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
}

.community_content {
	width: 70%;
	height: 950px;
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
	height: 200px;
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
	height: 100%;
	width: 200px;
	float: left;
}

.question_d1 {
	height: 100%;
	width: 810px;
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
	list-style: none;
	line-height: 300%;
}

.commentList>li {
	float: left;
	color: black;
}

.question_select {
	position: static;
	margin-left: 407px;
	width: 100px;
	margin-top: 0px;
}

.reviewCommentContent {
	width: 92%;
}

.dd1 {
	margin: 20px;
}

.d1_table {
	margin-top: 20px;
	width: 75%;
	height: 90%;
}

.ddd1 {
	margin-left: 85%;
}

.ddddd {
	line-height: 50%;
}
.sell_Content{
	margin-left: -100px;
}
.question_tap{
background-color: #ffac05 ;
border-radius: 5px;
}
.question_tap1:hover{
	color:#4a2100;
}
.review_a11{
	margin-left:10px;
	
}
</style>
<script>
	function sellContent(reviewBuyEndNo) {
		location.href = "/sellContentFrm?reviewBuyEndNo=" + reviewBuyEndNo;
	}
	$(function() {
		$(".question_li1").click(function() {

			$(".question_sub2").hide();
			$(this).find(".question_sub2").show();
			$("#pageNavi").css("margin-top", "0px");
			$(".community_content").css("height", "1000px");
		});
	});

	function updateComment(obj,reviewCommentNo,reviewRef){
		$(obj).prev().hide();
		$(obj).html("수정완료");
		$(obj).attr('onclick','modifyComplete(this,"'+reviewCommentNo+'","'+reviewRef+'")');
		$(obj).next().html("취소");
		$(obj).next().attr('onclick','modifyCancel(this,"'+reviewCommentNo+'","'+reviewRef+'")');
		$(obj).parent().parent().find('input').show();
		$(obj).parent().parent().find('input').prev().hide();
	}
	
	function modifyComplete(obj,reviewCommentNo,reviewRef){
	      var $form=$("<form action='/reviewCommentUpdate' method='post'></form>"); 
	         $form.append($("<input type='text' name='reviewCommentNo' value='"+reviewCommentNo+"'>"));
	        
	         $form.append($("<input type='text' name='reviewRef' value='"+reviewRef+"'>"));
	         $form.append($(obj).parent().parent().find('input'));
	         $('body').append($form);
	         $form.submit();
	         
		
	}
	
	function deleteComment(reviewCommentNo){
	
		location.href="/reviewCommentDelete?reviewCommentNo="+reviewCommentNo;
	}
	
	function warningComment(reviewCommentNo,reviewCommentWarning){
	
		location.href="/reviewCommentWarning?reviewCommentNo="+reviewCommentNo+"&reviewCommentWarning="+reviewCommentWarning;
		
	}
	
	function reviewWarning(reviewNo,reviewWarning){
		
		location.href="/reviewWarning?reviewNo="+reviewNo+"&reviewWarning="+reviewWarning;
		
	}
	
	function reviewDelete(reviewNo){
		
		location.href="/reviewDelete?reviewNo="+reviewNo;
		
	}
	
	
	
</script>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<section class="container1">
	<div class="community_body">
		<div class="community_sideTap">
			<div class="sideTap_a1">
				<a href="/noticeList?reqPage=1" class="question_tap1">공지사항</a>
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
			<h1 class="question_h1" style="font-weight: bold">리뷰 게시판</h1>
			<br>
			<form action="/reviewSearch" method="post">
			
				<div class="search_tap">
				<input type="hidden" name="reqPage" value="1">
					<select name="type" class="question_select">
						<option value="id">아이디</option>
						<option value="title">제목</option>
						
					</select> <input type="text" class="question_search" name="keyword"
						value="${keyword }" placeholder="제목을 입력해주세요">
					<button type="submit" class="btn btn-outline-primary">검색</button>
					<a href="/reviewList?reqPage=1" class="btn btn-outline-primary">전체 목록보기</a>

				</div>
			</form>
			<div class="question">
				<ul class="question_sub1">
					<c:forEach items="${list }" var="n">
						<li class="question_li1 question_li2">
							<div class="question_List">
								<div class="d2">
								
								<c:if test="${not empty n.reviewFilepath }">
									<a class=""><img class="header_top_logo1"
										src="/imgs/${n.reviewFilepath }"></a>
										</c:if>
										<c:if test="${empty n.reviewFilepath }"><a class="">사진이 없습니다.</a></c:if>
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
											<td><a class="review_a11">작성자 : ${n.reviewWriter } | 작성일 :
													${n.reviewDate } | 평점 : ${n.reviewScore }점</a>
												<div class="ddd1">
													<a class="sell_Content btn btn-outline-dark"
														href="javascript:void(0)"
														onclick="sellContent('${n.reviewBuyEndNo}')">판매글</a>
														<c:if test="${sessionScope.member.memberId=='admin' }">
														<a class=" btn btn-outline-dark"
														href="javascript:void(0)"
														onclick="reviewDelete('${n.reviewNo}')">삭제</a></c:if>
														<c:if test="${not empty sessionScope.member.memberId }">
														<a class=" btn btn-danger"
														href="javascript:void(0)"
														onclick="reviewWarning('${n.reviewNo}','${n.reviewWarning }')">신고</a></c:if>
														</td>
											</div>
										</tr>
									</table>
								</div>
							</div>
							<ul class="question_sub2">
								<li class="question_li3">
									<div class="dd1">
									<c:if test="${not empty sessionScope.member}">
										<form action="/reviewComment" method="post">
											<input type="hidden" name="commentWriter"
												value="${sessionScope.member.memberId }"> <input
												type="hidden" name="reviewNo" value="${n.reviewNo}">
											<input type="text" name="reviewCommentContent"
												class="reviewCommentContent">
											<button class="btn btn-outline-primary" type="submit">등록</button>
										</form>
										</c:if>
									</div>
									<c:forEach items="${list2 }" var="nc">
									<c:if test="${nc.reviewRef == n.reviewNo }">
										<ul class="commentList">
											<li style="width: 15%; text-align: center;"><span>작성자 : ${nc.reviewCommentWriter }</span></li>
											<li style="width: 40%"><span>내용 : ${nc.reviewCommentContent }</span>
												<input type="text" class="form-control"
												name="reviewCommentContent"
												value="${nc.reviewCommentContent }" style="display: none;">
											</li>
											<li style="width: 20%; text-align: center;"><span>작성일 : ${nc.reviewCommentDate }</span></li>
											<li style="width: 25%; text-align: center;">
												<c:if test="${sessionScope.member.memberId eq nc.reviewCommentWriter }">
													<a href="javascript:void(0)" class="btn btn-outline-dark"
														onclick="updateComment(this,'${nc.reviewCommentNo }','${nc.reviewRef }')">수정</a>
													<a href="javascript:void(0)" class="btn btn-outline-dark"
														onclick="deleteComment('${nc.reviewCommentNo}')">삭제</a>
														<a href="javascript:void(0)"  class="Comment_warning btn btn-danger"
														onclick="warningComment('${nc.reviewCommentNo}','${nc.reviewCommentWarning }')">신고</a>
												</c:if></li>
										</ul>
										</c:if>
									</c:forEach>
								</li>
							</ul>
						</li>
				</ul>
				</li>
				</c:forEach>
				</ul>
			</div>
		</div>
		<div id="pageNavi">${pageNavi }</div>
		
		
		<br> <br>
	</div>

	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

</body>

</html>