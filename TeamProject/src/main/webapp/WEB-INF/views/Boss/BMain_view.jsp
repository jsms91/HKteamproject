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
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 헤더  nav 메뉴*/
nav {
	height : 100px;
	font-size : 30px;
	background-color : #191919; 
}
#home a {
	text-decoration: none;
	color : #FF0000;
	font-size:50px;
}
.navbar-nav {
	text-align : center;
}

/* show 메뉴 */
.overlay {
	height: 100%;
	width: 100%;
	display: none; 
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color : black;
}

.overlay-content {
	position: relative;
	top: 25%;
	width: 100%;
	text-align: center;
	margin-top: 30px;
}

.overlay a {
	padding: 8px;
	text-decoration: none;
	font-size: 36px;
	color: white;
	display: block;
	transition: 0.3s;
}

.overlay-content a:hover, .overlay-content a:focus {
	background-color: white;
	color : black;
}

.overlay .closebtn {
  position: absolute;
  top: 20px;
  right: 45px;
  font-size: 60px;
}

@media screen and (max-height: 450px) {
  .overlay a {font-size: 20px}
  .overlay .closebtn {
  font-size: 40px;
  top: 15px;
  right: 35px;
  }
}
</style>
</head>
<body>
 
<!-- =============== HOME LOGO =============== -->
<div id="home" style="text-align:center;">
	<a href="BossHome">BossHome</a> 
	<a href="home" class="text-danger" style="margin-top:opx; float:right;"><b class="fas fa-sync"></b></a> 
</div>

<!-- =============== HOME LOGO =============== -->

<!-- =============== MENU =============== -->
<div> 
	<nav class="navbar navbar-expand-sm">  
	
	  <!-- Links --> 
	  <ul class="navbar-nav" style="margin-left:150px;">
	  <sec:authentication var="logid" property="principal.username" />
	     
	    <li class="nav-item">
	      <a class="nav-link text-white" href="#">공지사항</a>
	    </li>
	    
	    <li class="nav-item">
	      <a class="nav-link text-white" onclick="openNav()" style="cursor: pointer;">가게관리</a>
	    </li>

	    <li class="nav-item">
	      <a class="nav-link text-white" href="MyApplyList?user_id=${logid}">입점문의</a> 
	    </li>
	  
	  </ul>  
	    
	  <div style="margin-left:auto; font-size:35px;">
	  	  
		  <!-- 로그인한 뒤에 로그아웃으로 바뀌는 부분 --> 
		  <sec:authorize access="isAnonymous()">
			  <button type="button" class="nav-link text-white" onclick="location.href='login1?log=start'">로그인</button>
		  </sec:authorize>
		
		  <sec:authorize access="isAuthenticated()">
		  	  <form action="logout" method="POST">
		  		  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
				  <button type="submit" class="btn text-white" style="font-size:20px;">로그아웃</button>
			  </form>
		  </sec:authorize>
	  </div> 
	  
	</nav>
</div>
<!-- =============== MENU =============== -->

<!-- =============== DETAIL MENU =============== -->
<div id="myNav" class="overlay">

	<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
	
	<div class="overlay-content">
		<sec:authentication var="logid" property="principal.username" />
  		<a href="MySList?user_id=${logid}">내 가게</a>
  		<a href="MyOrderContent?user_id=${logid}">주문관리</a>
  		<a href="#">매출 관리</a>
  		<a href="#">리뷰 관리</a>
	</div>
</div>
<!-- =============== DETAIL MENU =============== -->
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>
function openNav() {
  document.getElementById("myNav").style.display = "block";
}

function closeNav() {
  document.getElementById("myNav").style.display = "none";
}
</script>
</body>
</html>