<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
   rel="stylesheet">

<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />

<script src="https://code.jquery.com/jquery-3.3.1.js"></script>

<style>
* {
   font-family: 'Jua', sans-serif;
}

/* .container{ */
/* width: 1200px; */
/* margin: 0 auto; */
/* } */
.wrapper {
   width: 1200px;
   margin: 0 auto;
}

.tab {
   width: 100%;
}

.main {
   overflow: hidden;
   width: 100%;
   margin-bottom: 100px;
}

.mine {
   width: 100%;
   margin: 20px 0px;
   display: flex;
}

.photo {
   width: 30%;
   height: 300px;
   display: flex;
   flex-direction: column;
   justify-content: center;
   align-items: center;
   position: relative;
}

#blah {
   position: absolute;
}

.info {
   width: 70%;
   line-height: 150px;
   height: 150px;
   padding-left: 30px;
}

ul {
   list-style: none;
   margin: 0;
   padding: 0;
}

.photo i {
   font-size: 150px;
   color: gray;
   margin-bottom: 15px;
}

.photo button, .photo label {
   text-align: center;
   width: 100px;
   line-height: 70px;
   height: 70px;
   font-size: 20px;
   border: none;
   color: white;
   border-radius: 20px;
   box-shadow: 3px 3px 3px gray;
}

.info-title {
   font-size: 40px;
   font-weight: bold;
   margin-bottom: 20px;
   display: flex;
   align-items: center;
}

.info-contents {
   display: flex;
}

.info-content {
   width: 20%;
}

.info-content>span {
   margin-left: 20px;
   color: rgb(92, 91, 91);
}

.modify-info, .manage-sell, .store-review {
   color: white;
   border: none;
   padding: 10px;
   width: 100px;
   height: 40px;
   border-radius: 10px;
   margin-left: 20px;
}

.intro {
   width: 90%;
}

.intro-text {
   width: 100%;
   padding: 10px;
   height: 120px;
   word-break: break-all;
   overflow: auto;
}

.modify-intro {
   background-color: rgb(202, 199, 199);
   border: none;
   border-radius: 10px;
   padding: 5px;
   color: gray;
}

.tab-li {
   width: 25%;
   font-size: 25px;
   float: left;
   box-sizing: border-box;
   border: 1px solid rgb(202, 201, 201);
   border-bottom: 1px solid black;
   height: 60px;
   color: rgb(202, 201, 201);
   line-height: 60px;
   text-align: center;
   transition-duration: 0.5s;
}

.tab ul>li:hover {
   box-shadow: 2px -2px 2px grey;
}

.content>div:first-child {
   padding-top: 50px;
   font-size: 30px;
   font-weight: bold;
   border-bottom: 1px solid rgb(190, 189, 189);
   margin-bottom: 30px;
}

.contents {
   width: 100%;
   clear: both;
}

.content {
   display: none;
   width: 100%;
}

.show-content {
   display: block;
}

.tab-selected {
   color: black;
   border: 1px solid black;
   border-bottom: none;
}

.content-menu {
   padding: 0px 10px;
   display: flex;
   justify-content: space-between;
   align-items: center;
   margin-bottom: 30px;
}

.order {
   display: flex;
}

.order>div {
   width: 100px;
   /* background-color: red; */
   border-right: 1px solid gray;
   text-align: center;
   cursor: pointer;
}

.order>div:last-child {
   border-right: none;
}

.allCheck {
   display: flex;
   align-items: center;
}

.allCheck>input {
   width: 30;
   height: 30;
}

.allCheck>button {
   width: 80px;
   height: 30px;
   border: none;
   background-color: rgb(112, 112, 112);
   border-radius: 10px;
   color: rgb(207, 207, 207);
   box-shadow: 2px 2px 2px rgb(201, 201, 201);
}

.list {
   width: 100%;
   margin-bottom: 30px;
}

.list>div {
   width: 99%;
   height: 250px;
   border: 1px solid rgb(209, 209, 209);
   display: flex;
   margin-bottom: 30px;
}

.p-image {
   width: 25%;
   height: 100%;
   background-color: burlywood;
}

.p-info {
   width: 65%;
   height: 100%;
   padding: 20px;
}

.p-title {
   margin-bottom: 20px;
   font-size: 30px;
   display: flex;
   justify-content: space-between;
}

.p-title>input {
   width: 30px;
   height: 30px;
}

.p-price {
   margin-bottom: 10px;
   font-size: 25px;
}

.p-day {
   color: gray;
   margin-bottom: 20px;
   padding-bottom: 10px;
   border-bottom: 1px solid rgb(209, 209, 209);
}

.p-location {
   height: 50px;
   color: gray;
   line-height: 50px;
}

.intro2>textarea {
   resize: none;
}

.info {
   position: relative;
}

.intro {
   position: absolute;
}

.intro2 {
   position: absolute;
   visibility: hidden;
   display: flex;
}

.modify_complete {
   width: 80px;
   background-color: gray;
   height: 180px;
   color: white;
   border: none;
}

