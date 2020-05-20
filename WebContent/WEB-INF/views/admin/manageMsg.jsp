<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<!-- Required meta tags-->
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="au theme template">
<meta name="author" content="Hau Nguyen">
<meta name="keywords" content="au theme template">

<!-- Title Page-->
<title>관리자페이지</title>

<!-- Fontfaces CSS-->
<link href="/admin_css/css/font-face.css" rel="stylesheet" media="all">
<link href="/admin_css/vendor/font-awesome-4.7/css/font-awesome.min.css"
	rel="stylesheet" media="all">
<link
	href="/admin_css/vendor/font-awesome-5/css/fontawesome-all.min.css"
	rel="stylesheet" media="all">
<link
	href="/admin_css/vendor/mdi-font/css/material-design-iconic-font.min.css"
	rel="stylesheet" media="all">

<!-- Bootstrap CSS-->
<link href="/admin_css/vendor/bootstrap-4.1/bootstrap.min.css"
	rel="stylesheet" media="all">

<!-- Vendor CSS-->
<link href="/admin_css/vendor/animsition/animsition.min.css"
	rel="stylesheet" media="all">
<link
	href="/admin_css/vendor/bootstrap-progressbar/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet" media="all">
<link href="/admin_css/vendor/wow/animate.css" rel="stylesheet"
	media="all">
<link href="/admin_css/vendor/css-hamburgers/hamburgers.min.css"
	rel="stylesheet" media="all">
<link href="/admin_css/vendor/slick/slick.css" rel="stylesheet"
	media="all">
<link href="/admin_css/vendor/select2/select2.min.css" rel="stylesheet"
	media="all">
<link href="/admin_css/vendor/perfect-scrollbar/perfect-scrollbar.css"
	rel="stylesheet" media="all">

<!-- Main CSS-->
<link href="/admin_css/css/theme.css" rel="stylesheet" media="all">
<link href="/admin_css/css/adminTab.css" rel="stylesheet" media="all">
<script type="text/javascript">
	$(function() {

		$.ajax({
			url : "/adminGetMsgCount",
			type : "post",

			success : function(data) {
				console.log(data);
				if (data <= 0) {
					$("#nonReadMsg").remove();
					return;
				}

				$(".mess__title").find("span").html(data);
				$("#nonReadMsg").html(data);
			},
			error : function() {
				console.log("서버 전송 실패")
			}
		});

		$("#msg-btn").click(function() {
			$.ajax({
				url : "/adminGetMsgCount",
				type : "post",
				success : function(data) {
					console.log(data);
					if (data <= 0) {
						$("#nonReadMsg").remove();
						return;
					}

					$(".mess__title").find("span").html(data);
					$("#nonReadMsg").html(data);
				},
				error : function() {
					console.log("서버 전송 실패")
				}
			});
		});

		$("#sort-btn")
				.click(
						function() {
							var value = $("#sort-select").children(
									"option:selected").val();
							var link = document.location.href;
							var searched = $("input[name=search]").val();
							if (!link.match("search")) {
								location.href = "/manageMember?reqPage=1&reqCount=10&sort="
										+ value;
							} else {
								location.href = "/adminSearchMember?reqPage=1&reqCount=10&search="
										+ searched + "&sort=" + value;
							}
						});

		$(".show-count")
				.change(
						function() {
							var value;
							$(this)
									.children()
									.each(
											function(index, item) {
												if (item.selected) {
													var link = document.location.href;
													value = Number(item.value);
													var searched = $(
															"input[name=search]")
															.val();
													if (!link.match("search")) {
														location.href = "/manageMember?reqPage=1&reqCount="
																+ value;
													} else {
														location.href = "/adminSearchMember?reqPage=1&reqCount="
																+ value
																+ "&search="
																+ searched;
													}

												}
											});
						});
		$(".memberStatus").change(
				function() {
					var text = $(this).children("option:selected").html();
					var value = $(this).children("option:selected").val();
					var memberNo = $(this).children("option:selected").attr(
							"memberNo");
					$('.modal-title').html("회원 " + text);
					$('.modal-body').html("해당회원을 [" + text + "] 하시겠습니까?");
					$('#deleteContent').html("확인");
					$('#cancelBtn').attr("onclick", "location.reload()");
					$('#deleteContent').attr(
							"onclick",
							"modifyMemberStatus(" + value + "," + memberNo
									+ ")");
					$('#myModal').modal('show');
				});

		$("input[name=allCheck]").click(function() {
			$("input[name=pick]").each(function(index, item) {
				item.checked = $("input[name=allCheck]").prop("checked");
			})
		});
		$("#selectDel").click(function() {
			var checkList = "";
			var length = $("input[name=pick]:checked").length - 1;
			console.log(length);
			$("input[name=pick]:checked").each(function(index, item) {
				if (index == length) {
					checkList = checkList.concat(item.value);

				} else {
					checkList = checkList.concat(item.value + "/");
				}
			});

			$.ajax({
				url : "/adminDelMember",
				data : {
					memberNo : checkList
				},
				type : "post",
				success : function(data) {
					location.reload();
					if (data > 0) {
						alert(data + "개 삭제 성공");
					} else {
						alert("삭제 실패");
					}
				},
				error : function() {
					console.log("서버 전송 실패")
				}
			});
		});
	});

	function modifyMemberStatus(value, memberNo) {
		$('#myModal').modal('hide');
		$.ajax({
			url : "/adminMemberStatus",
			data : {
				memberStatus : value,
				memberNo : memberNo
			},
			type : "post",
			success : function(data) {
				console.log("서버전송 성공");
				console.log("결과:" + data);
			},
			error : function() {
				console.log("서버 전송 실패");
			},
			complete : function() {
				console.log("t");
			}
		});
	}

	function showModal(memberNo, title, body) {
		$('.modal-title').html(title);
		$('.modal-body').html(body);
		$('#deleteContent').html("삭제");
		$('#myModal').modal('show');
		$('#deleteContent').attr("onclick", "deleteMember(" + memberNo + ")");
	}

	function deleteMember(param) {
		$('#myModal').modal('hide');
		$.ajax({
			url : "/adminDelMember",
			data : {
				memberNo : param
			},
			type : "post",
			success : function(data) {
				location.reload();
				if (data > 0) {
					alert("삭제 성공");
				} else {
					alert("삭제 실패");
				}
			},
			error : function() {
				console.log("서버 전송 실패")
			}
		});
	}

	function deleteCancelModal(memberNo, title, body) {
		$('.modal-title').html(title);
		$('.modal-body').html(body);
		$('#deleteContent').html("확인");
		$('#myModal').modal('show');
		$('#deleteContent').attr("onclick", "deleteCancel(" + memberNo + ")");
	}

	function deleteCancel(memberNo) {
		$.ajax({
			url : "/adminDelCancel",
			data : {
				memberNo : memberNo
			},
			type : "post",
			success : function(data) {
				location.reload();
				alert("취소 성공");
			},
			error : function() {
				console.log("서버 전송 실패")
			}
		});
	}
