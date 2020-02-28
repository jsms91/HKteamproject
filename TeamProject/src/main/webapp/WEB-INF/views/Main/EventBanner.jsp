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

<title>Insert title here</title>
<style>
/*배너관련 스타일 css*/
.d-block {
	width : 100%;
	height : 100%; 
	cursor: pointer;
}
.d-block:hover {
	opacity: 0.6;
}

/*모달 css*/
/* The Modal (background) */
#myModal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgba(0,0,0,0.8); /* Black w/ opacity */
}
/* Modal Content (image) */
#img01 {
  margin: auto;
  display: block;
  width: 80%;
  max-width: 700px;
}

/* Add Animation */
#img01 {  
  -webkit-animation-name: zoom;
  -webkit-animation-duration: 0.6s;
  animation-name: zoom;
  animation-duration: 0.6s;
}

/* 모달창 띄울때 점점크게 듸우는 효과 */
@-webkit-keyframes zoom {
  from {-webkit-transform:scale(0)} 
  to {-webkit-transform:scale(1)}
}

@keyframes zoom {
  from {transform:scale(0)} 
  to {transform:scale(1)}
}

/* The Close Button */
#myModal .close {
  position: absolute;
  top: 0px;
  right: 20px;
  color: #f1f1f1;
  font-size: 60px;
  font-weight: bold;
  transition: 0.3s;
}

.close:hover,.close:focus {
  color: #bbb;
  text-decoration: none;
  cursor: pointer;
}

/* 100% Image Width on Smaller Screens  모달창 이미지*/
@media only screen and (max-width: 700px){
  .modal-content {
    width: 100%;
  }
}
</style>
</head>

<body>
<section>
	<div id="event" class="container carousel slide" data-ride="carousel">
			
		  <!-- Indicators -->
		  <ul id="indicator" class="carousel-indicators">
		    <li data-target="#event" data-slide-to="0" class="active bg-danger"></li>
		    <li data-target="#event" data-slide-to="1" class=" bg-danger"></li>
		    <li data-target="#event" data-slide-to="2" class=" bg-danger"></li>
		  </ul>
		  
		  <!-- The slideshow -->
		  <div class="carousel-inner">
		  
		  	<div class="carousel-item active">
		      <img id="im1" src="resources/MainImg/event1_2.png" alt="이벤트1" class="d-block mx-auto">
		    </div>
		    
		    <div class="carousel-item">
		      <img id="im2" src="resources/MainImg/event2_2.png" alt="이벤트2" class="d-block mx-auto ">
		    </div>
		    
		    <div class="carousel-item">
		      <img id="im3" src="resources/MainImg/event3_2.png" alt="이벤트3" class="d-block mx-auto ">
		    </div>
	
		  </div>
	</div>
</section>

<!--============================== 이벤트 내용 배너 모달 시작 ==============================-->
<div id="myModal" class="modal">
	<span class="close">&times;</span>
  	<img class="modal-content" id="img01">
</div><br/>
<!--============================== 이벤트 내용 배너 모달 끝 ==============================-->	



<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
//============================= 이벤트 배너 모달 자바스크립트 코드 시작 =============================
//Get the modal
var modal = document.getElementById("myModal");
var modalImg = document.getElementById("img01");

$("#im1").click(function(){
	modal.style.display = "block";
	modalImg.src = 'resources/MainImg/event1_1.png';
	$("#indicator").hide();
});
$("#im2").click(function(){
	modal.style.display = "block";
	modalImg.src = 'resources/MainImg/event2_1.png';
	$("#indicator").hide();
});
$("#im3").click(function(){
	modal.style.display = "block";
	modalImg.src = 'resources/MainImg/event3_1.png';
	$("#indicator").hide();
});

//모달창 닫기
//Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

//When the user clicks on <span> (x), close the modal
span.onclick = function() { 
modal.style.display = "none"; //x클릭시 모달 닫기
$("#indicator").show(); //모달 띄울때 숨긴거 다시 표시
}
//============================= 이벤트 배너 모달 자바스크립트 코드 끝 =============================
</script>
</body>
</html>