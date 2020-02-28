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
<!-- 로그인,로그아웃 버튼에 사용하는 시큐리티 태그라이브러리 추가 -->
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script> 

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 로그인 버튼 */
#logbtn1, #logbtn2 {
	background-color: #FF4848;
}
 
/*헤더1(로그인,회원가입,로고)*/
#logo {
	color : white;
	margin-left : auto;
	margin-top : 15px;
}
.navbar-nav {
	margin-top : 15px;
}
nav {
	height : 100px;
	background-color : #FF4848;
}
</style>
</head>
<body>

<!-- header1 : 로그인 | 회원가입 | 로고(홈링크) -->
<nav class="navbar navbar-expand-sm navbar-dark">
	<div class="container">
 		<ul class="navbar-nav">
	   		<li class="nav-item active">
	   			<!-- 로그인한 뒤에 로그아웃으로 바뀌는 부분 -->
	   			<sec:authorize access="isAnonymous()">
  						<button type="button" class="btn btn-lg" style="color:#FFFFFF;"
  								onclick="location.href='../login1?log=start'">로그인</button>
				</sec:authorize>
				<sec:authorize access="isAuthenticated()">   							
					<form action="../logout" method="POST">
       					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
       					<button type="submit" class="btn btn-lg" style="color:#FFFFFF;">로그아웃</button>
   					</form>
  					</sec:authorize>
	   		</li>
	   		
		    <li class="nav-item">
		    	<sec:authorize access="isAnonymous()">
 					<button type="button" class="btn btn-lg" style="color:#FFFFFF;" onclick="location.href='../join_view'">회원가입</button>
 				</sec:authorize>
 				
 				<sec:authorize access="isAuthenticated()">
					<form action="../memberModify" method="POST">
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
						<button id="btn-mod" type="submit" class="btn btn-lg" style="color:#FFFFFF;">정보수정</button>
						<sec:authentication var="logid" property="principal.username"/>
						<input type="hidden" name="logid" value="${logid}" />   							
  					</form>
				</sec:authorize>				
		    </li>
		    <li>
		    	<sec:authorize access="isAuthenticated()">
		    		<sec:authentication var="logid" property="principal.username"/>
					<a class="btn btn-lg" style="color:#FFFFFF;" href="../MyOrderInfo?user_id=${logid}">주문내역</a>
				</sec:authorize>
		    </li>
		    
 		</ul>
 		<a id="logo" href="../home" style="margin:auto;" class="pt-3"><h3>HK라이더스</h3></a>  
 		<a id="logo" href="../cart"><h3 class="fas fa-shopping-cart text-white"></h3></a> 
 	</div>
</nav>


<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>