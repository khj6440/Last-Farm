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
	.carsel_wrap{
		width:290px;
		height:300px;
		display:inline-block;
	}
	#sellImg{
		width:100%;
		height:230px;
	}
</style>
<script>
	function testMsg() {
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
		
		/* var win = window
				.open(
						"/messageWrite",
						"_blank",
						"menubar=no,toolbar=yes,scrollbars=0,resizable=yes,status=no,top=200,left=500,width=500,height=600"); */
		
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
			 
		</div>
	</div>
	<div id="demo" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
			<!-- 슬라이드 쇼 -->
			<div class="carousel-item active">
				<!--가로-->
				<span class="carsel_wrap"><img class="d-inline-block" id="sellImg"
					src="/imgs/${listNation[0].thumbnail }"
					alt="First slide" onclick="location.href='/sellView?sellno=${listNation[0].sellNo }'" value="${listNation[0].sellNo }"></span>
					<span class="carsel_wrap"><img class="d-inline-block" id="sellImg"
					src="/imgs/${listNation[1].thumbnail }" onclick="location.href='/sellView?sellno=${listNation[1].sellNo }'"
					alt="First slide"></span>
					<span class="carsel_wrap"><img class="d-inline-block" id="sellImg"
					src="/imgs/${listNation[2].thumbnail }"
					alt="First slide"></span> 
				<div class="carousel-caption d-none d-md-block">
					제목
				</div>
			</div>
			<div class="carousel-item">
				<span class="carsel_wrap"><img class="d-inline-block" id="sellImg"
					src="imgs/${listNation[3].thumbnail }"
					alt="Second slide"></span>
					<span class="carsel_wrap"><img class="d-inline-block" id="sellImg"
					src="imgs/${listNation[4].thumbnail }"
					alt="Second slide"></span>
					<span class="carsel_wrap"><img class="d-inline-block" id="sellImg"
					src="imgs/${listNation[5].thumbnail }"
					alt="Second slide"></span>
			</div>
			<div class="carousel-item">
				<span class="carsel_wrap"><img class="d-inline-block" id="sellImg"
					src="imgs/${listNation[6].thumbnail }"
					alt="Third slide"></span>
					<span class="carsel_wrap"><img class="d-inline-block" id="sellImg"
					src="imgs/${listNation[7].thumbnail }"
					alt="Third slide"></span>
					<span class="carsel_wrap"><img class="d-inline-block" id="sellImg"
					src="imgs/${listNation[8].thumbnail }"
					alt="Third slide"></span>
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
				<span class="carsel_wrap"><img class="d-inline-block" id="sellImg"
					src="/imgs/${listRegion[0].thumbnail }"
					alt="First slide" onclick="location.href='/sellView?sellno=${listRegion[0].sellNo }'" value="${listRegion[0].sellNo }"></span>
					<span class="carsel_wrap"><img class="d-inline-block" id="sellImg"
					src="/imgs/${listRegion[1].thumbnail }" onclick="location.href='/sellView?sellno=${listRegion[1].sellNo }'"
					alt="First slide"></span>
					<span class="carsel_wrap"><img class="d-inline-block" id="sellImg"
					src="/imgs/${listRegion[2].thumbnail }"
					alt="First slide"></span> 
				<div class="carousel-caption d-none d-md-block">
					제목
				</div>
			</div>
			<div class="carousel-item">
				<span class="carsel_wrap"><img class="d-inline-block" id="sellImg"
					src="imgs/${listRegion[3].thumbnail }"
					alt="Second slide"></span>
					<span class="carsel_wrap"><img class="d-inline-block" id="sellImg"
					src="imgs/${listRegion[4].thumbnail }"
					alt="Second slide"></span>
					<span class="carsel_wrap"><img class="d-inline-block" id="sellImg"
					src="imgs/${listRegion[5].thumbnail }"
					alt="Second slide"></span>
			</div>
			<div class="carousel-item">
				<span class="carsel_wrap"><img class="d-inline-block" id="sellImg"
					src="imgs/${listRegion[6].thumbnail }"
					alt="Third slide"></span>
					<span class="carsel_wrap"><img class="d-inline-block" id="sellImg"
					src="imgs/${listRegion[7].thumbnail }"
					alt="Third slide"></span>
					<span class="carsel_wrap"><img class="d-inline-block" id="sellImg"
					src="imgs/${listRegion[8].thumbnail }"
					alt="Third slide"></span>
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