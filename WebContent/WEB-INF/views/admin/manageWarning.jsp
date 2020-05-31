<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<html lang="en">

<head>
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
<title>관리자 | 신고글관리</title>

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

<style>
* {
	font-family: 'Jua', sans-serif;
}

.list-unstyled>li {
	margin-top: 20px;
	margin-bottom: 20px;
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
	width: 100px;
	height: 100px;
	border-radius: 50px;
	background-color: #ffac05;
	color: #4a2100;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
}

.search-btn {
	color: #4a2100;
	font-size: 25px;
	width: 40px;
	height: 40px;
	border-radius: 5px;
	margin-left: 15px;
}

.search-btn:hover {
	background-color: #ffac05;
	color: white;
}

.logoTitle {
	font-weight: bold;
	font-size: 30px;
	color: #ffac05;
}

.header-mobile .navbar-mobile .navbar-mobile__list li a:hover {
	color: #ffac05;
}
</style>

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
	})

	function showModal(typeNo, title, body,type) {
		$('.modal-title').html(title);
		$('.modal-body').html(body);
		$('#deleteContent').html("삭제");
		$('#myModal').modal('show');
		$('#deleteContent').attr("onclick", "deleteWarning(" + typeNo + ",'"+type+"')");
	}

	function deleteWarning(typeNo,type) {
		$('#myModal').modal('hide');
		var url="";
		var param=null;
		if(type=="sell"){
			url ="/adminDelSell";
			param= {sellNo:typeNo};
		}else if(type=="review"){
			url ="/adminDelReview";
			param= {reviewNo:typeNo};
		}else{
			url = "/adminDelComment";
			param={commentNo:typeNo,type:type};
		}
		
		$.ajax({
			url : url,
			data : param,
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

	function fn_more(start) {
		var param = {
			start : start
		};
		$
				.ajax({
					url : "/adminWarningMore",
					data : param,
					type : "post",
					dataType : "json",
					success : function(data) {
						var area = $("tbody");
						var html = "";
						var value = "";
						console.log(data);

						for (var i = 0; i < data.length; i++) {
							html += "<tr><td>";
							html += '</td>';
							switch (data[i].type) {
							case "review":
								value = "리뷰";
								break;
							case "review_comment":
								value = "리뷰 댓글";
								break;
							case "sell":
								value = "판매글";
								break;
							case "sell_comment":
								value = "판매글 댓글";
								break;
							}
							html += '<td>' + value + '</td>';
							html += '<td>' + data[i].typeTitle + '</td>';
							html += '<td>' + data[i].typeWriter + '</td>';
							html += '<td style="color:red">'
									+ data[i].typeWarning + '</td>';
							html += '<td>' + data[i].typeDate + '</td>';
							html += '<td>';

							html += '<div class="table-data-feature"><button class="item" data-toggle="tooltip" data-placement="top" title="Delete" onclick="showModal('
									+ data[i].typeNo
									+ ","
									+ "'"
									+ value
									+ "삭제'"
									+ ","
									+ "'"
									+ "해당글을 삭제하시겠습니까?"
									+ "'"
									+ ","
									+ "'"
									+ data[i].type
									+ "'"
									+ ')">';
							html += '<i class="zmdi zmdi-delete"></i></button>';
							html += '</div>';
							html += '</td></tr>';

						}

						$("tbody").append(html);
						$("#more-btn").val(Number(start) + 5);
						$("#more-btn").attr(
								"currentCount",
								Number($("#more-btn").attr("currentCount"))
										+ data.length);
						var totalCount = $("#more-btn").attr("totalCount");
						var currentCount = $("#more-btn").attr("currentCount");
						if (totalCount == currentCount) {
							$("#more-btn").unbind('mouseenter mouseleave')
							$("#more-btn").attr("disabled", true);
							$("#more-btn").css("cursor", "not-allowed");
						}

					},
					error : function() {
						console.log("실패")
					}
				})
	}
	$(function() {
		fn_more(1);
		$("#more-btn").click(function() {
			fn_more($(this).val());
		})
	})
</script>

</head>

<body class="animsition">
	<div class="page-wrapper">
		<!-- HEADER MOBILE-->
		<header class="header-mobile d-block d-lg-none">
		<div class="header-mobile__bar">
			<div class="container-fluid">
				<div class="header-mobile-inner">

					<a href="index.jsp"> <img src="/imgs/mole.jpg"
						style="width: 55px; margin-right: 10px;" /><span
						class="logoTitle">LAST FARM</span>
					</a>
					<button class="hamburger hamburger--slider" type="button">
						<span class="hamburger-box"> <span class="hamburger-inner"></span>
						</span>
					</button>
				</div>
			</div>
		</div>
		<nav class="navbar-mobile">
		<div class="container-fluid">
			<ul class="navbar-mobile__list list-unstyled">
				<li><a href="/manageMember?reqPage=1"> <i
						class="fas fa-users"></i>회원 관리
				</a></li>
				<li><a href="/manageSell?reqPage=1"> <i
						class="far fa-list-alt"></i>거래글 관리
				</a></li>

				<li><a href="/manageReview?reqPage=1"> <i
						class="far fa-star"></i>리뷰 관리
				</a></li>

				<li style="border-radius: 0px;" class="active"><a
					href="/manageWarning"><i class="fas fa-exclamation-circle"
						style="color: #4a2100"></i>신고글 관리 </a></li>
				<li><a href="/adminGetMsgList"> <i
						class="far fa-envelope-open"></i>쪽지함
				</a></li>
			</ul>
		</div>
		</nav> </header>
		<!-- END HEADER MOBILE-->

		<!-- MENU SIDEBAR-->
		<aside class="menu-sidebar d-none d-lg-block">
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

				<li class="active"><a style="color: #4a2100"
					href="/manageWarning?reqPage=1"> <i
						class="fas fa-exclamation-circle"></i>신고글 관리
				</a></li>
				<li><a href="/adminGetMsgList"> <i
						class="far fa-envelope-open"></i>쪽지함
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
						<form class="form-header" action="" method="POST">
							<input disabled class="au-input au-input--xl" type="text"
								name="search" placeholder="Search for datas &amp; reports..." />
							<button style="height: 43px; width: 43px;" class="search-btn"
								type="submit">
								<i class="zmdi zmdi-search"></i>
							</button>
						</form>
						<div class="header-button">
							<div class="noti-wrap">
								<div id="msg-btn" class="noti__item js-item-menu">
									<i class="far fa-envelope-open"></i> <span id="nonReadMsg"
										class="quantity">8</span>
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
									<h3 class="title-5 m-b-35" style="font-weight: bold;">
										<i style="color: #DC3545" class="fas fa-exclamation-circle"></i>
										신고글 관리<span style="color: gray; font-size: 15px"> (검색결과
											신고글 :${totalCount }개)</span>
									</h3>
									<div>
										(신고누적 <span style="color: #dc3545">5</span>개 이상)
									</div>

									<table class="table table-borderless table-data3">
										<thead>
											<tr>
												<th style="display: flex;"></th>
												<th>type</th>
												<th>description</th>
												<th>writer</th>
												<th>warning</th>
												<th>reg date</th>
												<th></th>
											</tr>
										</thead>
										<tbody>


										</tbody>
									</table>
									<div class="more-btn-box">
										<button id="more-btn" totalCount="${totalCount}"
											currentCount="0" value="">
											<span>더보기</span> <i class="fas fa-arrow-circle-down"></i>
										</button>
									</div>
								</div>
								<!-- END DATA TABLE-->
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<div class="copyright">
									<p>
										Copyright © 2020 Last Farm. All rights reserved. By <a
											href="#">LAST FARM</a>.
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

</html>
<!-- end document-->
