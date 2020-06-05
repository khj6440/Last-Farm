<%@ page language="java" contentType="text/html; charset=UTF-8"

	
   pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/header/header.css">
 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

  <style>
        
        
    
      
        ul,li {list-style:none;}
        
        nav {background:#fff;z-index:10;transition:all 0.5s;}
      	
     
   
        
        .fixed-header {position:fixed;top:0;left:0;width:100%;animation:slide-down 0.7s;opacity:0.9;}
        @keyframes slide-down {
            0% {
                opacity: 0;
                transform: translateY(-100%);
            } 
            100% {
                opacity: 0.9;
                transform: translateY(0);
            } 
        }
        
       
       
    </style>
</head>
<body>
 <header>
  <nav>
  
	<div class="main_body">
		<div class="header_top">
			<div class="header_top_login">

				<ul>
					<c:if test="${empty sessionScope.member}">
						<li class="nav-item header_top_login_li">
							<!-- 2. 로그인 클릭시 온클릭으로 인해  loginFrm서블릿으로 이동-->
							<button class="btn"
								onclick="location.href='/loginFrm'">로그인</button>
								<a> | </a>
							<button class="btn"
								onclick="location.href='/joinFrm'">회원가입</button>
						</li>
						
					</c:if>
					<c:if test="${not empty sessionScope.member}">
						<li class="nav-item header_top_login_li">
							<!-- 4.세션 안에있는 member안에 이름만 가저온다. --> <c:if
								test="${not empty sessionScope.member.memberId && sessionScope.member.memberId ne 'admin'  }">
								<button class="btn"
									onclick="location.href='/mypage?memberId=${sessionScope.member.memberId}'">${sessionScope.member.memberName }</button>
							</c:if> <c:if test="${sessionScope.member.memberId eq 'admin' }">
								<button class="btn"
									onclick="location.href='/manageMember?reqPage=1'">${sessionScope.member.memberName }</button>
							</c:if>
							<a> | </a>
							<button class="btn"
								onclick="location.href='/logoutFrm'">로그아웃</button>
						</li>
					</c:if>
				</ul>
			</div>
			<div class="header_top_logo">

				<a class="header_top_logo_a1" href="index.jsp">
					<img class="header_top_logo2" src="../imgs/Logo1.png" >
				</a>

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
	
</nav>
</header>
</body>
<script>

$(window).scroll(function(){
    if ($(window).scrollTop() >= 100) {
       $('nav').addClass('fixed-header');
    }
    else {
       $('nav').removeClass('fixed-header');
    }
});        
</script>
</html>
