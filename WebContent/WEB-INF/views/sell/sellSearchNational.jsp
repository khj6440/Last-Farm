<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공동구매 리스트(전국)</title>
<script type="text/javascript"
   src="http://code.jquery.com/jquery-3.3.1.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
   rel="stylesheet">
<link rel="stylesheet" href="/css/header/header.css?after">
<link rel="stylesheet" href="/css/header/footer.css?after">
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    -->
<style>
/*상품 서치탭의 CSS*/
.sell-list-body {
   font-family: 'Jua', sans-serif;
   width: 1280px;
   margin: 0 auto;
   margin-top: 30px;
}

.searchbox-wrapper {
   background-color: #f4f4f4;
   width: 100%;
   height: 150px;
   margin: 0 auto;
}

.category {
   height: 60px;
   width: 15%;
   font-size: 135%;
   margin-right: 20px;
   margin-top: 45px;
   float: left;
   border: 1px solid gray;
   font-family: 'Jua', sans-serif;
}

.category1 {
   margin-left: 43px;
}

.searchTypingBox {
   height: 60px;
   width: 350px;
   font-size: 120%;
   margin: 0 auto;
   padding: 0;
}

.searchInput-wrapper {
   width: 60%;
   display: inline-block;
   margin: 0 auto;
   height: 60px;
   margin-top: 45px;
   float: left;
}

.searchBtn {
   height: 60px;
   width: 150px;
   font-size: 1.5em;
   float: right;
   margin-left: 20px;
   background-color: #ffac05;
   color: #4a2100;
   border-style: none;
   border: 1px solid gray;
   outline: none;
   font-family: 'Jua', sans-serif;
   border-radius: 3px;
   box-shadow: 1px 1px 1px darkgray;
}

.searchBtn:hover {
   background-color: #4a2100;
   color: #ffac05;
}

.searchTypingBox {
   height: 90%;
   width: 400px;
   font-size: 1.5em;
   margin: 0 auto;
   border: none;
   float: left;
   margin-top: 2px;
   font-family: 'Jua', sans-serif;
}

.searchInput-wrapper img {
   height: 100%;
   width: 60px;
   margin: 0 auto;
   display: inline-block;
   float: left;
}

.searchInputBox {
   border: 1px solid gray;
   height: 60px;
   width: 590px;
   display: inline-block;
   background-color: white;
   float: left;
}

.shoppingList-wrapper {
   margin: 0 auto;
   height: 2000px;
   margin-top: 50px;
}
/* 마감시간, 구매, 등록순 조회 탭 CSS */
.ordertabCategory>ul {
   list-style: none;
   padding: 0;
   margin: 0 auto;
}

.ordertabCategory>ul>li {
   display: block;
   height: 60px;
   width: 33.1%;
   text-align: center;
   font-size: 30px;
   padding-top: 20px;
   cursor: pointer;
   float: left;
}

.ordertabCategory>ul {
   list-style: none;
   padding: 0;
   margin: 0 auto;
}

.ordertabCategory>ul>li {
   display: block;
   height: 60px;
   width: 33.1%;
   text-align: center;
   font-size: 30px;
   padding-top: 20px;
   cursor: pointer;
   float: left;
}

.clicktab {
   border-top: 1px solid gray;
   border-left: 1px solid gray;
   border-right: 1px solid gray;
}

.unclicktab {
   border-bottom: 1px solid gray;
}
/*상품 카테고리 부분의 CSS*/
.shoppingList-wrapper>table tr>th {
   height: 500px;
   width: 400px;
   padding: 0px;
   padding-left: 17px;
}

.productImg img {
   border: 1px solid gray;
   height: 400px;
   width: 100%;
   z-index: 1;
   position: relative;
   overflow: hidden;
}

.timeBox {
   color: white;
   height: 40px;
   line-height: 40px;
   width: 140px;
   border-radius: 8px;
   font-size: 1.2em;
   float: left;
   z-index: 2;
   position: absolute;
   background-color: #534847;
   margin-top: 350px;
   margin-left: 10px;
}

.productBox>p {
   margin: 7px;
   font-size: 1.2em;
}

.productBox {
   font-size: 1.3em;
}

.detailInfoBox {
   text-align: left;
   margin-left: 30px;
   margin-bottom: 30px;
}

