<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<!-- 부트스트랩 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link
	href="https://fonts.googleapis.com/css2?family=Gothic+A1&family=Noto+Serif+KR:wght@900&display=swap"
	rel="stylesheet">

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
<!--  부트스트랩 -->
<!--    스마트에디터2.0-->


<!--    스마트에디터2.0 종료-->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- header,footer,noticeList 링크-->
<link rel="stylesheet" href="/css/header/header.css">
<link rel="stylesheet" href="/css/footer/footer.css">
<link rel="stylesheet" href="/css/notice/noticeList.css">
<!--  header,footer 종료  -->
</head>

<body>
	<!-- 페이지 상단 또는 하단에 라이브러르 추가 -->
	<script type="text/javascript"
		src="../../../se2/js/HuskyEZCreator.js"
		charset="utf-8"></script>
	
	<!-- 표시할 textarea 영역 -->
	<textarea id="txtContent" rows="10" cols="100" style="width: 100%;"></textarea>
	
	<!-- 페이지 로딩시 초기화 -->
	<script> 
        var oEditors = [];
        $(() => { nhn.husky.EZCreator.createInIFrame({ oAppRef: editor, elPlaceHolder: 'txtContent', sSkinURI: '../../../se2/SmartEditor2skin.html', fCreator: 'createSEditor2' }); }); 
	</script>

	출처: https://marsland.tistory.com/500 [삽질하는 프로그래머 통통만두의 판톼스틱한 삽질기]


</body>

</html>
