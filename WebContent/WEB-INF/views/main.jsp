<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
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
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&family=Jua&display=swap" rel="stylesheet">
<!--구글 폰트 링크 종료-->
    
<!--  폰트어썸 링크(부트4.3만 가능)-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<!--    폰트어썸 종료-->
</head>

<!-- header,footer 링크-->
<link rel="stylesheet" href="/css/header/header.css?after">
<link rel="stylesheet" href="/css/footer/footer.css">
<!--  header,footer 종료  -->
    
<style>
.carousel-inner>.carousel-item>img {
	width: 290px;
	height: 300px;
	margin: 0 auto;
	margin-left: 2px;
	margin-right: 2px;
}

.carousel-inner {
	width: 900px;
	margin: 0 auto;
}


.font {
	font-family: 'Do Hyeon', sans-serif;
}
/*

.d1 {
	margin-left: 100px;
}
*/

.f-black {
	font-size: 20px;
	color: black;
}

.main_body {
	margin: 0 auto;
	text-shadow: 0.5px 0.5px gray;
	width: 1280px;
}

.jj {
	margin-top: 17px;
}

a:hover {
	color: black;
	text-decoration: none;
}

.header_top {
	border-bottom: 0.1px solid gray;
	width: 100%;
	height: 235px;
	font-family: 'Nanum Gothic', sans-serif;
	position: relative;
}

.main_content {
	width: 100%;
	height: 62%;
	border-left: 0.1px solid gray;
	border-right: 0.1px solid gray;
}

.main_footer {
	position: relative;
	background-color: #D9D4CF;
	width: 100%;
	height: 15%;
}

.header_top_logo {
	width: 16%;
	height: 90%;
	float: left;
	margin-top: -2.5%;
	position: absolute;
	margin-left: 42%;
}

.header_top_logo1 {
	width: 100%;
	height: 100%;
}

.header_top_tap {
	width: 100%;
	float: left;
	margin-top: 4.4%;
}

.header_top_tap2 {
	width: 42%;
	float: left;
	margin-top: 4.4%;
}

.header_top_ul1 {
	list-style: none;
}

.header_top_li1 {
	display: block;
	float: left;
	width: 170px;
	height: 85px;
	margin-left: 40px;
	line-height: 85px;
	text-align: center;
	font-weight: bold;
}

.header_top_a1 {
	display: inline-block;
	text-decoration: none;
	font-size: 22px;
	color: black;
	text-shadow: 10px 10px 10px 10px gray;
}

.header_top_ul2 {
	list-style: none;
	padding: 0;
	position: absolute;
	visibility: hidden;
	text-align: center;
	box-sizing: border-box;
	line-height: 50px;
	left: 3%;
}

.header_top_ul3 {
	list-style: none;
	padding: 0;
	position: absolute;
	visibility: hidden;
	text-align: center;
	box-sizing: border-box;
	line-height: 50px;
	right: 5%;
}

.header_top_li2 {
	width: 210px;
	float: left;
}

.header_top_li4 {
	margin-left: 25px;
}

.header_top_li2>a {
	text-decoration: none;
	display: block;
	color: white;
	font-size: 22px;
}

.header_top_li1:hover>.header_top_ul2>li {
	visibility: visible;
}

.header_top_li1:hover>.header_top_ul3>li {
	visibility: visible;
}

.header_top_bottom {
	margin-top: -50px;
	width: 100%;
	height: 50px;
	background-color: #D9D4CF;
	border-bottom: 0.1px solid gray;
}

.header_top_a2 {
	font-size: 27px;
}

.header_top_login {
	margin-left: 88%;
	width: 140px;
}

.header_top_login>a {
	font-size: 20px;
	color: #7C7877;
	margin-right: 10px;
}

.header_top_tap {
	position: relative;
}

.header_top_tap2 {
	position: relative;
}

.header_top_li3 {
	margin-right: 25%;
}
#demo2,#demo{
	width:1280px;
	margin:0 auto;
}
.fff{
	font-family: 'Jua', sans-serif;
}
    .fontCt{
        text-align: center;
    }
    .content-top-wrap{
        width: 1280px;
        height: 700px;
        
        margin: 0 auto;
        
    }
    .content-top-wrap>div{
        width: 80%;
        height: 100%;
        background-color: gray;
        margin: 0 auto;
       position: relative
    }
    .content-top-img{
        width:100%;
        height:100%;
        opacity: 0.6;
        
    }

    .opa{
        width: 100%;
        height: 100%;
        background-color: black
        opacity: 1;
        position: absolute;
        display: inline;
        left: 0px;
        z-index: 100;
    }

</style>
<script>
	function testMsg() {
		var win = window
				.open(
						"/messageWrite",
						"_blank",
						"toolbar=yes,scrollbars=yes,resizable=yes,top=200,left=500,width=500,height=600");

	}
