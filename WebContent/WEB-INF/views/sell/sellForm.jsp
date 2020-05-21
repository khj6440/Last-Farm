<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< HEAD
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
=======
<!-- 다음주소api -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
<!-- 제이쿼리 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>

>>>>>>> 88c7e4c21c147d5670ff1642de647970a8b5c18c
<!-- 달력 링크 -->
<link href="/dist/css/datepicker.min.css" rel="stylesheet"
	type="text/css">
<script src="/dist/js/datepicker.min.js"></script>
<script src="/dist/js/i18n/datepicker.en.js"></script>
<<<<<<< HEAD
<!-- 제이쿼리 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
	
<title>새 판매글 작성</title>
<style>
table, th, td {
	border: 1px solid black;
}

th, td {
	height: 40px;
}

td {
	width: 400px;
}

th {
	width: 300px;
=======
<!-- 스마트 에디터 -->
<script type="text/javascript" src="/SE2.3/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<!-- 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">


<title>새 판매글 작성</title>
<style>

* {
   font-family: 'Jua', sans-serif;
}
body{

	font-family: 'Jua', sans-serif;
	width: 1280px;
	margin: 0 auto;
}

th, td {
	height: 45px;
	margin-bottom: 10px;
	border-bottom: 1px solid lightgray;
}

td {
	width: 70%;
}

th {
	border-right: 1px solid lightgray;
	width: 30%;
	font-size: 120%;
}

form {
	margin: 25px;
>>>>>>> 88c7e4c21c147d5670ff1642de647970a8b5c18c
}

.comments {
	color: red;
}
<<<<<<< HEAD
</style>
</head>
<script>
	
</script>
<body>
	<form action="/sellFormInsert" method="post"
		enctype="multipart/form-data">
		<table>
			<tr>
				<th>판매 지역 선택</th>
				<td><select>
						<option value="전체보기">전체보기</option>
						<option value="서울/경기">서울/경기</option>
						<option value="인천/부천">인천/부천</option>
						<option value="춘천/강원">춘천/강원</option>
						<option value="부산/울산/경남">부산/울산/경남</option>
						<option value="대구/경북">대구/경북</option>
						<option value="전주/전북">전주/전북</option>
						<option value="광주/전남">광주/전남</option>
						<option value="청주/충북">청주/충북</option>
						<option value="청주/충북">청주/충북</option>
						<option value="대전/충남">대전/충남</option>
						<option value="제주">제주</option>
				</select> <select>
						<option value="">구 끌어오기</option>
				</select> <select>
						<option value="">동네 끌어오기</option>
				</select>
					<div></div></td>
			</tr>
			<script>
				function addrSearch() {
					new daum.Postcode({
						oncomplete : function(data) {
							$("#postCode").val(data.zoneCode); //우편번호 값 읽어오는 속성 = zoneCode
							$("#roadAddr").val(data.roadAddress);
							$("#jibunAddr").val(data.jibunAddress);
						}
					}).open();
					$("form").submit(function() {
						return false;
					});
				}
			</script>
			<tr>
				<th>판매자 지역</th>
				<td><div>
=======

.chooseRtab {
	height: 100px;
	width: 650px;
	margin: 0 auto;
	border-radius: 10px;
	background-color: #f4f4f4;
	margin-bottom: 10px;
}

.chooseRtab>select {
	height: 30px;
	border-radius: 3px;
	width: 140px;
	margin-right: 5px;
	margin-top: 10px;
	font-family: 'Jua', sans-serif;
	font-size: 105%;
}

#sido {
	margin-left: 20px;
}

.chooseNation, .chooseRegion {
	margin: 16px;
}

.sellFormBtn {
	background-color: white;
	border: 1px solid gray;
	height: 30px;
	width: 90px;
	border-radius: 3px;
	font-family: 'Jua', sans-serif;
	box-shadow: 1px 1px 1px darkgray;
	margin-right: 5px;
	font-size: 105%;
	line-height: 30px;
}

.sellFormBtn:hover {
	background-color: #ffac05;
	color: #4a2100;
	cursor: pointer;
}

