<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


<script>
	$(function() {
		var check = [ false, false, false, false, false, false, false ]
		$("#id").focusout(function() {
			RegExp = /^[a-z][a-z0-9]{4,12}$/;
			var id = $("#id").val();
			if (RegExp.test(id)) {
				$("#id_result").html(" ");
				var id = $("#id").val();
				$.ajax({
					url : "/checkId",
					type : "get",
					data : {
						id : id
					},
					success : function(data) {
						if (data == 1) {
							$("#id_result").html('사용가능한 아이디 입니다..').css({
								'color' : 'green',
								"font-size" : "15px",
								"text-align" : "center",
								"margin-top" : "20px"

							})
							check[0] = true;
						} else {

							$("#id_result").html('중복 아이디 입니다.').css({
								'color' : 'red',
								"font-size" : "15px",
								"text-align" : "center",
								"margin-top" : "10px"
							});
							check[0] = false;
						}

					},
					error : function() {
						console.log("아이디 중복 체크 실패")
					}

				});

			} else if (id == "") {
				$("#id_result").html('공란이 될 수 없습니다.').css({
					'color' : 'red',
					"font-size" : "15px",
					"text-align" : "center",
					"margin-top" : "20px"

				})
				check[0] = false;
			} else {
				$("#id_result").html('영어소문자+숫자4~12자리/영어로 시작').css({
					'color' : 'red',
					"font-size" : "15px",
					"text-align" : "center",
					"margin-top" : "10px"
				});
				check[0] = false;
			}

		});
		$("#pw").focusout(function() {
			var pw = $("#pw").val();
			var pwr = $("#pw_re").val();
			regExp = /^[a-zA-Z0-9]{6,18}$/;
			if (regExp.test(pw)) {
				$("#pw_result").html(" ");
				check[1] = true
			} else if (pw == "") {
				$("#pw_result").html("공란이 될수 없습니다.").css({
					'color' : 'red',
					"font-size" : "15px",
					"text-align" : "center",
					"margin-top" : "50px"
				});
				check[1] = false;
			} else if (pw != pwr) {
				$("#pw_result").html("비밀번호와 비밀번호 확인이 맞지 않습니다.").css({
					'color' : 'red',
					"font-size" : "15px",
					"text-align" : "center",
					"margin-top" : "20px"
				})
				check[1] = false;
			} else {
				$("#pw_result").html("영문 대/소문자 + 숫자 6~18자리 입니다").css({
					'color' : 'red',
					"font-size" : "15px",
					"text-align" : "center",
					"margin-top" : "50px"
				});
				check[1] = false;
			}
		});

		$("#name").focusout(function() {
			regExp = /^[가-힣]{2,4}$/;
			var name = $("#name").val();
			if (name == " ") {
				$("#name_result").html("공란일 수 없습니다.").css({
					'color' : 'red',
					"font-size" : "15px",
					"text-align" : "center",
					"margin-top" : "50px"
				})
				check[2] = false;
			} else if (!regExp.test(name)) {
				$("#name_result").html("양식에 맞지 않습니다.").css({
					'color' : 'red',
					"font-size" : "15px",
					"text-align" : "center",
					"margin-top" : "50px"
				})
				check[2] = false;
			} else {
				$("#name_result").html("");
				check[2] = true;
			}
		})

		$("#code")
				.focusout(
						function() {
							regExp = /\b(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}\b/g;
							var code = $("#code").val();
							if (code == " ") {
								$("#code_result").html("공란일 수 없습니다.").css({
									'color' : 'red',
									"font-size" : "15px",
									"text-align" : "center",
									"margin-top" : "50px"
								})
								check[3] = false;
							} else if (!regExp.test(code)) {
								$("#code_result").html("주민등록번호 오류").css({
									'color' : 'red',
									"font-size" : "15px",
									"text-align" : "center",
									"margin-top" : "50px"
								})
								check[3] = false;
							} else {
								$("#code_result").html("");
								check[3] = true;
							}

						})

		$("#phone").focusout(function() {
			regExp = /(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/g;
			var phone = $("#phone").val();
			if (!regExp.test(phone)) {
				$('#tell_result').html("-제외/양식에 맞게 기입 부탁드립니다.").css({
					'color' : 'red',
					"font-size" : "15px",
					"text-align" : "center",
					"margin-top" : "50px"
				})
				check[4] = false;
			} else if (phone == " ") {
				$("#tell_result").html("공란일수 없습니다.").css({
					'color' : 'red',
					"font-size" : "15px",
					"text-align" : "center",
					"margin-top" : "20px"
				})
				check[4] = false;

			} else {
				$("#tell_result").html(" ");
				check[4] = true;
			}

		});
		$("#eBtn")
				.click(
						function() {
							var email = $("#email").val()
							var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;

							if (email == "") {
								$("#email_result").html("공란일수 없습니다.").css({
									'color' : 'red',
									"font-size" : "15px",
									"text-align" : "center",
									"margin-top" : "20px"
								})
								email.focus();
								check[5] = false;
							} else if (!regExp.test(email)) {
								$("#email_result").html("옳지 않은 형식입니다.").css({
									'color' : 'red',
									"font-size" : "15px",
									"text-align" : "center",
									"margin-top" : "10px"
								})
								check[5] = false
							} else {
								$("#email_result").html(" ");
								check[5] = true;
							}
						})
		var mailCode = "";
		$("#eBtn").click(function() {

			var email = $("#email").val();
			$.ajax({
				url : "/sendMail",
				type : "post",
				data : {
					email : email
				},
				success : function(data) {
					mailCode = data;
					$("#mailCode").show();
					$("#mailResult").show();

				}
			});
		});

		$("#mailResult").click(function() {
			if ($("#mailCode").val() == mailCode) {
				$("#email_result").html('인증성공');
				$("#email_result").css({
					'color' : 'green',
					'text-align' : 'center'
				});
				check[6] = true;
			} else {
				$("#email_result").html('인증 실패');
				$("#email_result").css({
					'color' : 'red',
					'text-align' : 'center'
				});
				check[6] = false;
			}
		})

		$('form').submit(function() {
			var count = 0;
			for (var i = 0; i < check.length; i++) {
				if (check[i] == true) {
					count++;
				}
			}
			if (count < 6) {
				alert("빈틉없이 채워주세요");
				return false;

			}
		});

	})

	function addrSearch() {
		new daum.Postcode({
			oncomplete : function(data) {
				$("#postCode").val(data.zonecode);
				$("#roadAddr").val(data.roadAddress);
				$("#jibunAddr").val(data.jibunAddress);
			}
		}).open();
	}
</script>
<style>
body {
	font-family: 'Ubuntu', sans-serif;
	background-repeat: no-repeat;
	background-size: 140% 130%;
	font-family: 'Ubuntu', sans-serif;
}

.container {
	margin: 0px auto;
	width: 120px;
	text-align: left;
}

.container>.phone, .container>.bank {
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

.main {
	background: white;
	width: 500px;
	height: 100%;
	margin: 7em auto;
	border-radius: 1.5em;
	box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
}

.sign {
	padding-top: 0px;
	color: #8C55AA;
	font-family: 'Ubuntu', sans-serif;
	font-weight: bold;
	font-size: 23px;
	margin: 0;
}

form.form1 {
	padding-top: 20px;
}

.id, #pw, #pw_re, #name, #phone, #email, #mailCode, #code {
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
	font-family: 'Ubuntu', sans-serif;
}

#bankNum {
	width: 56%;
	float: right;
	height: 40px;
	color: rgb(38, 50, 56);
	font-weight: 700px;
	font-size: 14px;
	letter-spacing: 1px;
	background: rgba(136, 126, 126, 0.04);
	padding: 10px 20px;
	border: none;
	border-radius: 20px;
	outline: none;
	box-sizing: border-box;
	border: 2px solid rgba(0, 0, 0, 0.02);
	margin-bottom: 40px;
	margin-left: 10px;
	text-align: center;
	margin-top: 20px;
	font-family: 'Ubuntu', sans-serif;
}

