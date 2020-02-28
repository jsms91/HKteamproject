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
<!-- header -->
<%@ include file="../MMain_view.jsp" %>
<br/>

<h1>가게 등록</h1>

<div class="container">
<!-- 업체코드는 시퀀스로 얻기 -->
	<form action="register" method="post" enctype="multipart/form-data">
		<c:forEach items="${RegisterView}" var="dto" varStatus="status">
			
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
		<div id="content">
	
			<input type="text" name="sName" placeholder="가게명" value="${dto.asName}"/>
			<br/><br/>
			
			<input type="text" name="bName" placeholder="대표자명"/>
			<br/><br/>
			
			<!-- 사업자번호 추가하기 -->
			<input type="tel" name="bNo" pattern="[0-9]{3}-[0-9]{2}-[0-9]{5}" required placeholder="사업자 번호 : 000-00-00000" value="${dto.abNo}"/ >
			<br/><br/>
			
			<input id="file" type="file" name="sImg"><!-- 가게로고 이미지 -->
			<br/><br/>
			
			<!-- 위도 경도는 페이지에서는 숨겨서 받고 db에는 전송  -->
			<input type="text" id="lat" name="sLat" placeholder="위도" style="display:none" value="${dto.asLat}" />
			<input type="text" id="lng" name="sLng" placeholder="경도" style="display:none" value="${dto.asLng}" />
			
			<input type="search" id="address" name="sAd" placeholder="주소를 설정해주세요." value="${dto.asAd}"/>
			<br/>
			<button id="search" type="button">검색</button>
			
			<br/><br/>
			<div id="google-map"></div>
			<br/>
			
			<b>가게전화번호</b><br/>
			<input type="tel" name="sPhone" placeholder="02-000-0000" value="${dto.asPhone}" />
			<br/><br/>
			
			<div id="catagory">
				<select name="sCategory">
				    <option value="">카테고리를 선택하세요.</option>
				    <option value="치킨">치킨</option>
				    <option value="피자">피자</option>
				    <option value="중식">중식</option>
				    <option value="한식">한식</option>
				    <option value="카페">카페</option>
				    <option value="프렌차이즈">프렌차이즈</option>
				</select>
			</div>
			
			<br/>
			
			<div id="tip">
				<select name="sTip">
				    <option value="">배달팁</option>
				    <option value="0">없음</option>
				    <option value="1000">1000원</option>
				    <option value="2000">2000원</option>
				    <option value="3000">3000원</option>
				    <option value="4000">4000원</option>
				    <option value="5000">5000원</option>
				</select>
			</div>
			
			<br/>
			
			<b>최소주문가격(0원 ~ 30000원)</b><br/>
			<input type="number" name="mPrice" placeholder="최소주문가격" min="0" max="30000" step="1000" value="0">
			<br/><br/>
			
			<input type="hidden" name="user_id" value="${dto.user_id}" />
			<input type="hidden" name="asNo" value="${dto.asNo}" />
			<br/><br/>
			
			<input id="submit" type="submit" value="등록">
		
		</div>
		 
		</c:forEach>
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

//============================= 구글 API 시작 =============================
function initMap() {
  console.log('Map is initialized.');

  //처음 페이지 실행시 보여지는 맵 주소 설정
  var map = new google.maps.Map(document.getElementById('google-map'), {
      zoom: 17,//맵확대정도
      center: {
          lat: 37.5255894, //위도
          lng: 126.8889075 //경도
      }
  }); 
  
  var input = document.getElementById('search'); 
  var autocomplete = new google.maps.places.Autocomplete(input); 
  
	//발급받은 api키에 포함되어 있다. 혹시 안될경우 사용설정해주면된다.
  var geocoder = new google.maps.Geocoder();

  // search 버튼 클릭 이벤트 실행
  document.getElementById('search').addEventListener('click', function() {
      console.log('search 버튼 클릭 이벤트 실행');
      // 여기서 실행
      geocodeAddress(geocoder, map);
  });

  
  //geocodeAddress | 입력한 주소로 맵의 좌표를 바꾼다.
  function geocodeAddress(geocoder, resultMap) {
      console.log('geocodeAddress 함수 실행');

      // 주소 설정
      var address = document.getElementById('address').value;

      
      
      //////////////////////////////////////////////////////////////////////////////
      /**
       * 입력받은 주소로 좌표에 맵 마커를 찍는다.
       * 1번째 파라미터 : 주소 등 여러가지. 
       *      ㄴ 참고 : https://developers.google.com/maps/documentation/javascript/geocoding#GeocodingRequests
       * 
       * 2번째 파라미터의 함수
       *      ㄴ result : 결과값
       *      ㄴ status : 상태. OK가 나오면 정상.
       */
      geocoder.geocode({'address': address}, function(result, status) {
          console.log(result);
          console.log("status : " + status);

          if (status === 'OK') {
              // 맵의 중심 좌표를 설정한다.
              resultMap.setCenter(result[0].geometry.location);
              
              // 맵의 확대 정도를 설정한다.
              resultMap.setZoom(17);
              
              // 맵 마커
              var marker = new google.maps.Marker({
                  map: resultMap,
                  position: result[0].geometry.location
              });

              // 위도
              console.log('위도(latitude) : ' + marker.position.lat());
              // 경도
              console.log('경도(longitude) : ' + marker.position.lng());
              
              //위도, 경도 값 넣기
              document.getElementById("lat").value = marker.position.lat();
              document.getElementById("lng").value = marker.position.lng();
              
          } else {
              alert('잘못된 주소입니다. 다시 검색해주세요. : ' + status);
          }
      });
		//////////////////////////////////////////////////////////////////////////////
		
  }
}
//============================= 구글 API 끝 =============================
</script>
</body>
</html>