#sellRegionalAddr {
	margin-left: 20px;
	height: 35px;
	width: 600px;
	border-radius: 3px;
	margin-top: 8px;
	border: 1px solid lightgray;
	overflow: scroll;
	font-family: 'Jua', sans-serif;
	box-shadow: 1px 1px 1px lightgray;
	font-size: 105%;
}

.sellerAddr>ul {
	padding-left: 20px;
}

.sellerAddr>ul>li {
	list-style: none;
}

.sellerAddr>ul>li>input {
	font-size: 100%;
	font-family: 'Jua', sans-serif;
	border-radius: 3px;
	height: 28px;
	margin-bottom: 3px;
	border: 1px solid lightgray;
	box-shadow: 1px 1px 1px lightgray;
	padding-left: 10px;
}

#addrSearchBtn {
	background-color: white;
	border: 1px solid gray;
	height: 30px;
	width: 100px;
	border-radius: 3px;
	font-family: 'Jua', sans-serif;
	box-shadow: 1px 1px 1px darkgray;
	font-size: 105%;
	line-height: 30px;
}

#addrSearchBtn:hover {
	background-color: #ffac05;
	color: #4a2100;
	cursor: pointer;
}

.sellInputBox {
	font-size: 100%;
	font-family: 'Jua', sans-serif;
	height: 25px;
	border-radius: 3px;
	margin-left: 20px;
	border: 1px solid lightgray;
	box-shadow: 1px 1px 1px lightgray;
	width: 700px;
	padding-left: 10px;
}

.sellInputNBox {
	font-size: 100%;
	font-family: 'Jua', sans-serif;
	height: 25px;
	border-radius: 3px;
	border: 1px solid lightgray;
	box-shadow: 1px 1px 1px lightgray;
	width: 200px;
	margin-right: 7px;
	padding-left: 10px;
}

.mg {
	margin-left: 20px;
}

.category {
	height: 30px;
	border-radius: 3px;
	width: 140px;
	margin-right: 5px;
	font-size: 105%;
	font-family: 'Jua', sans-serif;
}

.dfradio {
	margin: 15px;
	margin-left: 20px;
}

#delFeeBox {
	margin-left: 10px;
	margin-bottom: 6px;
}

.fileattach {
	margin-left: 20px;
	font-family: 'Jua', sans-serif;
	font-size: 110%;
}

#file-upload-button {
	background-color: white;
	border: 1px solid #4a2100;
	height: 40px;
	width: 150px;
	border-radius: 3px;
	font-family: 'Jua', sans-serif;
	box-shadow: 1px 1px 1px #4a2100;
	font-size: 105%;
	line-height: 40px;
	margin: 10px;
}

.finalBtn {
	background-color: white;
	border: 1px solid #4a2100;
	height: 50px;
	width: 180px;
	border-radius: 3px;
	font-family: 'Jua', sans-serif;
	box-shadow: 1px 1px 1px #4a2100;
	font-size: 110%;
	line-height: 50px;
	margin: 20px;
	background-color: #ffac05;
	color: #4a2100;
}

.finalBtn:hover {
	background-color: #4a2100;
	color: #ffac05;
	cursor: pointer;
}

