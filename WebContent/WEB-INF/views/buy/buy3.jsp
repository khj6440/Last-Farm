<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문완료</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<style>
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
        .buy_content2{
            width: 90%;
            height: 1000px;
            border-left: 1px solid gray;
            border-right: 1px solid gray;
            margin: 0 auto;
        }
        .buy_content2_sub{
            width: 100%;
            height: 200px;
            text-align: center;
            line-height: 8;
            font-size: 20px;
        }
        .buy_content2_sub2{
            width: 100%;
            height: 500px;
        }
        .buy_content2_sub2_1{
            background-color: lightgray;
            margin: 0 auto;
            width: 80%;
            height: 100%;
        }
        .buy_content11{
            border-bottom: 3px solid black;
            width: 100%;
            height: 20%;
            text-align: center;
            line-height: 5;
        }
        .buy_h3{
            margin: 0;
        }
        .buy_content_table{
            text-align: center;
            width: 80%;
            height: 50%;
            margin: 0 auto;
            margin-top: 20px;
            border-collapse: collapse;
        }
        .buy_content_table_tr{
            border-bottom: 1px solid gray;
        }
        .buy_content_table td{
            text-align: center;
        }
        .buy_content12{
            margin-top: 50px;
            width: 100%;
            height: 80px;
            text-align: center;
            line-height: 5;
            background-color: white;
        }
         .buy_table_btn,
        .buy_table_btn2 {
            width: 120px;
            height: 50px;
        }

        .buy_table_btn {
            margin-right: 50px;
            
        }

        .buy_table_btn:hover {
            background-color: darkgray;
            font-weight: bold;
            cursor: pointer;
        }
        .buy_table_btn2:hover {
            background-color: darkgray;
            font-weight: bold;
            cursor: pointer;
        }
</style>
</head>
<body>
	<section class="buy_container">
        <form action="/buy2Frm" method="post" class="buy">
            <div class="buy_head">
                <div class="buy_head1">
                    <p class="buy_p">주문완료</p>
                </div>

                <div class="buy_head2">
                    <div class="buy_head2_sub">
                        <img src="img/1.png" class="buy_himg"> 약관동의 > <img src="img/2.png" class="buy_himg"> 주문결제 > <img src="img/3g.png" class="buy_himg"> 주문완료
                    </div>
                </div>
            </div>
            <div class="buy_content">
                <div class="buy_content_sub">
                    <div class="buy_content2">
                        <div class="buy_content2_sub">
                            <h3>주문이 완료 되었습니다.</h3>
                        </div>
                        <div class="buy_content2_sub2">
                            <div class="buy_content2_sub2_1">
                                <div class="buy_content11">
                                    <h3 class="buy_h3">
                                        고객님이 주문하신 주문 번호는 ${r1 } 입니다.
                                    </h3>
                                </div>
                                <table class="buy_content_table">
                                    <tr class="buy_content_table_tr">
                                        <th>상품명</th>
                                        <td>${s.sellName }</td>
                                    </tr>
                                    <tr class="buy_content_table_tr">
                                        <th>총 결제 수량</th>
                                        <td>${type } 개</td>
                                    </tr>
                                    <tr class="buy_content_table_tr">
                                        <th>총 결제 금액</th>
                                        <td>${r2 } 원</td>
                                    </tr>
                                </table>
                                <div class="buy_content12">
                                <button class="buy_table_btn">주문확인</button>
                                <button class="buy_table_btn2" onclick="location.href='/index.jsp'">메인으로</button>
                                    </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
            </div>
        </form>
    </section>
</body>
</html>