</script>
</head>



<body class="animsition">
	<div class="page-wrapper">
		<!-- HEADER MOBILE-->

		<!-- END HEADER MOBILE-->

		<!-- MENU SIDEBAR-->
		<aside class="menu-sidebar d-none d-lg-block" style="overflow:hidden">
		<div class="logo">
			<a href="index.jsp"> <img src="/imgs/mole.jpg"
				style="width: 55px; margin-right: 10px;" /><span class="logoTitle">LAST
					FARM</span>
			</a>
		</div>
		<div class="menu-sidebar__content js-scrollbar1">
			<nav class="navbar-sidebar">
			<ul class="list-unstyled navbar__list">
				<li><a href="/manageMember?reqPage=1"> <i
						class="fas fa-users"></i>회원 관리
				</a></li>
				<li><a href="/manageSell?reqPage=1"> <i
						class="far fa-list-alt"></i>거래글 관리
				</a></li>

				<li><a href="/manageReview?reqPage=1"> <i
						class="far fa-star"></i>리뷰 관리
				</a></li>

				<li><a href="/manageWarning"><i
						class="fas fa-exclamation-circle"></i>신고글 관리 </a></li>
				<li class="active"><a style="color: #4a2100"
					href="/adminGetMsgList"> <i class="far fa-envelope-open"></i>쪽지함
				</a></li>
			</ul>
			</nav>
		</div>
		</aside>
		<!-- END MENU SIDEBAR-->

		<!-- PAGE CONTAINER-->
		<div class="page-container">
			<!-- HEADER DESKTOP-->
			<header class="header-desktop">
			<div class="section__content section__content--p30">
				<div class="container-fluid">
					<div class="header-wrap">
						<form class="form-header" action="/adminSearchMember" method="get">
							<input disabled style="margin-right: 10px;" class="au-input au-input--xl"
								type="text" name="search"
								placeholder="Search for user ID &amp; name..."
								value="${search }"> <input type="hidden" name="reqPage"
								value="1"> <input type="hidden" name="reqCount"
								value="10">
							<button style="height: 43px; width: 43px;" class="search-btn"
								type="submit">
								<i class="zmdi zmdi-search"></i>
							</button>
						</form>
						<div class="header-button">
							<div class="noti-wrap">
								<div id="msg-btn" class="noti__item js-item-menu">
									<i class="far fa-envelope-open"></i> <span id="nonReadMsg"
										class="quantity">0</span>
									<div class="mess-dropdown js-dropdown">
										<div class="mess__title">
											<p style="font-size: 20px;">
												읽지 않은 메세지가 <span style="font-weight: bold; color: black">0</span>개
												있습니다.
											</p>
										</div>
										<div class="mess__footer">
											<a href="/adminGetMsgList">View all messages</a>
										</div>
									</div>
								</div>
								<div class="noti__item js-item-menu"></div>

								<div class="noti__item js-item-menu"></div>
							</div>
							<div class="account-wrap">
								<div class="account-item clearfix js-item-menu">
									<div class="image">
										<!-- <img src="images/icon/avatar-01.jpg" alt="John Doe" /> -->
									</div>
									<div class="content">
										<a class="js-acc-btn" href="#">Admin</a>
									</div>
									<div class="account-dropdown js-dropdown">
										<div class="info clearfix">
											<div class="image">
												<i style="font-size: 50px;" class="fas fa-user"></i>
											</div>
											<div class="content">
												<h5 class="name">
													<a href="#">administrator</a>
												</h5>
												<span class="email">admin@gmail.com</span>
											</div>
										</div>

										<div class="account-dropdown__footer">
											<a href="#"> <i class="zmdi zmdi-power"></i>Logout
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			</header>
			<!-- END HEADER DESKTOP-->
			<!-- MAIN CONTENT-->
			<div class="main-content">
				<div class="section__content section__content--p30">
					<div class="container-fluid">
						<div class="row m-t-30">
							<div class="col-md-12">
								<!-- DATA TABLE-->
								<div class="table-responsive m-b-40">
									<h3 class="title-5 m-b-35"
										style="font-size: 30px; font-weight: bold;">
										<i style="color: gray" class="far fa-envelope-open"></i> 쪽지함<span
											style="color: gray; font-size: 15px"> ( 받은,보낸쪽지
											:${totalCount }개)</span>
									</h3>
								</div>

								<div class="msg-main">
									<div class="msg-receive">
										<div class="msg-box-title">받은쪽지함</div>
										<div class="msg-box-tab">
											<div>보낸사람</div>
											<div>제목</div>
											<div>읽음여부</div>

										</div>

										<div class="msg-box-content">
											<div class="msgs">
												<c:forEach items="${list }" var='m'>
													<c:if test="${m.msgReceiveId eq 'admin' }">
														${m.msgNo }
														${m.msgSendId }
														${m.msgReceiveId }
													</c:if>
												</c:forEach>

											</div>
										</div>

									</div>
									<div class="msg-send">
										<div class="msg-box-title">보낸쪽지함</div>
										<div class="msg-box-tab">
											<div>받은사람</div>
											<div>제목</div>
											<div></div>
										</div>
										<div class="msg-box-content">
											<div class="msgs">
												<c:forEach items="${list }" var='m'>
													<c:if test="${m.msgSendId eq 'admin' }">
														${m.msgNo }
														${m.msgSendId }
														${m.msgReceiveId }
													</c:if>
												</c:forEach>
											</div>
										</div>
									</div>
								</div>
								<div class="msg-main">
									<div class="more-btn-box">
										<button id="more-btn" totalCount="${totalCount}"
											currentCount="0" value="">
											<span>더보기</span> <i class="fas fa-arrow-circle-down"></i>
										</button>
									</div>
									<div class="more-btn-box">
										<button id="more-btn" totalCount="${totalCount}"
											currentCount="0" value="">
											<span>더보기</span> <i class="fas fa-arrow-circle-down"></i>
										</button>
									</div>

								</div>


							</div>
						</div>
						<!-- END DATA TABLE-->
					</div>
				</div>
				<div style="margin-top: 100px;" class="row">
					<div class="col-md-12">
						<div class="copyright">
							<p>
								Copyright © 2020 Last Farm. All rights reserved. By <a href="#">LAST
									FARM</a>.
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>



	</div>
	</div>

	</div>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button id="cancelBtn" type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button id="deleteContent" type="button" class="btn btn-danger"></button>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="confirmModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button id="deleteContent" type="button" class="btn btn-danger">삭제</button>
				</div>
			</div>
		</div>
	</div>


	<!-- Jquery JS-->
	<script src="/admin_css/vendor/jquery-3.2.1.min.js"></script>
	<!-- Bootstrap JS-->
	<script src="/admin_css/vendor/bootstrap-4.1/popper.min.js"></script>
	<script src="/admin_css/vendor/bootstrap-4.1/bootstrap.min.js"></script>
	<!-- Vendor JS       -->
	<script src="/admin_css/vendor/slick/slick.min.js">
		
	</script>
	<script src="/admin_css/vendor/wow/wow.min.js"></script>
	<script src="/admin_css/vendor/animsition/animsition.min.js"></script>
	<script
		src="/admin_css/vendor/bootstrap-progressbar/bootstrap-progressbar.min.js">
		
	</script>
	<script src="/admin_css/vendor/counter-up/jquery.waypoints.min.js"></script>
	<script src="/admin_css/vendor/counter-up/jquery.counterup.min.js">
		
	</script>
	<script src="/admin_css/vendor/circle-progress/circle-progress.min.js"></script>
	<script src="/admin_css/vendor/perfect-scrollbar/perfect-scrollbar.js"></script>
	<script src="/admin_css/vendor/chartjs/Chart.bundle.min.js"></script>
	<script src="/admin_css/vendor/select2/select2.min.js">
		
	</script>

	<!-- Main JS-->
	<script src="/admin_css/js/main.js"></script>

