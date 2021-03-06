<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<!-- 스마트에디터   -->
<script type="text/javascript" src="/SE2.3/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<!--  스마트 에디터 끝 -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 부트스트림4 지원 메타 포트 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트림4 지원 메타 포트 종료-->
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

<title>Insert title here</title>
<!-- header,footer 링크-->


<link rel="stylesheet" href="/css/notice/noticeList.css">
<link rel="stylesheet" href="/css/header/header.css">
<link rel="stylesheet" href="/css/footer/footer.css">
<!--  header,footer 종료  -->
</head>
<style>
.noticeIn {
	width: 80%;
}

.ntcWrite_Wrap {
	overflow: hidden;
}

.ntcWrite_Wrap>* {
	font-family: 'Jua', sans-serif;
}

.h2Center {
	text-align: center;
}

.divCenter {
	padding-left: 280px;
}

.ntcWrapeed {
	width: 80%;
	/* margin: 0 auto; */
	margin-left: 250px;
}

.content-wrap {
	width: 1190px;
	margin:0 auto;
	overflow: hidden;
}

.modify_a {
	color: white;
}

.modify_a:hover {
	color: white;
	text-decoration: none;
	
}

.mb-3>label {
	font-size: 20px;
}

.mb-3>.contentHtml {
	font-size: 15px;
	border: 1.2px solid black;
	border-radius: 5px;
	padding: 15px;
}
.button_wrap{
	float: right;
	
}
#notiveBack{
	margin-left:300px;
	width:150px;
}
</style>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="community_sideTap" id="sideTap">
		<div class="sideTap_a1">
			<a href="#">공지사항</a>
		</div>
		<div class="sideTap_a1">
			<a href="/questionList?reqPage=1">자주 묻는 질문</a>
		</div>
		<div class="sideTap_a1">
			<a href="#">리뷰게시판</a>
		</div>

	</div>
	<div class="content-wrap">

		<div class="ntcWrite_Wrap">
			<div class="ntcWrapeed">

				<div class="noticeIn">
					<br><br><br><br>
					<h2 class="h2Center">공지사항</h2>
					<div class="button_wrap">
						<c:if test="${ sessionScope.member.memberId eq 'admin' }">
						<button class="btn btn-dark">
							<a class="modify_a" href="/noticeModify?noticeNo=${n.noticeNo }">수정하기</a>
						</button>
						<button class="btn btn-dark">
							<a class="modify_a" href="/noticeDelete?noticeNo=${n.noticeNo }">삭제하기</a>
						</button>
						</c:if>
					</div>

					<div class="mb-3">
						<label for="writer">작성자 : &nbsp; ${n.noticeWriter }</label>
					</div>

					<div class="mb-3">
						<label for="title">제목 : ${n.noticeTitle }</label>
					</div>
					<div class="mb-3">
						<label for="img">참조 이미지 :</label>
						<div class="img-viewer">
							<c:if test="${not empty n.noticeFilename }">
							<img id="img-view" width="350px" height="300px" src="/imgs/${n.noticeFilename }">
							</c:if>
						</div>
					</div>
					<div class="mb-3">
						<label for="content">내용 : </label>
						<div class="contentHtml">${n.noticeContent }</div>
					</div>
					<input type="button" class="btn btn-dark" id="notiveBack"value="돌아가기" onclick="location.href='noticeList?reqPage=1'">
					<br><br><br><br>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>

</html>
