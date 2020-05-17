<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.3.1.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 판매글 작성</title>
<style>
table, th, td {
	border: 1px solid black;
}

th, td {
	height: 40px;
}
td{
	width:400px;
}
th {
	width: 300px;
}
    .comments{
        color: red;
    }
</style>
</head>
<script>
	

</script>
<body>
	<form action="/sellFormInsert" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th>판매 지역 선택</th>
				<td><select>
						<option value="전체보기">전체보기</option>
						<option value="서울/경기">서울/경기</option>
						<option value="인천/부천">인천/부천</option>
						<option value="춘천/강원">춘천/강원</option>
						<option value="부산/울산/경남">부산/울산/경남</option>
						<option value="대구/경북">대구/경북</option>
						<option value="전주/전북">전주/전북</option>
						<option value="광주/전남">광주/전남</option>
						<option value="청주/충북">청주/충북</option>
						<option value="청주/충북">청주/충북</option>
						<option value="대전/충남">대전/충남</option>
						<option value="제주">제주</option>
				</select> <select>
						<option value="">구 끌어오기</option>
				</select> <select>
						<option value="">동네 끌어오기</option>
				</select>
					<div></div></td>
			</tr>
			<script>
			function addrSearch(){
				new daum.Postcode({
					oncomplete: function(data){
						$("#postCode").val(data.zoneCode); //우편번호 값 읽어오는 속성 = zoneCode
						$("#roadAddr").val(data.roadAddress);
						$("#jibunAddr").val(data.jibunAddress);
					}
				}).open();
				$("form").submit(function(){
					return false;
				});
			}
			</script>
			<tr>
				<th>판매자 지역</th>
				<td><div>
						<ul>
							<li><input type="text" id="postCode"
								style="width: 200px; display: inline-block;"
								class="form-control" placeholder="우편번호" readonly>
								<button id="addrSearchBtn" onclick="addrSearch();"
									class="btn btn-primary">주소검색</button></li>
							<li><input id="roadAddr"
								style="width: 400px; display: inline-block;" type="text"
								class="form-control" placeholder="도로명주소"> <input
								id="jibunAddr" style="width: 400px; display: inline-block;"
								type="text" class="form-control" placeholder="지번주소"></li>
							<li><input id="detailAddr"
								style="width: 800px; display: inline-block;" type="text"
								class="form-control" placeholder="상세주소"></li>
						</ul>
					</div></td>
			</tr>
            <script>
                
            </script>
			<tr>
				<th>제목</th>
				<td><input type="text" id="sellTitle"><span class="comments"> 1자 이상 입력하세요.</span></td>
			</tr>
            <script>
                $(function(){
                    $(".category2").eq(0).hide();
                    $(".category2").eq(1).hide();
                    $(".category2").eq(2).show();
                    $(".category1").change(function(){
                      if($(this).children("option:selected").val()=="농산물"){
                            $(".category2").eq(0).show();
                            $(".category2").eq(1).hide();
                          $(".category2").eq(2).hide();
                        }else if($(this).children("option:selected").val()=="수산물"){
                            $(".category2").eq(0).hide();
                            $(".category2").eq(1).show();
                            $(".category2").eq(2).hide();
                        }else{
                            $(".category2").eq(0).hide();
                            $(".category2").eq(1).hide();
                            $(".category2").eq(2).show();
                        }
                    });
                    
                });
                
            </script>
			<tr>
				<th>상품 대분류</th>
				<td><select class="category category1">
                        <option value="">상품 대분류</option>
						<option value="농산물">농산물</option>
						<option value="수산물">수산물</option>
				</select></td>
			</tr>
			<tr>
				<th>상품 소분류</th>
				<td>
                    <select class="category category2">
                        <option value="" selected>상품 소분류</option>
						<option value="채소">채소</option>
						<option value="과일">과일</option>
						<option value="가공식품">가공식품</option>
				</select> <select class="category category2">
                    <option value="" selected>상품 소분류</option>
						<option value="생물">생물</option>
						<option value="냉동">냉동</option>
						<option value="가공식품">가공식품</option>
				</select>
                <select class="category category2" disabled>
                    <option value="" selected>상품 소분류</option>
                    </select>
                    <span class="comments">대분류를 먼저 선택하세요.</span>
                </td>
			</tr>
			<tr>
				<th>상품명</th>
				<td><input type="text"><br><span class="comments"></span></td>
			</tr>

			<tr>
				<th>가격</th>
				<td><input type="text" id="sellPrice">원<br><span class="comments"></span></td>
			</tr>
            
            <script>
      $(function(){
         $("input[type=radio]").click(function(){
             if($(this).index()==3){
                 $("#delFeeBox").attr("disabled", false);
             }else{
                 $("#delFeeBox").attr("disabled", true);
             }
            }) ;
          $("#delFeeBox").focusout(function(){
              if(!$("#delFeeBox").val()==""){
              $("#typeDF").val($("#delFeeBox").val());
          }}); 
      });
            </script>
			<tr>
				<th>배송비 선택</th>
				<td>
                    <input type="radio" name="deliveryFee" value="0">무료배송
					<input type="radio" name="deliveryFee" value="2500">2500원 
                    <input type="radio" name="deliveryFee" value="3000">3000원 
                    <input type="radio" id="typeDF" name="deliveryFee" value="">직접입력 
                    <input type="text" id="delFeeBox" name="deliveryFee" disabled ></td>
			</tr>
			<tr>
				<th>판매 수량 설정</th>
				<td>최소: <input type="text">개 ~ 최대: <input type="text">개(묶음/박스)
				<br><span class="comments"></span>
				</td>
			</tr>
			<tr>
				<th>판매 종료일 설정</th>
				<td><input type="text"><br><span class="comments"></span></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><input type="text"><br></td>
			</tr>
			<tr>
				<th colspan ="2">등록 상품의 필수 정보 입력</th>
			</tr>
			<tr>
				<th>제조원(원산지)</th>
				<td><input type="text">
				<br><span class="comments"></span></td>
			</tr>
			<tr>
				<th>유통기한</th>
				<td><input type="text">
				<br><span class="comments"></span></td>
			</tr>
			<tr>
				<th>원재료명 및 함량</th>
				<td><input type="text">
				<br><span class="comments"></span></td>
			</tr>
			<tr>
				<th>보관상 주의사항</th>
				<td><input type="text">
				<br><span class="comments"></span></td>
			</tr>

			<tr>
				<th>대표 이미지 등록</th>
				<td><input type="file" name="thumbnail" onchange="loadImg(this);"></td>
			</tr>
			<tr>
				<th>물품 사진 등록(최대 4장 가능)</th>
				<td>
				<input multiple="multiple" type="file" name="filename[]">
				</td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="등록하기"> <input
					type="reset" value="취소하기"></th>
			</tr>
		</table>
	</form>
</body>

</html>