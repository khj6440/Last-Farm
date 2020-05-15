<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="utf-8">

<head>
<!-- Required meta tags-->
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="au theme template">
<meta name="author" content="Hau Nguyen">
<meta name="keywords" content="au theme template">
<style type="text/css">
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
</style>
<script type="text/javascript">
	$(function() {
		$("input[name=allCheck]").click(function() {
			$("input[name=pick]").each(function(index, item) {
				item.checked = $("input[name=allCheck]").prop("checked");
			})
		});
		$(".show-count").change(function() {
			var value;
			$(this).children().each(function(index, item) {
				if (item.selected) {
					value = Number(item.value);
					location.href = "/manageSell?reqPage=1&reqCount=" + value;
				}
			});
		});

		$("#selectDel").click(function() {
			var checkList = "";
			var length = $("input[name=pick]:checked").length-1;
			console.log(length);
			$("input[name=pick]:checked").each(function(index, item) {
				if(index ==length){
					checkList= checkList.concat(item.value);
								
				}else{
					checkList= checkList.concat(item.value+"/");
				}
			});
			
			$.ajax({
				url: "/adminDelSell",
				data:{sellNo:checkList},
				type :"post",
				success:function(data){
					location.reload();
					if(data>0){
						alert("삭제 성공");
					}else{
						alert("삭제 실패");
					}
				},
				error : function(){
					console.log("서버 전송 실패")
				}
			});
		});
	});

	function showModal(sellNo, title, body) {
		$('.modal-title').html(title);
		$('.modal-body').html(body);
		$('#myModal').modal('show');
		$('#deleteContent').attr("onclick", "deleteSell(" + sellNo + ")");
	}

	function deleteSell(param) {
		$('#myModal').modal('hide');
		$.ajax({
			url: "/adminDelSell",
			data:{sellNo:param},
			type :"post",
			success:function(data){
				location.reload();
				if(data>0){
					alert("삭제 성공");
				}else{
					alert("삭제 실패");
				}
			},
			error : function(){
				console.log("서버 전송 실패")
			}
		});
	}
</script>
<!-- Title Page-->
<title>관리자 | 거래글관리</title>

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
</head>

