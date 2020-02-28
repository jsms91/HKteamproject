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
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>

<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
form {
	width : 500px;
	height : 500px;
	margin : auto;
	display : table;
	margin-top : 200px;
	margin-bottom : 250px;
}
#id1 {
	display : table-cell;
    vertical-align : middle;
    text-align : center;
}
#id,#pw {
	width : 350px;
	height : 50px;
}
#login {
	width : 350px;
	height : 50px;
	background-color : #FF4848;
	color : white;
	font-size : 25px;
	font-weight : bolder;
}
hr {
	border : 0.5px solid gray;
}
#logo {
	font-size : 50px;
	color : #FF4848;
	font-weight : bolder; 
    cursor:pointer; /*커서포인트 마우스 대면 커서모양 변함*/
}
a:hover,a:link,a:visited {
	 text-decoration: none; /*마우스 클릭, 갖다대기, 방문 등 효과 없애기 */
}
</style>
</head>
<body>

<div class="container">
	<form id="loginForm" action="login" method="POST">
	<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" /><br/>
		<div id="id1">
			<a id="logo" href="home">HK라이더스</a><br/><br/><br/>
			<div>
				<input id="id" type="text" name="user_id" placeholder="  아이디">
			</div>
			<br/>
			<div>
				<input id="pw" type="password" name="user_pw" placeholder="  비밀번호">
			</div>
			
			<br/>
			
			<div>
				<input id="login" type="submit" value="로그인">
			</div>
			
			<br><hr/><br/>
			<input id="remember_me" name ="_spring_security_remember_me" type="checkbox"/>Remember me
			
			<div>
				<a id="findIdView" href="#">아이디 찾기</a>&nbsp;&nbsp;
				<a id="findPwView" href="#">비밀번호 찾기</a>&nbsp;&nbsp;<a href="join_view">회원가입</a>
			</div>
			
			<br/>	
			
			<div id="naver_id_login" style="text-align:center">
				<a href="${url}">
					<img width="250px" src="resources/MainImg/네이버.png"/>
				</a>
			</div>
			
		</div>
	</form>
</div>

<!-- footer (위치 수정해야함) -->
<div id="footer"> 
	<%@ include file="footer.jsp" %> 
</div>
<br/><br/>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>

$(document).ready(function(){
	/*
	$("#loginForm").submit(function(){
		event.preventDefault(); 
		
		$.ajax({
			url : $("#loginForm").attr("action"),
			type : $("#loginForm").attr("method"),
			data : $("#loginForm").serialize(), //서버로 보내는 데이터
			dataType : "text", //응답데이터형 
			beforeSend : function(xhr, settings) { //xhr은 XmlHttpRequest객체
				xhr.setRequestHeader("X-CSRF-TOKEN", $("meta[name='_csrf']").attr('content'));
			},
			success : function(data) {
				alert("로그인 성공");
				console.log(data);
				location.href = "home"; 
			},
			error : function() { //서버 에러
				alert("아이디 혹은 비밀번호가 맞지 않습니다.");
				location.href = "login1?log=start";
			}
		});		
	});*/
	
	$("#findIdView").click(function(){
		event.preventDefault();
		
		var popUrl = "findIdView";	//팝업창에 출력될 페이지 URL
		var popOption = "width=400, height=190, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		
		window.open(popUrl,"",popOption);
	});	
	
	$("#findPwView").click(function(){
		event.preventDefault();
		
		var popUrl = "findPwView";	//팝업창에 출력될 페이지 URL
		var popOption = "width=450, height=280, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		
		window.open(popUrl,"",popOption);
	});
});

</script>
</body>
</html>