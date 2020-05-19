<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 다음주소api -->
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- 제이쿼리 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>

<!-- 달력 링크 -->
<link href="/dist/css/datepicker.min.css" rel="stylesheet"
	type="text/css">
<script src="/dist/js/datepicker.min.js"></script>
<script src="/dist/js/i18n/datepicker.en.js"></script>
<!-- 스마트 에디터 -->
<script type="text/javascript" src="/SE2.3/js/HuskyEZCreator.js"
   charset="utf-8"></script>



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
}

.comments {
	color: red;
}

.datepicker-here {
	
}
</style>
</head>
<script>
	//지역 선택시 판매 지역 선택
	$('document')
			.ready(
					function() {
						var area0 = [ "시/도 선택", "서울특별시", "인천광역시", "대전광역시",
								"광주광역시", "대구광역시", "울산광역시", "부산광역시", "경기도",
								"강원도", "충청북도", "충청남도", "전라북도", "전라남도", "경상북도",
								"경상남도", "제주도" ];
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
												$gugun.append("<option value=''>구/군 선택</option>");
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
	$(function(){
		$(".chooseRtab").hide();
		$(".chooseNation").click(function(){
			$(".chooseRtab").slideToggle("fast",function(){
			$(".chooseRtab").hide();
			});
		});
		$(".chooseRegion").click(function(){
			$(".chooseRtab").slideToggle("fast",function(){
				$(".chooseRtab").show();
			});
		});
		
		$("#addrAddBtn").click(function(){
			var sido = $("#sido").children("option:selected").val();
			var gugun = $("#gugun").children("option:selected").val();
			var addr = sido+" "+gugun;
			if($("#sellRegionalAddr").val()==""){
				$("#sellRegionalAddr").val(sido+" "+gugun);
			}else{
				if($("#sellRegionalAddr").val()==addr){
					alert("이미 추가한 주소입니다. \n다른 주소를 추가해주세요.")
				}else{
					$("#sellRegionalAddr").val($("#sellRegionalAddr").val()+","+sido+" "+gugun);
				}
			}
		});
		$("#addrDelBtn").click(function(){
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
      $("#formsubmit").click(
            function() {
               //id가 smarteditor인 textarea에 에디터에서 대입
               editor_object.getById["content"].exec(
                     "UPDATE_CONTENTS_FIELD", []);

               // 이부분에 에디터 validation 검증

               //폼 submit
               $("form").submit();
            });
   });
  
</script>
<body>
	<form action="/sellFormInsert" method="post"
		enctype="multipart/form-data">
		<input type="hidden" name="sellWriter"
			value="${sessionScope.member.memberId }">
		<table>
			<tr>
				<th>판매 지역 선택</th>
				<td><input type="radio" name="sellType" value="1" class="chooseNation">전국 판매
					<input type="radio" name="sellType" value="2" class="chooseRegion">지역 선택하기
					<div class="chooseRtab">
						<select name="sido" id="sido"></select> <select name="gugun"
							id="gugun"></select>
							<button type="button" id="addrAddBtn">추가</button>
							<button type="button" id="addrDelBtn">전체 삭제</button>
					 <input id="sellRegionalAddr" name="sellRegionalAddr" readonly/>
					 </div>
			</tr>
			<tr>
				<th>판매자 지역</th>
				<td><div>
						<ul>
							<li><input type="text" id="postCode"
								style="width: 200px; display: inline-block;"
								class="form-control" placeholder="우편번호" readonly>
								<button type="button" id="addrSearchBtn" onclick="addrSearch();"
									class="btn btn-primary">주소검색</button></li>
							<li><input id="roadAddr"
								style="width: 400px; display: inline-block;" type="text"
								class="form-control" placeholder="도로명주소"> <input
								id="jibunAddr" style="width: 400px; display: inline-block;"
								type="text" class="form-control" placeholder="지번주소"></li>
							<li><input id="detailAddr"
								style="width: 800px; display: inline-block;" type="text"
								class="form-control" placeholder="상세주소"></li>
						</ul>
					</div></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input type="text" name="sellTitle"><span
					class="comments"> 1자 이상 입력하세요.</span></td>
			</tr>
			<tr>
				<th>상품 대분류</th>
				<td><select class="category category1" name="sellCategory1">
						<option value="">상품 대분류</option>
						<option value="농산물">농산물</option>
						<option value="수산물">수산물</option>
				</select></td>
			</tr>
			<tr>
				<th>상품 소분류</th>
				<td><select class="category category2">
						<option value="">상품 소분류</option>
						<option value="채소">채소</option>
						<option value="과일">과일</option>
						<option value="가공식품">가공식품</option>
				</select> <select class="category category2">
						<option value="">상품 소분류</option>
						<option value="생물">생물</option>
						<option value="냉동">냉동</option>
						<option value="가공식품">가공식품</option>
				</select> <select class="category category2" disabled>
						<option value="" selected>상품 소분류</option>
				</select> <span class="comments">대분류를 먼저 선택하세요.</span></td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><input type="text" name="sellName"><br> <span
					class="comments"></span></td>
			</tr>

			<tr>
				<th>가격</th>
				<td><input type="text" name="sellPrice">원<br> <span
					class="comments"></span></td>
			</tr>
			<tr>
				<th>배송비 선택</th>
				<td><input type="radio" class="dfradio" name="sellDeliveryFee" value="0">무료배송
					<input type="radio" class="dfradio" name="sellDeliveryFee" value="2500">2500원
					<input type="radio" class="dfradio" name="sellDeliveryFee" value="3000">3000원
					<input type="radio" class="dfradio" name="sellDeliveryFee" id="typeDF" value="">직접입력
					<input type="text" id="delFeeBox" disabled></td>
			</tr>
			<tr>
				<th>판매 수량 설정</th>
				<td>최소: <input type="text" name="sellMin">개 ~ 최대: <input
					type="text" name="sellMax">개(묶음/박스) <br> <span
					class="comments"></span>
				</td>
			</tr>
			<tr>
				<th>판매 종료일 설정</th>
				<td><input type="text" class="datepicker-here"
					data-language="en" name="sellEndDate" readonly></td>
			</tr>
			<tr>
				<th colspan="2">내용 입력</th>
			</tr>
			<tr>
				<td colspan="2"><textarea name="sellContent" id="content" rows="10" cols="100"
						style="width: 652px; height: 412px;"></textarea></td>
			</tr>
			<tr>
				<th colspan="2">등록 상품의 필수 정보 입력</th>
			</tr>
			<tr>
				<th>제조원(원산지)</th>
				<td><input type="text" name="sellItemOrigin"> <br>
					<span class="comments"></span></td>
			</tr>
			<tr>
				<th>유통기한</th>
				<td><input type="text" name="sellItemExpireDate"> <br>
					<span class="comments"></span></td>
			</tr>
			<tr>
				<th>상품 용량</th>
				<td><input type="text" name="sellItemQuantity"> <br>
					<span class="comments"></span></td>
			</tr>
			<tr>
				<th>원재료명 및 함량</th>
				<td><input type="text" name="sellItemMaterial"> <br>
					<span class="comments"></span></td>
			</tr>
			<tr>
				<th>보관상 주의사항</th>
				<td><input type="text" name="sellItemRule"> <br> <span
					class="comments"></span></td>
			</tr>

			<tr>
				<th>대표 이미지 등록</th>
				<td><input type="file" name="thumbnail" id="thumbnail"></td>
			</tr>
			<tr>
				<th>물품 사진 등록</th>
				<td><input multiple="multiple" type="file" name="imgFilepath[]">
				</td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="등록하기" id="formsubmit"> <input
					type="reset" value="취소하기"></th>
			</tr>
		</table>
	</form>
</body>

</html>