</body>

<style type="text/css">
* {
	font-family: 'Jua', sans-serif;
}

.page>a {
	color: black;
	font-weight: 500;
	display: block;
}

.page>a:hover {
	color: #ffac05;
}

.selectPage {
	background-color: #ffac05;
	border-radius: 10px;
	font-weight: bold;
	color: white;
}

#pageNavi {
	display: flex;
	justify-content: center;
}

#pageNavi>* {
	float: left;
}

.page {
	text-align: center;
	line-height: 40px;
	width: 40px;
	height: 40px;
}

.next_page>a, .pre_page>a {
	color: black;
	text-align: center;
	line-height: 40px;
	width: 40px;
	height: 40px;
	font-weight: bold;
	font-size: 30px;
}

.next_page:hover>a, .pre_page:hover>a {
	color: #ffac05;
}

.noResult {
	height: 500px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	font-size: 25px;
	font-weight: bold;
	font-size: 25px;
}

.list-unstyled>li {
	margin-top: 20px;
	margin-bottom: 20px;
}

.results>td {
	position: relative;
}

.setDelete {
	width: 1750%;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
	background-color: black;
	z-index: 2;
	opacity: 0.8;
	display: flex;
	align-items: center;
	justify-content: center;
}

.setDelete>span {
	color: white;
}