.empty {
   clear: both;
   display: none;
   width: 100%;
   text-align: center;
   height: 300px;
   color: gray;
   font-size: 50px;
   line-height: 300px;
}

.buy-list {
   width: 100%;
}

.buy-item {
   float: left;
   width: 280px;
   height: 430px;
   margin-right: 15px;
   border: 1px solid rgb(199, 199, 199);
}

.buy-image {
   margin-bottom: 15px;
   width: 100%;
   height: 250px;
   background-color: green;
}

.buy-image>img {
   width: 100%;
   height: 100%;
}

.buy-name {
   font-size: 30px;
   font-weight: bold;
   margin-bottom: 20px;
   padding: 10px;
}

.buy-price {
   display: flex;
   justify-content: space-between;
   padding: 5px;
   font-size: 20px;
   border-bottom: 1px solid rgb(180, 180, 180);
}

.buy-price>span:last-child {
   color: rgb(155, 155, 155);
}

.buy-location {
   padding-left: 10px;
   color: rgb(155, 155, 155);
   height: 50px;
   display: flex;
   align-items: center;
}

.request {
   margin: 0 auto;
   width: 95%;
}

.request>textarea {
   width: 100%;
   height: 150px;
   resize: none;
   border: 1px solid rgb(180, 180, 180);
}

.textNum {
   width: 100%;
   line-height: 50px;
   height: 50px;
   display: flex;
   justify-content: space-between;
   background-color: rgb(245, 245, 245);
   border: 1px solid rgb(180, 180, 180);
   margin-bottom: 30px;
}

.textNum>span {
   margin-left: 40px;
   color: rgb(180, 180, 180);
}

.textNum>button {
   margin-right: 40px;
   width: 100px;
   color: white;
   font-size: 20px;
   background-color: #F6b70d;
   border: none;
   border-radius: 10px;
}

#inputArea {
   font-size: 20px;
}

.request>.result {
   width: 100%;
}

.comment {
   width: 100%;
   /* height: 100px; */
   border-bottom: 1px solid gray;
   display: flex;
   margin-bottom: 20px;
}

.comment-left {
   width: 10%;
   height: 100%;
   display: flex;
   align-items: center;
   justify-content: center;
}

.comment-left>i {
   text-align: center;
   padding-top: 20px;
   font-size: 50px;
}

.comment-right {
   width: 90%;
   padding: 0px 30px;
   word-break: break-all;

   /* background-color: blanchedalmond; */
}

.comment-right>.user-name {
   color: gray;
   font-size: 20px;
   margin-bottom: 5px;
   display: flex;
   justify-content: space-between;
}

.comment-right>.user-comment {
   font-size: 20px;
   margin-bottom: 30px;
}

.delete-comment {
   background-color: #F6b70d;
   border-radius: 50px;
   border: none;
   width: 30px;
   height: 30px;
   color: white;
}

.followers {
   width: 100%;
}

.follower-list {
   width: 90%;
   margin: 0 auto;
   display: flex;
   justify-content: space-between;
}

.follower {
   margin-bottom: 30px;
   width: 30%;
   height: 350px;
   border: 1px solid rgb(207, 207, 207);
   transition-duration: 0.5s;
   display: flex;
   flex-direction: column;
   text-align: center;
   justify-content: space-around;
}

.follower:hover {
   border: 1px solid #F6b70d;
   box-shadow: 15px 15px 20px rgb(179, 178, 178);
}

.follower>i:first-child {
   font-size: 100px;
}

.follower>.plus-btn {
   margin: 0 auto;
   width: 80%;
   height: 60px;
   line-height: 60px;
   background-color: #F6b70d;
}

.follower>.nick {
   font-size: 40px;
}

.main_font {
   color: #F6b70d;
}

.sub_font {
   color: #2c3650;
}

.main_bgColor {
   background-color: #F6b70d;
}

.sub_bgColor {
   background-color: #2c3650;
}

.grey1 {
   background-color: #4e5052;
}

.grey2 {
   background-color: #7d8084;
}

.grey3 {
   background-color: #d2d5db;
}
</style>

