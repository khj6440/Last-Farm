<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>



<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<style>
* {
	font-family: 'Jua', sans-serif;
}

/* .container{ */
/* width: 1200px; */
/* margin: 0 auto; */
/* } */
.wrapper {
	width: 1200px;
	margin: 0 auto;
}

.tab {
	width: 100%;
}

.main {
	overflow: hidden;
	width: 100%;
	margin-bottom: 100px;
}

.mine {
	width: 100%;
	margin: 20px 0px;
	display: flex;
}

.photo {
	width: 30%;
	height: 300px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	position: relative;
}

#blah {
	position: absolute;
}

.info {
	width: 70%;
	line-height: 150px;
	height: 150px;
	padding-left: 30px;
}

ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

.photo i {
	font-size: 150px;
	color: gray;
	margin-bottom: 15px;
}

.photo button, .photo label {
	text-align: center;
	width: 100px;
	line-height: 70px;
	height: 70px;
	font-size: 20px;
	border: none;
	color: white;
	border-radius: 20px;
	box-shadow: 3px 3px 3px gray;
}

.info-title {
	font-size: 40px;
	font-weight: bold;
	margin-bottom: 20px;
	display: flex;
	align-items: center;
}

.info-contents {
	display: flex;
}

.info-content {
	width: 20%;
}

.info-content>span {
	margin-left: 20px;
	color: rgb(92, 91, 91);
}

.modify-info, .manage-sell, .store-review {
	color: white;
	border: none;
	padding: 10px;
	width: 100px;
	height: 40px;
	border-radius: 10px;
	margin-left: 20px;
}

.intro {
	width: 90%;
}

.intro-text {
	width: 100%;
	padding: 10px;
	height: 120px;
	word-break: break-all;
	overflow: auto;
}

.modify-intro {
	background-color: rgb(202, 199, 199);
	border: none;
	border-radius: 10px;
	padding: 5px;
	color: gray;
}

.tab-li {
	width: 25%;
	font-size: 25px;
	float: left;
	box-sizing: border-box;
	border: 1px solid rgb(202, 201, 201);
	border-bottom: 1px solid black;
	height: 60px;
	color: rgb(202, 201, 201);
	line-height: 60px;
	text-align: center;
	transition-duration: 0.5s;
}

.tab ul>li:hover {
	box-shadow: 2px -2px 2px grey;
}

.content>div:first-child {
	padding-top: 50px;
	font-size: 30px;
	font-weight: bold;
	border-bottom: 1px solid rgb(190, 189, 189);
	margin-bottom: 30px;
}

.contents {
	width: 100%;
	clear: both;
}

.content {
	display: none;
	width: 100%;
}

.show-content {
	display: block;
}

.tab-selected {
	color: black;
	border: 1px solid black;
	border-bottom: none;
}

.content-menu {
	padding: 0px 10px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 30px;
}

.order {
	display: flex;
}

.order>div {
	width: 100px;
	/* background-color: red; */
	border-right: 1px solid gray;
	text-align: center;
	cursor: pointer;
}

.order>div:last-child {
	border-right: none;
}

.allCheck {
	display: flex;
	align-items: center;
}

.allCheck>input {
	width: 30;
	height: 30;
}

.allCheck>button {
	width: 80px;
	height: 30px;
	border: none;
	background-color: rgb(112, 112, 112);
	border-radius: 10px;
	color: rgb(207, 207, 207);
	box-shadow: 2px 2px 2px rgb(201, 201, 201);
}

.list {
	width: 100%;
	margin-bottom: 30px;
}

.list>div {
	width: 99%;
	height: 250px;
	border: 1px solid rgb(209, 209, 209);
	display: flex;
	margin-bottom: 30px;
}

.p-image {
	width: 25%;
	height: 100%;
	background-color: burlywood;
}

.p-info {
	width: 65%;
	height: 100%;
	padding: 20px;
}

.p-title {
	margin-bottom: 20px;
	font-size: 30px;
	display: flex;
	justify-content: space-between;
}

.p-title>input {
	width: 30px;
	height: 30px;
}

