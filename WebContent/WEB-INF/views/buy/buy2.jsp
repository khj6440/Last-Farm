<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문결제</title>
<script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
	<script src = "http://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
   rel="stylesheet">
<style>
* {
   font-family: 'Jua', sans-serif;
}
		.buy {
            width: 1280px;
            height: 1800px;
            margin: 0 auto;
            overflow: hidden;
        }

        .buy_head {
            margin: 0 auto;
            line-height: 350px;
            width: 90%;
            height: 250px;
            box-sizing: content-box;
            border-bottom: 5px solid black;
        }

        .buy_p {
            font-size: 2.5em;
            margin-left: 20px;
            font-weight: bold;
        }

        .buy_head1 {
            float: left;
            box-sizing: border-box;
            width: 60%;
            height: 250px;
        }

        .buy_head2 {
            float: left;
            box-sizing: border-box;
            width: 40%;
            height: 250px;
        }

        .buy_head2_sub {
            float: right;
            margin-top: 50px;
            margin-right: 10px;
        }

        .buy_himg {
            width: 30px;
            height: 30px;
        }

        .buy_content {
            width: 100%;
            height: 1400px;
        }

        .buy_content_sub {
            padding-top: 70px;
            width: 90%;
            height: 1200px;
            margin: 0 auto;
           
        }

        .buy_content_sub2 {
            box-sizing: content-box;
            border: 1px solid black;
            text-align: center;
            width: 90%;
            height: 150px;
            margin: 0 auto;
            overflow: hidden;
        }
        .buy_content_sub2_1{
            box-sizing: border-box;
            width: 25%;
            height: 150px;
            float: left;
            border-right: 1px solid gray;
        }
        .buy_content_sub2_1_1{
            box-sizing: border-box;
            width: 100%;
            height: 75px;
            line-height: 3;
            border-bottom: 1px solid gray; 
            
        }
        .buy_h4{
            margin: 0;
            line-height: 4.5;
        }
        .buy_content_sub2_1_2{
        	line-height : 4;
            box-sizing: border-box;
            width: 100%;
            height: 75px;
            
        }
        .buy_content_sub2_2{
            box-sizing: border-box;
            width: 25%;
            height: 150px;
            float: left;
            border-right: 1px solid gray;
        }
        .buy_content_sub2_3{
            box-sizing: border-box;
            width: 25%;
            height: 150px;
            float: left;
            border-right: 1px solid gray;
        }
        .buy_content_sub2_4{
            box-sizing: border-box;
            width: 25%;
            height: 150px;
            float: left;
        }

        .buy_content2_sub {
            margin-top: 10px;
            width: 100%;
        }

        .buy_h3 {
            margin-top: 50px;
            margin-bottom: 0;
        }
        .buy_inf_div{
            border: 1px solid black;
            width: 90%;
            margin: 0 auto;
        }
        .buy_inf {
            width: 100%;
            height: 250px;
            
        }
        .buy_th, .buy_td{
            background-color: lightgray;
        }
        #sameBtn{
            background-color: white;
            margin-left: 5px;
            border-radius: 5px;
            width:200px;
            height: 30px;
            font-weight: bold;
        }
        .buy_inf th {
            width: 20%;
            height: 50px;

        }

        .buy_content3_sub {
            width: 100%;
        }

        .buy_content3_sub th {
            width: 20%;
            height: 50px;
        }

        .buy_content4_sub {
            margin-top: 50px;
            width: 100%;
            height: 200px;
            text-align: center;

        }

        .buy_btn,
        .buy_btn2 {
            width: 120px;
            height: 50px;
            background-color : #ffac05;
			color : #4a2100;
        }

        .buy_btn {
            margin-right: 50px;
            
        }

        .buy_btn:hover {
            background-color: darkgray;
            font-weight: bold;
            cursor: pointer;
            background-color : #4a2100;
	color : #ffac05;
        }
        .buy_btn2:hover {
            background-color: darkgray;
            font-weight: bold;
            cursor: pointer;
            background-color : #4a2100;
	color : #ffac05;
        }
        input{
            height: 30px;
        }
        input[class=name] {
            width: 100px;
        }

        input[class=addr] {
            width: 100px;
        }

        input[id=roadAddr] {
            width: 350px;
        }

        input[id=detailAddr] {
            width: 350px;
        }

        input[class=tel] {
            width: 250px;
        }

        input[class=email] {
            width: 300px;
        }
	</style>
