<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 카테고리 바*/
.btn-group button {
	background-color: white; /* Green background */
	border: 1px solid #EAEAEA; /* Green border */
	color: black; /* White text */
	padding: 20px; /* Some padding */
	cursor: pointer; /* Pointer/hand icon */
	float: left; /* Float the buttons side by side */
}
.btn-group button:hover {
	background-color:#474747;
	color:#FBFBFB;
}
/* 내용 */
#none {
	text-align : center; 
	margin-top : 30px;
}
#b1 {
	color : gray;
	font-size : 20px;
}
</style>
</head> 
<body>
<!-- header -->
<header id="header"></header>
<br/>

<!-- 가게주소검색 -->
<section id="sec"></section>
<br/>

<div id="Category_Bar">
	<div class="container">
		<div id="cgBar" class="btn-group" style="width:100%">
			<button id="all" onclick="AllFunction()" style="width:14.3%">전체보기</button>
			<button id="Chicken" onclick="ChickenFunction()" style="width:14.3%">치킨</button>
			<button id="Pizza" onclick="PizzaFunction()" style="width:14.3%">피자</button>
			<button id="CF" onclick="CFFunction()" style="width:14.3%">중식</button>
			<button id="KF" onclick="KFFunction()" style="width:14.3%">한식</button>
			<button id="Cafe" onclick="CafeFunction()" style="width:14.3%">카페</button>
			<button id="FC" onclick="FCFunction()" style="width:14.3%">프렌차이즈</button>
		</div>
	</div>
</div>

<br/><br/>

<div id="none" style="height : 1000px;"> 
	<b id="b1">현재 위치에는 찾으시는 가게가 없습니다.</b>
</div>

<!-- footer -->
<footer id="footer"></footer>
<br/><br/>

<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
//header 가져오기
$("#header").load("header");

//주소검색창 가져오기
$("#sec").load("AddressSection");

//footer 가져오기
$("#footer").load("footer");

//카테고리 가게찾기
//전체보기(주소 검색이랑 같은 컨트롤러 사용)
function AllFunction() {
	console.log("전체보기");
	
	//카테고리별로 검색
	//var ad = document.getElementById("address").value; //한글주소
	var ad = JSON.parse(sessionStorage.getItem("address1")); //이렇게 해야 세션에 한글주소가 저장되지 않는이상 이동하지 않는다.
	var lat = document.getElementById("lat").value; //위도
	var lng = document.getElementById("lng").value; //경도
	
	if(ad == null){
		alert("주소를 먼저 검색 해주세요.");
		$("#address").focus();
		return false;
	}
	//$("#contents").load("search?sLat=" + lat + "&sLng=" + lng);
	location.href = "search?sLat=" + lat + "&sLng=" + lng;
}

//치킨
function ChickenFunction() {
	console.log("치킨보기");
	
	//카테고리별로 검색
	//var ad = document.getElementById("address").value; //한글주소
	var ad = JSON.parse(sessionStorage.getItem("address1")); //이렇게 해야 세션에 한글주소가 저장되지 않는이상 이동하지 않는다.
	var lat = document.getElementById("lat").value; //위도
	var lng = document.getElementById("lng").value; //경도
	var ca = "치킨";
	
	if(ad == null){
		alert("주소를 먼저 검색 해주세요.");
		$("#address").focus();
		return false;
	}	
	//$("#contents").load("Category?sLat=" + lat + "&sLng=" + lng + "&sCategory=" + ca);
	location.href = "Category?sLat=" + lat + "&sLng=" + lng + "&sCategory=" + ca;
}

//피자
function PizzaFunction() {
	console.log("피자보기");
	
	//카테고리별로 검색
	//var ad = document.getElementById("address").value; //한글주소
	var ad = JSON.parse(sessionStorage.getItem("address1")); //이렇게 해야 세션에 한글주소가 저장되지 않는이상 이동하지 않는다.
	var lat = document.getElementById("lat").value; //위도
	var lng = document.getElementById("lng").value; //경도
	var ca = "피자";
	
	if(ad == null){
		alert("주소를 먼저 검색 해주세요.");
		$("#address").focus();
		return false;
	}	
	//$("#contents").load("Category?sLat=" + lat + "&sLng=" + lng + "&sCategory=" + ca);
	location.href = "Category?sLat=" + lat + "&sLng=" + lng + "&sCategory=" + ca;
}

//중식
function CFFunction() {
	console.log("중식보기");
	
	//카테고리별로 검색
	//var ad = document.getElementById("address").value; //한글주소
	var ad = JSON.parse(sessionStorage.getItem("address1")); //이렇게 해야 세션에 한글주소가 저장되지 않는이상 이동하지 않는다.
	var lat = document.getElementById("lat").value; //위도
	var lng = document.getElementById("lng").value; //경도
	var ca = "중식";
	
	if(ad == null){
		alert("주소를 먼저 검색 해주세요.");
		$("#address").focus();
		return false;
	}	
	//$("#contents").load("Category?sLat=" + lat + "&sLng=" + lng + "&sCategory=" + ca);
	location.href = "Category?sLat=" + lat + "&sLng=" + lng + "&sCategory=" + ca;
}

//한식
function KFFunction() {
	console.log("한식보기");
	
	//카테고리별로 검색
	//var ad = document.getElementById("address").value; //한글주소
	var ad = JSON.parse(sessionStorage.getItem("address1")); //이렇게 해야 세션에 한글주소가 저장되지 않는이상 이동하지 않는다.
	var lat = document.getElementById("lat").value; //위도
	var lng = document.getElementById("lng").value; //경도
	var ca = "한식";
	
	if(ad == null){
		alert("주소를 먼저 검색 해주세요.");
		$("#address").focus();
		return false;
	}	
	//$("#contents").load("Category?sLat=" + lat + "&sLng=" + lng + "&sCategory=" + ca);
	location.href = "Category?sLat=" + lat + "&sLng=" + lng + "&sCategory=" + ca;
}

//카페
function CafeFunction() {
	console.log("카페보기");
	
	//카테고리별로 검색
	//var ad = document.getElementById("address").value; //한글주소
	var ad = JSON.parse(sessionStorage.getItem("address1")); //이렇게 해야 세션에 한글주소가 저장되지 않는이상 이동하지 않는다.
	var lat = document.getElementById("lat").value; //위도
	var lng = document.getElementById("lng").value; //경도
	var ca = "카페";
	
	if(ad == null){
		alert("주소를 먼저 검색 해주세요.");
		$("#address").focus();
		return false;
	}	
	//$("#contents").load("Category?sLat=" + lat + "&sLng=" + lng + "&sCategory=" + ca);
	location.href = "Category?sLat=" + lat + "&sLng=" + lng + "&sCategory=" + ca;
}

//프렌차이즈
function FCFunction() {
	console.log("프렌차이즈보기");
	
	//카테고리별로 검색
	//var ad = document.getElementById("address").value; //한글주소
	var ad = JSON.parse(sessionStorage.getItem("address1")); //이렇게 해야 세션에 한글주소가 저장되지 않는이상 이동하지 않는다.
	var lat = document.getElementById("lat").value; //위도
	var lng = document.getElementById("lng").value; //경도
	var ca = "프렌차이즈";
	
	if(ad == null){
		alert("주소를 먼저 검색 해주세요.");
		$("#address").focus();
		return false;
	}	
	//$("#contents").load("Category?sLat=" + lat + "&sLng=" + lng + "&sCategory=" + ca);
	location.href = "Category?sLat=" + lat + "&sLng=" + lng + "&sCategory=" + ca;
}
</script>
</body>
</html>