.p-price {
	margin-bottom: 10px;
	font-size: 25px;
}

.p-day {
	color: gray;
	margin-bottom: 20px;
	padding-bottom: 10px;
	border-bottom: 1px solid rgb(209, 209, 209);
}

.p-location {
	height: 50px;
	color: gray;
	line-height: 50px;
}

.intro2>textarea {
	resize: none;
}

.info {
	position: relative;
}

.intro {
	position: absolute;
}

.intro2 {
	position: absolute;
	visibility: hidden;
	display: flex;
}

.modify_complete {
	width: 80px;
	background-color: gray;
	height: 180px;
	color: white;
	border: none;
}

.empty {
	clear: both;
	display: none;
	width: 100%;
	text-align: center;
	height: 300px;
	color: gray;
	font-size: 50px;
	line-height: 300px;
}

.buy-list {
	width: 100%;
}

.buy-item {
	float: left;
	width: 280px;
	height: 430px;
	margin-right: 15px;
	border: 1px solid rgb(199, 199, 199);
}

.buy-image {
	margin-bottom: 15px;
	width: 100%;
	height: 250px;
	background-color: green;
}

.buy-image>img {
	width: 100%;
	height: 100%;
}

.buy-name {
	font-size: 30px;
	font-weight: bold;
	margin-bottom: 20px;
	padding: 10px;
}

.buy-price {
	display: flex;
	justify-content: space-between;
	padding: 5px;
	font-size: 20px;
	border-bottom: 1px solid rgb(180, 180, 180);
}

.buy-price>span:last-child {
	color: rgb(155, 155, 155);
}

.buy-location {
	padding-left: 10px;
	color: rgb(155, 155, 155);
	height: 50px;
	display: flex;
	align-items: center;
}

.request {
	margin: 0 auto;
	width: 95%;
}

.request>textarea {
	width: 100%;
	height: 150px;
	resize: none;
	border: 1px solid rgb(180, 180, 180);
}

.textNum {
	width: 100%;
	line-height: 50px;
	height: 50px;
	display: flex;
	justify-content: space-between;
	background-color: rgb(245, 245, 245);
	border: 1px solid rgb(180, 180, 180);
	margin-bottom: 30px;
}

.textNum>span {
	margin-left: 40px;
	color: rgb(180, 180, 180);
}

.textNum>button {
	margin-right: 40px;
	width: 100px;
	color: white;
	font-size: 20px;
	background-color: #F6b70d;
	border: none;
	border-radius: 10px;
}

#inputArea {
	font-size: 20px;
}

.request>.result {
	width: 100%;
}

.comment {
	width: 100%;
	/* height: 100px; */
	border-bottom: 1px solid gray;
	display: flex;
	margin-bottom: 20px;
}

.comment-left {
	width: 10%;
	height: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
}

.comment-left>i {
	text-align: center;
	padding-top: 20px;
	font-size: 50px;
}

.comment-right {
	width: 90%;
	padding: 0px 30px;
	word-break: break-all;

	/* background-color: blanchedalmond; */
}

.comment-right>.user-name {
	color: gray;
	font-size: 20px;
	margin-bottom: 5px;
	display: flex;
	justify-content: space-between;
}

.comment-right>.user-comment {
	font-size: 20px;
	margin-bottom: 30px;
}

.delete-comment {
	background-color: #F6b70d;
	border-radius: 50px;
	border: none;
	width: 30px;
	height: 30px;
	color: white;
}

.followers {
	width: 100%;
}

.follower-list {
	width: 90%;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
}

.follower {
	margin-bottom: 30px;
	width: 30%;
	height: 350px;
	border: 1px solid rgb(207, 207, 207);
	transition-duration: 0.5s;
	display: flex;
	flex-direction: column;
	text-align: center;
	justify-content: space-around;
}

.follower:hover {
	border: 1px solid #F6b70d;
	box-shadow: 15px 15px 20px rgb(179, 178, 178);
}

.follower>i:first-child {
	font-size: 100px;
}

.follower>.plus-btn {
	margin: 0 auto;
	width: 80%;
	height: 60px;
	line-height: 60px;
	background-color: #F6b70d;
}

