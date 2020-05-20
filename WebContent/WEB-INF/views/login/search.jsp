<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link href="http://font.woowahan.com/jua/" rel="stylesheet">
</head>

<body>
	<style>
	
	
* {
	font-family: 'Jua', sans-serif;
}

tr {
	border: 0px solid none;
}

k:hover {
	text-decoration: none;
	color: #9354ED
}

#result, #pw_result {
	color: red;
	text-align: center;
}

#idButton, #pwButton {
	background-color: #ffac05;
	color: #4a2100;
	border-radius: 3px 3px 3px 3px;
	border: 0;
	outline: 0;
	width:120px;
	padding-
}

#idButton:hover, #pwButton:hover {
	background-color: #4a2100;
	color: #ffac05;
	border-radius: 3px 3px 3px 3px;
}

#code, #id, #pw, #name, #phone, #email, #mailCode {
	display: inline-block;
	width: 86%;
	height: 40px;
	color: rgb(38, 50, 56);
	font-weight: 700px;
	font-size: 14px;
	letter-spacing: 1px;
	margin: 0 auto;
	outline: none;
	box-sizing: border-box;
	margin-left: 10px;
	text-align: center;
	font-family: 'Jua', sans-serif;
}

#id, #name, #phone, #email, #mailCode {
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
</style>


	<script>
		$(function() {
			var check = [ false, false ];
			$("#name").focusout(function() {

				var name = $("#name").val();
				if (name == "") {
					$("#result").html("성함을 기입해주세요").css({
						"color" : "red",
						" font-size" : "x-smail",
						"font-family" : "'Jua', sans-serif"
					});
				}
			})
			$("#id").focusout(function() {
				var name = $("#id").val();
				if (name == "") {
					$("#pw_result").html("찾으시려는 아이디를 입력해주세요").css({
						"color" : "red",
						" font-size" : "5px",
						"font-family" : "'Jua', sans-serif"
					});
				}
			})
			$("#phone").focusout(function() {
				var phone = $("#phone").val();
				if (phone == "") {
					$("#result").html("휴대전화번호를 기입해주세요").css({
						"color" : "red",
						" font-size" : "5px",
						"font-family" : "'Jua', sans-serif"

					});
				}
			})
			$("#email").focusout(function() {
				var email = $("#email").val();
				var regExp = /^([/\w/g\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
				if (!regExp.test(email)) {

					$("#pw_result").html('올바른 email을 입력해주세요.').css({
						"color" : "red",
						" font-size" : "10px",
						"font-family" : "'Jua', sans-serif",
						" text-align" : "center"
					});
					;
				}
			})

			var mailCode = "";
			$("#eBtn").click(function() {

				var email = $("#email").val();
				$.ajax({
					url : "/findPw",
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
					check[0] = divue;
				} else {
					$("#email_result").html('인증 실패');
					$("#email_result").css({
						'color' : 'red',
						'text-align' : 'center'
					});
					check[0] = false;
				}
			})
			$('#searchPw').submit(function() {
				var count = 0;
				for (var i = 0; i < check.length; i++) {
					if (check[i] == divue) {
						count++;
					}
				}
				if (count < 2) {
					alert("빈틈없이 채워주세요");
					return false;

				}
			});
		});
	</script>


	<jsp:include page="/WEB-INF/views/common/header.jsp" />

	<table align="center">
		<tr>
			<td>
				<table width="600px" align="center" border="0"
					style="color: black; background-color: #F6F6F6; font-size: 20px;">
					<tr>
						<td>
							<table width="750px" align="center" border=0;
								style="margin-top: 3%">
								<tr>
									<td align="center"></td>
									<td>아이디 /비밀번호 찾기</td>

									<td width="300px"></td>
								</tr>
							</table>
						</td>
					</tr>

					<tr>
						<td>
							<table width="800px" height="300px" align="center"
								style="border: dotted 5px none; margin-top: 4%">

								<tr>
									<td>
										<table width="300px" height="30px" border="0"
											style="margin-top: 3%; color: black; font-size: 18px;">
											<tr>
												<td>&nbsp;&nbsp;</td>
												<td>&nbsp;아이디 찾기</td>
											</tr>
										</table>
									</td>
								</tr>
								<form name="searchId" method="post" action="/searchId">
									<tr>
										<td>


											<table width="380px" height="70px" align="center" border="0"
												style="font-size: 16px;">
												<tr>

													<td>이름</td>
													<td><input type="text" name="name" id="name"
														style="width: 210px"></td>
												</tr>
												<tr>
													<label for="phone">
														<td>휴대폰</td>
														<td><input type="text" name="phone" id="phone"
															style="width: 210px"></td>
													</label>
												</tr>
											</table>



										</td>
									</tr>
									<tr>
										<td>
											<table width="140px" height="10px" border="0"
												style="margin-top: 2%;" align="center">
												<tr>
													<td><input type="submit" name="enter" value="  찾기  "
														id="idButton" align="center"></td>
													<td><input type="reset" name="cancle" value="  취소  "
														id="idButton"></td>
												</tr>
											</table>
											<br>
										</td>
									</tr>
								</form>
									<tr id="result"></tr>
								<form name="searchPw" method="post" action="/sendPw">
								
									<tr>
										<td>
											<table width="300px" height="20px" border="0"
												style="margin-top: 3%; font-size: 18px;">
												<br>
												<br>
												<tr>
													<td>&nbsp;&nbsp;</td>
													<td>&nbsp;비밀번호 찾기</td>
												</tr>
											</table>
										</td>
									</tr>
									<tr>
										<td>
											<table width="380px" height="70px" align="center" border="0"
												style="font-size: 16px;">
												<tr>
													<td>아이디</td>
													<td><input type="text" name="id" id="id"
														style="width: 210px"></td>
												</tr>
												<tr>
													<label for="email">
														<td style="text-align: center;">e-mail&nbsp;</td>
														<td><input type="text" name="email"
															style="width: 210px" id="email"></td>
													</label>
												</tr>
											</table>
										</td>
									</tr>

									<tr>
										<td>
											<table width="140px" height="10px" border="0"
												style="margin-top: 2%" align="center">
												<tr>
													<td><input type="submit" name="pwButton"
														value="  찾기  " align="center" id="pwButton"
														style="cursor: pointer;"></td>
													<td><input type="reset" name="pwButton" value="  취소  "
														align="center" id="pwButton" style="cursor: pointer;"></td>
												</tr>
											</table> <br>
										</td>
									</tr>
									<tr id="pw_result"></tr>
								</form>
							</table>
					</tr>
				</table>
			</td>
		</tr>
	</table>










	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>