</head>
<body>
	 <jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<section class="buy_container">
        <form action="/buy3Frm" method="post" class="buy">
        	<input type="hidden" name="sell_no" value="${sellNo }">
			<input type="hidden" name="type" value="${type }">
			<input type="hidden" name="memberId" value="${sessionScope.member.memberId }">
			<input type="hidden" name="sellCount" value="${sellCount }">
			<input type="hidden" name="sell_max" value="${sellMax }">
            <div class="buy_head">
                <div class="buy_head1">
                    <p class="buy_p">주문결제</p>
                </div>

                <div class="buy_head2">
                    <div class="buy_head2_sub">
                        <img src="img/1.png" class="buy_himg"> 약관동의 > <img src="img/2g.png" class="buy_himg"> 주문결제 > <img src="img/3.png" class="buy_himg"> 주문완료
                    </div>
                </div>
            </div>
            <div class="buy_content">
                <div class="buy_content_sub">
                    <div class="buy_content_sub2">
                        <div class="buy_content_sub2_1">
                            <div class="buy_content_sub2_1_1">
                                <h4 class="buy_h4">판매자 상품 정보</h4>
                            </div>
                            <div
                            class="buy_content_sub2_1_2">
                            ${sellName}
                            </div>
                        </div>
                        <div class="buy_content_sub2_2">
                            <div class="buy_content_sub2_1_1">
                                <h4 class="buy_h4">수량</h4>
                            </div>
                            <div
                            class="buy_content_sub2_1_2">
                            ${type }
                            </div>
                        </div>
                        <div class="buy_content_sub2_3">
                            <div class="buy_content_sub2_1_1">
                                <h4 class="buy_h4">상품금액</h4>
                            </div>
                            <div
                            class="buy_content_sub2_1_2">
                            ${sellPrice }
                            </div>
                        </div>
                        <div class="buy_content_sub2_4">
                        <div class="buy_content_sub2_1_1">
                                <h4 class="buy_h4">배송비</h4>
                            </div>
                            <div
                            class="buy_content_sub2_1_2">
                            ${deliveryFee }
                            </div></div>
                    </div>
                    <div class="buy_content2_sub">
                        <h3 class="buy_h3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주문자 정보 입력</h3>
                        <div class="buy_inf_div">
                            <table class="buy_inf">
                                <tr>
                                    <th>주문자 이름</th>
                                    <td>
                                    <input type="text" name="name" class="name" value="${sessionScope.member.memberName }" readonly></td>
                                </tr>
                                <tr>
                                    <th rowspan="3">주소</th>
                                    <td> 
                                    <input type="text" name="addr" id="postCode" class="addr" value="${sessionScope.member.memberPostCode }" placeholder="우편번호" readonly></td>
                                    
                                </tr>
                                <tr>
                                    <td><input type="text" name="addr" id="roadAddr" class="addr" value="${sessionScope.member.memberRoadAddr }" placeholder="도로명주소" readonly></td>
                                </tr>
                                <tr>
                                    <td><input type="text" name="addr" id="detailAddr" class="addr" value="${sessionScope.member.memberDetailAddr }"placeholder="상세주소" ></td>
                                </tr>
                                <tr>
                                    <th>휴대전화</th>
                                    <td><input type="text" name="tel" class="tel" value="${sessionScope.member.memberPhone }"readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td><input type="text" name="email" class="email" value="${sessionScope.member.memberEmail }" readonly></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="buy_content3_sub">
                        <h3 class="buy_h3"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            	배송지 정보 입력</h3>
                        <div class="buy_inf_div">
                            <table class="buy_inf">
                                <tr>
                                    <th class="buy_th">배송지 선택</th>
                                    <td class="buy_td"><button type="button" id="sameBtn" onclick="SameBtn();">주문자 정보와 동일</button>
                                    </td>
                                </tr>
                                <tr>
                                    <th>주문자 이름</th>
                                    <td><input type="text" name="name2" class="name2" ></td>
                                </tr>
                                <tr>
                                    <th rowspan="3">주소</th>
                                    <td><input type="text" name="postCode2" id="postCode2" class="addr2" placeholder="우편번호" readonly>
                                        <button type="button" id="addrSearchBtn" onclick="addrSearch();" class="addrBtn">주소검색</button>
                                    </td>
									<td></td>
                                    <td > **당일배달 가능한 지역 : <span class="dAddr" style="color : red;">${sellRegionalAddr }</span></td>
                                </tr>
                                <tr>
                                    <td><input type="text" name="roadAddr2" id="roadAddr2" class="addr3" placeholder="도로명주소">
                                    	<button type="button" id="checkAddr" class="checkAddr">주소확인</button>
                                    </td>
                                </tr>
                                <tr>
                                    <td><input type="text" name="detailAddr2" id="detailAddr2" class="addr4" placeholder="상세주소"></td>
                                </tr>
                                <tr>
                                    <th>휴대전화</th>
                                    <td><input type="text" name="tel2" class="tel2" placeholder="ex) 010-0000-0000">
                                    </td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td><input type="text" name="email2" class="email2" placeholder="ex) test123@naver.com"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="buy_content4_sub">
                        <h2>총 결제 금액 : ${sellPrice + deliveryFee} 원</h2>
                        <button type="button" class="buy_btn">결제하기</button>
                        <button type="button" class="buy_btn2" onclick="location.href='/sellView?sell_no=${sellNo}'">취소하기</button>
                        
                    </div>
                </div>
            </div>
        </form>
    </section>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
    <script>
    	var count = 0;
    	
    	function addrSearch(){
    		new daum.Postcode({
    			oncomplete:function(data){
    				document.getElementById("postCode").value=data.zonecode;
    				$("#postCode2").val(data.zonecode);
    				$("#roadAddr2").val(data.roadAddress);
    			}
    		}).open();
    	};
    	
    	function SameBtn(){
    		$('.name2').val('${sessionScope.member.memberName}');
    		$('.tel2').val('${sessionScope.member.memberPhone}');
    		$('.email2').val('${sessionScope.member.memberEmail}');
    		$('.addr2').val('${sessionScope.member.memberPostCode }');
    		$('.addr3').val('${sessionScope.member.memberRoadAddr }');
    		$('.addr4').val('${sessionScope.member.memberDetailAddr }');
    		
    	};
    		$(".checkAddr").click(function(){
    			
    		var string = '${sellRegionalAddr}';
    		console.log(string);
    		var stArray = string.split(',');
    		console.log(stArray)
    		var addr1 = stArray[0];
    		var addr2 = stArray[1];
    		var addr3 = stArray[2];
    		
    		alert($(".addr3").val());
    		if($(".addr3").val().indexOf(addr1)!= -1 || $(".addr3").val().indexOf(addr2)!= -1 || $(".addr3").val().indexOf(addr3)!= -1){ 
    			alert("당일 배달 가능 지역과 일치합니다.");
    			count = 1;
    		 }else{
    			alert("당일 배달 가능 지역과 일치하지 않습니다.");
    		} 
    		
    		});
    			
    		
    	
    	$(".buy_btn").click(function(){
    		if(count==1){
    			
    		
    		var price = ${sellPrice + deliveryFee};
    			
    		var d = new Date();
    		var date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""+d.getHours()+""+d.getMinutes()+""+d.getSeconds();
    		IMP.init("imp79336132");
    		IMP.request_pay({
    			merchant_uid : '상품명_' +date,
    			name : '결제',
    			amount : price,
    			buyer_email : $('.email2').val(),
    			buyer_name : $('.name2').val(),
    			buyer_tel : $('.tel2').val(),
    			buyer_addr : $('.addr3').val(),
    			buyer_postcode :$('.addr2').val()
    			
    	},function(rsp){
    		if(rsp.success){
    			var r1 = rsp.imp_uid; //고유 Id
    			var r2 = rsp.merchant_uid; //상점 거래 아이디
    			var r3 = rsp.paid_amount; // 결제 금액
    			var r4 = rsp.apply_num;// 카드 승인번호 
    			var $div = $("<div></div>");
    			$div.append($("<input type='hidden' name='imp_uid' value='"+r1+"'>"));
    			$div.append($("<input type='hidden' name='merchant_uid' value='"+r2+"'>"));
    			$div.append($("<input type='hidden' name='paid_amount' value='"+r3+"'>"));
    			$div.append($("<input type='hidden' name='apply_num' value='"+r4+"'>"));
    			$(".buy").append($div);
    			$(".buy").submit();
    		}else{
    			//결제 실패했을때
    			alert("결제에 실패했습니다.");
    			
    		}
    	});
    	}else{
    		alert("배달 주소확인 후 결제 가능합니다.");
    	}
    			
    	});
    	
    	/*   var now = new Date();
    	  var standD = now.getDate()+1;
    	  var endTime = new Date('2020-05-22');
    	          console.log(now.getDate());
    	  var gapTime = endTime-now-32400000;
    	  var SetTime =gapTime/1000;
    	  var SetMin = SetTime/60;
    	  var SetHour = SetMin/60;
    	  function msg_time() {   // 1초씩 카운트
    	     m = Math.floor(SetHour% 60) + ":"+Math.floor(SetMin % 60) + ":" + Math.floor(SetTime % 60);   // 남은 시간 계산
    	     var msg = m;
    	     document.all.ViewTimer.innerHTML = msg;
    	     SetTime--;      
    	     if (SetTime < 0) {   
    	        clearInterval(tid);
    	     }
    	  }
    	  window.onload = function TimerStart(){ tid=setInterval('msg_time()',1000) };
 */
    </script>
</body>
</html>