.follower>.nick {
	font-size: 40px;
}

.main_font {
	color: #F6b70d;
}

.sub_font {
	color: #2c3650;
}

.main_bgColor {
	background-color: #F6b70d;
}

.sub_bgColor {
	background-color: #2c3650;
}

.grey1 {
	background-color: #4e5052;
}

.grey2 {
	background-color: #7d8084;
}

.grey3 {
	background-color: #d2d5db;
}

.pcontainer>.phone, .bcontainer>.bank {
	float: left;
	margin: 0 20px;
	vertical-align: top;
}

.phone, .bank {
	display: inline-block;
	position: relative;
	overflow: hidden;
	height: 28px;
	width: 150px;
	background: #f2f2f2;
	border: 1px solid;
	border-color: white #f7f7f7 whitesmoke;
	border-radius: 3px;
	background-image: -webkit-linear-gradient(top, transparent, rgba(0, 0, 0, 0.06));
	background-image: -moz-linear-gradient(top, transparent, rgba(0, 0, 0, 0.06));
	background-image: -o-linear-gradient(top, transparent, rgba(0, 0, 0, 0.06));
	background-image: linear-gradient(to bottom, transparent, rgba(0, 0, 0, 0.06));
	-webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.08);
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.08);
}

.sign {
	padding-top: 0px;
	color: #8C55AA;
	font-family: 'Jua', sans-serif;
	font-weight: bold;
	font-size: 23px;
	margin: 0;
}

form.form1 {
	padding-top: 20px;
}

#company, #bank, .id, #pw, #pw_re, #name, #phone, #email, #mailCode,
	#code {
	display: inline-block;
	width: 86%;
	height: 40px;
	color: rgb(38, 50, 56);
	font-weight: 700px;
	font-size: 14px;
	letter-spacing: 1px;
	background: rgba(136, 126, 126, 0.04);
	margin: 0 auto;
	outline: none;
	box-sizing: border-box;
	border: 2px solid rgba(0, 0, 0, 0.02);
	margin-left: 10px;
	text-align: center;
	font-family: 'Jua', sans-serif;
}

.form-control {
	width: 36%;
	height: 40px;
	color: rgb(38, 50, 56);
	font-weight: 70;
	font-size: 14px;
	letter-spacing: 1px;
	background: rgba(136, 126, 126, 0.04);
	border: none;
	border-radius: 3px 3px 3px 3px;
	outline: none;
	box-sizing: border-box;
	border: 2px solid rgba(0, 0, 0, 0.02);
	margin-bottom: 10px;
	margin-left: 108px;
	text-align: center;
	margin-bottom: 27px;
	font-family: 'Jua', sans-serif;
}

#company:focus, #bank:focus, #id:focus, #pw:focus, #pw_re:focus, #email:focus,
	#name:focus, #phone:focus, #bankNum:focus, #code:focus {
	border: 2px solid rgba(0, 0, 0, 0.18);
	background-color: beige;
	!
	important;
}

.abtn, .btn {
	cursor: pointer;
	margin: 0 auto;
	color: #fff;
	background: #964b00;
	border: 0.5px solid gray;
	border-radius: 3px 3px 3px 3px;
	padding-bottom: 10px;
	padding-top: 10px;
	font-family: 'Jua', sans-serif;
	box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
}

.submit {
	cursor: pointer;
	border-radius: 5em;
	color: #fff;
	background: #964b00;
	border: 0;
	padding-bottom: 10px;
	padding-top: 10px;
	font-family: 'Jua', sans-serif;
	margin-left: 35%;
	font-size: 13px;
	box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
}

.forgot {
	padding-top: 15px;
}

.dropdown {
	float: left;
}

#text {
	display: block;
	padding-left: 100px;
	text-align: left;
	font-family: 'Jua', sans-serif;
}

.phone:before, .phone:after {
	content: '';
	position: absolute;
	z-index: 2;
	top: 9px;
	right: 10px;
	width: 0;
	height: 0;
	border: 4px dashed;
	border-color: #888888 transparent;
	pointer-events: none;
}

