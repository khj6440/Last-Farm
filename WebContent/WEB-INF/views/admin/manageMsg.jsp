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
<title>관리자 | 쪽지함</title>

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
	
	
	$(function() {
		$(".msgs").click(
						function() {
							var msgNo = $(this).find("h5").prev().html();
							var value = $(this).find("h5").html();
							$("#sender").html(value);
							$("#title1").html($(this).find("h5").next().html());
							$("#msgContent1").html($(this).find("h5").next().next().html());
							
							var readChk = $(this).find("h5").next().next().next().html();
							if($(this).find(".readChk").html()!=="읽음"){
							$.ajax({
								url : "/adminReadMsg",
								data:{msgNo:msgNo},
								type : "get",
								success : function(data) {

									var newValue=$("#nonReadMsg").html();
									
								
									$(".mess__title").find("span").html(newValue-1);
									$("#nonReadMsg").html(newValue-1);
								},
								error : function() {
									console.log("서버 전송 실패")
								}
							});
							}
							$(this).find(".readChk").html("읽음");
							$(this).find(".readChk").parent().css("color","grey");
						})
	})
	function backBox(){
		$("#Cbox").removeClass("show-chat-box")
	}
	
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
							<input disabled style="margin-right: 10px;"
								class="au-input au-input--xl" type="text" name="search"
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
											<a href="/logoutFrm"> <i class="zmdi zmdi-power"></i>Logout
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
										<i style="color: gray" class="far fa-envelope-open"></i> 쪽지함
										<button onclick="testMsg();" style="font-size:20px; background-color: #ffac05; border-radius: 5px; padding:5px;color:#4a2100;">쪽지 보내기</button>
									</h3>
								</div>
								<div style="display: flex">
									<div class="col-lg-6">
										<div class="au-card au-card--no-shadow au-card--no-pad m-b-40">
											<div class="au-card-title"
												style="background-image: url('images/bg-title-02.jpg');">
												<div style="background-color: #ffac05;"
													class="bg-overlay bg-overlay--blue"></div>
												<h3 style="color: #4a2100;">
													<i style="color: #4a2100;" class="zmdi zmdi-comment-text"></i>받은
													쪽지함
												</h3>
											</div>
											
											
											
											<div  id="Cbox" class="au-inbox-wrap js-inbox-wrap">
												<div class="au-message js-list-load">
													<div class="au-message__noti"></div>
													<div class="au-message-list">
														<c:forEach items="${list }" var="m">
															<c:if test="${m.msgReceiveId eq 'admin' }">
																<div class="au-message__item">
																	<div class="au-message__item-inner msgs">
																		<div class="au-message__item-text">
																			<c:if test="${m.msgRead eq 0 }">
																			<div  style="padding-top: 10px;color:yellowgreen" class="avatar-wrap">
																				<i class="far fa-check-circle"></i> <span class="readChk">new</span>
																			</div>
																			</c:if>
																			<c:if test="${m.msgRead eq 1 }">
																			<div style="padding-top: 10px;color:grey" class="avatar-wrap">
																				<i class="far fa-check-circle"></i> <span class="readChk">읽음</span>
																			</div>
																			</c:if>
																			<div class="text">
																				<div style="display:none">${m.msgNo }</div>
																				<h5 class="name">${m.msgSendId }</h5>
																				<p>${m.msgTitle }</p>
																				<div style="display: none">${m.msgContent }</div>
																				<div style="display: none">${m.msgRead }</div>
																			</div>
																		</div>
																		<div class="au-message__item-time">
																			<span>${m.msgDate }</span>
																		</div>
																	</div>
																</div>
															</c:if>
														</c:forEach>
													</div>
												</div>
												<div class="au-chat ans">
													<div class="au-chat__title">
														<div class="au-chat-info">
															<span class="nick">보낸사람 : <span id="sender"></span>
															</span>
														</div>
													</div>
													<div  class="au-chat__content">
														제목 :<span id="title1"></span>
														
													<div id="msgContent1" style="word-break: break-all;padding:10px;;height :100% ;background-color: #ededed">
														
													</div>
													</div>
													<div class="au-chat-textfield"  style="text-align: center;">
														<button style="border-radius:5px;;width: 30px;height: 30px; background-color: #ffac05;" onclick="backBox()">&lt;</button>
													</div>
												</div>
											</div>
										</div>
									</div>
									
									<div class="col-lg-6">
										<div class="au-card au-card--no-shadow au-card--no-pad m-b-40">
											<div class="au-card-title"
												style="background-image: url('images/bg-title-02.jpg');">
												<div style="background-color: #ffac05;"
													class="bg-overlay bg-overlay--blue"></div>
												<h3 style="color: #4a2100;">
													<i style="color: #4a2100;" class="zmdi zmdi-comment-text"></i>보낸
													쪽지함
												</h3>
											</div>
											<script>
												$(function() {
													$(".msgs2").click(
																	function() {
																		var value = $(this).find("h5").html();
																		$("#sender2").html(value);
																		$("#title2").html($(this).find("h5").next().html());
																		$("#msgContent2").html($(this).find("h5").next().next().html());
																	})
												})
												function backBox2(){
													$("#Cbox2").removeClass("show-chat-box")
												}
											</script>
											<div  id="Cbox2" class="au-inbox-wrap js-inbox-wrap">
												<div class="au-message js-list-load">
													<div class="au-message__noti"></div>
													<div class="au-message-list">
														<c:forEach items="${list }" var="m">
															<c:if test="${m.msgSendId eq 'admin' }">
																<div class="au-message__item">
																	<div class="au-message__item-inner msgs2">
																		<div class="au-message__item-text">
																			<div style="padding-top: 10px;" class="avatar-wrap">
																				 <span>받는이</span>
																			</div>
																			<div class="text">
																				<h5 class="name">${m.msgReceiveId }</h5>
																				<p>${m.msgTitle }</p>
																				<div style="display: none">${m.msgContent }</div>
																			</div>
																		</div>
																		<div class="au-message__item-time">
																			<span>${m.msgDate }</span>
																		</div>
																	</div>
																</div>
															</c:if>
														</c:forEach>
													</div>
												</div>
												<div class="au-chat ans">
													<div class="au-chat__title">
														<div class="au-chat-info">
															<span class="nick">받는사람 : <span id="sender2"></span>
															</span>
														</div>
													</div>
													<div  class="au-chat__content">
														제목 :<span id="title2"></span>
														
													<div id="msgContent2" style="word-break: break-all;padding:10px;;height :100% ;background-color: #ededed">
														
													</div>
													</div>
													<div class="au-chat-textfield"  style="text-align: center;">
														<button style="border-radius:5px;;width: 30px;height: 30px; background-color: #ffac05;" onclick="backBox2()">&lt;</button>
													</div>
												</div>
											</div>
										</div>
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
</style>
</html>
<!-- end document-->