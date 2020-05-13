<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공동구매 리스트(전국)</title>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap"
	rel="stylesheet">
<style>
body {
	font-family: 'Jua', sans-serif;
	width: 1280px;
	border: 1px solid black;
	height: 2000px;
}

.searchbox-wrapper {
	background-color: #f4f4f4;
	width: 1000px;
	height: 150px;
	margin: 0 auto;
	margin-top: 70px;
}

.category {
	height: 54px;
	width: 130px;
	font-size: 120%;
	margin-right: 20px;
	margin-top: 45px;
	float: left;
}

.category1 {
	margin-left: 40px;
}

.searchTypingBox {
	height: 50px;
	width: 350px;
	font-size: 120%;
	margin: 0 auto;
	padding: 0;
}

.searchInput-wrapper {
	width: 630px;
	display: inline-block;
	margin: 0 auto;
	height: 50px;
	margin-top: 45px;
	float: left;
}

.searchInput-wrapper>button {
	height: 50px;
	width: 150px;
	font-size: 1.2em;
	float: left;
	margin-left: 20px;
	background-color: #ABD0CE;
	border-style: none;
	border-radius: 10px;
	box-shadow: 1px 1px 1px gray;
}

.searchInput-wrapper>button:hover {
	background-color: #534847;
	box-shadow: 1px 1px 1px gray;
	color: white;
}

.searchInput-wrapper input {
	height: 50px;
	width: 380px;
	font-size: 1.2em;
	margin: 0 auto;
	border: none;
	float: left;
}

.searchInput-wrapper img {
	height: 100%;
	width: 50px;
	margin: 0 auto;
	display: inline-block;
	float: left;
}

.searchInputBox {
	border: 1px solid black;
	height: 50px;
	width: 450px;
	display: inline-block;
	background-color: white;
	float: left;
}
</style>
</head>
<body>
	<script>
		
	</script>
	<div class="searchbox-wrapper">
		<select class="category category1" name="sellCategory1">
			<option value="농산물">농산물</option>
			<option value="수산물">수산물</option>
		</select> <select class="category category2" name="sellCategory2">
			<option value="채소">채소</option>
			<option value="과일">과일</option>
			<option value="가공식품">가공식품</option>
		</select>
		<!--
    <select class="category category2" name="sellCategory2">
        <option value="생물">생물</option>
        <option value="냉동">냉동</option>
        <option value="가공식품">가공식품</option>
    </select>
    -->
		<div class="searchInput-wrapper">
			<div class="searchInputBox">
				<img src="imgs/search@3x.png" class="searchInput-factor"> <input
					type="text" name="searchTypingBox"
					class="searchTypingBox searchInput-factor"
					placeholder="검색할 상품을 입력하세요.">
			</div>
			<button onclick="categorySearch();" class="searchInput-factor">상품
				검색</button>
		</div>
	</div>
</body>
</html>