<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>판매글 Page</title>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
<style>
.buy {
	width: 1280px;
	height: 1800px;
	margin: 0 auto;
	overflow: hidden;
}
 
.sell_head {
	box-sizing: content-box;
	margin: 0 auto;
	border-bottom: 2px solid gray;
	width: 90%;
	height: 50px;
	/*            border-collapse: collapse;*/
}

.sell_head_sub {
	padding-bottom: 10px;
	font-size: 1.5em;
	box-sizing: border-box;
	width: 70%;
	height: 100%;
	float: left;
	line-height: 2;
}

.sell_home {
	float: left;
	width: 50px;
	height: 50px;
}

.sell_a {
	font-size: 25px;
	text-decoration: none;
	color: black;
}

.sell_head_sub2 {
	box-sizing: border-box;
	width: 30%;
	height: 100%;
	float: left;
	text-align: center;
	line-height: 4;
}

.sell_content {
	margin: 0 auto;
	width: 80%;
	height: 1300px;
	border: 1px solid red;
}

.sell_content_table {
	border-collapse: collapse;
	font-size: 20px;
	width: 100%;
	height: 500px;
}

.sell_table_td {
	border-right: 1px solid gray;
}

.sell_img11 {
	margin-left: 50px;
	width: 80%;
	height: 100%;
}

.sell_content_table tr {
	border-bottom: 1px solid gray;
	height: 30px;
}

.sell_content_img_div {
	border: 1px solid black;
	width: 100px;
	height: 1;
}

.sell_timer {
	box-sizing: border-box; position : absolute;
	margin-left: 105px;
	margin-top: -70px;
	border: 2px solid black;
	width: 300px;
	height: 70px;
	text-align: center;
	color: red;
	line-height: 1.7;
	font-size: 2em;
	position: absolute;
}

.sell_table_th {
	width: 500px;
	height: 50px;
}

.sell_table_th2 {
	line-height: 0.5;
	width: 80px;
	height: 50px;
}

.sell_warning {
	width: 20px;
	height: 20px;
}

#sell_content_warning {
	font-size: 10px;
}

.sell_table_div {
	border-radius: 5px;
	height: 80%;
	line-height: 2;
	border: 1px solid darkseagreen;
	background-color: darkseagreen;
}

.sell_content2 {
	border-bottom: 2px solid gray;
	width: 100%;
	height: 800px;
	box-sizing: content-box;
	overflow: hidden;
}

.sell_content2_sub {
	width: 70%;
	height: 100%;
	border: 1px solid blue;
	box-sizing: border-box;
	float: left;
}

.sell_content_img2_btn {
	text-align: center;
	line-height: 5;
	margin-top: 100px;
	border: 1px solid black;
	width: 9%;
	height: 10%;
	float: left;
}

.sell_content_img2_btn2 {
	text-align: center;
	line-height: 5;
	margin-top: 100px;
	border: 1px solid black;
	width: 9%;
	height: 10%;
	float: left;
}

.sell_content_text {
	border: 1px solid red;
	width: 100%;
	height: 500px;
	float: left;
	box-sizing: border-box;
}

.sell_content_img2 {
	float: left;
	border: 1px solid red;
	margin: 0 auto;
	width: 80%;
	height: 300px;
	box-sizing: border-box;
}

.sell_content2_sub2 {
	box-sizing: border-box;
	width: 25%;
	height: 20%;
	float: left;
	background-color: lightgray;
	margin: 20px;
}

.sell_grade {
	display: none;
}

.sell_content3 {
	box-sizing: content-box;
	border: 1px solid black;
	width: 100%;
	height: 300px;
}

.sell_navi {
	margin: 0 auto;
	box-sizing: content-box;
	border: 1px solid blue;
	width: 80%;
	height: 50px;
}

.sell_menu {
	line-height: 2.5;
	text-align: center;
	box-sizing: border-box;
	border: 1px solid red;
	width: 50%;
	height: 100%;
	float: left;
	cursor: pointer;
}

.sell_menu.active {
	background-color: darkseagreen;
}

.sell_menu_sub {
	border: 1px solid red;
	width: 80%;
	margin: 0 auto;
	border-top: none;
	display:none;
}

.sell_goods_inf {
	width: 100%;
	border-collapse: collapse;
}

.sell_goods_inf tr {
	border-bottom: 1px solid gray;
}

.sell_goods_inf th {
	width: 50%;
	border-right: 1px solid gray;
}

.sell_content3 h2 {
	margin-top: 0;
}