.setDelete>button {
	background-color: #ffac05;
	padding: 5px;
	border-radius: 10px;
}

.table {
	overflow: hidden;
}

.delTitle, .delDate {
	margin-right: 30px;
}

.logoTitle {
	font-weight: bold;
	font-size: 30px;
	color: #ffac05;
}

.search-btn {
	color: #4a2100;
	font-size: 25px;
	width: 40px;
	height: 40px;
	border-radius: 5px;
}

.search-btn:hover {
	background-color: #ffac05;
	color: white;
}

.more-btn-box {
	display: flex;
	padding: 30px;
	align-items: center;
	justify-content: center;
}

#more-btn:hover {
	background-color: #4a2100;
	color: #ffac05;
}

#more-btn {
	width: 60px;
	height: 60px;
	border-radius: 50px;
	background-color: #ffac05;
	color: #4a2100;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.msg-main {
	display: flex;
}

.msg-main>div {
	width: 50%;
}

.msg-box-title {
	width: 50%;
	height: 60px;
	line-height: 60px;
	padding-left: 10px;
	border-radius: 5px;
	font-weight: bold;
	font-size: 30px;
	color: #4a2100;
	background-color: #ffac05;
}

.msg-box-content {
	width: 98%;
	padding: 20px 0px;
	border: 1px solid grey;
	border-radius: 3px;
	background-color: #f5f5f5;
}

.msgs, .msg-box-tab {
	padding: 20px 10px;
	width: 98%;
	display: flex;
}

.msg-box-tab>div:first-child, .msg-box-tab>div:last-child {
	width: 25%;
}

.msg-box-tab>div:nth-child(2) {
	width: 50%;
}

.msgs>div:nth-child(2) {
	width: 50%;
}

.msgs>div:first-child, .msgs>div:last-child {
	width: 25%;
}
</style>
</html>
<!-- end document-->