</script>
<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
    <div class="content-top-wrap">
        <div>
        <img src="imgs/contentVer%201.jpg" class="content-top-img">
            <div class="opa"></div>
        </div>
        
    </div>
    <br><br><br><br>
	<div class="container">
		<div class="d1">
			<h2 class="fff fontCt">전체 판매</h2>
			<button onclick="testMsg();">쪽지 보내기</button>
		</div>
	</div>
	<div id="demo" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			<!-- 슬라이드 쇼 -->
			<div class="carousel-item active">
				<!--가로-->
				<img class="d-inline-block"
					src="imgs/%EA%B5%B0%EA%B3%A0%EA%B5%AC%EB%A7%88.jpg"
					alt="First slide" id="link-totalSell"> <img class="d-inline-block"
					src="imgs/%EA%B5%B0%EA%B3%A0%EA%B5%AC%EB%A7%88.jpg"
					alt="First slide"> <img class="d-inline-block"
					src="imgs/%EA%B5%B0%EA%B3%A0%EA%B5%AC%EB%A7%88.jpg"
					alt="First slide">
				<div class="carousel-caption d-none d-md-block">
					<h5>테스트</h5>
					<p></p>
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-inline-block"
					src="imgs/%EC%A2%85%EA%B0%93%EC%A7%91%20%EA%B9%80%EC%B9%98.jpg"
					alt="Second slide"> <img class="d-inline-block"
					src="imgs/%EC%A2%85%EA%B0%93%EC%A7%91%20%EA%B9%80%EC%B9%98.jpg"
					alt="Second slide"> <img class="d-inline-block"
					src="imgs/%EC%A2%85%EA%B0%93%EC%A7%91%20%EA%B9%80%EC%B9%98.jpg"
					alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-inline-block"
					src="https://images.pexels.com/photos/2544554/pexels-photo-2544554.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
					alt="Third slide"> <img class="d-inline-block"
					src="https://images.pexels.com/photos/2544554/pexels-photo-2544554.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
					alt="Third slide"> <img class="d-inline-block"
					src="https://images.pexels.com/photos/2544554/pexels-photo-2544554.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
					alt="Third slide">
			</div>

			<!-- / 슬라이드 쇼 끝 -->
			<!-- 인디케이터 -->
			<ul class="carousel-indicators">
				<li data-target="#demo" data-slide-to="0" class="active"></li>
				<!--0번부터시작-->
				<li data-target="#demo" data-slide-to="1"></li>
				<li data-target="#demo" data-slide-to="2"></li>
			</ul>
			<!-- 인디케이터 끝 -->
		</div>
		<!-- 왼쪽 오른쪽 화살표 버튼 -->
		<a class="carousel-control-prev" href="#demo" data-slide="prev"> <!--                <span class="carousel-control-prev-icon b-black" aria-hidden="true"></span>-->
			<i class="fas fa-angle-left f-black" aria-hidden="true"></i> <span
			class="f-black fff">Previous</span>
		</a> <a class="carousel-control-next" href="#demo" data-slide="next">
			<!--                <span class="carousel-control-next-icon b-black" aria-hidden="true"></span> -->
			<span class="f-black fff">Next</span> <i
			class="fas fa-angle-right f-black" aria-hidden="true"></i>

		</a>
		<!-- / 화살표 버튼 끝 -->
	</div>

	<div class="container">
		<div class="d1">
			<h2 class="fff fontCt">지역 판매</h2>
		</div>
	</div>
	<div id="demo2" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			<!-- 슬라이드 쇼 -->
			<div class="carousel-item active">
				<!--가로-->
				<img class="d-inline-block"
					src="imgs/%EA%B5%B0%EA%B3%A0%EA%B5%AC%EB%A7%88.jpg"
					alt="First slide"> <img class="d-inline-block"
					src="imgs/%EA%B5%B0%EA%B3%A0%EA%B5%AC%EB%A7%88.jpg"
					alt="First slide"> <img class="d-inline-block"
					src="imgs/%EA%B5%B0%EA%B3%A0%EA%B5%AC%EB%A7%88.jpg"
					alt="First slide">
				<div class="carousel-caption d-none d-md-block">
					
				</div>
			</div>
			<div class="carousel-item">
				<img class="d-inline-block"
					src="imgs/%EC%A2%85%EA%B0%93%EC%A7%91%20%EA%B9%80%EC%B9%98.jpg"
					alt="Second slide"> <img class="d-inline-block"
					src="imgs/%EC%A2%85%EA%B0%93%EC%A7%91%20%EA%B9%80%EC%B9%98.jpg"
					alt="Second slide"> <img class="d-inline-block"
					src="imgs/%EC%A2%85%EA%B0%93%EC%A7%91%20%EA%B9%80%EC%B9%98.jpg"
					alt="Second slide">
			</div>
			<div class="carousel-item">
				<img class="d-inline-block"
					src="https://images.pexels.com/photos/2544554/pexels-photo-2544554.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
					alt="Third slide"> <img class="d-inline-block"
					src="https://images.pexels.com/photos/2544554/pexels-photo-2544554.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
					alt="Third slide"> <img class="d-inline-block"
					src="https://images.pexels.com/photos/2544554/pexels-photo-2544554.jpeg?auto=compress&cs=tinysrgb&h=650&w=940"
					alt="Third slide">
			</div>

			<!-- / 슬라이드 쇼 끝 -->

			<!-- 인디케이터 -->
			<ul class="carousel-indicators">
				<li data-target="#demo2" data-slide-to="0" class="active"></li>
				<!--0번부터시작-->
				<li data-target="#demo2" data-slide-to="1"></li>
				<li data-target="#demo2" data-slide-to="2"></li>
			</ul>
			<!-- 인디케이터 끝 -->
		</div>
		<!-- 왼쪽 오른쪽 화살표 버튼 -->
		<a class="carousel-control-prev" href="#demo2" data-slide="prev">
			<i class="fas fa-angle-left f-black" aria-hidden="true"></i> <span
			class="f-black fff">Previous</span>
		</a> <a class="carousel-control-next" href="#demo2" data-slide="next">
			<span class="f-black fff">Next</span>
			<i class="fas fa-angle-right f-black" aria-hidden="true"></i> 

		</a>
	</div>
    <br><br><br><br>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>