.tableTitle {
	height: 60px;
	background-color: #fafafa;
	border-radius: 5px;
	border-shadow: 0px 1px 1px gray;
}
</style>
</head>
<script>
	//지역 선택시 판매 지역 선택
	$('document')
			.ready(
					function() {
						var area0 = [ "시/도 선택", "서울", "인천", "대전", "광주", "대구",
								"울산", "부산", "경기", "강원", "충북", "충남", "전북", "전남",
								"경북", "경남", "제주특별자치도" ];
						var area1 = [ "강남구", "강동구", "강북구", "강서구", "관악구", "광진구",
								"구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구",
								"마포구", "서대문구", "서초구", "성동구", "성북구", "송파구",
								"양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구" ];
						var area2 = [ "계양구", "남구", "남동구", "동구", "부평구", "서구",
								"연수구", "중구", "강화군", "옹진군" ];
						var area3 = [ "대덕구", "동구", "서구", "유성구", "중구" ];
						var area4 = [ "광산구", "남구", "동구", "북구", "서구" ];
						var area5 = [ "남구", "달서구", "동구", "북구", "서구", "수성구",
								"중구", "달성군" ];
						var area6 = [ "남구", "동구", "북구", "중구", "울주군" ];
						var area7 = [ "강서구", "금정구", "남구", "동구", "동래구", "부산진구",
								"북구", "사상구", "사하구", "서구", "수영구", "연제구", "영도구",
								"중구", "해운대구", "기장군" ];
						var area8 = [ "고양시", "과천시", "광명시", "광주시", "구리시", "군포시",
								"김포시", "남양주시", "동두천시", "부천시", "성남시", "수원시",
								"시흥시", "안산시", "안성시", "안양시", "양주시", "오산시",
								"용인시", "의왕시", "의정부시", "이천시", "파주시", "평택시",
								"포천시", "하남시", "화성시", "가평군", "양평군", "여주군", "연천군" ];
						var area9 = [ "강릉시", "동해시", "삼척시", "속초시", "원주시", "춘천시",
								"태백시", "고성군", "양구군", "양양군", "영월군", "인제군",
								"정선군", "철원군", "평창군", "홍천군", "화천군", "횡성군" ];
						var area10 = [ "제천시", "청주시", "충주시", "괴산군", "단양군",
								"보은군", "영동군", "옥천군", "음성군", "증평군", "진천군", "청원군" ];
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
	//지역 주소 추가&삭제 버튼
	$(function() {
		$(".chooseRtab").hide();
		$(".chooseNation").click(function() {
			$(".chooseRtab").slideToggle("fast", function() {
				$(".chooseRtab").hide();
			});
		});
		$(".chooseRegion").click(function() {
			$(".chooseRtab").slideToggle("fast", function() {
				$(".chooseRtab").show();
			});
		});
		//tockenizer 추가 필요
		$("#addrAddBtn").click(
				function() {
					var sido = $("#sido").children("option:selected").val();
					var gugun = $("#gugun").children("option:selected").val();
					var addr = sido + " " + gugun;
					if ($("#sellRegionalAddr").val() == ""
							& $("#sido").val() != "시/도 선택") {
						$("#sellRegionalAddr").val(sido + " " + gugun);
					} else if ($("#sido").val() != "시/도 선택") {
						if ($("#sellRegionalAddr").val() == addr) {
							alert("이미 추가한 주소입니다. \n다른 주소를 추가해주세요.")
						} else {
							$("#sellRegionalAddr").val(
									$("#sellRegionalAddr").val() + "," + sido
											+ " " + gugun);
						}
					}
				});
		$("#addrDelBtn").click(function() {
			$("#sellRegionalAddr").val("");
		});
	});
	//주소 받아오는 기능
	function addrSearch() {
		new daum.Postcode({
			oncomplete : function(data) {
				$("#postCode").val(data.zonecode); //우편번호 값 읽어오는 속성 = zonecode
				$("#roadAddr").val(data.roadAddress);
				$("#jibunAddr").val(data.jibunAddress);
			}
		}).open();
	}
	//상품 대분류 - 소분류 기능
	$(function() {
		$(".category2").eq(0).hide();
		$(".category2").eq(1).hide();
		$(".category2").eq(2).show();
		$(".category1").change(function() {
			if ($(this).children("option:selected").val() == "농산물") {
				$(".category2").eq(0).show();
				$(".category2").eq(0).attr("name", "sellCategory2");
				$(".category2").eq(1).hide();
				$(".category2").eq(1).removeAttr("name");
				$(".category2").eq(2).hide();
			} else if ($(this).children("option:selected").val() == "수산물") {
				$(".category2").eq(0).hide();
				$(".category2").eq(0).removeAttr("name");
				$(".category2").eq(1).show();
				$(".category2").eq(1).attr("name", "sellCategory2");
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
	//배송비 선택 기능
	$(function() {
		$(".dfradio").click(function() {
			if ($(this).index() == 3) {
				$("#delFeeBox").attr("disabled", false);
			} else {
				$("#delFeeBox").attr("disabled", true);
			}
		});
		$("#delFeeBox").focusout(function() {
			if (!$("#delFeeBox").val() == "") {
				$("#typeDF").val($("#delFeeBox").val());
			}
		});
	});
	//스마트 에디터
	$(function() {
		//전역변수선언
		var editor_object = [];

		nhn.husky.EZCreator.createInIFrame({
			oAppRef : editor_object,
			elPlaceHolder : "content", //불러올 id 
			sSkinURI : "/SE2.3/SmartEditor2Skin.html",
			htParams : {
				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseToolbar : true,
				// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true,
				// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : false,
			}
		});

		//전송버튼 클릭이벤트
		$("#formsubmit").click(function() {
			//id가 smarteditor인 textarea에 에디터에서 대입
			editor_object.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

			// 이부분에 에디터 validation 검증

			//폼 submit
			$("form").submit();
		});
	});
</script>
<body>

<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<form action="/sellFormInsert" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="sellWriter"
			value="${sessionScope.member.memberId }">
		<table>
			<tr>
				<th colspan="2" style="font-size: 140%; border-right: none;"
					class="tableTitle">판매 기본 정보 입력</th>
			</tr>
			<tr>
				<th>판매 가능 지역 선택</th>
				<td><input type="radio" name="sellType" value="1"
					class="chooseNation">전국 판매 <input type="radio"
					name="sellType" value="2" class="chooseRegion">지역 선택하기
					<div class="chooseRtab">
						<select name="sido" id="sido"></select> <select name="gugun"
							id="gugun"></select>
						<button type="button" id="addrAddBtn" class="sellFormBtn">추가</button>
						<button type="button" id="addrDelBtn" class="sellFormBtn">전체
							삭제</button>
						<br> <input id="sellRegionalAddr" name="sellRegionalAddr"
							readonly />
					</div>
			</tr>
			<tr>
				<th>판매자 지역(생산지) 입력</th>
				<td><div class="sellerAddr">
>>>>>>> 88c7e4c21c147d5670ff1642de647970a8b5c18c
						<ul>
							<li><input type="text" id="postCode"
								style="width: 200px; display: inline-block;"
								class="form-control" placeholder="우편번호" readonly>
<<<<<<< HEAD
								<button id="addrSearchBtn" onclick="addrSearch();"
=======
								<button type="button" id="addrSearchBtn" onclick="addrSearch();"
>>>>>>> 88c7e4c21c147d5670ff1642de647970a8b5c18c
									class="btn btn-primary">주소검색</button></li>
							<li><input id="roadAddr"
								style="width: 400px; display: inline-block;" type="text"
								class="form-control" placeholder="도로명주소"> <input
								id="jibunAddr" style="width: 400px; display: inline-block;"
								type="text" class="form-control" placeholder="지번주소"></li>
							<li><input id="detailAddr"
<<<<<<< HEAD
								style="width: 800px; display: inline-block;" type="text"
=======
								style="width: 540px; display: inline-block;" type="text"
>>>>>>> 88c7e4c21c147d5670ff1642de647970a8b5c18c
								class="form-control" placeholder="상세주소"></li>
						</ul>
					</div></td>
			</tr>
<<<<<<< HEAD
			<script>
				
			</script>
			<tr>
				<th>제목</th>
				<td><input type="text" id="sellTitle"><span
					class="comments"> 1자 이상 입력하세요.</span></td>
			</tr>
			<script>
				$(function() {
					$(".category2").eq(0).hide();
					$(".category2").eq(1).hide();
					$(".category2").eq(2).show();
					$(".category1")
							.change(
									function() {
										if ($(this).children("option:selected")
												.val() == "농산물") {
											$(".category2").eq(0).show();
											$(".category2").eq(1).hide();
											$(".category2").eq(2).hide();
										} else if ($(this).children(
												"option:selected").val() == "수산물") {
											$(".category2").eq(0).hide();
											$(".category2").eq(1).show();
											$(".category2").eq(2).hide();
										} else {
											$(".category2").eq(0).hide();
											$(".category2").eq(1).hide();
											$(".category2").eq(2).show();
										}
									});

				});
			</script>
			<tr>
				<th>상품 대분류</th>
				<td><select class="category category1">
=======
			<tr>
				<th>제목</th>
				<td><input type="text" name="sellTitle" class="sellInputBox"></td>
			</tr>
			<tr>
				<th>상품 대분류</th>
				<td><select class="category category1 mg" name="sellCategory1">
>>>>>>> 88c7e4c21c147d5670ff1642de647970a8b5c18c
						<option value="">상품 대분류</option>
						<option value="농산물">농산물</option>
						<option value="수산물">수산물</option>
				</select></td>
			</tr>
			<tr>
				<th>상품 소분류</th>
<<<<<<< HEAD
				<td><select class="category category2">
						<option value="" selected>상품 소분류</option>
						<option value="채소">채소</option>
						<option value="과일">과일</option>
						<option value="가공식품">가공식품</option>
				</select> <select class="category category2">
						<option value="" selected>상품 소분류</option>
						<option value="생물">생물</option>
						<option value="냉동">냉동</option>
						<option value="가공식품">가공식품</option>
				</select> <select class="category category2" disabled>
						<option value="" selected>상품 소분류</option>
				</select> <span class="comments">대분류를 먼저 선택하세요.</span></td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><input type="text"><br>
				<span class="comments"></span></td>
=======
				<td><select class="category category2 mg">
						<option value="">상품 소분류</option>
						<option value="채소">채소</option>
						<option value="과일">과일</option>
						<option value="가공식품">가공식품</option>
				</select> <select class="category category2 mg">
						<option value="">상품 소분류</option>
						<option value="생물">생물</option>
						<option value="냉동">냉동</option>
						<option value="가공식품">가공식품</option>
				</select> <select class="category category2 mg" disabled>
						<option value="" selected>상품 소분류</option>
				</select></td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><input type="text" name="sellName" class="sellInputBox"></td>
>>>>>>> 88c7e4c21c147d5670ff1642de647970a8b5c18c
			</tr>

			<tr>
				<th>가격</th>
<<<<<<< HEAD
				<td><input type="text" id="sellPrice">원<br>
				<span class="comments"></span></td>
			</tr>

			<script>
				$(function() {
					$("input[type=radio]").click(function() {
						if ($(this).index() == 3) {
							$("#delFeeBox").attr("disabled", false);
						} else {
							$("#delFeeBox").attr("disabled", true);
						}
					});
					$("#delFeeBox").focusout(function() {
						if (!$("#delFeeBox").val() == "") {
							$("#typeDF").val($("#delFeeBox").val());
						}
					});
				});
			</script>
			<tr>
				<th>배송비 선택</th>
				<td><input type="radio" name="deliveryFee" value="0">무료배송
					<input type="radio" name="deliveryFee" value="2500">2500원 <input
					type="radio" name="deliveryFee" value="3000">3000원 <input
					type="radio" id="typeDF" name="deliveryFee" value="">직접입력 <input
					type="text" id="delFeeBox" name="deliveryFee" disabled></td>
			</tr>
			<tr>
				<th>판매 수량 설정</th>
				<td>최소: <input type="text">개 ~ 최대: <input type="text">개(묶음/박스)
					<br>
				<span class="comments"></span>
				</td>
			</tr>
			<tr>
				<th>판매 종료일 설정</th>
				<td><input type='text' class='datepicker-here' data-language='en' /></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><input type="text"><br></td>
			</tr>
			<tr>
				<th colspan="2">등록 상품의 필수 정보 입력</th>
			</tr>
			<tr>
				<th>제조원(원산지)</th>
				<td><input type="text"> <br>
				<span class="comments"></span></td>
			</tr>
			<tr>
				<th>유통기한</th>
				<td><input type="text"> <br>
				<span class="comments"></span></td>
			</tr>
			<tr>
				<th>원재료명 및 함량</th>
				<td><input type="text"> <br>
				<span class="comments"></span></td>
			</tr>
			<tr>
				<th>보관상 주의사항</th>
				<td><input type="text"> <br>
				<span class="comments"></span></td>
			</tr>

			<tr>
				<th>대표 이미지 등록</th>
				<td><input type="file" name="thumbnail"
					onchange="loadImg(this);"></td>
			</tr>
			<tr>
				<th>물품 사진 등록(최대 4장 가능)</th>
				<td><input multiple="multiple" type="file" name="filename[]">
				</td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="등록하기"> <input
					type="reset" value="취소하기"></th>
			</tr>
		</table>
	</form>
=======
				<td style="font-size: 110%;"><input type="text"
					name="sellPrice" class="sellInputNBox mg">원</td>
			</tr>
			<tr>
				<th>배송비 선택</th>
				<td><input type="radio" class="dfradio" name="sellDeliveryFee"
					value="0">무료배송 <input type="radio" class="dfradio"
					name="sellDeliveryFee" value="2500">2500원 <input
					type="radio" class="dfradio" name="sellDeliveryFee" value="3000">3000원
					<input type="radio" class="dfradio" name="sellDeliveryFee"
					id="typeDF" value="">직접입력 <input type="text" id="delFeeBox"
					class="sellInputNBox" disabled></td>
			</tr>
			<tr>
				<th>판매 수량 설정</th>
				<td style="font-size: 110%; margin-left: 10px;"><span
					class="mg"></span>최소: <input type="text" name="sellMin"
					class="sellInputNBox">개 ~ 최대: <input type="text"
					name="sellMax" class="sellInputNBox">개(묶음/박스)</td>
			</tr>
			<tr>
				<th>판매 종료일 설정</th>
				<td><input type="text" class="datepicker-here sellInputNBox mg"
					data-language="en" name="sellEndDate" readonly></td>
			</tr>
			<tr>
				<th colspan="2" style="border: none;"></th>
			</tr>
			<tr>
				<th colspan="2" style="font-size: 140%; border-right: none;"
					class="tableTitle">본문 내용 입력</th>
			</tr>
			<tr>
				<td colspan="2"><textarea name="sellContent" id="content"
						rows="10" cols="100" style="width: 1205px; height: 412px;"></textarea></td>
			</tr>
			<tr>
				<th colspan="2" style="border: none;"></th>
			</tr>
			<tr>
				<th colspan="2" style="font-size: 140%; border-right: none;"
					class="tableTitle">등록 상품의 필수 정보 입력</th>
			</tr>
			<tr>
				<th>제조원(원산지)</th>
				<td><input type="text" name="sellItemOrigin"
					class="sellInputBox"></td>
			</tr>
			<tr>
				<th>유통기한</th>
				<td><input type="text" name="sellItemExpireDate"
					class="sellInputBox"></td>
			</tr>
			<tr>
				<th>상품 용량</th>
				<td><input type="text" name="sellItemQuantity"
					class="sellInputBox"></td>
			</tr>
			<tr>
				<th>원재료명 및 함량</th>
				<td><input type="text" name="sellItemMaterial"
					class="sellInputBox"></td>
			</tr>
			<tr>
				<th>보관상 주의사항</th>
				<td><input type="text" name="sellItemRule" class="sellInputBox"></td>
			</tr>
			<tr>
				<th>대표 이미지 등록</th>
				<td><input type="file" name="thumbnail" id="thumbnail"
					class="fileattach"></td>
			</tr>
			<tr>
				<th>물품 사진 등록</th>
				<td><input multiple="multiple" type="file" name="imgFilepath[]"
					class="fileattach"></td>
			</tr>
			<tr>
				<th colspan="2" style="border: none;"></th>
			</tr>
			<tr style="height: 100px;">
				<th colspan="2" style="border: none;"><input type="submit"
					value="등록하기" id="formsubmit" class="finalBtn"> <input
					type="reset" value="취소하기" class="finalBtn"></th>
			</tr>
		</table>
	</form>

	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

>>>>>>> 88c7e4c21c147d5670ff1642de647970a8b5c18c
</body>

</html>