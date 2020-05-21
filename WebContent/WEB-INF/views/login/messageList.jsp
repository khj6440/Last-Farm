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
<link rel="stylesheet" href="/css/notice/noticeList.css">
<title>Insert title here</title>
</head>
<Script>
function msgWrite() {
	var options = {
	        height: 600, // sets the height in pixels of the window.
	        width: 500, // sets the width in pixels of the window.
	        toolbar: 0, // determines whether a toolbar (includes the forward and back buttons) is displayed {1 (YES) or 0 (NO)}.
	        scrollbars: 0, // determines whether scrollbars appear on the window {1 (YES) or 0 (NO)}.
	        status: 0, // whether a status line appears at the bottom of the window {1 (YES) or 0 (NO)}.
	        resizable: 1, // whether the window can be resized {1 (YES) or 0 (NO)}. Can also be overloaded using resizable.
	        left: 500, // left position when the window appears.
	        top: 200, // top position when the window appears.
	        center: 0, // should we center the window? {1 (YES) or 0 (NO)}. overrides top and left
	        createnew: 0, // should we create a new window for each occurance {1 (YES) or 0 (NO)}.
	        location: 0, // determines whether the address bar is displayed {1 (YES) or 0 (NO)}.
	        menubar: 0 // determines whether the menu bar is displayed {1 (YES) or 0 (NO)}.
	    };

	    var parameters = "location=" + options.location +
	                     ",menubar=" + options.menubar +
	                     ",height=" + options.height +
	                     ",width=" + options.width +
	                     ",toolbar=" + options.toolbar +
	                     ",scrollbars=" + options.scrollbars +
	                     ",status=" + options.status +
	                     ",resizable=" + options.resizable +
	                     ",left=" + options.left +
	                     ",screenX=" + options.left +
	                     ",top=" + options.top +
	                     ",screenY=" + options.top;

	    // target url
	    var target = "/messageWrite"; 

	    popup = window.open(target, 'popup', parameters);
	
	}
</Script>
<body>
	<div class="wrapped">
		<div id="table">
		<h2 class="h2Center">보낸쪽지함</h2>
		<button clss="btn btn-dark" id="msgWrite" onclick="msgWrite();">쪽지보내기</button>
			<table class="table table-striped">
				<c:if test="${not empty check}">
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
									href="/messageView?msgNo=${msg.msgNo}">${msg.msgTitle }</a></td>
								<td class="table_writer fnt1">${msg.msgReceiveId }</td>
								<td class="table_date fnt1">${msg.msgDate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</c:if>
				<c:if test="${ empty check}">
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
									href="/messageView?msgNo=${msg.msgNo}">${msg.msgTitle }</a></td>
								<td class="table_writer fnt1">${msg.msgSendId }</td>
								<td class="table_date fnt1">${msg.msgDate }</td>
							</tr>
						</c:forEach>
					</tbody>
				</c:if>
			</table>
			<div class="pageNavi">
				<span>${pageNavi }</span>
			</div>
		</div>
	</div>
</body>
</html>