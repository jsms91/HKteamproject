<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="ko">
<head> 

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta id="_csrf" name="_csrf" content="${_csrf.token }"/>


<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Insert title here</title>

<style>
h1 { 
	text-align : center;
	margin-top : 30px;
}
.container {
	margin-top : 50px;
	margin-bottom : 50px; 
}
#content {
	margin : auto;
	width : 350px;
}
input {
	width : 350px;
	height : 50px;
	text-align : center;
}
#google-map {
	width : 350px;
	height : 250px;
	margin : auto;
}
select { 
	width : 250px;
	height : 50px;
}


</style>
</head>

<body>
<div id="BMain"></div>
<br/><br/>

<h1>입점문의 등록</h1>
<div class="container">
	<form action="apply" method="post">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
		<div id="content">
	
			<input type="text" name="asName" placeholder="가게명" required>
			<br/><br/>
			
			<input type="tel" name="abNo" pattern="[0-9]{3}-[0-9]{2}-[0-9]{5}" required placeholder="사업자 번호 : 000-00-00000">
			<br/><br/>
			
			<!-- 위도 경도는 페이지에서는 숨겨서 받고 db에는 전송 -->
			<input type="text" id="lat" name="asLat" placeholder="위도" style="display:none">
			<input type="text" id="lng" name="asLng" placeholder="경도" style="display:none">
			
			<!-- 한글주소가 자동으로 입력됨 -->
			<input type="search" id="address" name="asAd" placeholder="현재위치를 검색하여 주소를 설정해주세요." readonly required>
			<br/>
			<button id="search" type="button">검색</button>
			
			<br/><br/>
			<div id="google-map"></div>
			<br/>
			
			<b>가게전화번호</b><br/>
			<input type="tel" name="asPhone" required>
			<br/><br/>
			
			<div id="catagory">
				<select name="asCategory">
				    <option value="">카테고리를 선택하세요.</option>
				    <option value="치킨">치킨</option>
				    <option value="피자">피자</option>
				    <option value="중식">중식</option>
				    <option value="한식">한식</option>
				    <option value="카페">카페</option>
				    <option value="프렌차이즈">프렌차이즈</option>
				</select>
			</div>
			
			<br/><br/>		
				
			<sec:authentication var="logid" property="principal.username" />
			<input type="hidden" name="user_id" value="${logid}"> <!-- 로그인시 로그인한 아이디로 입력되게해야함 화면에는 숨기고 -->
			
			<input type="submit" class="bg-danger text-white" value="등록">
			
		</div>
	</form>
</div>




<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- 구글 맵 API -->
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBHgDQIauLTIeS1P9UWW9ba_HmNUY7fvO0&libraries=places&callback=initMap"></script>
<script>
//맨위에 헤더를 가져옴
$("#BMain").load("BossHome");

//============================= 구글 API 시작 =============================
var x = document.getElementById("google-map");

getLocation(); //화면에 뿌려줌
	
function initMap() { //페이지 실행시 처음 화면
    
	var map = new google.maps.Map(document.getElementById('google-map'), {
    	zoom: 17,
    	center: {lat: 37.497665, lng: 126.7805416} 
	});
    
    var geocoder = new google.maps.Geocoder;
    var infowindow = new google.maps.InfoWindow;
    
    document.getElementById('search').addEventListener('click', function() {
    	geocodeLatLng(geocoder, map, infowindow); 
    });
}
	
function getLocation() { //현위치 위도경도함수를 조건에 따라 뿌려줌
	if (navigator.geolocation) { 
		navigator.geolocation.watchPosition(showPosition);
	}
	else { 
		x.innerHTML = "Geolocation is not supported by this browser.";
	}
}
	
function showPosition(position) { //현위치 위도 경도 얻기	
	document.getElementById('lat').value = position.coords.latitude;
	document.getElementById('lng').value = position.coords.longitude;
}


function geocodeLatLng(geocoder, map, infowindow) {
	//document.getElementById('latlng').value =  position.coords.latitude + "," + position.coords.longitude; 
	var lat = document.getElementById('lat').value;
	var lng = document.getElementById('lng').value; 
	var latlngStr = lat + "," + lng;
   
	console.log(latlngStr);
   
	var latlng = {lat: parseFloat(lat), lng: parseFloat(lng)};
   
   	console.log(latlng);
	   
   	geocoder.geocode({'location': latlng}, function(results, status) {
    	if (status === 'OK') {
       		if (results[0]) {
       			
       			map.setZoom(17);
         		
         		var marker = new google.maps.Marker({
           			position: latlng, 
           			map: map
           			
           		});
           		 
         		infowindow.setContent(results[0].formatted_address);
         		document.getElementById("address").value = results[0].formatted_address;
         		infowindow.open(map, marker);
         	
       		} 
       		else {
         		window.alert('No results found');
       		}
       	
    	} 
    		else {
       			window.alert('Geocoder failed due to: ' + status);
     		}
    });
}
//============================= 구글 API 끝 =============================
</script>
</body>