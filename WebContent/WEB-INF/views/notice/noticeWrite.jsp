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

<Script>
	$(function() {
		//전역변수선언
		var editor_object = [];

		nhn.husky.EZCreator.createInIFrame({
			oAppRef : editor_object,
			elPlaceHolder : "content", //textarea의 id 
			sSkinURI : "/SE2.3/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : false,
			},

			//기존의 저장된 text 내용 가져오기
			fOnAppLoad : function() {
				//기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
				editor_object.getById["content"].exec("PASTE_HTML", [ "" ]);
			}

		});

		//전송버튼 클릭이벤트
		$("#savebutton").click(function() {
			//id가 smarteditor인 textarea에 에디터에서 대입
			editor_object.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

			// 이부분에 에디터 validation 검증

			//폼 submit
			$("#frm").submit();
		});
	});
	//첨부하는 사진 이미지 보여주기는 함수
	function loadImg(f) {

		console.log(f.files);
		if (f.files.length != 0 && f.files[0] != 0) {
			var reader = new FileReader();
			reader.readAsDataURL(f.files[0]);
			reader.onload = function(e) {
				$("#img-view").attr("src", e.target.result);
			}

		} else {

			$("#img-view").attr("src", "");

		}
	}
	//로직 처리 함수
	function func1() {
		location.href = ("/noticeList?reqPage=1");
	}
</Script>
<style>
.noticeIn {
	width: 80%;
	float: left;
}

#sideTap {
	padding-top: 50px;
}

.ntcWrite_Wrap {
	padding-top: 50px;
	overflow:hidden;
}

.ntcWrite_Wrap>* {
	font-family: 'Jua', sans-serif;
}

.h2Center {
	padding-left: 250px;
}

.divCenter {
	padding-left: 280px;
	margin-bottom:15px;
}

.ntcWrapeed {
	width: 70%;
	margin: 0 auto;
}
.mb-3>label{
	font-size:20px;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<div class="ntcWrite_Wrap">
		<div class="ntcWrapeed">
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
			<div class="noticeIn">
				<h2 class="h2Center">공지사항 작성하기</h2>
				<form action="/noticeInsert" method="post" id="frm"
					enctype="multipart/form-data">
					<div class="mb-3">
						<label for="writer">작성자 : 
							${sessionScope.member.memberId }</label> <input type="hidden"
							name="writer" value="${sessionScope.member.memberId }">
					</div>
					<div class="mb-3">
						<label for="title">제목 : </label> &nbsp;&nbsp;<input type="text" id="title"
							class="form-control alng" name="title" />

					</div>
					<div class="mb-3">
						<label for="filename">첨부 이미지 :</label> <input type="file"
							name="filename" onchange="loadImg(this);">
					</div>
					<div class="mb-3">
						<label for="img-viewer">이미지보기</label>
						<div img="img-viewer">
							<img id="img-view" width="350px">
						</div>
					</div>
					<div class="mb-3">
						<label for="content">내용 :</label>
						<textarea name="content" id="content" rows="10" cols="100"
							style="width: 652px; height: 412px;"></textarea>
					</div>
					<div class="divCenter">
						<input type="button" id="savebutton" value="완료" /> <input
							type="button" value="취소" onclick="func1();" />
					</div>
				</form>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>