.bank:before, .bank:after {
	content: '';
	position: absolute;
	z-index: 2;
	top: 9px;
	right: 10px;
	width: 0;
	height: 0;
	border: 4px dashed;
	border-color: #888888 transparent;
	pointer-events: none;
}

.phone:before {
	border-bottom-style: solid;
	border-top: none;
}

.phone:after, .bank:after {
	margin-top: 7px;
	border-top-style: solid;
	border-bottom: none;
}

.phone-select, .bank-select {
	position: relative;
	width: 130%;
	margin: 0;
	height: 28px;
	line-height: 14px;
	font-size: 12px;
	color: #62717a;
	text-shadow: 0 1px white;
	background: #f2f2f2;
	background: rgba(0, 0, 0, 0) !important;
	border: 0;
	border-radius: 0;
	-webkit-appearance: none;
}

.bank-select:focus, .phone-select:focus {
	z-index: 3;
	width: 100%;
	color: #394349;
	outline: 2px solid #49aff2;
	outline: 2px solid -webkit-focus-ring-color;
	outline-offset: -2px;
}

.bank-select>option, .phone-select>option {
	margin: 3px;
	padding: 6px 8px;
	text-shadow: none;
	background: #f2f2f2;
	border-radius: 3px;
	cursor: pointer;
}

.lt-ie9 .phone, .lt-ie9 .bank {
	z-index: 1;
}

.lt-ie9 .phone-select, .lt-ie9 .bank-select {
	z-index: -1;
}

.lt-ie9 .phone-select:focus, .lt-ie9 .bank-select:focus {
	z-index: 3;
}

@
-moz-document url-prefix () { .phone-select {
	padding-left: 6px;
}

}
@media ( max-width : 600px) {
	.main {
		border-radius: 0px;
	}
	p {
		margin: 0 auto;
	}
}

::placeholder {
	opacity: 0.4;
}

#submit {
	background-color: #4a2100;
	color: #ffac05;
	border-radius: 3px 3px 3px 3px;
}

#submit:hover {
	background-color: #ffac05;
	color: #4a2100;
}

#reset {
	background-color: #4a2100;
	color: #ffac05;
	border-radius: 3px 3px 3px 3px;
}

#reset:hover {
	background-color: #ffac05;
	color: #4a2100;
}

#roadAddr, #detailAddr {
	float: left;
}

#eBtn {
	color: #fff;
	font-family: 'Jua', sans-serif;
	background: #964b00;
	border: 0.5px solid gray;
	border-radius: 3px 3px 3px 3px;
}

</style>