<script type="text/javascript">
   $(function() {
      $(".tab>ul>li").click(function() {
         $(".tab>ul>li").removeClass("tab-selected")
         $(this).addClass("tab-selected");
         var index = $(".tab>ul>li").index($(this));
         $(".content").removeClass("show-content");
         $(".content").eq(index).addClass("show-content")
      });

      $(".order>div").click(function() {
         $(".order>div").css("color", "");
         $(this).css("color", "#F6b70d");

      })
      $("#inputArea").keyup(function() {
         var inputLength = $(this).val().length;
         if (inputLength > 2000) {
            alert("입력가능 글자를 초과했습니다")
            return;
         }
         $(".textNum>span").html(inputLength + " / 2000");

      })

      $(".p-title>input").click(function(event) {
         event.stopPropagation();
      })

      $(".product").children().not(".p-info>.p-title>input").click(
            function() {
               console.log("test");
            })

      $("#imgInp").on('change', function() {
         changeImg(this);
      });

   })

   function reviewInsert(sellEndNo) {
      console.log("시작");
      var memberId = "${sessionScope.member.memberId}";
      var sellEndWriter = "${sessionScope.sellEnd.sellEndWriter}";
      var url = "/reviewInsertFrm";
      var title = "reviewInsertFrm";
      var status = "left=500px, top=100px, width=600px, height=550px, menubar=no, status=no, scrollbars=yes";
      var popup = window.open("", title, status);
      $("input[name=sellEndNo]").val(sellEndNo);
      $("input[name=memberId]").val(memberId);
      $("input[name=sellEndWriter]").val(sellEndWriter);
      $(".reviewInsertFrm").attr("action", url);
      $(".reviewInsertFrm").attr("method", "post");
      $(".reviewInsertFrm").attr("target", title);//새로 열린 popup창과 form태그를 연결
      $(".reviewInsertFrm").submit();
   }
</script>
</head>
<body>
   <jsp:include page="/WEB-INF/views/common/header.jsp" />

   <div class="container">
      <div class="wrapper">
         <div class="main">
            <div class="mine">
               <div class="info">
                  <div class="info-title">
                     <i class="fas fa-user" style="margin-right: 20px;"></i> <span>${sessionScope.member.memberName }
                        님 </span>
                  </div>
                  <div class="info-contents">
                     <div class="info-content"></div>
                  </div>

               </div>
            </div>
            <div class="tab">
               <ul class="tab-ul">
                  <li class="tab-li tab-selected">내 정보 수정</li>


                  <c:if test="${sessionScope.member.memberType eq 1 }">
                     <li class="tab-li">구매중 목록</li>
                     <li class="tab-li">구매 내역</li>
                  </c:if>
                  <c:if test="${sessionScope.member.memberType eq 2 }">
                     <li class="tab-li">판매중 목록</li>
                     <li class="tab-li">판매 내역</li>
                  </c:if>

                  <li class="tab-li">쪽지함</li>
               </ul>
            </div>
            <div class="contents">
               <div class="content show-content">
                  <div class="content-title">내정보 수정</div>
                  <div class="request"></div>
               </div>
               <div class="content">
                  <c:if test="${sessionScope.member.memberType eq 1 }">
                     <div class="content-title">구매중 목록</div>
                  </c:if>

                  <c:if test="${sessionScope.member.memberType eq 2 }">
                     <div class="content-title">판매중 목록</div>
                  </c:if>
                  <div class="content-menu">
                     
                  </div>
                  <div class="list">
                     <c:forEach items="${list }" var="l">
                        <div class="product">
                           <div class="p-image">
                              <img src="/imgs/logo1.png" width="100%" height="100%" alt=""
                                 srcset="">
                           </div>
                           <div class="p-info">
                              <div class="p-title">
                                 <span>${l.sellTitle}</span> 
                                 <button onclick="" type="button">상세보기</button>
                              </div>
                              <div class="p-price">
                              <fmt:formatNumber value="${l.sellPrice}"
                                             pattern="###,###,###,###" />원
                              </div>
                              <div class="p-day">${l.sellWriter }</div>
                              <div class="p-location">
                                 구매중 수량 :  ${l.sellCount }/${l.sellMax }
                              </div>
                           </div>
                        </div>
                     </c:forEach>
                  </div>
               </div>
               <div class="content">
                  <c:if test="${sessionScope.member.memberType eq 1 }">
                     <div class="content-title">구매 내역</div>
                  </c:if>

                  <c:if test="${sessionScope.member.memberType eq 2 }">
                     <div class="content-title">판매 내역</div>
                  </c:if>
                  <div class="content-menu"></div>
                  <div class="list">
                     <c:forEach items="${endList }" var="e">
                        <form class="reviewInsertFrm">
                           <input name="sellEndNo" type="hidden"> <input
                              name="memberId" type="hidden"> <input
                              name="sellEndWriter" type="hidden" value="${e.sellEndWriter}">
                        </form>
                        <div class="product">
                           <div class="p-image">
                              <img src="" width="100%" height="100%" alt="" srcset="">
                           </div>
                           <div class="p-info">
                              <div class="p-title">
                                 <span>${e.sellEndTitle } </span>
                                 <c:if test="${sessionScope.member.memberType eq 1}">
                                 <button onclick="reviewInsert('${e.sellEndNo}')"
                                    type="button">리뷰작성</button>
                                 </c:if>
                              </div>
                              <div class="p-price">55,000원</div>
                              <div class="p-day">4시간전</div>
                              <div class="p-location">
                                 <i class="fas fa-map-marker-alt"></i> 대전광역시 대덕구 송촌동
                              </div>
                           </div>
                        </div>
                     </c:forEach>
                  </div>
               </div>

               <div class="content">
                  <div class="content-title">쪽지함</div>
                  
                  
               </div>
            </div>
         </div>
      </div>

   </div>

   <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>
</html>