.sell_goods_inf_tr {
	border-top: 1px solid gray;
}
</style>
</head>
<body>
	<section class="sell_container">
	<form action="/buyFrm" method="post" class="sell">
		<div class="sell_head">
			<div class="sell_head_sub">
				<img src="img/1.png" class="sell_home"> > <a href="#"
					class="sell_a">내 지역 판매</a>
			</div>
			<div class="sell_head_sub2">
				작성일 :
				<button type="button" class="sell_delete_btn">글 삭제 요청</button>
			</div>
		</div>
		<div class="sell_content">
			<table class="sell_content_table">
				<tr>
					<td rowspan="5" class="sell_table_td"><img src="img/1.png"
						class="sell_img11">
						<div class="sell_timer">00:00:00</div></td>
					<th class="sell_table_th">글 제목</th>
					<th class="sell_table_th2"><img src="/img/3g.png"
						class="sell_warning"><br> <span
						id="sell_content_warning">글 신고하기</span></th>
				</tr>
				<tr>
					<th colspan="2">팜 딜가 10000원 | 개당(g)</th>
				</tr>
				<tr>
					<th colspan="2">
						<div class="sell_table_div">
							내 지역 판매 상품을 주문하고, <br>오늘 오후 23시 전에 바로 받아보세요!
						</div>
					</th>
				</tr>
				<tr>
					<th colspan="2">무료배송<br> 당일 도착 보장(오후 2시 전 주문 시 / 내 지역 기준)
					</th>
				</tr>
				<tr>
					<th colspan="2">수량 선택 <select>
							<option name="count" class="count" value="1">1</option>
							<option name="count" class="count" value="2">2</option>
							<option name="count" class="count" value="3">3</option>
							<option name="count" class="count" value="4">4</option>
							<option name="count" class="count" value="5">5</option>
							<option name="count" class="count" value="6">6</option>
							<option name="count" class="count" value="7">7</option>
							<option name="count" class="count" value="8">8</option>
							<option name="count" class="count" value="9">9</option>
							<option name="count" class="count" value="10">10</option>
					</select>
						<button onclick="#" class="sell_btn">딜 참여하기(결제하기)</button> <span>주문한
							금액</span>
					</th>
				</tr>
				<tr>
					<td>구매현황 : 현재 000개 구매 진행중</td>
					<td colspan="2">딜 완료까지 00개 남음!</td>
				</tr>
			</table>
			<div class="sell_content2">
				<div class="sell_content2_sub">
					<div class="sell_content_img2_btn">왼</div>
					<div class="sell_content_img2">img</div>
					<div class="sell_content_img2_btn2">오</div>
					<div class="sell_content_text">상세내용</div>
				</div>
				<div class="sell_content2_sub2">
					판매자 스토어 정보<br>
					<br> <span>판매자 이름</span> <img src="/img/1.png"
						class="sell_grade">
				</div>
			</div>
			<div class="sell_content3">
				<div class="sell_navi">
					<div class="sell_menu">상품문의</div>
					<div class="sell_menu">상품정보</div>
				</div>
				<div class="sell_menu_sub">
					<h2>상품문의</h2>
					<div class="sell_content_wrapper">
						<!-- <form action="/sellPage_CommentInsert" method="post">
						</form> -->
					</div>
				</div>
				<div class="sell_menu_sub">
					<h2>상품정보</h2>
					<table class="sell_goods_inf">
						<tr class="sell_goods_inf_tr">
							<th>제조원</th>
							<td></td>
						</tr>
						<tr>
							<th>유통기한</th>
							<td></td>
						</tr>
						<tr>
							<th>상품용량</th>
							<td></td>
						</tr>
						<tr>
							<th>원재료명 및 함량</th>
							<td></td>
						</tr>
						<tr>
							<th>보관시 주의사항</th>
							<td></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</form>
	</section>
	<script>
		$(".sell_menu:eq(0)").addClass("active");
		$(".sell_menu_sub:eq(0)").first().css("display", "block");
		$(".sell_menu").click(function(event) {
			var selectedIndex = $(".sell_menu").index($(this));
			$(".sell_menu_sub").each(function(index, item) {
				if (index != selectedIndex) {
					$(item).css('display', 'none');
				} else {
					$(item).css('display', 'block');
				}
			});
			$(".sell_menu").each(function(index, item) {
				if (index != selectedIndex) {
					$(this).removeClass('active');
				} else {
					$(this).addClass("active");
				}
			});
		});
	</script>
</body>
</html>