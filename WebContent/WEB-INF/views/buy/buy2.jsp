<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문결제</title>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
	<style>
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
        }

        .buy_btn {
            margin-right: 50px;
            
        }

        .buy_btn:hover {
            background-color: darkgray;
            font-weight: bold;
            cursor: pointer;
        }
        .buy_btn2:hover {
            background-color: darkgray;
            font-weight: bold;
            cursor: pointer;
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
	<%-- <jsp:include page="/WEB-INF/views/common/header.jsp"/> --%>
	<section class="buy_container">
        <form action="/buy3Frm" method="post" class="buy">
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
                            
                            </div>
                        </div>
                        <div class="buy_content_sub2_2">
                            <div class="buy_content_sub2_1_1">
                                <h4 class="buy_h4">수량</h4>
                            </div>
                            <div
                            class="buy_content_sub2_1_2">
                            
                            </div>
                        </div>
                        <div class="buy_content_sub2_3">
                            <div class="buy_content_sub2_1_1">
                                <h4 class="buy_h4">상품금액</h4>
                            </div>
                            <div
                            class="buy_content_sub2_1_2">
                            
                            </div>
                        </div>
                        <div class="buy_content_sub2_4">
                        <div class="buy_content_sub2_1_1">
                                <h4 class="buy_h4">배송비</h4>
                            </div>
                            <div
                            class="buy_content_sub2_1_2">
                            
                            </div></div>
                    </div>
                    <div class="buy_content2_sub">
                        <h3 class="buy_h3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;주문자 정보 입력</h3>
                        <div class="buy_inf_div">
                            <table class="buy_inf">
                                <tr>
                                    <th>주문자 이름</th>
                                    <td><input type="text" name="name" class="name" readonly></td>
                                </tr>
                                <tr>
                                    <th rowspan="3">주소</th>
                                    <td><input type="text" name="addr" id="postCode" class="addr" placeholder="우편번호" readonly></td>
                                </tr>
                                <tr>
                                    <td><input type="text" name="addr" id="roadAddr" class="addr" placeholder="도로명주소" readonly></td>
                                </tr>
                                <tr>
                                    <td><input type="text" name="addr" id="detailAddr" class="addr" placeholder="상세주소" ></td>
                                </tr>
                                <tr>
                                    <th>휴대전화</th>
                                    <td><input type="text" name="tel" class="tel" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td><input type="text" name="email" class="email"  readonly></td>
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
                                    <td class="buy_td"><button type="button" id="sameBtn" onclick="addrSameBtn();">주문자 정보와 동일</button>
                                    </td>
                                </tr>
                                <tr>
                                    <th>주문자 이름</th>
                                    <td><input type="text" name="name" class="name" ></td>
                                </tr>
                                <tr>
                                    <th rowspan="3">주소</th>
                                    <td><input type="text" name="addr" id="postCode" class="addr" placeholder="우편번호" readonly>
                                        <button type="button" id="addrSearchBtn" onclick="addrSearch();" class="addrBtn">주소검색</button>
                                    </td>

                                </tr>
                                <tr>
                                    <td><input type="text" name="addr" id="roadAddr" class="addr" placeholder="도로명주소" readonly></td>
                                </tr>
                                <tr>
                                    <td><input type="text" name="addr" id="detailAddr" class="addr" placeholder="상세주소"></td>
                                </tr>
                                <tr>
                                    <th>휴대전화</th>
                                    <td><input type="text" name="tel" class="tel" placeholder="ex) 010-0000-0000">
                                    </td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td><input type="text" name="email" class="email" placeholder="ex) test123@naver.com"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="buy_content4_sub">
                        <h2>총 결제 금액 : </h2>
                        <button type="submit" class="buy_btn">결제하기</button>
                        <button type="button" class="buy_btn2">취소하기</button>
                    </div>
                </div>
            </div>
        </form>
    </section>
    <%-- <jsp:include page="/WEB-INF/views/common/footer.jsp"/> --%>
</body>
</html>