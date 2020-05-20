<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공동구매 리스트(전국)</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">

<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	 -->
<style>
/*상품 서치탭의 CSS*/
.sell-list-body {
	font-family: 'Jua', sans-serif;
	width: 1280px;
	margin: 0 auto;
	margin-top: 30px;
}

.searchbox-wrapper {
	background-color: #f4f4f4;
	width: 100%;
	height: 250px;
	margin: 0 auto;
}

#sido, #gugun {
	height: 60px;
	width: 15%;
	font-size: 135%;
	margin-right: 20px;
	float: left;
	border: 1px solid gray;
	font-family: 'Jua', sans-serif;
}

.category {
	height: 60px;
	width: 15%;
	font-size: 135%;
	margin-right: 20px;
	margin-top: 45px;
	float: left;
	border: 1px solid gray;
	font-family: 'Jua', sans-serif;
}

.category1 {
	margin-left: 43px;
}

.searchTypingBox {
	height: 60px;
	width: 350px;
	font-size: 120%;
	margin: 0 auto;
	padding: 0;
}

.searchInput-wrapper {
	width: 60%;
	display: inline-block;
	margin: 0 auto;
	height: 60px;
	margin-top: 45px;
	float: left;
}

.searchBtn {
	height: 60px;
	width: 150px;
	font-size: 1.5em;
	float: right;
	margin-left: 20px;
	background-color: #ffac05;
	color: #4a2100;
	border-style: none;
	border: 1px solid gray;
	outline: none;
	font-family: 'Jua', sans-serif;
	border-radius: 3px;
	box-shadow: 1px 1px 1px darkgray;
}

.searchBtn:hover {
	background-color: #4a2100;
	color: #ffac05;
}

.searchTypingBox {
	height: 90%;
	width: 400px;
	font-size: 1.5em;
	margin: 0 auto;
	border: none;
	float: left;
	margin-top: 2px;
	font-family: 'Jua', sans-serif;
}

.searchInput-wrapper img {
	height: 100%;
	width: 60px;
	margin: 0 auto;
	display: inline-block;
	float: left;
}

.searchInputBox {
	border: 1px solid gray;
	height: 60px;
	width: 590px;
	display: inline-block;
	background-color: white;
	float: left;
}

.shoppingList-wrapper {
	margin: 0 auto;
	height: 2000px;
	margin-top: 50px;
}
/* 마감시간, 구매, 등록순 조회 탭 CSS */
.ordertabCategory>ul {
	list-style: none;
	padding: 0;
	margin: 0 auto;
}

.ordertabCategory>ul>li {
	display: block;
	height: 60px;
	width: 33.1%;
	text-align: center;
	font-size: 30px;
	padding-top: 20px;
	cursor: pointer;
	float: left;
}

.ordertabCategory>ul {
	list-style: none;
	padding: 0;
	margin: 0 auto;
}

.ordertabCategory>ul>li {
	display: block;
	height: 60px;
	width: 33.1%;
	text-align: center;
	font-size: 30px;
	padding-top: 20px;
	cursor: pointer;
	float: left;
}

.clicktab {
	border-top: 1px solid gray;
	border-left: 1px solid gray;
	border-right: 1px solid gray;
}

.unclicktab {
	border-bottom: 1px solid gray;
}
/*상품 카테고리 부분의 CSS*/
.shoppingList-wrapper>table tr>th {
	height: 500px;
	width: 400px;
	padding: 0px;
	padding-left: 17px;
}

.productImg img {
	border: 1px solid gray;
	height: 400px;
	width: 100%;
	z-index: 1;
	position: relative;
	overflow: hidden;
}

.timeBox {
	color: white;
	height: 40px;
	line-height: 40px;
	width: 140px;
	border-radius: 8px;
	font-size: 1.2em;
	float: left;
	z-index: 2;
	position: absolute;
	background-color: #534847;
	margin-top: 350px;
	margin-left: 10px;
}

.productBox>p {
	margin: 7px;
	font-size: 1.2em;
}

.productBox {
	font-size: 1.3em;
}

