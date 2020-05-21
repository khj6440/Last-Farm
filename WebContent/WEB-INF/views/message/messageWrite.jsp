<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
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
body {
	padding-top: 70px;
	padding-bottom: 30px;
	/* 크롬에서 스크롤바를 없애기 위한 방법 코드.. */
	overflow-x:hidden; 
	overflow-y:hidden;"


}

.noticeIn {
	width: 80%;
	float: left;
}

#sideTap {
	padding-top: 50px;
}
.msg_Wrap{
	width:80%;
}	

#msgSend{
	width:80%;
	margin:0 auto;
    padding: 10px;
	font-family: 'Jua', sans-serif;
	border: 3px solid #ffac05;
	border-radius: 15px;
    
}
    #msgSend>div{
        font-size: 20px;
    }
.h2Center {
	text-align: center;
    border-bottom: 2px solid #FFEEE4;
}

.divCenter {
	padding-left: 280px;
}

.ntcWrapeed {
	width: 70%;
	margin: 0 auto;
}
.contt{
	width:
}
#msgPut{
	margin-left: 150px;
	width:70px;
	height:30px;
	background-color:#ffac05;
	color:#4a2100;
}

</style>

<script>
	$(function() {

		$("#msgReceiveId").blur(function() {
			
			var msgReceiveId = $(this).val();
			$.ajax({
				url : "/messageInsert",
				te : "get",
				data : {
					msgReceiveId : msgReceiveId
				},
				success : function(data) {
					if (data != 'true') {
						alert("입력하신 회원이 없습니다.");
						$("#msgReceiveId").val("");
						$("#msgReceiveId").css("border", "1.2px solid red");

					} else {
						
						$("#msgReceiveId").css("border", "1.2px solid blue");
					}
				},
				error : function() {
					alert("실패");
				}
			});

		});
        
        
	});
</script>

<body>
	<div class="msg_wrap">
		<form action="/messageInsert2" method="post" id="msgSend">
			<h2 class="h2Center">쪽지 보내기</h2>
           	<c:if test="${not empty sessionScope.member.memberId }">
			<div class="mb-3">
				<label>작성자 : ${sessionScope.member.memberId }</label> <input
					type="hidden" value=${sessionScope.member.memberId } name="msgSendId">
			</div>
			</c:if>
			<c:if test="${empty sessionScope.member.memberId }">
			<div class="mb-3">
				<label>작성자 : 관리자</label> <input
					type="hidden" value="admin" name="msgSendId">
			</div>
			</c:if>
			
			<div class="mb-3">
				<label>받는사람</label> <input type="text" id="msgReceiveId"
					class="form-control msgReceiveId" name="msgReceiveId"
					placeholder="받을사람을 입력하세요.">
			</div>
			<div class="mb-3">
				<label>제목</label> <input type="text" name="msgTitle"
					class="form-control" placeholder="제목을 입력하세요.">
			</div>
			<div class="mb-3">
				<label>내용</label> <input type="text" class="form-control contt"
					name="msgContent" placeholder="내용을 입력하세요.">
			</div>
			<button type="submit" Id="msgPut" onclick="returnmsgfunc();">완료</button>
		</form>
	</div>
</body>
</html>
