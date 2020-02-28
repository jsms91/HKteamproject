<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta id="_csrf" name="_csrf" content="${_csrf.token}"/>
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>회원탈퇴 페이지</title>
</head>

<style>
.container {
	width : 800px;
	height : 1500px;
}
form {
	margin : auto; /*form위치를 컨테이너에서 가운데로*/
	margin-top : 100px;
	margin-bottom : 100px;
}
/*로고*/
#c1 {
	text-align : center;
}
#logo {
	font-size : 50px;
	color : #FF4848;
	font-weight : bolder; 
}

/*아이디,비밀번호...내용*/
#c2 {
	width : 450px;
	margin : auto;
}
#userid,#userpw,#userpw1,#name,#email,#phone,#text,#joinbtn {
	width : 450px;
	height : 50px;
}

textarea {
	width : 350px;
	margin : auto;
	border : 1px solid black;
}

/*필수,선택 이용약관*/
.article {
	width : 450px;
	margin : auto;
}
#a1 {
	width : 450px;
	height : 150px;
	overflow: auto;
	border : 1px solid gray;
}

a:hover,a:link,a:visited {
	 text-decoration: none; /*마우스 클릭, 갖다대기, 방문 등 효과 없애기 */
}
</style>
<body>
<sec:authentication var="logid" property="principal.username"/>
<input id="logid" type="hidden" name="logid" value="${logid}" />

<div class="container">
	<form action="memberDelDo" method="post">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>	
	<sec:authentication var="logid" property="principal.username"/>
	<input id="logid" type="hidden" name="logid" value="${logid}" />
		<div id="content">
			<div id="c1">
				<a id="logo" href="home">탈퇴 하시겠습니까?</a><br/><br/>
			</div>
			<div id="c2" style="text-align:center;">
				<input id="delbtn" class="mx mx-auto" type="submit" value="탈퇴"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input id="rebtn" class="mx mx-auto" type="button" onclick="location.href='mainFrame'" value="취소"/>
			</div>
		</div>
	</form>
</div>

<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>