.detailInfoBox {
	text-align: left;
	margin-left: 30px;
	margin-bottom: 30px;
}

#pageNavi {
	font-size: 30px;
	text-align: center;
	width: 1000px;
	margin: 0 auto;
	margin-top: 80px;
}
</style>
</head>
<body>
	<script>
		//로그인한 아이디가 판매자이면 검색 대신 새글 쓰기 버튼
		$(function() {
			$("#newSellForm").click(function() {
				location.href = "/sellForm";
			});
		});
		//검색창에 검색어 입력 시, 아웃라인 제거
		$(function() {
			$(".searchTypingBox").focusin(function() {
				$(".searchTypingBox").css("outline", "none");
			});
		});
		//countdown
		var now = new Date();
		var endTime = new Date('2020-05-22');
		var gapTime = endTime - now - 32400000;
		var SetTime = gapTime / 1000;
		var SetMin = SetTime / 60;
		var SetHour = SetMin / 60;
		function msg_time() { // 1초씩 카운트
			m = Math.floor(SetHour % 60) + ":" + Math.floor(SetMin % 60) + ":"
					+ Math.floor(SetTime % 60); // 남은 시간 계산
			var msg = m;
			$(".viewTimer").html(msg);
			//document.all.ViewTimer.innerHTML = msg;
			SetTime--;
			if (SetTime < 0) {
				clearInterval(tid);
			}
		}
		window.onload = function TimerStart() {
			tid = setInterval('msg_time()', 1000)
		};
		//카테고리 분류하여 검색
		$(function() {
			$(".category2").eq(0).hide();
			$(".category2").eq(1).hide();
			$(".category2").eq(2).show();
			//카테고리1- 농산물 선택
			$(".category1").change(function() {
				if ($(this).children("option:selected").val() == "농산물") {
					$(".category2").eq(0).show();
					$(".category2").eq(0).attr("name", "type2");
					$(".category2").eq(1).hide();
					$(".category2").eq(1).removeAttr("name");
					$(".category2").eq(2).hide();
				} else if ($(this).children("option:selected").val() == "수산물") {
					$(".category2").eq(0).hide();
					$(".category2").eq(0).removeAttr("name");
					$(".category2").eq(1).show();
					$(".category2").eq(1).attr("name", "type2");
					$(".category2").eq(2).hide();
				} else {
					$(".category2").eq(0).hide();
					$(".category2").eq(1).hide();
					$(".category2").eq(2).show();
					$(".category2").eq(1).removeAttr("name");
					$(".category2").eq(0).removeAttr("name");
				}
			});
		});
		//탭 검사
		$(function() {
			$(".ordertabCategory").children("ul").children("li").eq(0).click(
					function() {
						$(this).removeClass("unclicktab");
						$(this).addClass("clicktab");
						$(this).attr("name", "sortingTab");

						$(this).next().addClass("unclicktab");
						$(this).next().removeClass("clicktab");
						$(this).next().removeAttr("name", "sortingTab");
						$(this).next().next().addClass("unclicktab");
						$(this).next().next().removeClass("clicktab");
						$(this).next().next().removeAttr("name", "sortingTab");
					});
			$(".ordertabCategory").children("ul").children("li").eq(1).click(
					function() {
						$(this).addClass("clicktab");
						$(this).attr("name", "sortingTab");
						$(this).removeClass("unclicktab");
						$(this).next().addClass("unclicktab");
						$(this).next().removeClass("clicktab");
						$(this).next().removeAttr("name", "sortingTab");
						$(this).prev().addClass("unclicktab");
						$(this).prev().removeClass("clicktab");
						$(this).prev().removeAttr("name", "sortingTab");
					});
			$(".ordertabCategory").children("ul").children("li").eq(2).click(
					function() {
						$(this).addClass("clicktab");
						$(this).attr("name", "sortingTab");
						$(this).removeClass("unclicktab");
						$(this).prev().addClass("unclicktab");
						$(this).prev().removeClass("clicktab");
						$(this).prev().removeAttr("name", "sortingTab");
						$(this).prev().prev().addClass("unclicktab");
						$(this).prev().prev().removeClass("clicktab");
						$(this).prev().prev().removeAttr("name", "sortingTab");
					});
		});
		//지역 선택시 판매 지역 선택
		$('document')
				.ready(
						function() {
							var area0 = [ "시/도 선택", "서울", "인천", "대전", "광주",
									"대구", "울산", "부산", "경기", "강원", "충북", "충남",
									"전북", "전남", "경북", "경남", "제주특별자치도" ];
							var area1 = [ "강남구", "강동구", "강북구", "강서구", "관악구",
									"광진구", "구로구", "금천구", "노원구", "도봉구", "동대문구",
									"동작구", "마포구", "서대문구", "서초구", "성동구", "성북구",
									"송파구", "양천구", "영등포구", "용산구", "은평구", "종로구",
									"중구", "중랑구" ];
							var area2 = [ "계양구", "남구", "남동구", "동구", "부평구",
									"서구", "연수구", "중구", "강화군", "옹진군" ];
							var area3 = [ "대덕구", "동구", "서구", "유성구", "중구" ];
							var area4 = [ "광산구", "남구", "동구", "북구", "서구" ];
							var area5 = [ "남구", "달서구", "동구", "북구", "서구", "수성구",
									"중구", "달성군" ];
							var area6 = [ "남구", "동구", "북구", "중구", "울주군" ];
							var area7 = [ "강서구", "금정구", "남구", "동구", "동래구",
									"부산진구", "북구", "사상구", "사하구", "서구", "수영구",
									"연제구", "영도구", "중구", "해운대구", "기장군" ];
							var area8 = [ "고양시", "과천시", "광명시", "광주시", "구리시",
									"군포시", "김포시", "남양주시", "동두천시", "부천시", "성남시",
									"수원시", "시흥시", "안산시", "안성시", "안양시", "양주시",
									"오산시", "용인시", "의왕시", "의정부시", "이천시", "파주시",
									"평택시", "포천시", "하남시", "화성시", "가평군", "양평군",
									"여주군", "연천군" ];
							var area9 = [ "강릉시", "동해시", "삼척시", "속초시", "원주시",
									"춘천시", "태백시", "고성군", "양구군", "양양군", "영월군",
									"인제군", "정선군", "철원군", "평창군", "홍천군", "화천군",
									"횡성군" ];
							var area10 = [ "제천시", "청주시", "충주시", "괴산군", "단양군",
									"보은군", "영동군", "옥천군", "음성군", "증평군", "진천군",
									"청원군" ];
							var area11 = [ "계룡시", "공주시", "논산시", "보령시", "서산시",
									"아산시", "천안시", "금산군", "당진군", "부여군", "서천군",
									"연기군", "예산군", "청양군", "태안군", "홍성군" ];
							var area12 = [ "군산시", "김제시", "남원시", "익산시", "전주시",
									"정읍시", "고창군", "무주군", "부안군", "순창군", "완주군",
									"임실군", "장수군", "진안군" ];
							var area13 = [ "광양시", "나주시", "목포시", "순천시", "여수시",
									"강진군", "고흥군", "곡성군", "구례군", "담양군", "무안군",
									"보성군", "신안군", "영광군", "영암군", "완도군", "장성군",
									"장흥군", "진도군", "함평군", "해남군", "화순군" ];
							var area14 = [ "경산시", "경주시", "구미시", "김천시", "문경시",
									"상주시", "안동시", "영주시", "영천시", "포항시", "고령군",
									"군위군", "봉화군", "성주군", "영덕군", "영양군", "예천군",
									"울릉군", "울진군", "의성군", "청도군", "청송군", "칠곡군" ];
							var area15 = [ "거제시", "김해시", "마산시", "밀양시", "사천시",
									"양산시", "진주시", "진해시", "창원시", "통영시", "거창군",
									"고성군", "남해군", "산청군", "의령군", "창녕군", "하동군",
									"함안군", "함양군", "합천군" ];
							var area16 = [ "서귀포시", "제주시", "남제주군", "북제주군" ];
							// 시/도 선택 박스 초기화
							$("select[name^=sido]")
									.each(
											function() {
												$selsido = $(this);
												$
														.each(
																eval(area0),
																function() {
																	$selsido
																			.append("<option value='"+this+"'>"
																					+ this
																					+ "</option>");
																});
												$selsido
														.next()
														.append(
																"<option value=''>구/군 선택</option>");
											});
							// 시/도 선택시 구/군 설정
							$("select[name^=sido]")
									.change(
											function() {
												var area = "area"
														+ $("option", $(this))
																.index(
																		$(
																				"option:selected",
																				$(this))); // 선택지역의 구군 Array
												var $gugun = $(this).next(); // 선택영역 군구 객체
												$("option", $gugun).remove(); // 구군 초기화
												if (area == "area0")
													$gugun
															.append("<option value=''>구/군 선택</option>");
												else {
													$
															.each(
																	eval(area),
																	function() {
																		$gugun
																				.append("<option value='"+this+"'>"
																						+ this
																						+ "</option>");
																	});
												}
											});
						});
	</script>
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<div class="sell-list-body">
		<form action="/sellSearchRegionalFrm" method="post" id="searchSell">
			<div class="searchbox-wrapper">
				<select name="sido" id="sido"></select> <select name="gugun"
					id="gugun"></select> <select class="category category1"
					name="type1">
					<option value=null>농/수산물(전체)</option>
					<option value="농산물">농산물</option>
					<option value="수산물">수산물</option>
				</select> <select class="category category2">
					<option value=null>상품타입(전체)</option>
					<option value="채소">채소</option>
					<option value="과일">과일</option>
					<option value="가공식품">가공식품</option>
				</select> <select class="category category2">
					<option value=null>상품타입(전체)</option>
					<option value="생물">생물</option>
					<option value="냉동">냉동</option>
					<option value="가공식품">가공식품</option>
				</select> <select class="category category2" disabled>
					<option value="" selected>상품 소분류</option>
				</select>

				<script>
					
				</script>
				<div class="searchInput-wrapper">
					<div class="searchInputBox">
						<img src="../imgs/search@3x.png"> <input type="text"
							name="searchTypingBox" id="searchTypingBox"
							class="searchTypingBox" placeholder="검색할 상품을 입력하세요(Enter)">
					</div>
					<c:if test="${sessionScope.member.memberType != '2'}">
						<input type="submit" value="상품 검색" class="searchBtn">
					</c:if>
					<c:if test="${sessionScope.member.memberType == '2'}">
						<input type="button" id="newSellForm" value="새 글쓰기"
							class="searchBtn">
					</c:if>
				</div>
			</div>
			<br> <br>
			<div class="ordertabCategory">
				<ul>
					<li class="unclicktab" value="마감시간 순">마감시간 순</li>
					<li class="unclicktab" value="구매 인기순">구매 인기순</li>
					<li class="unclicktab" value="최근 등록순">최근 등록순</li>
				</ul>
			</div>
		</form>
		<br> <br> <br>
		<div class="shoppingList-wrapper">
			<table class="shoppingList-firstRow">
				<c:forEach items="${sellList }" var="n" varStatus="i">
					<c:if test="${i.count%3 eq 1 }">
						<tr>
					</c:if>
					<th>
						<div class="productBox">
							<div class='productImg'>
								<div class='timeBox' id='timeBox'>
									<c:if test="${n.timegap >0}">
							${n.timegap } 일 남음
							</c:if>
									<c:if test="${n.timegap ==0 }">
										<div class="viewTimer"></div>
									</c:if>
								</div>
								<a
									href='/sellView?sellNo=${n.sellNo }&sellWriter=${n.sellWriter }'><img
									src='/imgs/${n.thumbnail }'></a>
							</div>
							<p>${n.sellTitle }</p>
							<div class='detailInfoBox'>
								상품가격: ${n.sellPrice }원<br> 현재 참여인원: ${n.sellCount }명
							</div>
						</div>
					</th>
					<c:if test="${i.count%3 eq 0 }">
						</tr>
					</c:if>
				</c:forEach>
			</table>
			<div id="pageNavi">${pageNavi }</div>
		</div>
	</div>
</body>
</html>