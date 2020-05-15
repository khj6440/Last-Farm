<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">

<head>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<!-- Required meta tags-->
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
		$("input[name=allCheck]").click(function() {
			console.log("실행");
			$("input[name=pick]").each(function(index, item) {
				item.checked = $("input[name=allCheck]").prop("checked");
			})
		});
	});
</script>
</head>



<body class="animsition">
	<div class="page-wrapper">
		<!-- HEADER MOBILE-->

		<!-- END HEADER MOBILE-->

		<!-- MENU SIDEBAR-->
		<aside class="menu-sidebar d-none d-lg-block">
		<div class="logo">
			<a href="#"> <img src="" alt="Cool Admin" />
			</a>
		</div>
		<div class="menu-sidebar__content js-scrollbar1">
			<nav class="navbar-sidebar">
			<ul class="list-unstyled navbar__list">


				<li class="active"><a href="/manageMember?reqPage=1"> <i
						class="fas fa-users"></i>회원 관리
				</a></li>
				<li><a href="/manageSell?reqPage=1"> <i class="far fa-check-square"></i>거래글
						관리
				</a></li>

				<li><a href="/manageReview?reqPage=1"> <i class="far fa-check-square"></i>리뷰
						관리
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
						<form class="form-header" action="" method="POST">
							<input class="au-input au-input--xl" type="text" name="search"
								placeholder="Search for datas &amp; reports..." />
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
							<div class="" style="max-width: none; width: 100%;">
								<!-- USER DATA-->
								<div class="user-data m-b-30">
									<h3 class="title-3 m-b-30">
										<i class="fas fa-users"></i><span style="font-weight: bold">회원 관리</span>

									</h3>

									<div class="filters m-b-45"
										style="display: flex; justify-content: space-between;">
										<div>
											<div
												class="rs-select2--dark rs-select2--md m-r-10 rs-select2--border">
												<select class="js-select2" name="property">
													<option selected="selected">전체 사용자</option>
													<option value="seller">판매자</option>
													<option value="buyer">구매자</option>
												</select>
												<div class="dropDownSelect2"></div>
											</div>


											<div
												class="rs-select2--dark rs-select2--sm rs-select2--border">
												<select class="js-select2 au-select-dark" name="time">
													<option selected="selected">All Time</option>
													<option value="">By Month</option>
													<option value="">By Day</option>
												</select>
												<div class="dropDownSelect2"></div>
											</div>
											<button class="btn btn-primary" style="height: 100%;width:50px" type="button">
											<i class="zmdi zmdi-search"></i>
										</button>
									
										</div>
										총페이지 : ${totalPage } 총 회원 :${totalCount }
										<div>
											
											<button class="btn au-btn-icon btn-danger au-btn--small">
												<i class="zmdi zmdi-minus"></i>선택 삭제
											</button>
										</div>

									</div>



									<div class="table-responsive table-data">
										<table class="table">
											<thead>
												<tr>
													<td><label class="au-checkbox"> <input
															type="checkbox" name="allCheck"> <span
															class="au-checkmark"></span>
													</label></td>
													<td>name</td>
													<td>user ID</td>
													<td>type</td>
													<td>test</td>
													<td></td>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${list}" var="m">
													<tr>
														<td><label class="au-checkbox"> <input
																type="checkbox" name="pick"> <span
																class="au-checkmark"></span>
														</label></td>

														<td>
															<div class="table-data__info">
																<h6>${m.memberName }</h6>
																<span> <a href="#">${m.memberEmail}</a>
																</span>
															</div>
														</td>
														<td><span>${m.memberId }</span></td>

														<c:if test="${m.memberType eq 1}">
															<td><span class="role member">구매자</span></td>
														</c:if>
														<c:if test="${m.memberType eq 2}">
															<td><span class="role user">판매자</span></td>
														</c:if>
														<td>
															<div class="rs-select2--trans rs-select2--sm">
																<select class="js-select2" name="property">
																	<option selected="selected">Full Control</option>
																	<option value="">Post</option>
																	<option value="">Watch</option>
																</select>
																<div class="dropDownSelect2"></div>
															</div>
														</td>
														<td><span class="more"> <i
																class="zmdi zmdi-more"></i>
														</span></td>
													</tr>

												</c:forEach>
											</tbody>
										</table>
										<!-- <div id="pageNavi">${pageNavi}</div> -->
									</div>
									<div class="user-data__footer">
										<div id="pageNavi">${pageNavi}</div>
										<!-- <button class="au-btn au-btn-load">load more</button> -->
									</div>
								</div>
								<!-- END USER DATA-->
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<div class="copyright">
									<p>
										Copyright © 2018 Colorlib. All rights reserved. Template by <a
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

.next_page:hover>a,.pre_page:hover>a{
	color:#ffac05;
	
}
</style>
</html>
<!-- end document-->