<script type="text/javascript">
	function deleteMember(memberId) {
		if (confirm("탈퇴하시겠습니까?"))

			location.href = "/deleteMember?memberId=" + memberId;
	}

	function addrSearch1() {
		new daum.Postcode({
			oncomplete : function(data) {
				$("#postCode").val(data.zonecode);
				$("#roadAddr").val(data.roadAddress);

			}
		}).open();
	}

	function addrSearch2() {
		new daum.Postcode({
			oncomplete : function(data) {
				$("#postCode2").val(data.zonecode);
				$("#roadAddr2").val(data.roadAddress);

			}
		}).open();
	}

	$(function() {
		$(".tab>ul>li").click(function() {
			$(".tab>ul>li").removeClass("tab-selected")
			$(this).addClass("tab-selected");
			var index = $(".tab>ul>li").index($(this));
			$(".content").removeClass("show-content");
			$(".content").eq(index).addClass("show-content")
		});

		$(".order>div").click(function() {
			$(".order>div").css("color", "");
			$(this).css("color", "#F6b70d");

		})
		$("#inputArea").keyup(function() {
			var inputLength = $(this).val().length;
			if (inputLength > 2000) {
				alert("입력가능 글자를 초과했습니다")
				return;
			}
			$(".textNum>span").html(inputLength + " / 2000");

		})

		$(".p-title>input").click(function(event) {
			event.stopPropagation();
		})

		$(".product").children().not(".p-info>.p-title>input").click(
				function() {
					console.log("test");
				})

		$("#imgInp").on('change', function() {
			changeImg(this);
		});

	})

	function reviewInsert(sellEndNo, sellEndWriter) {
		console.log("시작");
		var memberId = "${sessionScope.member.memberId}";
		/* var sellEndWriter = "${sessionScope.sellEnd.sellEndWriter}"; */
		var url = "/reviewInsertFrm";
		var title = "reviewInsertFrm";
		var status = "left=500px, top=100px, width=600px, height=550px, menubar=no, status=no, scrollbars=yes";
		var popup = window.open("", title, status);
		$("input[name=sellEndNo]").val(sellEndNo);
		$("input[name=memberId]").val(memberId);
		$("input[name=sellEndWriter]").val(sellEndWriter);
		$(".reviewInsertFrm").attr("action", url);
		$(".reviewInsertFrm").attr("method", "post");
		$(".reviewInsertFrm").attr("target", title);//새로 열린 popup창과 form태그를 연결
		$(".reviewInsertFrm").submit();
	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<div class="container">
		<div class="wrapper">
			<div class="main">
				<div class="mine">
					<div class="info">
						<div class="info-title">
							<i class="fas fa-user" style="margin-right: 20px;"></i> <span>${sessionScope.member.memberName }
								님 </span>
						</div>
						<div class="info-contents">
							<div class="info-content"></div>
						</div>

					</div>
				</div>
				<div class="tab">
					<ul class="tab-ul">
						<li class="tab-li tab-selected">내 정보 수정</li>


						<c:if test="${sessionScope.member.memberType eq 1 }">
							<li class="tab-li">구매중 목록</li>
							<li class="tab-li">구매 내역</li>
						</c:if>
						<c:if test="${sessionScope.member.memberType eq 2 }">
							<li class="tab-li">판매중 목록</li>
							<li class="tab-li">판매 내역</li>
						</c:if>

						<li class="tab-li"
							onclick="location.href='/messageList?check=1&reqPage=1&memberId=${sessionScope.member.memberId }'">쪽지함</li>
					</ul>
				</div>
				<div class="contents">
					<div class="content show-content">
						<div class="content-title">내정보 수정</div>
						<div class="request">
							<form class="form1" method="post" action="/updateMember">

								<label for="id">
									<div id="text">아이디</div>
									<div style="padding-left: 100px; padding-right: 40px">
										<input class="id " type="text" id="id" align="center"
											value="${m.memberId}" name="id"
											style="margin-right: 35px; width: 150px" readonly>
									</div>
								</label> <br> <label for="pw">
									<div id="text" style="float: left;"
										style="padding-bottom:10px;">비밀번호</div> <br>
									<div style="padding-left: 100px; padding-right: 40px">

										<input class="pw" type="password" id="pw" align="center"
											style="width: 150px" "
										value="${m.memberPw }"
											name="pw">
									</div> <br>
								</label>
								<div id="text" style="padding-bottom: 10px;">비밀번호 확인</div>
								<div style="padding-left: 100px; padding-right: 40px">

									<input class="pw" type="password" id="pw" align="center"
										style="width: 150px" "
										value="${m.memberPw }"
										style="display:none" name="pw">
								</div>
								<br> </label>

								<div id="pw_result" style="display: none"></div>

								<br> <label for="name">
									<div id="text" style="padding-top: 20px;">이름</div>
									<div style="padding-left: 100px; padding-right: 40px">
										<input type="text" name="name" id="name"
											value="${m.memberName }" style="width: 150px">
									</div>
								</label>


								<div id="name_result"></div>
								<br>

								<lable for="phone">
								<div id="text">휴대전화</div>

								<div style="margin-left: 108px; display: inline-block;">
									<div class="Pcontainer"
										style="display: inline-block; float: left;">
										<div class="dropdown" style="padding-top: 10px;">
											<select class="phone" style="width: 50px; height: 40px;">

												<option value="82">+82</option>
												<option value="84">+84</option>
												<option value="1">+1</option>
												<option value="10">+10</option>
												<option value="1">+11</option>
												<option value="12">+12</option>
												<option value="13">+13</option>
												<option value="14">+14</option>
												<option value="15">+15</option>
												<option value="16">+16</option>
												<option value="17">+17</option>

											</select>

										</div>


									</div>

									<div id="tell_input"
										style="padding-top: 10px; padding-right: 30px; float: right;">
										<input type="text" id="phone" name="phone"
											style="width: 150px;" value="${m.memberPhone }">
									</div>
								</div>
								</lable>
								<br>
								<div id="tell_result"
									style="margin-top: 50px; margin-bottom: 10px;"></div>



								<br> <label for="email">
									<div id="text">이메일</div>
									<div style="padding-left: 98px; padding-right: 10px">
										<input type="email" id="email" value="${m.memberEmail }"
											name="email" style="float: left; width: 200px;"> <input
											type="button" id="eBtn"
											style="width: 115px; height: 40px; margin-left: 10px;"
											value="인증하기">
									</div>
									<div style="padding-left: 98px;">
										<input type="text" id="mailCode"
											style="display: none; margin-top: 13px; width: 120px;">
										<button type="button" id="mailResult" class="btn "
											style="display: none; width: 100px; font-size: 10px; height: 40px; padding-bottom: 10px; background-color: balck;">확인</button>
									</div> <span id="mailMsg"></span> <br> <br>

									<div id="email_result"
										style="margin-top: 2px; margin-bottom: 10px;"></div>
								</label>



								<div id="text" style="text-align: left;">자택 주소</div>

								<div>
									<div style="padding-right: 40px;">
										<input type="text" id="postCode" name="postCode1"
											style="width: 200px; display: inline-block; width: 150px"
											class="form-control" value="${m.memberPostCode }" readonly>
										<input type="button" id="addrSearchBtn"
											onclick="addrSearch1();" class="btn btn-primary" value="변경하기"
											style="width: 120px;">
									</div>
									<div>
										<input id="roadAddr"
											style="width: 190px; display: inline-block;" name="roadAddr1"
											type="text" class="form-control" value="${m.memberRoadAddr }">


										<input id="detailAddr" name="detailAddr1"
											style="width: 125px; float: left; margin-left: 15px;"
											type="text" ;
							class="form-control"
											value="${m.memberDetailAddr }">

									</div>

								</div>
								<c:if test="${m.memberType eq 2 }">
									<br>
									<label for="title"> <br>

										<div
											style="padding-left: 100px; padding-right: 40px; text-align: left;">
											<br> <br> <br>
											<div style="text-align: left; padding-right: 108px;">상호명</div>

											<input type="text" name="company" id="company"
												style="width: 150px; height: 40px;"
												placeholder=" 상호명을 입력해주세요" value="${m.companyName }">
										</div>
									</label>


									<div id="title_result"></div>

									<br>

									<div id="text" style="text-align: left;">사업자 등록 주소</div>
									<div>
										<div style="padding-right: 40px;">
											<input type="text" id="postCode2" name="postCode2"
												style="width: 200px; display: inline-block; width: 150px"
												class="form-control" value="${m.memberPostCode2 }" readonly>
											<input type="button" id="addrSearchBtn2"
												onclick="addrSearch2();" class="btn btn-primary"
												value="변경하기" style="width: 120px;">
										</div>
										<div>
											<input id="roadAddr2"
												style="width: 190px; display: inline-block;"
												name="roadAddr2" type="text" class="form-control"
												value="${m.memberRoadAddr2 }"> <input
												id="detailAddr2" name="detailAddr2"
												style="width: 125px; margin-left: 15px;" type="text"
												class="form-control" value="${m.memberDetailAddr2 }">
										</div>
									</div>
									<br>
									<br>
									<br>
									<br>

									<lable for="bank">
									<div id="text" style="text-align: left;">주거래 은행</div>
									</lable>
									<div style="float: left; padding-left: 100px">
										<div class="dropdown">
											<select class="bank" style="width: 110px; height: 40px"
												name="bankName">

												<option value="기업">기업은행</option>
												<option value="신한">신한은행</option>
												<option value="국민">국민은행</option>
												<option value="리드코푸">리드코프</option>
												<option value="러시앤캐쉬">러쉬앤캐쉬</option>


											</select>

										</div>


									</div>

									<div id="bank_input" style="padding-right: 30px;">
										<input type="text" id="bank" name="bankAccount"
											style="width: 213px;" placeholder="-빼고 입력해주세요"
											value="${m.bankAccount }">
									</div>
									<br>
									<br>
									<div id="bank_result" style="margin-top: 50px;"></div>
								</c:if>


								<br> <br> <br> <br>

								<div style="text-align: center">
									<input type="reset" id="reset" class="submit" align="center"
										value="되돌아가기"
										style="margin: 10px; margin-bottom: 12px; width: 150px"
										onClick="location.href='/index.jsp';"> <input
										type="submit" id="submit" class="submit" align="center"
										value="수정하기" style="margin: 10px; width: 150px"> <input
										type="button" align="center" id="submit"
										style="margin: 10px; width: 150px; margin: 10 px; width: 150px; outline: 0; border: 0; color: red; padding-top: 10px; padding-bottom: 10px;"
										onclick="deleteMember('${m.memberId}')" value="탈퇴하기">

									<p class="forgot" align="center"></p>

								</div>

							</form>


						</div>
					</div>
					<div class="content">
						<c:if test="${sessionScope.member.memberType eq 1 }">
							<div class="content-title">구매중 목록</div>
						</c:if>

						<c:if test="${sessionScope.member.memberType eq 2 }">
							<div class="content-title">판매중 목록</div>
						</c:if>
						<div class="content-menu"></div>
						<div class="list">
							<button class="" id="more-btn" totalCount="${totalCount}"
								currentCount="0" value="">결과더보기 (총 ${totalCount} 건 )</button>
						</div>
					</div>
					<div class="content">
						 <c:if test="${sessionScope.member.memberType eq 1 }">
							<div class="content-title">구매 내역</div>
						</c:if>

						<c:if test="${sessionScope.member.memberType eq 2 }">
							<div class="content-title">판매 내역</div>
						</c:if>
						<div class="content-menu"></div>
						<div class="list">
						<button class="" id="more-btn2" totalCount="${totalEndCount}"
								currentCount="0" value="">결과더보기 (총 ${totalEndCount} 건 )</button>
						<!-- 	<c:forEach items="${endList }" var="e">
								<form class="reviewInsertFrm">
									<input name="sellEndNo" type="hidden"> <input
										name="memberId" type="hidden"> <input
										name="sellEndWriter" type="hidden" value="${e.sellEndWriter}">
								</form>

								<div class="product">
									<div class="p-image">
										<img src="/imgs/${e.thumbnail }" width="100%" height="100%"
											alt="" srcset="">
									</div>
									<div class="p-info">
										<div class="p-title">
											<span>${e.sellEndTitle } </span>
											<c:if test="${sessionScope.member.memberType eq 1}">
												<button
													onclick="reviewInsert('${e.sellEndNo}','${e.sellEndWriter }')"
													type="button">리뷰작성</button>
											</c:if>
										</div>
										<div class="p-price">판매완료</div>
										<div class="p-day">${e.sellEndDate }</div>
										<div class="p-location">
											<i class="fas fa-map-marker-alt"></i> ${e.sellItemOrigin }
										</div>
									</div>
								</div>


							</c:forEach>
							 -->
						</div>
					</div>

					<div class="content">
						<div class="content-title" id="letter">쪽지함</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

<script>
	$("#letter").click(function() {
		$.ajax({
			url : "/letterList",
			type : "get",

		});
	});

	function viewDetail(num,id){
		location.href="/sellView?sell_no="+num+"&sell_writer="+id;
	}
	function fn_more(start) {
		var param = {
			start : start,
			writer : "${sessionScope.member.memberId}"
		};
		$.ajax({
					url : "/presentMore",
					data : param,
					type : "post",
					dataType : "json",
					success : function(data) {
						console.log(data);
						
						var html = "";
						for (var i = 0; i < data.length; i++) {
							html+='<div class="product">';
							html+='<div class="p-image">';
							html+='<img src="/imgs/'+data[i].thumbnail+'" width="100%" height="100%">';
							html+='</div>';
							html+='<div class="p-info">';
							html+='<div class="p-title">';
							html+='<span>'+data[i].sellTitle+'</span>';
							html+="<button onclick='viewDetail("+data[i].sellNo+","+'"'+data[i].sellWriter+'"'+")'";
							html+=' type="button">상세보기</button>';
							html+='</div>';
							html+='<div class="p-price">';
							html+= data[i].sellPrice+"원";
							html+='<div class="p-day">~'+data[i].sellEndDate+'까지</div>';
							html+='<div class="p-location">구매중 수량 : '+data[i].sellCount+"/"+data[i].sellMax;
							html+='</div>';
							html+='</div>';
							html+='</div>';
							html+='</div>';
						}
						$(".content:nth-child(2)>.list>button").before(html);
						$("#more-btn").val(Number(start) + 5);
						$("#more-btn").attr(
								"currentCount",
								Number($("#more-btn").attr("currentCount"))
										+ data.length);
						var totalCount = Number($("#more-btn").attr("totalCount"));
						var currentCount = Number($("#more-btn").attr("currentCount"));
						
						if (totalCount <= currentCount) {
							console.log("test");
							$("#more-btn").attr("disabled", true);
							$("#more-btn").css("cursor", "not-allowed");
						}

					},
					error : function() {
						console.log("실패")
					}
				})
	}
	function fn_more2(start) {
		var param = {
			start : start,
			writer : "${sessionScope.member.memberId}"
		};
		$.ajax({
					url : "/pastMore",
					data : param,
					type : "post",
					dataType : "json",
					success : function(data) {
						console.log(data);
						
						
						
						var html = "";
						for (var i = 0; i < data.length; i++) {
							html+='<form class="reviewInsertFrm">';
							html+='<input name="sellEndNo" type="hidden">';
							html+='<input name="memberId" type="hidden">';
							html+='<input name="sellEndWriter" type="hidden" value="${e.sellEndWriter}">';
							html+='</form>';
							html+='<div class="product">';
							html+='<div class="p-image">';
							html+='<img src="/imgs/'+data[i].thumbnail+'" width="100%" height="100%">';
							html+='</div>';
							html+='<div class="p-info">';
							html+='<div class="p-title">';
							html+='<span>'+data[i].sellEndTitle+'</span>';
							if(${sessionScope.member.memberType eq 1}){
								html+="<button onclick='reviewInsert("+data[i].sellEndNo+","+'"'+data[i].sellEndWriter+'"'+")'";
								html+=' type="button">리뷰작성</button>';
							}
							html+='</div>';
							html+='<div class="p-price">';
							html+= "판매완료";
							html+='<div class="p-day">~'+data[i].sellEndDate+'까지</div>';
							html+='<div class="p-location">';
							html+="<i class='fas fa-map-marker-alt'></i>"+data[i].sellItemOrigin
							html+='</div>';
							html+='</div>';
							html+='</div>';
							html+='</div>';
						}
						$(".content:nth-child(3)>.list>button").before(html);
						$("#more-btn2").val(Number(start) + 5);
						$("#more-btn2").attr("currentCount",Number($("#more-btn2").attr("currentCount"))+ data.length);
						var totalCount = Number($("#more-btn2").attr("totalCount"));
						var currentCount = Number($("#more-btn2").attr("currentCount"));
						if (totalCount <= currentCount) {
							console.log("test2");
							$("#more-btn2").attr("disabled", true);
							$("#more-btn2").css("cursor", "not-allowed");
						}

					},
					error : function() {
						console.log("실패")
					}
				})
	}
	
	$(function() {
		fn_more(1);
		fn_more2(1);
		$("#more-btn").click(function() {
			fn_more($(this).val());
		});
		
		$("#more-btn2").click(function() {
			fn_more2($(this).val());
		});
	})
</script>
<style>
	#more-btn,#more-btn2{
		width: 100%;
		height: 70px;
		font-size: 20px;
		
	}
</style>
</html>