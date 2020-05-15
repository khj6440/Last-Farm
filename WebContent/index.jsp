<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!--    부트스트랩 4.3 링크-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!--    부트스트랩 4.3 종료-->
<!--  폰트어썸 링크(부트4.3만 가능)-->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
	integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
	crossorigin="anonymous">
<!--    폰트어썸 종료-->
</head>
<!--    jquery와popper.js 연결(부트4.3에 필요)-->
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
	crossorigin="anonymous">
    </script>
<!--    jquery와popper.js 종료(부트4.3에 필요)-->
<!-- header,footer 링크-->
<link rel="stylesheet" href="/css/header/header.css">
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

#demo {
	/*background-color: darkgray;*/
	
}

.font {
	font-family: 'Do Hyeon', sans-serif;
}

.d1 {
	margin-left: 100px;
}

.f-black {
	font-size: 20px;
	color: black;
}
</style>

<body>

	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<div class="container">
<<<<<<< HEAD
        <div class="d1">
        <h2 class="font">전체 판매</h2>
        </div>
    </div>
    <div id="demo" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <!-- 슬라이드 쇼 -->
            <div class="carousel-item active">
                <!--가로-->
                <img class="d-inline-block" src="imgs/%EA%B5%B0%EA%B3%A0%EA%B5%AC%EB%A7%88.jpg" alt="First slide">
                <img class="d-inline-block" src="imgs/%EA%B5%B0%EA%B3%A0%EA%B5%AC%EB%A7%88.jpg"  alt="First slide">
                <img class="d-inline-block" src="imgs/%EA%B5%B0%EA%B3%A0%EA%B5%AC%EB%A7%88.jpg" alt="First slide">
                <div class="carousel-caption d-none d-md-block">
                    <h5>테스트</h5>
                    <p></p>
                </div>
            </div>
            <div class="carousel-item"> <img class="d-inline-block" src="imgs/%EC%A2%85%EA%B0%93%EC%A7%91%20%EA%B9%80%EC%B9%98.jpg" alt="Second slide">
                
            <img class="d-inline-block" src="imgs/%EC%A2%85%EA%B0%93%EC%A7%91%20%EA%B9%80%EC%B9%98.jpg" alt="Second slide">
                <img class="d-inline-block" src="imgs/%EC%A2%85%EA%B0%93%EC%A7%91%20%EA%B9%80%EC%B9%98.jpg" alt="Second slide">
            </div>
            <div class="carousel-item"> <img class="d-inline-block" src="https://images.pexels.com/photos/2544554/pexels-photo-2544554.jpeg?auto=compress&cs=tinysrgb&h=650&w=940" alt="Third slide">
                <img class="d-inline-block" src="https://images.pexels.com/photos/2544554/pexels-photo-2544554.jpeg?auto=compress&cs=tinysrgb&h=650&w=940" alt="Third slide">
                <img class="d-inline-block" src="https://images.pexels.com/photos/2544554/pexels-photo-2544554.jpeg?auto=compress&cs=tinysrgb&h=650&w=940" alt="Third slide">
            </div>
            
            <!-- / 슬라이드 쇼 끝 -->
        
            <!-- 인디케이터 -->
            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <!--0번부터시작-->
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
            </ul> <!-- 인디케이터 끝 -->
        </div> 
        <!-- 왼쪽 오른쪽 화살표 버튼 --> 
            <a class="carousel-control-prev" href="#demo" data-slide="prev"> 
<!--                <span class="carousel-control-prev-icon b-black" aria-hidden="true"></span>-->
                <i class="fas fa-angle-left f-black" aria-hidden="true"></i>
                 <span class="f-black">Previous</span>  
            </a> 
            <a class="carousel-control-next" href="#demo" data-slide="next"> 
