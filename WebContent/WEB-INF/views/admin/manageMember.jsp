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
				if(data<=0){
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
		
		
		$("#msg-btn").click(function(){
			$.ajax({
				url : "/adminGetMsgCount",
				type : "post",
				success : function(data) {
					console.log(data);
					if(data<=0){
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
		
		$("#sort-btn").click(function(){
			var value =$("#sort-select").children("option:selected").val();
			var link = document.location.href;
			var searched = $("input[name=search]").val();
			if (!link.match("search")) {
				location.href = "/manageMember?reqPage=1&reqCount=10&sort="+ value;
			} else {
				location.href = "/adminSearchMember?reqPage=1&reqCount=10&search="+ searched+"&sort="+value;
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
		$(".memberStatus").change(function() {
			var text = $(this).children("option:selected").html();
			var value= $(this).children("option:selected").val();
			var memberNo = $(this).children("option:selected").attr("memberNo");
			$('.modal-title').html("회원 "+text);
			$('.modal-body').html("해당회원을 ["+text+"] 하시겠습니까?");
			$('#deleteContent').html("확인");
			$('#cancelBtn').attr("onclick","location.reload()");
			$('#deleteContent').attr("onclick", "modifyMemberStatus(" + value + ","+memberNo+")");
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
	
	
	function modifyMemberStatus(value,memberNo) {
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
				console.log("결과:" +data);
			},
			error : function() {
				console.log("서버 전송 실패");
			},
			complete:function(){
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
	
	function deleteCancelModal(memberNo,title,body){
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
				<li class="active"><a style="color: #4a2100"
					href="/manageMember?reqPage=1"> <i class="fas fa-users"></i>회원
						관리
				</a></li>
				<li><a href="/manageSell?reqPage=1"> <i
						class="far fa-list-alt"></i>거래글 관리
				</a></li>

				<li><a href="/manageReview?reqPage=1"> <i
						class="far fa-star"></i>리뷰 관리
				</a></li>

				<li><a href="/manageWarning"><i
						class="fas fa-exclamation-circle"></i>신고글 관리 </a></li>
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
						<form class="form-header" action="/adminSearchMember" method="get">
							<input style="margin-right: 10px;" class="au-input au-input--xl"
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
						<div class="row">
							<div class="" style="max-width: none; width: 100%;">
								<!-- USER DATA-->
								<div class="user-data m-b-30" style="width: 100%">
									<h3 class="title-3 m-b-30">
										<i style="color: navy;" class="fas fa-users"></i><span
											style="font-weight: bold">회원 관리 </span><span
											style="color: gray; font-size: 15px"> (검색결과 회원
											:${totalCount })</span>
									</h3>
									<div class="filters m-b-45"
										style="display: flex;; justify-content: space-between;">
										<div style="display: flex;">
											<div
												class="rs-select2--dark rs-select2--md m-r-10 rs-select2--border">
												<c:if test="${sort eq 'member_date desc' }">
													<select id="sort-select" class="js-select2" name="property">
														<option value="가입일순" selected>가입일순</option>
														<option value="타입순">타입순</option>
														<option value="ID순">ID순</option>
													</select>
												</c:if>
												<c:if test="${sort eq 'member_type' }">
													<select id="sort-select" class="js-select2" name="property">
														<option value="가입일순">가입일순</option>
														<option value="타입순" selected>타입순</option>
														<option value="ID순">ID순</option>
													</select>
												</c:if>
												<c:if test="${sort eq 'member_id' }">
													<select id="sort-select" class="js-select2" name="property">
														<option value="가입일순">가입일순</option>
														<option value="타입순">타입순</option>
														<option value="ID순" selected>ID순</option>
													</select>
												</c:if>
												<div class="dropDownSelect2"></div>
											</div>
											<button id="sort-btn" class="search-btn" type="button">
												<i class="fas fa-sort"></i>
											</button>
										</div>
										<div>
											<button style=""
												class="btn au-btn-icon btn-danger au-btn--small"
												id=selectDel>
												<i class="zmdi zmdi-minus"></i>선택항목 삭제
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
													<td>status</td>
													<td>reg Date</td>
													<td></td>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${list}" var="m">
													<c:if test="${m.memberId ne 'admin'}">
													<tr class="results">
														<td><label class="au-checkbox"> <input
																type="checkbox" name="pick" value="${m.memberNo }">
																<span class="au-checkmark"></span>
														</label> <c:if test="${m.memberStatus eq 2 }">
																<div class="setDelete">
																	<span class="delTitle">삭제 예정일 : </span> <span
																		class="delDate"> ${m.memberDelDate} 00시 </span>
																	<button class="delCancel"
																		onclick="deleteCancelModal('${m.memberNo }','회원삭제 취소','취소하시겠습니까?')">삭제
																		취소</button>
																</div>
															</c:if></td>
														<td>
															<div class="table-data__info">
																<h6>${m.memberName }</h6>
																<span> <a href="#">${m.memberEmail}</a>
																</span>
															</div>
														</td>
														<td><span>${m.memberId }</span></td>

														<c:if test="${m.memberType eq 1}">
															<td><span class="role member"
																style="background-color: #d9be8d;">구매자</span></td>
														</c:if>
														<c:if test="${m.memberType eq 2}">
															<td><span class="role user"
																style="background-color: #8f7951;">판매자</span></td>
														</c:if>
														<td>
															<div class="rs-select2--trans rs-select2--sm">

																<c:if test="${m.memberStatus eq 1 }">
																	<select class="js-select2 memberStatus" name="property">
																		<option memberNo="${m.memberNo}" value="1" selected>활성화</option>
																		<option memberNo="${m.memberNo}" value="3">비활성화</option>
																		<option value="2" disabled>삭제중</option>
																	</select>
																</c:if>
																<c:if test="${m.memberStatus eq 3 }">
																	<select class="js-select2 memberStatus" name="property">
																		<option memberNo="${m.memberNo}" value="1">활성화</option>
																		<option memberNo="${m.memberNo}" value="3" selected>비활성화</option>
																		<option value="2" disabled>삭제중</option>
																	</select>
																</c:if>
																<c:if test="${m.memberStatus eq 2 }">
																	<select class="js-select2 memberStatus" name="property">
																		<option value="1">활성화</option>
																		<option value="3">비활성화</option>
																		<option value="2" selected disabled>삭제중</option>
																	</select>
																</c:if>
																<div class="dropDownSelect2"></div>
															</div>
														</td>
														<td>${m.memberDate }</td>
														<td><span class="more"> <i
																class="zmdi zmdi-delete"
																onclick="showModal('${m.memberNo}','회원 삭제','해당 회원 [${m.memberId}]을 삭제 하시겠습니까?<div>회원 삭제시 14일뒤에 삭제 됩니다.</div')"></i>
														</span> <span class="more"> <i class="zmdi zmdi-more"></i>
														</span></td>
													</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
										<c:if test="${empty list  && totalCount==0 }">
											<div class="noResult">
												<div style="padding-bottom: 30px;">[ ${search} ]에 대한
													검색결과가 없습니다.</div>
												<button class="btn btn-primary"
													onclick="location.href='/manageMember?reqPage=1'">돌아가기</button>
											</div>
										</c:if>
										<!-- <div id="pageNavi">${pageNavi}</div> -->
									</div>
									<c:if test="${totalCount!=0 }">
										<div class="user-data__footer">
											<div id="pageNavi">${pageNavi}</div>
											<!-- <button class="au-btn au-btn-load">load more</button> -->
										</div>
									</c:if>
								</div>
								<!-- END USER DATA-->
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
</style>
</html>
<!-- end document-->