.form-control {
	width: 36%;
	padding-left: 100px;
	height: 40px;
	color: rgb(38, 50, 56);
	font-weight: 70;
	font-size: 14px;
	letter-spacing: 1px;
	background: rgba(136, 126, 126, 0.04);
	padding: 10px 50px;
	border: none;
	border-radius: 20px;
	outline: none;
	box-sizing: border-box;
	border: 2px solid rgba(0, 0, 0, 0.02);
	margin-bottom: 10px;
	margin-left: 106px;
	text-align: center;
	margin-bottom: 27px;
	font-family: 'Ubuntu', sans-serif;
}

.btn {
	margin: 0px;
	padding-right: 100px;
}

#id:focus, #pw:focus, #pw_re:focus, #email:focus, #name:focus, #phone:focus,
	#bankNum:focus, #code:focus {
	border: 2px solid rgba(0, 0, 0, 0.18);
	background-color: beige;
	!
	important;
}

.btn {
	cursor: pointer;
	border-radius: 5em;
	color: #fff;
	background: #964b00;
	border: 0;
	padding-left: 50px;
	padding-right: 50px;
	padding-bottom: 10px;
	padding-top: 10px;
	font-family: 'Ubuntu', sans-serif;
	margin: 100px font-size: 13px;
	box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
}