<!--                <span class="carousel-control-next-icon b-black" aria-hidden="true"></span> -->
                             <span class="f-black">Next</span>
                <i class="fas fa-angle-right f-black" aria-hidden="true"></i>
                
            </a> 
            <!-- / 화살표 버튼 끝 -->
    </div>
	
    <div class="container">
        <div class="d1">
        <h2 class="font">지역 판매</h2>
        </div>
    </div>
    <div id="demo" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
            <!-- 슬라이드 쇼 -->
            <div class="carousel-item active">
                <!--가로-->
                <img class="d-inline-block" src="imgs/%EA%B5%B0%EA%B3%A0%EA%B5%AC%EB%A7%88.jpg" alt="First slide">
                <img class="d-inline-block" src="imgs/%EA%B5%B0%EA%B3%A0%EA%B5%AC%EB%A7%88.jpg"  alt="First slide">
                <img class="d-inline-block" src="imgs/%EA%B5%B0%EA%B3%A0%EA%B5%AC%EB%A7%88.jpg" alt="First slide">
                <div class="carousel-caption d-none d-md-block">
                    <h5>테스트</h5>
                    <p></p>
                </div>
            </div>
            <div class="carousel-item"> <img class="d-inline-block" src="imgs/%EC%A2%85%EA%B0%93%EC%A7%91%20%EA%B9%80%EC%B9%98.jpg" alt="Second slide">
                
            <img class="d-inline-block" src="imgs/%EC%A2%85%EA%B0%93%EC%A7%91%20%EA%B9%80%EC%B9%98.jpg" alt="Second slide">
                <img class="d-inline-block" src="imgs/%EC%A2%85%EA%B0%93%EC%A7%91%20%EA%B9%80%EC%B9%98.jpg" alt="Second slide">
            </div>
            <div class="carousel-item"> <img class="d-inline-block" src="https://images.pexels.com/photos/2544554/pexels-photo-2544554.jpeg?auto=compress&cs=tinysrgb&h=650&w=940" alt="Third slide">
                <img class="d-inline-block" src="https://images.pexels.com/photos/2544554/pexels-photo-2544554.jpeg?auto=compress&cs=tinysrgb&h=650&w=940" alt="Third slide">
                <img class="d-inline-block" src="https://images.pexels.com/photos/2544554/pexels-photo-2544554.jpeg?auto=compress&cs=tinysrgb&h=650&w=940" alt="Third slide">
            </div>
            
            <!-- / 슬라이드 쇼 끝 -->
        
            <!-- 인디케이터 -->
            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <!--0번부터시작-->
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
            </ul> <!-- 인디케이터 끝 -->
        </div>
        <!-- 왼쪽 오른쪽 화살표 버튼 --> 
            <a class="carousel-control-prev" href="#demo" data-slide="prev"> 
			
                <i class="fas fa-angle-left f-black" aria-hidden="true"></i>
                 <span class="f-black">Previous</span>  .........
            </a> 
            <a class="carousel-control-next" href="#demo" data-slide="next"> 
=======
		<div class="d1">
			<h2 class="font">전체 판매</h2>
		</div>
	</div>
	<div id="demo" class="carousel slide" data-ride="carousel">
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
>>>>>>> master

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
			class="f-black">Previous</span>
		</a> <a class="carousel-control-next" href="#demo" data-slide="next">
			<!--                <span class="carousel-control-next-icon b-black" aria-hidden="true"></span> -->
			<span class="f-black">Next</span> <i
			class="fas fa-angle-right f-black" aria-hidden="true"></i>

		</a>
		<!-- / 화살표 버튼 끝 -->
	</div>

	<div class="container">
		<div class="d1">
			<h2 class="font">지역 판매</h2>
		</div>
	</div>
	<div id="demo" class="carousel slide" data-ride="carousel">
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
		<a class="carousel-control-prev" href="#demo" data-slide="prev"> <i
			class="fas fa-angle-left f-black" aria-hidden="true"></i> <span
			class="f-black">Previous</span>
		</a> <a class="carousel-control-next" href="#demo" data-slide="next">
		<i
			class="fas fa-angle-left f-black" aria-hidden="true"></i> <span
			class="f-black">Next</span>
		
		</a>
		</div>
		
			
				<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
			</body>
</html>