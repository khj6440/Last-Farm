<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap"
	rel="stylesheet">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">
<link rel="stylesheet" href="/css/header/style.css">
<link rel="stylesheet" href="/css/header/responsive.css">
<script type="text/javascript" src="/js/bootstrap.js">
	
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
		#insertFrm{
			width:500px;
			margin:0 auto;
		}
		.review_h1{
		text-align: center;
		margin: 0 auto;
		}
		#reviewContent_textarea{
		 resize: none;
		}
	</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body><br>
	<h1 class="review_h1">리뷰 작성</h1><br>
		<form action="/reviewInsert" method="post" enctype="multipart/form-data" id="insertFrm">
		<input type="hidden" name="sellEndWriter" value="${sessionScope.sellEndWriter }">
		<input type="hidden" name="sellEndNo" value="${sessionScope.sellEndNo}">

			<table class="table table-bordered">
				<tr>
					<th>제목</th>
					
					<td><input type="text" class="form-control" name="reviewTitle"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td>${sessionScope.member.memberId }
					<input type="hidden" name="reviewWriter" value="${sessionScope.member.memberId }"></td>
				</tr>
				<tr>
					<th>별점</th>
					<td>
        <img class="star" src="../imgs/star-off.png">
        <img class="star" src="../imgs/star-off.png">
        <img class="star" src="../imgs/star-off.png">
        <img class="star" src="../imgs/star-off.png">
        <img class="star" src="../imgs/star-off.png">
        <span class="d1" name="reviewScore"></span>
        
        <input type="hidden" class="reviewScore" name="reviewScore">
   					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td><input type="file" name="reviewFilepath" onchange="loadImg(this)"></td>
				</tr>
				<tr>
					<th>이미지 보기</th>
					<td>
						<div id="img-viewer">
							<img id="img-view" width="350">
						</div>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea id="reviewContent_textarea" name="reviewContent" rows="5" style="width:100%;"></textarea></td>
				</tr>
				<tr style="text-align:center;">
					<th colspan="2">
						<button type="submit" OnClick="FnClose()" class="btn btn-outline-primary">등록</button>	 
										
					</th>
				</tr>
			</table>
		</form>




<script>


function setMemberId(){
	alert("등록 성공");
	
}

function loadImg(f){
	console.log(f.files);
	if(f.files.length!=0 && f.files[0]!=0){
		var reader = new FileReader();
		reader.readAsDataURL(f.files[0]);
		reader.onload = function(e){
			$("#img-view").attr("src",e.target.result);
		}
	}else{
		$("#img-view").attr("src","");
	}
}

$(function() {
    var num = 0;
    $(".star").mouseenter(function() {
        //몇번째인지 확인 0~4
        var index = $(".star").index($(this));

        for (var i = 0; i < index + 1; i++) {
            $(".star").eq(i).attr("src", "../imgs/star-on.png");
            num = i + 1;
        }
        for (var i = index + 1; i < 5; i++) {
            $(".star").eq(i).attr("src", "../imgs/star-off.png");
        }
    });
    $(".star").click(function() {
        $("span").html(num + "점");
        $(".reviewScore").val(num);
    });
});
</script>
</body>
</html>