#pageNavi {
   font-size: 30px;
   text-align: center;
   width: 1000px;
   margin: 0 auto;
   margin-top: 80px;
}
</style>
</head>
<body>
   <script>
      //로그인한 아이디가 판매자이면 검색 대신 새글 쓰기 버튼
      $(function() {
         $("#newSellForm").click(function() {
            location.href = "/sellForm";
         });
      });
      //검색창에 검색어 입력 시, 아웃라인 제거
      $(function() {
         $(".searchTypingBox").focusin(function() {
            $(".searchTypingBox").css("outline", "none");
         });
      });
      //마감시간, 구매인기, 등록순 정렬 탭 활성화
      $(function() {
         var sortingTab;
         $(".ordertabCategory")
               .children("ul")
               .children("li")
               .eq(0)
               .click(
                     function() {
                        $(".ordertabCategory").children("ul").children(
                              "li").eq(0).addClass("clicktab");
                        $(".ordertabCategory").children("ul").children(
                              "li").eq(0).removeClass("unclicktab");
                        $(".ordertabCategory").children("ul").children(
                              "li").eq(1).addClass("unclicktab");
                        $(".ordertabCategory").children("ul").children(
                              "li").eq(1).removeClass("clicktab");
                        $(".ordertabCategory").children("ul").children(
                              "li").eq(2).addClass("unclicktab");
                        $(".ordertabCategory").children("ul").children(
                              "li").eq(2).removeClass("clicktab");
                        sortingTab = $(".clicktab").html();
                        location.href = "/sellSearchNationalFrm?reqPage=1&sortingTab="
                              + sortingTab;
                     });

         $(".ordertabCategory")
               .children("ul")
               .children("li")
               .eq(1)
               .click(
                     function() {
                        $(".ordertabCategory").children("ul").children(
                              "li").eq(0).addClass("unclicktab");
                        $(".ordertabCategory").children("ul").children(
                              "li").eq(0).removeClass("clicktab");
                        $(".ordertabCategory").children("ul").children(
                              "li").eq(1).addClass("clicktab");
                        $(".ordertabCategory").children("ul").children(
                              "li").eq(1).removeClass("unclicktab");
                        $(".ordertabCategory").children("ul").children(
                              "li").eq(2).addClass("unclicktab");
                        $(".ordertabCategory").children("ul").children(
                              "li").eq(2).removeClass("clicktab");
                        sortingTab = $(".clicktab").html();
                        location.href = "/sellSearchNationalFrm?reqPage=1&sortingTab="
                              + sortingTab;
                     });
         $(".ordertabCategory")
               .children("ul")
               .children("li")
               .eq(2)
               .click(
                     function() {
                        $(".ordertabCategory").children("ul").children(
                              "li").eq(0).addClass("unclicktab");
                        $(".ordertabCategory").children("ul").children(
                              "li").eq(0).removeClass("clicktab");
                        $(".ordertabCategory").children("ul").children(
                              "li").eq(2).addClass("clicktab");
                        $(".ordertabCategory").children("ul").children(
                              "li").eq(2).removeClass("unclicktab");
                        $(".ordertabCategory").children("ul").children(
                              "li").eq(1).addClass("unclicktab");
                        $(".ordertabCategory").children("ul").children(
                              "li").eq(1).removeClass("clicktab");
                        sortingTab = $(".clicktab").html();
                        location.href = "/sellSearchNationalFrm?reqPage=1&sortingTab="
                              + sortingTab;
                     });
      });
      $(function() {
         if ("${searchWord }" != null) {
            $("#searchTypingBox").val("${searchWord }");
         }
      });
      //countdown
      var now = new Date();
      var endTime = new Date('2020-05-29');
      var gapTime = endTime - now - 32400000;
      var SetTime = gapTime / 1000;
      var SetMin = SetTime / 60;
      var SetHour = SetMin / 60;
      function msg_time() { // 1초씩 카운트
         m = Math.floor(SetHour % 60) + ":" + Math.floor(SetMin % 60) + ":"
               + Math.floor(SetTime % 60); // 남은 시간 계산
         var msg = m;
         $(".viewTimer").html(msg);
         //document.all.ViewTimer.innerHTML = msg;
         SetTime--;
         if (SetTime < 0) {
            clearInterval(tid);
         }
      }
      window.onload = function TimerStart() {
         tid = setInterval('msg_time()', 1000)
      };

      //DB에서 상품 데이터 불러오기
      /*function sell_listAll(){
         var searchTypingBox = $("#searchTypingBox").val();
         var sortingTab = $(".clicktab").html();
         var param = {searchTypingBox:searchTypingBox, sortingTab:sortingTab};
         $.ajax({
            url:"/sellSearchBox",
            type: "post",
            data: param,
            dataType: "json",
            success: function(data){
               $(".shoppingList-firstRow").html("");
               var html = "";
               for(var i=0; i<data.length;i++){
                  
                  if(i%3==0){
                     html+="<tr>";
                  }
                  html += "<th><div class='productBox'><div class='productImg'>";
                  html += "<div class='timeBox'>"+data[i].sellEndDate+"</div>";
                  html += "<img src='/imgs/"+data[i].thumbnail+"'></div>";
                  html += "<p>"+data[i].sellTitle+"</p><div class='detailInfoBox'>"
                  html += "상품가격: "+data[i].sellPrice+"원<br> 현재 참여인원: "+data[i].sellCount+"명</div></div></th>"
                  if(i%3==2){
                     html+="</tr>"
                  }
               }
               $(".shoppingList-firstRow").append(html);
            },
            error: function(){
               console.log("데이터 불러오기 실패.")
            }
         });
      }
      $(function(){
         $("form").submit(function(){
            sell_listAll();
            return false;
         });
      });*/
      //카테고리 분류하여 검색
      $(function(){
         $(".category2").eq(0).hide();
         $(".category2").eq(1).hide();
         $(".category2").eq(2).show();
         //카테고리1- 농산물 선택
         $(".category1").change(function(){
            if ($(this).children("option:selected").val() == "농산물") {
               $(".category2").eq(0).show();
               $(".category2").eq(0).attr("name", "type2");
               $(".category2").eq(1).hide();
               $(".category2").eq(1).removeAttr("name");
               $(".category2").eq(2).hide();
            } else if ($(this).children("option:selected").val() == "수산물") {
               $(".category2").eq(0).hide();
               $(".category2").eq(0).removeAttr("name");
               $(".category2").eq(1).show();
               $(".category2").eq(1).attr("name", "type2");
               $(".category2").eq(2).hide();
            } else {
               $(".category2").eq(0).hide();
               $(".category2").eq(1).hide();
               $(".category2").eq(2).show();
               $(".category2").eq(1).removeAttr("name");
               $(".category2").eq(0).removeAttr("name");
            }
         });
         
         $(".ordertabCategory").children().children().click(function(){
            var tabWord = $(this).val();
            console.log("ㅇㅇ");
         });
      });
   </script>
   <jsp:include page="/WEB-INF/views/common/header.jsp" />
   <div class="sell-list-body">
      <form action="/sellSearchBox" method="post" id="searchSell">
         <div class="searchbox-wrapper">
            <select class="category category1" name="type1">
               <option value=null>농/수산물(전체)</option>
               <option value="농산물">농산물</option>
               <option value="수산물">수산물</option>
            </select> <select class="category category2" name="type2">
               <option value=null>상품타입(전체)</option>
               <option value="채소">채소</option>
               <option value="과일">과일</option>
               <option value="가공식품">가공식품</option>
            </select>
            <select class="category category2">
               <option value=null>상품타입(전체)</option>
                 <option value="생물">생물</option>
                 <option value="냉동">냉동</option>
                    <option value="가공식품">가공식품</option>
                </select>
                <select class="category category2" disabled>
                  <option value="" selected>상품 소분류</option>
            </select>
            <div class="searchInput-wrapper">
               <div class="searchInputBox">
                  <img src="../imgs/search@3x.png"> <input type="text"
                     name="searchTypingBox" id="searchTypingBox"
                     class="searchTypingBox" placeholder="검색할 상품을 입력하세요(Enter)">
               </div>
                  <input type="submit" value="상품 검색" class="searchBtn">
            </div>
         </div>
         <br> <br>
         <div class="ordertabCategory">
            <ul>
               <input type="hidden" value="마감시간 순" name="sortingTab1">
               <li class="clicktab" name="sortingTab" value="마감시간 순">마감시간 순</li>
               <li class="unclicktab" name="sortingTab" value="구매 인기순">구매 인기순</li>
               <li class="unclicktab" name="sortingTab" value="최근 등록순">최근 등록순</li>
            </ul>
         </div>
      </form>
      <br> <br> <br>
      <div class="shoppingList-wrapper">
         <table class="shoppingList-firstRow">
            <c:forEach items="${sellList }" var="n" varStatus="i">
               <c:if test="${i.count%3 eq 1 }">
                  <tr>
               </c:if>
               <th>
                  <div class="productBox">
                     <div class='productImg'>
                        <div class='timeBox' id='timeBox'>
                           <c:if test="${n.timegap >0}">
                     ${n.timegap } 일 남음
                     </c:if>
                           <c:if test="${n.timegap ==0 }">
                              <div class="viewTimer"></div>
                           </c:if>
                        </div>
                        <a
                           href='/sellView?sell_no=${n.sellNo }&sell_writer=${n.sellWriter }'><img
                           src='/imgs/${n.thumbnail }'></a>
                     </div>
                     <p>${n.sellTitle }</p>
                     <div class='detailInfoBox'>
                        상품가격: ${n.sellPrice }원<br> 현재 참여인원: ${n.sellCount }명
                     </div>
                  </div>
               </th>
               <c:if test="${i.count%3 eq 0 }">
                  </tr>
               </c:if>
            </c:forEach>
         </table>
         <div id="pageNavi">${pageNavi }</div>
      </div>
   </div>
   <jsp:include page="/WEB-INF/views/common/footer.jsp" />
</body>

</html>