<body class="animsition">
	<div class="page-wrapper">

		<!-- HEADER MOBILE-->

		<!-- END HEADER MOBILE-->

		<!-- MENU SIDEBAR-->
		<aside class="menu-sidebar d-none d-lg-block">
		<div class="logo">
			<a href="#"> <img src="images/icon/logo.png" alt="Cool Admin" />
			</a>
		</div>
		<div class="menu-sidebar__content js-scrollbar1">
			<nav class="navbar-sidebar">
			<ul class="list-unstyled navbar__list">


				<li><a href="/manageMember?reqPage=1"> <i
						class="fas fa-users"></i>회원 관리
				</a></li>
				<li class="active"><a href="/manageSell?reqPage=1"> <i
						class="far fa-check-square"></i>거래글 관리
				</a></li>

				<li><a href="/manageReview?reqPage=1"> <i
						class="far fa-check-square"></i>리뷰 관리
				</a></li>

				<li><a href="/manageWarning?reqPage=1"> <i
						class="far fa-check-square"></i>신고글 확인
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
						<form class="form-header" action="/adminSearchSell" method="get">
							<input class="au-input au-input--xl" type="text" name="search"
								placeholder="Search for datas &amp; reports..." />
							<input type="hidden" name="reqPage" value="1">
							<button class="au-btn--submit" type="submit">
								<i class="zmdi zmdi-search"></i>
							</button>
						</form>
						<div class="header-button">
							<div class="noti-wrap">
								<div class="noti__item js-item-menu">
									<i class="zmdi zmdi-comment-more"></i> <span class="quantity">1</span>
									<div class="mess-dropdown js-dropdown">
										<div class="mess__title">
											<p>You have 2 news message</p>
										</div>
										<div class="mess__item">
											<div class="image img-cir img-40">
												<img src="images/icon/avatar-06.jpg" alt="Michelle Moreno" />
											</div>
											<div class="content">
												<h6>Michelle Moreno</h6>
												<p>Have sent a photo</p>
												<span class="time">3 min ago</span>
											</div>
										</div>
										<div class="mess__item">
											<div class="image img-cir img-40">
												<img src="images/icon/avatar-04.jpg" alt="Diane Myers" />
											</div>
											<div class="content">
												<h6>Diane Myers</h6>
												<p>You are now connected on message</p>
												<span class="time">Yesterday</span>
											</div>
										</div>
										<div class="mess__footer">
											<a href="#">View all messages</a>
										</div>
									</div>
								</div>
								<div class="noti__item js-item-menu">
									<i class="zmdi zmdi-email"></i> <span class="quantity">1</span>
									<div class="email-dropdown js-dropdown">
										<div class="email__title">
											<p>You have 3 New Emails</p>
										</div>
										<div class="email__item">
											<div class="image img-cir img-40">
												<img src="images/icon/avatar-06.jpg" alt="Cynthia Harvey" />
											</div>
											<div class="content">
												<p>Meeting about new dashboard...</p>
												<span>Cynthia Harvey, 3 min ago</span>
											</div>
										</div>
										<div class="email__item">
											<div class="image img-cir img-40">
												<img src="images/icon/avatar-05.jpg" alt="Cynthia Harvey" />
											</div>
											<div class="content">
												<p>Meeting about new dashboard...</p>
												<span>Cynthia Harvey, Yesterday</span>
											</div>
										</div>
										<div class="email__item">
											<div class="image img-cir img-40">
												<img src="images/icon/avatar-04.jpg" alt="Cynthia Harvey" />
											</div>
											<div class="content">
												<p>Meeting about new dashboard...</p>
												<span>Cynthia Harvey, April 12,,2018</span>
											</div>
										</div>
										<div class="email__footer">
											<a href="#">See all emails</a>
										</div>
									</div>
								</div>
								<div class="noti__item js-item-menu">
									<i class="zmdi zmdi-notifications"></i> <span class="quantity">3</span>
									<div class="notifi-dropdown js-dropdown">
										<div class="notifi__title">
											<p>You have 3 Notifications</p>
										</div>
										<div class="notifi__item">
											<div class="bg-c1 img-cir img-40">
												<i class="zmdi zmdi-email-open"></i>
											</div>
											<div class="content">
												<p>You got a email notification</p>
												<span class="date">April 12, 2018 06:50</span>
											</div>
										</div>
										<div class="notifi__item">
											<div class="bg-c2 img-cir img-40">
												<i class="zmdi zmdi-account-box"></i>
											</div>
											<div class="content">
												<p>Your account has been blocked</p>
												<span class="date">April 12, 2018 06:50</span>
											</div>
										</div>
										<div class="notifi__item">
											<div class="bg-c3 img-cir img-40">
												<i class="zmdi zmdi-file-text"></i>
											</div>
											<div class="content">
												<p>You got a new file</p>
												<span class="date">April 12, 2018 06:50</span>
											</div>
										</div>
										<div class="notifi__footer">
											<a href="#">All notifications</a>
										</div>
									</div>
								</div>
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
												<a href="#"> <!-- <img src="images/icon/avatar-01.jpg" alt="John Doe" /> -->
												</a>
											</div>
											<div class="content">
												<h5 class="name">
													<a href="#">administrator</a>
												</h5>
												<span class="email">admin@example.com</span>
											</div>
										</div>
										<div class="account-dropdown__body">
											<div class="account-dropdown__item">
												<a href="#"> <i class="zmdi zmdi-account"></i>Account
												</a>
											</div>
											<div class="account-dropdown__item">
												<a href="#"> <i class="zmdi zmdi-settings"></i>Setting
												</a>
											</div>
											<div class="account-dropdown__item">
												<a href="#"> <i class="zmdi zmdi-money-box"></i>Billing
												</a>
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
						<div class="row">
							<div class="col-md-12">
								<!-- DATA TABLE -->
								<h3 class="title-5 m-b-35">
									<span style="font-weight: bold">거래글 관리</span>
								</h3>
								<div class="table-data__tool">
									<div class="table-data__tool-left">
										<div class="rs-select2--light rs-select2--md">
											<select class="js-select2" name="property">
												<option selected="selected">All Properties</option>
												<option value="21">Option 1</option>
												<option value="">Option 2</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
										<div class="rs-select2--light rs-select2--sm">
											<select class="js-select2" name="time">
												<option selected="selected">Today</option>
												<option value="">3 Days</option>
												<option value="">1 Week</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
										<button class="au-btn-filter">
											<i class="zmdi zmdi-filter-list"></i>filters
										</button>
									</div>
									<div class="table-data__tool-right">
										<button class="btn btn-danger" id="selectDel">
											<i class="zmdi zmdi-minus"></i> 선택항목 삭제
										</button>
										<div
											class="rs-select2--dark rs-select2--sm rs-select2--dark2 show-list"
											style="width: 150px;">
											<c:if test="${reqCount eq 10}">
												<select class="js-select2 show-count" name="type">
													<option value="5">5개씩 보기</option>
													<option value="10" selected>10개씩 보기</option>
													<option value="20">20개씩 보기</option>
												</select>
											</c:if>
											<c:if test="${reqCount eq 5 }">
												<select class="js-select2 show-count" name="type">
													<option value="5" selected>5개씩 보기</option>
													<option value="10">10개씩 보기</option>
													<option value="20">20개씩 보기</option>
												</select>
											</c:if>
											<c:if test="${reqCount eq 20 }">
												<select class="js-select2 show-count" name="type">
													<option value="5">5개씩 보기</option>
													<option value="10">10개씩 보기</option>
													<option value="20" selected>20개씩 보기</option>
												</select>
											</c:if>

											<div class="dropDownSelect2"></div>
										</div>
									</div>
								</div>

								<div class="table-responsive table-responsive-data2">
									<table class="table table-data2">
										<thead>
											<tr>
												<th><label class="au-checkbox"> <input
														type="checkbox" name="allCheck"> <span
														class="au-checkmark"></span>
												</label></th>

												<th>user ID</th>
												<th>title</th>
												<th>reg date</th>
												<th>end date</th>
												<th>count</th>
												<th>status</th>
												<th>price</th>
												<th></th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${list }" var="s">
												<tr class="tr-shadow">
													<td><label class="au-checkbox"> <input
															type="checkbox" name="pick" value="${s.sellNo}"> <span
															class="au-checkmark"></span>
													</label></td>

													<td><span class="block-email">${s.sellWriter }</span>
													</td>
													<td class="desc">${s.sellTitle }</td>
													<td>${s.sellDate }</td>
													<td>${s.sellEndDate }</td>
													<td>${s.sellCount }/${s.sellMax }</td>
													<td><c:if test="${s.sellDeleteState eq 0 }">
															<span class="status--process"">판매중</span>
														</c:if> <c:if test="${s.sellDeleteState eq 1 }">
															<span class="status--process" style="color: red">삭제요청</span>
														</c:if> <c:if test="${s.sellDeleteState eq 2 }">
															<span class="status--process" style="color: orange">삭제진행중</span>
														</c:if></td>
													<td>&#8361;${s.sellPrice }</td>
													<td>
														<div class="table-data-feature">

															<button class="item" data-toggle="tooltip"
																data-placement="top" title="Delete"
																onclick="showModal('${s.sellNo}','거래글 삭제','해당 게시물을 삭제 하시겠습니까?')">
																<i class="zmdi zmdi-delete"></i>
															</button>


															<button class="item" data-toggle="tooltip"
																data-placement="top" title="More">
																<i class="zmdi zmdi-more"></i>
															</button>
														</div>
													</td>
												</tr>

												<tr class="spacer"></tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="user-data__footer">
									<div id="pageNavi">${pageNavi}</div>
									<!-- <button class="au-btn au-btn-load">load more</button> -->
								</div>
								<!-- END DATA TABLE -->
							</div>
						</div>
						<div class="row m-t-30"></div>
						<div class="row">
							<div class="col-md-12">
								<div class="copyright">
									<p>
										Copyright Â© 2020 Colorlib. All rights reserved. Template by <a
											href="https://colorlib.com">Colorlib</a>.
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
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
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
</html>
<!-- end document-->
