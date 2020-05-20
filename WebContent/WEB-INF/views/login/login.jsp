<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script>
$(function() {
    var regId = /^[A-Za-z0-9]{5,12}/;
    var regPw = /^[a-z0-9_-]{3,16}$/;



    $("#id").focusout(function() {
        if ($("#id").val() == "") {
            $("#id_result").html("아이디를 입력해주세요");
             $("#id_result").css("color","red ");
            $("#id_result").css("text-align","center");
        }
    })
    $("#pw").focusout(function() {
        if ($("#pw").val() == "") {
            $("#pw_result").html("비밀번호를 입력해주세요")
            $("#pw_result").css("color","red");
            $("#pw_result").css("text-align","center");
        }
    })


})
</script>
<style>
.submit:hover{
   background-color: #4a2100; 
    font-family: "Jua", sans-serif;
    color: white;


}
body {

    font-family: 'Jua', 'sans-serif';
}

.main {
    background-color: #FFFFFF;
    width: 400px;
    height: 500px;
    margin: 7em auto;
    border-radius: 1.5em;
    box-shadow: 0px 11px 35px 2px rgba(0, 0, 0, 0.14);
}

.sign {
    padding-top: 40px;
    color: #4a2100 ;
    font-family: "Jua", sans-serif;
    font-weight: bold;
    font-size: 23px;
}

.id {
    width: 76%;
    color: rgb(38, 50, 56);
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    background: rgba(136, 126, 126, 0.04);
    padding: 10px 20px;
    border: none;
    border-radius: 20px;
    outline: none;
    box-sizing: border-box;
    border: 2px solid rgba(0, 0, 0, 0.02);
    margin-bottom: 50px;
    margin-left: 46px;
    text-align: center;
    margin-bottom: 27px;
    font-family: "Jua", sans-serif;
}

form.form1 {
    padding-top: 40px;
}

.pass {
    width: 76%;
    color: rgb(38, 50, 56);
    font-weight: 700;
    font-size: 14px;
    letter-spacing: 1px;
    background: rgba(136, 126, 126, 0.04);
    padding: 10px 20px;
    border: none;
    border-radius: 20px;
    outline: none;
    box-sizing: border-box;
    border: 2px solid rgba(0, 0, 0, 0.02);
    margin-bottom: 50px;
    margin-left: 46px;
    text-align: center;
    margin-bottom: 27px;
   font-family: "Jua", sans-serif;
}


.un:focus,
.pass:focus {
    border: 2px solid rgba(0, 0, 0, 0.18) !important;

}

.submit {
    cursor: pointer;
    border-radius: 5em;
    color: #4a2100;
    width: 300px;
    border: 0;
    background-color:#ffac05;
   margin-left: 50px;
    padding-bottom: 10px;
    padding-top: 10px;
    font-family: 'jua', sans-serif;
    margin-left: 0 auto;
    font-size: 13px;
    box-shadow: 0 0 20px 1px rgba(0, 0, 0, 0.04);
}
::placeholder{
    
        opacity: 0.4; 
}
.forgot {
    text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
    color: #E1BEE7;
    padding-top: 15px;
}

 a {
        text-shadow: 0px 0px 3px rgba(117, 117, 117, 0.12);
        color: #4a2100 ;
        opacity: 0.5;
        text-decoration: none
    }
    a:hover{
        color:  #ffac05  ;
    }

@media (max-width: 600px) {
    .main {
        border-radius: 0px;
    }
</style>

<body>
        <div class="main">
        <p class="sign" align="center" >라스트 팜</p>
        <form class="form1" method="post" action="/login">
            <input class="id " type="text" id="id" align="center" placeholder="아이디 입력하세요" name="id">
            <br>
            <div id="id_result"></div>
            <input class="pass" type="password" id="pw" align="center" placeholder="비밀번호 입력하세요" name="pw">
            <br>
            <div id="pw_result"></div>
            <br>
            <input type="submit" class="submit" id="submit" align="center" value="로그인">
            <p class="forgot" align="center">
                <br>
                <br>
                <a href="/agree">회원가입</a> |
                <a href="/searchFrm">아이디찾기/비번찾기</a> 
                
            </p>
        </form>

    </div>

    </div>




</html>