.submit {
	cursor: pointer;
	border-radius: 5em;
	color: #fff;
	background: #964b00;
	border: 0;
	padding-left: 50px;
	padding-right: 50px;
	padding-bottom: 10px;
	padding-top: 10px;
	font-family: 'Ubuntu', sans-serif;
	margin-left: 35%;
	font-size: 13px;
	box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
}

.forgot {
	text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
	color: #E1BEE7;
	padding-top: 15px;
}

a {
	text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
	color: #E1BEE7;
	text-decoration: none;
}

.abtn, #eBtn {
	background: #30A9DE;
	cursor: pointer;
	border-radius: 5em;
	color: #fff;
	border: 0;
	padding-left: 50px;
	padding-right: 50px;
	padding-bottom: 10px;
	padding-top: 10px;
	font-family: 'Ubuntu', sans-serif;
	margin: 100px font-size: 13px;
	box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
}

ul>li {
	list-style: none;
}

.dropdown {
	float: left;
}

#text {
	display: block;
	padding-left: 100px;
	text-align: left;
	font-family: 'Ubuntu', sans-serif;
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
	padding: 6px 8px 6px 10px;
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

.phone-select:focus {
	z-index: 3;
	width: 100%;
	color: #394349;
	outline: 2px solid #49aff2;
	outline: 2px solid -webkit-focus-ring-color;
	outline-offset: -2px;
}

.bank-select:focus {
	z-index: 3;
	width: 100%;
	color: #394349;
	outline: 2px solid #49aff2;
	outline: 2px solid -webkit-focus-ring-color;
	outline-offset: -2px;
}

.phone-select>option {
	margin: 3px;
	padding: 6px 8px;
	text-shadow: none;
	background: #f2f2f2;
	border-radius: 3px;
	cursor: pointer;
}

