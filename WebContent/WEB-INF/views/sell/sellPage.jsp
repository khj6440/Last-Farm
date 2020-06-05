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
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">

<style>
* {
	font-family: 'Jua', sans-serif;
}

.buy {
	width: 1280px;
	margin: 0 auto;
	overflow: hidden;
}
 
.sell_head {
	box-sizing: content-box;
	margin: 0 auto;
	border-bottom: 2px solid gray;
	width: 80%;
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
.sell_delete_btn{
	border-radius : 3px;
	box-shadow : 1px 1px 2px gray;
	border-style : none;
	width : 100px;
	height : 30px;
	background-color : #DC3545 ;
}
.sell_delete_btn:hover{
	color : #DC3545 ;
	background-color:  #ffac05;
}
.sell_content {
	margin: 0 auto;
	width: 65%;
	height: 1100px;
}

.sell_content_table {
	border-collapse: collapse;
	font-size: 20px;
	width: 100%;
	height: 500px;
}
.sell_table_title{
	text-align : center;
	font-size : 20px;
	color : ;
}
.sell_table_td {
	overflow : hidden;
	box-sizing: border-box;
	width: 400px;
	height: 400px;
	overflow: hidden;
}
.sell_img_div{
	position : relative;
	box-sizing: content-box;
}
.sell_img11 {
	width : 405px;
	height : 430px;
	position: relative;
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

#sell_timer {
	position : absolute;
	box-sizing: content-box;
	border-radius : 3px;
	border: 2px solid red;
	width: 300px;
	height: 80px;
	text-align: center;
	color : red;
	line-height: 2;
	font-size: 2em;
	bottom: 0px;
    right: 0px;
}

.sell_table_th {
	width: 500px;
	height: 50px;
	text-align: center;
}

.sell_table_th2 {
	line-height: 0.5;
	width: 80px;
	height: 50px;
	text-align: center;
}

.sell_warning {
	width: 20px;
	height: 20px;
}
#sell_th{
text-align: center;
}
#sell_content_warning {
	font-size: 10px;
}

.sell_table_div {
	margin : 0 auto;
	width : 80%;
	border-radius: 5px;
	height: 70%;
}
.sell_btn{
	border-radius : 3px;
	box-shadow : 1px 1px 2px gray;
	border-style : none;
	background-color : #ffac05;
	color : #4a2100 ;
	width : 120px;
	height : 40px;
	font-size : 20px;
}
.sell_btn:hover{
	background-color :#4a2100 ;
	color : #ffac05;
}
.sell_content2 {
	border-bottom: 2px solid gray;
	width: 100%;
	height: 600px;
	box-sizing: content-box;
	overflow: hidden;
}

.sell_content2_sub {
	width: 70%;
	height: 100%;
	box-sizing: border-box;
	float: left;
	border-right: 1px solid gray;
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
	padding: 10px;
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
	float: left;
	width: 30%;
	height: 100%;
	overflow: hidden;
}

.sell_content2_sub2_div {
	padding : 20px;
	box-sizing: border-box;
	width: 100%;
	border-bottom: 2px solid gray;
}

.sell_content2_sub31 {
	padding-top : 10px;
	padding-bottom : 10px;
	text-align:center;
	margin: 0 auto;
	box-sizing: border-box;
	width: 200px;
	height: 50%;
	background-color: lightgray;
}

.sell_content2_sub32 {
	padding-top : 10px;
	padding-left : 25px;
	margin: 0 auto;
	text-align : center;
	box-sizing: border-box;
	width: 100%;
	height: 50%;
	padding-left : 10px;
}

.sell_content2_sub22 {
	margin-top: 100px;
	margin-left: 30px;
	box-sizing: border-box;
	width: 80%;
	height: 80%;
}

.sell_contentinf_h3 {
	text-align: center;
}

.sell_grade {
	width: 30px;
	height: 30px;
}

.sell_grade:hover{
	cursor : pointer;
	opacity: 0.7;
}

.sell_content3 {
	padding-bottom : 10px;
	padding-top: 15px;
	margin: 0 auto;
	box-sizing: content-box;
	width: 70%;
}

.sell_menu {
	line-height: 3;
	text-align: center;
	box-sizing: border-box;
	font-weight: bold;
	border-radius: 5px;
	color : #4a2100;
	border: 1px solid #4a2100;
	width: 70%;
	height: 50px;
	margin: 0 auto;
}


.sell_menu_sub {
	width: 80%;
	margin: 0 auto;
	border-top: none;
	display: none;
}
fieldset{
	border : 1px solid gray;
	border-radius: 5px;
}
legend{
	text-align : center;
	margin-bottom : 0;
}
.sell_content_wrapper {
	margin : 0 auto;
	width: 80%;
	text-align: center;
	overflow : hidden;
}

