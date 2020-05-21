<%@ page language="java" contentType="text/html; charset=UTF-8"

	
   pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/header/header.css">

</head>
<body>
	<div class="main_body">
		<div class="header_top">
			<div class="header_top_login">

				<ul>
					<c:if test="${empty sessionScope.member}">
						<li class="nav-item header_top_login_li">
							<!-- 2. 로그인 클릭시 온클릭으로 인해  loginFrm서블릿으로 이동-->
							<button class="btn btn-outline-primary"
								onclick="location.href='/loginFrm'">로그인</button>
							<button class="btn btn-outline-primary"
								onclick="location.href='/joinFrm'">회원가입</button>
						</li>
					</c:if>
					<c:if test="${not empty sessionScope.member}">
						<li class="nav-item header_top_login_li">
							<!-- 4.세션 안에있는 member안에 이름만 가저온다. --> <c:if
								test="${not empty sessionScope.member.memberId && sessionScope.member.memberId ne 'admin'  }">
								<button class="btn btn-outline-primary"
									onclick="location.href='/mypage?memberId=${sessionScope.member.memberId}'">${sessionScope.member.memberName }</button>
							</c:if> <c:if test="${sessionScope.member.memberId eq 'admin' }">
								<button class="btn btn-outline-primary"
									onclick="location.href='/manageMember?reqPage=1'">${sessionScope.member.memberName }</button>
							</c:if>

							<button class="btn btn-outline-primary"
								onclick="location.href='/logoutFrm'">로그아웃</button>
						</li>
					</c:if>
				</ul>
			</div>
			<div class="header_top_logo">
				<a class="header_top_logo_a1" href="index.jsp"><img
					class="header_top_logo1 header_top_logo2" src="../imgs/Logo1.png"></a>
			</div>
			<div class="header_top_tap">

				<ul class="header_top_ul1 jj">
					<li class="header_top_li1"><a class="header_top_a1"
						href="/sellSearchNationalFrm?reqPage=1&sortingTab=마감시간 순">전 지역
							상품</a></li>
					<li class="header_top_li1  header_top_li3"><a
						class="header_top_a1" href="#">지역 상품</a></li>
				</ul>
				<ul class="header_top_ul1">
					<li class="header_top_li1"><a class="header_top_a1"
						href="/noticeList?reqPage=1">커뮤니티</a></li>

					<c:if
						test="${not empty sessionScope.member.memberId && sessionScope.member.memberId ne 'admin'  }">
						<li class="header_top_li1"><a class="header_top_a1"
							href="/mypage?memberId=${sessionScope.member.memberId }">마이페이지</a>
						</li>
					</c:if>
					<c:if test="${sessionScope.member.memberId eq 'admin' }">
						<li class="header_top_li1"><a class="header_top_a1"
							href="/manageMember?reqPage=1">관리자페이지</a></li>
					</c:if>

					<c:if test="${empty sessionScope.member.memberId }">
						<li class="header_top_li1"><a class="header_top_a1"
							href="/loginFrm">마이페이지</a></li>
					</c:if>

				</ul>
			</div>
		</div>
	</div>
	<div class="header_top_bottom"></div>

</body>
</html>