.bank-select>option {
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

.ddd {
	text-align: center;
	margin: 0 auto;
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
</style>

<body>

	<div class="main">
		<h2 style="text-align: center;">소비자 회원가입</h2>
		<form class="form1" method="post" action="/customerSignIn">
			<div class="ddd">
				<label for="id">
					<div id="text" style="padding-bottom: 10px;">아이디</div>
					<div style="padding-left: 100px; padding-right: 40px">
						<input class="id " type="text" id="id" align="center"
							placeholder="아이디 입력하세요" name="id" style="margin-right: 35px;">
					</div>
				</label>
			</div>
			<br>
			<div id="id_result"></div>
			<br> <br>
			<div class="ddd" style="height: 130px;">
				<label for="pw">
					<div id="text" style="float: left;" style="padding-bottom:10px;">*비밀번호

					</div>

					<div style="padding-left: 100px; padding-right: 40px">

						<input class="pw" type="password" id="pw" align="center"
							placeholder="비밀번호 입력하세요" name="pw">
					</div>
				</label> <br> <label for="pw_re">
					<div style="padding-left: 100px; padding-right: 40px">
						<input type="password" id="pw_re" align="center"
							placeholder="비밀번호 확인" name="pw_re">
					</div>
				</label>

				<div id="pw_result"></div>
			</div>
			<br> <br> <br>
			<div class="ddd">
				<label for="name">
					<div id="text" style="padding-top: 20px; padding-bottom: 10px;">*이름</div>
					<div style="padding-left: 100px; padding-right: 40px">
						<input type="text" name="name" id="name" placeholder="성함을 입력해주세요">
					</div>
				</label>
			</div>

			<div id="name_result"></div>
			<br> <br>
			<div class="ddd">
				<label for="code">
					<div id="text" style="padding-top: 20px; padding-bottom: 10px;">주민번호</div>
					<div style="padding-left: 100px; padding-right: 40px">
						<input type="text" name="code" id="code"
							placeholder="주민번호 13자리를-포함하여 입력하세요">
					</div>


				</label> <br> <br> <br>
				<div class="ddd">
					<lable for="phone">
					<div id="text">휴대전화</div>
					</lable>
					<div class="container" style="float: left; padding-left: 40px">
						<div class="dropdown" style="padding-top: 10px;">
							<select class="phone" style="width: 150px; height: 40px">

								<option value="010">+82</option>
								<option value="010">+84</option>
								<option value="010">+1</option>
								<option value="010">+10</option>
								<option value="010">+11</option>
								<option value="010">+12</option>
								<option value="010">+13</option>
								<option value="010">+14</option>
								<option value="010">+15</option>
								<option value="010">+16</option>
								<option value="010">+17</option>

							</select>

						</div>


					</div>

					<div id="tell_input"
						style="padding-top: 10px; padding-right: 30px; float: right;">
						<input type="text" id="phone" name="phone" style="width: 250px;"
							placeholder="-빼고 입력해주세요">
					</div>
					<br> <br>
					<div id="tell_result"
						style="margin-top: 50px; margin-bottom: 10px;"></div>
				</div>



				<br> <label for="email">
					<div id="text">이메일 기입란</div>
					<div style="padding-left: 90px; padding-right: 30px">
						<input type="email" id="email" placeholder="이메일을 입력하세요@ 포함"
							name="email" style="padding-float: left; width: 200px;">
						<button type="button" id="eBtn"
							style="height: 40px; margin-left: 10px; background: #30A9DE;">인증</button>
					</div> <input type="text" id="mailCode"
					style="display: none; margin-top: 10px; margin-left: 100px; width: 250px;">
					<button type="button" id="mailResult" class="btn btn-primary"
						style="display: none; margin-top: 1px; width: 130px; font-size: 10px; padding-top: 1px; background-color: balck;">확인</button>
					<span id="mailMsg"></span> <br> <br>

					<div id="email_result"
						style="margin-top: 2px; margin-bottom: 10px;"></div>
				</label>

				<div id="text" style="text-align: left;">주소</div>
				<div>
					<div style="padding-right: 40px;">
						<input type="text" id="postCode" name="postCode"
							style="width: 200px; display: inline-block; margin-left: 100px;"
							class="form-control" placeholder="우편번호" readonly> <input
							type="button" id="addrSearchBtn" onclick="addrSearch();"
							class="btn btn-primary" value="주소검색">
					</div>
					<div>
						<input id="roadAddr" style="width: 400px; display: inline-block;"
							name="roadAddr" type="text" class="form-control"
							placeholder="도로명주소">
						<div>
							<input id="detailAddr" name="detailAddr"
								style="width: 400px; display: inline-block;" type="text"
								class="form-control" placeholder="상세주소">
						</div>
					</div>

				</div>
				<br>
				<div style="text-align: center;">
					<input type="reset" class="submit" align="center" value="되돌아가기"
						style="margin: 10px; float: left padding-left:10px;"
						onClick="location.href='/index.jsp';"> <input
						type="submit" class="submit" align="center" value="회원 가입하기"
						style="margin: 10px">

					<p class="forgot" align="center"></p>
				</div>
		</form>

	</div>





</body>
</html>
