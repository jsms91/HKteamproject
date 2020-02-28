<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 로그인,로그아웃 버튼에 사용하는 시큐리티 태그라이브러리 추가 -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<title>Insert title here</title>
<style>
/*기본 홈 contents*/
#cul {
	text-align : center;
    list-style:none;
    -webkit-padding-start:0px; /*ul왼쪽 여백 없애기*/
}
.rounded-square {
	width : 250px;
	height : 250px;
	border : 1px solid #BDBDBD;
	background-color : white;
	cursor:pointer;
}
</style>
</head>
<body>
<!-- header -->
<%@ include file="header.jsp" %>
<br/>

<!-- 이벤트 배너 -->
<%@ include file="EventBanner.jsp" %>
<br/>

<!-- 가게주소검색 -->
<%@ include file="AddressSection.jsp" %>
<br/>

<!--============================== main 메뉴버튼  시작 ==============================-->
<!-- 내용 기본으로 홈화면 내용 설정한후 ajax통해서 이부분만 교체 -->
<div id="contents">
<div class="container">

	<ul id="cul" class="row">
    	<li class="col-4">
    		<a id="all" onclick="AllFunction()">
    			<img src="resources/MainImg/all.png" class="rounded-square" title="전체보기">
    		</a>
    	</li>
    	
        <li class="col-4">
        	<a id="Chicken" onclick="ChickenFunction()">
        		<img src="resources/MainImg/치킨.png" class="rounded-square" title="치킨">
        	</a>
        </li>
        
        <li class="col-4">
        	<a id="Pizza" onclick="PizzaFunction()">
        		<img src="resources/MainImg/피자.png" class="rounded-square" title="피자">
        	</a>
        </li>
    </ul>
	
	<br><br>
	
	<ul id="cul" class="row">
    	<li class="col-4">
    		<a id="CF" onclick="CFFunction()">
    			<img src="resources/MainImg/중식.png" class="rounded-square" title="중식">
    		</a>
    	</li>
    	
        <li class="col-4">
        	<a id="KF" onclick="KFFunction()">
        		<img src="resources/MainImg/한식.png" class="rounded-square" title="한식">
        	</a>
        </li>
        
        <li class="col-4">
        	<a id="Cafe" onclick="CafeFunction()">
        		<img src="resources/MainImg/카페.png" class="rounded-square" title="카페">
        	</a>
        </li>
    </ul>
	
	<br><br>
	
	<ul id="cul" class="row">
    	<li class="col-4">
    		<a id="FC" onclick="FCFunction()">	
    			<img src="resources/MainImg/프렌차이즈.png" class="rounded-square" title="프렌차이즈">
    		</a>
    	</li>
    </ul>
    
</div>
</div>
<br/>
<!--============================== main 메뉴버튼  끝 ==============================-->

<!-- footer -->
<%@ include file="footer.jsp" %>
<br/><br/>

<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


<script>

//============================= 메인에서 카테고리별 가게 찾기 =============================

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