.sellList {
	padding : 0;
	width: 95%;
	clear: both;
	border: 1px solid #ccc;
	border-radius: 5px;
	overflow: hidden;
}

.sellList>li {
	list-style: none;
	float: left;
	color: black;
}

.sell_comment_h4 {
	width: 420px;
	height: 30px;
	text-align : center;
	background-color: lightgray;
	margin: 0 auto;
	margin-bottom: 10px;
	margin-top: 10px;
	line-height: 2;
	font-size:20px;
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
.sellCommentTable{
	padding : 10px;
	margin : 0 auto;
}
.sellCommentInput {
	width: 350px;
	height: 20px;
	text-align : center;
}

.sell_commentBtn {
	text-decoration: none;
	font-size: 15px;
	color : #4a2100;
}
</style>
</head>

<body>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
	<section class="sell_container">
	<form action="/buyFrm" method="post" class="sell">
		<input type="hidden" name="sell_no" value="${s.sellNo }"> <input
			type="hidden" name="sell_name" value="${s.sellName }"> <input
			type="hidden" name="sell_price" value="${s.sellPrice }"> <input
			type="hidden" name="sell_delivery_fee" value="${s.sellDeliveryFee }">
		<input type="hidden" name="sell_count" value="${s.sellCount }">
		<input type="hidden" name="sell_max" value="${s.sellMax }">
		<input type="hidden" name="sell_regional_addr" value="${s.sellRegionalAddr }">
		<div class="sell_head">
			<div class="sell_head_sub">
				<a href="index.jsp"><img src="imgs/두더지.jpg" class="sell_home"></a>
				>
				<c:if test="${s.sellType eq 1}">
					<a href="#" class="sell_a">전 지역 판매</a>
				</c:if>
				<c:if test="${s.sellType eq 2}">
					<a href="#" class="sell_a">내 지역 판매</a>
				</c:if>
			</div>
			<div class="sell_head_sub2">
				작성일 : ${s.sellDate }
				<c:if
					test="${sessionScope.member.memberType ne 3 && sessionScope.member.memberId eq s.sellWriter && s.sellDeleteState eq 0 && sessionScope.member.memberType eq 2}">

					<button type="button" class="sell_delete_btn"
						onclick="location.href='/sellPageDelRequest?sell_no=${s.sellNo}&sell_delete_state=${s.sellDeleteState }'">글
						삭제 요청</button>

				</c:if>
			</div>
		</div>
		<div class="sell_content">
			<table class="sell_content_table">
				<tr>
					<td colspan="3" class="sell_table_title">${s.sellTitle }</td>
				</tr>
				<tr>
					<td rowspan="5" class="sell_table_td">
					<div class="sell_img_div"><img
						src="/imgs/${s.thumbnail }" class="sell_img11">
							<c:if test="${s.timegap >0}">
                    		 ${s.timegap } 일 남음
                     			</c:if>
							<c:if test="${s.timegap ==0 }">
						<div id="sell_timer">
						</div>
							</c:if>
						</div>
						</td>
					<th class="sell_table_th">${s.sellName }</th>
					<c:if test="${not empty sessionScope.member && sessionScope.member.memberType ne 3 && sessionScope.member.memberId ne s.sellWriter }">
					<th class="sell_table_th2">
					
					<a href="javascript:void(0)" onclick="sellWarning('${s.sellNo }','${sessionScope.member.memberId }')">
					<img src="/img/신고버튼.png" class="sell_warning"></a><br></th>
					</c:if>
				</tr>
				<tr>
					<th colspan="2" id="sell_th">${s.sellPrice }원|개당(g)</th>
				</tr>
				<tr>
					<th colspan="2" id="sell_th">

						<div class="sell_table_div">
							<c:if test="${s.sellType eq 1 }">
								전 지역 판매 상품을 주문하고, <br>신선한 재료를 직배송으로 받아보세요!
								</c:if>
							<c:if test="${s.sellType eq 2 }">
								내 지역 판매 상품을 주문하고, <br>오늘 오후 23시 전에 바로 받아보세요!
								</c:if>
						</div>

					</th>
				</tr>
				<tr>
					<th colspan="2" id="sell_th"><c:if
							test="${s.sellDeliveryFee eq 0 && s.sellType eq 1}">
							무료배송<br> 3일 내 도착 보장<br>(오후 2시 전 주문 시 / 전 지역 상품 기준)<br>
							*지역에 따라 상이*							
							</c:if> <c:if test="${s.sellDeliveryFee eq 0 && s.sellType eq 2 }">
							무료배송 <br> 당일 도착 보장<br>(오후 2시 전 주문 시 / 내 지역 상품 기준)
							</c:if> <c:if test="${s.sellType eq 1}">
							배송비 ${s.sellDeliveryFee }원 <br> 3일 내 도착 보장<br>(오후 2시 전 주문 시 / 전 지역 상품 기준)<br>
							*지역에 따라 상이*
							</c:if> <c:if test="${s.sellType eq 2}">
							배송비 ${s.sellDeliveryFee }원 <br> 당일 도착 보장<br>(오후 2시 전 주문 시 / 내 지역 상품 기준)
							</c:if></th>
				</tr>
				<tr>
					<th colspan="2">수량 선택 <select class="sell_count_select"
						name="type">
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
					</select> <c:if test="${s.sellDeleteState eq 1 || s.sellCount eq s.sellMax}">
							<span>딜이 중지된 글입니다.</span>
						</c:if> <c:if
							test="${s.sellDeleteState eq 0 && not empty sessionScope.member && s.sellCount ne s.sellMax}">
							<input type="submit" onclick="location.href='/buyFrm'"
								class="sell_btn" value="딜 참여하기"> 총 <span class="sell_allprice">${s.sellPrice }</span>원
								</c:if>
					</th>
				</tr>
				<tr>

					<td>구매현황 : 현재 ${s.sellCount }개 구매 진행중</td>
					<td colspan="2">딜 완료까지 ${s.sellMax-s.sellCount }개 남음</td>
				</tr>
			</table>
			<div class="sell_content2">
				<div class="sell_content2_sub">
					<!-- <div class="sell_content_img2_btn">왼</div>
						<div class="sell_content_img2"></div>
						<div class="sell_content_img2_btn2">오</div> -->
					<div class="sell_content_text"><br>${s.contentBr }</div>
				</div>
				<div class="sell_content2_sub2">
					<div class="sell_content2_sub2_div">
						<div class="sell_content2_sub31">
							판매자 스토어 정보<br> <span>판매자 이름 : ${s.sellWriter }</span>
							<c:if test="${m. memberScore eq 4}">
								<span><img src="/img/판매자스티커.png"
									onclick="alert('후기 평점이 4점을 넘은 우수 판매자에게 부여되는 스티커입니다.');"
									class="sell_grade"></span>
							</c:if>
						</div>
						<c:if test="${s.sellType eq 2}">
						<div class="sell_content2_sub32">
						<br>
							 <img class="sell_warning"src="/imgs/time_car2.png"> 당일 배송 가능한 지역 <br>
							  : ${s.sellRegionalAddr }
						</div>
						</c:if>
					</div>
					<div class="sell_content2_sub22">
						<h3 class="sell_contentinf_h3">상품정보</h3>
						<table class="sell_goods_inf">
							<tr class="sell_goods_inf_tr">
								<th>제조원</th>
								<td>${s.sellItemOrigin }</td>
							</tr>
							<tr>
								<th>유통기한</th>
								<td>${s.sellItemExpireDate }</td>
							</tr>
							<tr>
								<th>상품용량</th>
								<td>${s.sellItemQuantity }</td>
							</tr>
							<tr>
								<th>원재료명 및 함량</th>
								<td>${s.sellItemMaterial }</td>
							</tr>
							<tr>
								<th>보관시 주의사항</th>
								<td>${s.sellItemRule }</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</form>


	<div class="sell_content3">
		<div class="sell_menu">상품문의</div>
		<div class="sell_menu_sub">
			<fieldset>
				<legend>
					<h4 class="sell_comment_h4">상품에 대한 궁금한 점은 댓글로 남겨주세요 ↓</h4>
				</legend>
				<div class="sell_content_wrapper">
					<form action="/sellCommentInsert" method="post">
						<input type="hidden" name="sellCommentWriter"
							value="${sessionScope.member.memberId }"> <input
							type="hidden" name="sellNo" value="${s.sellNo }"> <input
							type="hidden" name="sellCommentLevel" value="1"> <input
							type="hidden" name="sellCommentRef" value="0">
						<c:if test="${not empty sessionScope.member}">
							<div class="sellCommentTable">
									<input type="text"
										class="sellCommentInput" name="sellCommentContent"
										placeholder="이곳에 문의 댓글을 남겨주세요.">
									
									<button type="submit" >등록</button>
								
								
							</div>
						</c:if>
					</form>
				</div>

				<div class="sell_content_wrapper">
					<c:forEach items="${list }" var="sc">
						<c:if test="${sc.sellCommentLevel eq 1 && not empty sessionScope.member || sessionScope.member.memberType eq 3}">
							<ul class="sellList">
								<li style="width: 10%; text-align: center"><span>${sc.sellCommentWriter }</span></li>
								<li style="width: 60%; text-align: center; word-break:break-all;"><span>${sc.sellCommentContent }</span>
									<input type="text" class="sellCommentInput"
									name="sellCommentContent" value="${sc.sellCommentContent }"
									style="display: none;"></li>
								<li style="width: 20%; text-align: center"><span>${sc.sellCommentDate }</span></li>
								<li style="width:90%; text-align: right">
								<c:if test="${sessionScope.member.memberId eq s.sellWriter}">
								<c:if test="${sessionScope.member.memberType ne 3 }">
										<a href="javascript:void(0)" class="sell_commentBtn"
											onclick="insertComment(this, '${sc.sellCommentNo }','${s.sellNo }','${sessionScope.member.memberId }')">댓글달기</a>
											</c:if>
											</c:if>
											<c:if test="${not empty sessionScope.member && sessionScope.member.memberId ne sc.sellCommentWriter && sessionScope.member.memberType ne 3}">
											<c:if test="${ empty w4}">
										<a href="javascript:void(0)" class="sell_commentBtn"
											onclick="sellCommentWarning('${s.sellNo }','${sc.sellRef }','${sc.sellCommentNo}','${sessionScope.member.memberId }')">신고</a>
											</c:if>
											<c:if test="${not empty w4 }">
											<c:forEach items="${w4 }" var="w4">
											<c:if test="${w4.writer eq sessionScope.member.memberId && w4.sellCommentNo eq sc.sellCommentNo}">
											<a class="sell_commentBtn" href="javascript:void(0)">신고완료</a>
											</c:if>
											<c:if test="${w4.writer ne sessionScope.member.memberId && w4.sellCommentNo eq sc.sellCommentNo }">
												<a href="javascript:void(0)" class="sell_commentBtn"
											onclick="sellCommentWarning('${s.sellNo }','${sc.sellRef }','${sc.sellCommentNo}','${sessionScope.member.memberId }')">신고</a>
											</c:if>
											</c:forEach>
											</c:if>
											</c:if>
										<c:if
											test="${not empty sessionScope.member && sessionScope.member.memberId == sc.sellCommentWriter }">
											<a href="javascript:void(0)" class="sell_commentBtn"
												onclick="modifyComment(this, '${sc.sellCommentNo}','${sc.sellRef }')">수정</a>
											<a href="javascript:void(0)" class="sell_commentBtn"
												onclick="deleteComment('${sc.sellCommentNo}','${sc.sellRef }')">삭제</a>
										</c:if>
									</li>
							</ul>
						</c:if>
						<c:forEach items="${list }" var="scc">
							<c:if
								test="${not empty sessionScope.member && scc.sellCommentLevel eq 2 && sc.sellCommentNo eq scc.sellCommentRef && s.sellWriter eq sessionScope.member.memberId}">
								<ul class="sellList">
									<li style="width: 5%; text-align: center"><span>└─</span></li>
									<li style="width: 10%; text-align: center"><span>${scc.sellCommentWriter }</span></li>
									<li style="width: 55%; text-align: center"><span>${scc.sellCommentContent }</span>
										<input type="text" class="sellCommentInput"
										name="sellCommentContent" value="${scc.sellCommentContent }"
										style="display: none;"></li>
									<li style="width: 20%; text-align: center"><span>${scc.sellCommentDate }</span>
									</li>
									<li style="width: 80%; text-align: right">
									<%-- <a href="javascript:void(0)" class="sell_commentBtn"
										onclick="warningComment('${sc.sellCommentNo}','${sc.sellCommentWarning }')">신고</a> --%>
										<c:if
											test="${not empty sessionScope.member && sessionScope.member.memberId eq scc.sellCommentWriter }">
											<a href="javascript:void(0)" class="sell_commentBtn"
												onclick="modifyComment(this, '${scc.sellCommentNo}','${scc.sellRef }')">수정</a>
											<a href="javascript:void(0)" class="sell_commentBtn"
												onclick="deleteComment('${scc.sellCommentNo}','${scc.sellRef }')">삭제</a>
										</c:if></li>
								</ul>
							</c:if>
						</c:forEach>
					</c:forEach>
				</div>
			</fieldset>
		</div>
	</div>

	</section>
	<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
	<script>
		//대댓글달기
		 function insertComment(obj, sellCommentNo, sellNo, memberId) {
			$(obj).parent().hide();
			var $form = $("<form action='/sellCommentInsert' method='post'></form>");
			var $ul = $("<ul class='sellList'></ul>")
			$form.append($("<input type='hidden' name='sellCommentWriter' value='"+memberId+"'>"));
			$form.append($("<input type='hidden' name='sellRef' value='"+sellNo+"'>"));
			$form.append($("<input type='hidden' name='sellCommentLevel' value='2'>"));
			$form.append($("<input type='hidden' name='sellCommentRef' value='"+sellCommentNo+"'>"));
			var $li1 = $("<li style='width:5%'>└─</li>");
			var $li2 = $("<li style='width:75%'></li>");
			$li2.append($("<input type='text' name='sellCommentContent' class='form-control'>"));
			var $li3 = $("<li style='width:20%'></li>");
			$li3.append($("<button type='submit' class='btn btn-link btn-sm'>등록</button>"));
			$li3.append($("<button type='button' class='btn btn-link btn-sm' onclick='insertCancel(this)'>취소</button>"));
			$ul.append($li1).append($li2).append($li3);
			$form.append($ul);
			$(obj).parent().parent().after($form);

		} 
		 function insertCancel(obj){
				$(obj).parents('form').prev().children().show();
				$(obj).parents('form').remove();
			}
		 
		 function sellWarning(sellNo,memberId,sellRef){
			 location.href="/warning?PageNo="+sellNo+"&sellNo="+sellNo+"&sellRef="+sellRef+"&memberId="+memberId+"&warningType=3";
		 }
		 function sellCommentWarning(sellNo,sellRef,sellCommentNo,memberId){
		      location.href="/warning?PageNo="+sellCommentNo+"&sellNo="+sellNo+"&memberId="+memberId+"&sellRef="+sellRef+"&warningType=4";
		 }
		 
			function deleteComment(sellCommentNo, sellRef){
				location.href="/sellCommentDelete?sellCommentNo="+sellCommentNo+"&sellRef="+sellRef;
				//noticeCommentDeleteServlet 삭제하기 noticeRef로 돌아오기
			}
			function modifyComment(obj, sellCommentNo, sellRef){
				$(obj).prev().hide();
				$(obj).html('수정완료');
				$(obj).attr('onclick','modifyComplete(this,"'+sellCommentNo+'","'+sellRef+'")');
				$(obj).next().html('취소');
				$(obj).next().attr('onclick','modifyCancel(this,"'+sellCommentNo+'","'+sellRef+'")');
				$(obj).parent().parent().find('input').show();//input태그
				$(obj).parent().parent().find('input').prev().hide();//span태그
			}
			function modifyCancel(obj, sellCommentNo, sellRef){
				$(obj).prev().prev().show();
				$(obj).prev().html('수정');
				$(obj).prev().attr('onclick','modifyComment(this, "'+sellCommentNo+'","'+sellRef+'")');
				$(obj).html('삭제');
				$(obj).attr('onclick', 'deleteComment("'+sellCommentNo+'","'+sellRef+'")');
				$(obj).parent().parent().find('input').hide();
				$(obj).parent().parent().find('input').prev().show();
			}
			function modifyComplete(obj, sellCommentNo, sellRef){
				var $form = $("<form action='/sellCommentUpdate' method='post'></form>");
				$form.append($("<input type='text' name='sellCommentNo' value='"+sellCommentNo+"'>"));
				$form.append($("<input type='text' name='sellRef' value='"+sellRef+"'>"));
				$form.append($(obj).parent().parent().find('input'));
				$('body').append($form);
				$form.submit();
			}

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
		
		$(function(){
			$(".sell_count_select").change(function(){
				$(".sell_allprice").html($(this).val() * ${s.sellPrice});
			 });
		   });
		
		//타이머
		 var now = new Date();
		 var standD = now.getDate()+1;
		 var endTime = new Date('2020-05-23');
		         console.log(now.getDate());
		 var gapTime = endTime-now-32400000;
		 var SetTime =gapTime/1000;
		 var SetMin = SetTime/60;
		 var SetHour = SetMin/60;
		 function msg_time() {   // 1초씩 카운트
		    m = Math.floor(SetHour% 60) + ":"+Math.floor(SetMin % 60) + ":" + Math.floor(SetTime % 60);   // 남은 시간 계산
		    var msg = m;
		    document.all.sell_timer.innerHTML = msg;
		    SetTime--;      
		    if (SetTime < 0) {   
		       clearInterval(tid);
		    }
		 }
		 window.onload = function TimerStart(){ tid=setInterval('msg_time()',1000) };

	
		
	</script>
</body>
</html>