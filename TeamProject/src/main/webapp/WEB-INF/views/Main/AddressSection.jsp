<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<title>Insert title here</title>
<style>
#ad1 {
	display : table;
	margin : auto;
	height : 100px;
}
#ad2 {	
	display : table-cell;
    vertical-align : middle; /* id=ad1 div를 테이블로 하고 밑에서 id=ad2의 내용을 가운데 정렬*/
    text-align : center;
    color : gray; /* 글자색 변경하기*/
}
#btn,#icon {
	border-radius: 10px;
	border : 1px solid red;
	cursor:pointer; 
}

#address  {
	width : 450px;
}
</style>
</head>

<body>
<section style="border-bottom:1px solid #FF4848;"> 
	<div id="ad1">
		<!-- header2 : 주소 검색 -->
		<form id="ad2" class="container" action="search" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<input type="hidden" id="lat" name="sLat" placeholder="위도"> 
			<input type="hidden" id="lng" name="sLng" placeholder="경도">
			<br/> 
			<div id="btn" class="btn-group btn-group-lg">
				<i id="icon" class="material-icons" style="font-size:48px;color:red">my_location</i> 
				<input type="search" id="address" class="btn" placeholder="주소를 설정해주세요." readonly>
				<!-- readonly는 읽는거만 가능 입력 불가 대신 form안에서 사용시 전송은 가능 -->
				<input type="submit" id="search" class="btn bg-danger" value="검색">
			</div>
			<br/><br/>
		</form>
		<!-- header2 : 주소 검색 끝 -->
	</div>
</section>

<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- 구글 맵 API -->
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBHgDQIauLTIeS1P9UWW9ba_HmNUY7fvO0&libraries=places&callback=initMap"></script>
<script>
//============================= 구글 API 시작 =============================

function initMap() {
	
    console.log('Map is initialized.');
    
    //현위치 찾기
    var geocoder = new google.maps.Geocoder;
    var infowindow = new google.maps.InfoWindow;
    
    document.getElementById('icon').addEventListener('click', function() {
    	geocodeLatLng(geocoder, infowindow); 	 
    });
    //현위치 끝
}

//현위치 찾기
getLocation(); //화면에 뿌려줌

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

function geocodeLatLng(geocoder, infowindow) { 
	
	var lat = document.getElementById('lat').value;
	var lng = document.getElementById('lng').value; 
	var latlngStr = lat + "," + lng;
   
	console.log(latlngStr);
   
	var latlng = {lat: parseFloat(lat), lng: parseFloat(lng)};
   
   	console.log(latlng);
	   
   	geocoder.geocode({'location': latlng}, function(results, status) {
    	if (status === 'OK') {
       		if (results[0]) {
           		 
         		infowindow.setContent(results[0].formatted_address);        		
         		document.getElementById("address").value = results[0].formatted_address;
         		infowindow.open();
         	
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


$(document).ready(function() {
	 
	document.getElementById("address").value = JSON.parse(sessionStorage.getItem("address1"));
	document.getElementById("lat").value = JSON.parse(sessionStorage.getItem("lat1"));
	document.getElementById("lng").value = JSON.parse(sessionStorage.getItem("lng1"));
	
	//============================= 가게테이블 위도,경도와 메인에서 검색한 주소에 위도,경도 비교 =============================
		
	$("#ad2").submit(function(event){ //form엘리먼트의 submit이벤트 처리 메서드
		//세션스토리지에 위도,경도,한글주소 저장
		var ad = document.getElementById("address").value; //한글주소
		var lat = document.getElementById("lat").value; //위도
		var lng = document.getElementById("lng").value; //경도
		
		if(ad == ""){
			alert("주소를 먼저 설정해주세요.");
			$("#address").focus();
			return false;
		}
		else {
			
			sessionStorage.setItem("address1", JSON.stringify(ad));
			JSON.parse(sessionStorage.getItem("address1"));	
			
			sessionStorage.setItem("lat1", JSON.stringify(lat));
			JSON.parse(sessionStorage.getItem("lat1"));	
			
			sessionStorage.setItem("lng1", JSON.stringify(lng));
			JSON.parse(sessionStorage.getItem("lng1"));	
			
		}
		
	});	
	
	//============================= 가게테이블 위도,경도와 메인에서 검색한 주소에 위도,경도 비교 =============================
});
</script>

</body>
</html>