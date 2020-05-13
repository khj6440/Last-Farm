<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제완료</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
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
            border: 1px solid black;
            margin: 0 auto;
        }
        .buy_content2_sub{
            width: 100%;
            height: 200px;
            border: 1px solid red;
            text-align: center;
            line-height: 6;
            font-size: 20px;
        }
        .buy_content2_sub2{
            width: 100%;
            height: 500px;
            border: 1px solid red;
        }
        .buy_content2_sub2_1{
            border: 1px solid black;
            margin: 0 auto;
            width: 80%;
            height: 100%;
        }
        .buy_content11{
            border-bottom: 3px solid black;
            width: 100%;
            height: 20%;
        }
</style>
</head>
<body>
	<section class="buy_container">
        <form action="/buy2Frm" method="post" class="buy">
            <div class="buy_head">
                <div class="buy_head1">
                    <p class="buy_p">주문결제</p>
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
                                    <h3>고객님이 주문하신 주문 번호는 123456789입니다.</h3>
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