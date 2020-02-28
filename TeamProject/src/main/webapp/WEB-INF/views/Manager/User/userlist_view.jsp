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
<meta id="_csrf" name="_csrf" content="${_csrf.token }"/>

<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
h1 { 
	text-align : center;
	margin-top : 20px;
}
table {
	margin-top : 50px;
	text-align : center;
}
#user_id:hover {
	background-color : #EAEAEA;
}
</style>

</head>
<body>

<div id="MMain"></div>
<br/><br/>
<div id="uList">
	<h1>전체 회원목록</h1>

	<div class="container" style="height:1000px">
		<table class="table table-bordered">
			<tr>
				<td>#</td>
				<td>아이디</td>
				<td>이름</td>
				<td>회원코드</td>
				<td>가입일</td>
			<tr>
			
			<c:forEach items="${UserList}" var="dto" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td id="user_id"><a class="text-dark" href="UserDetail?user_no=${dto.user_no}" />${dto.user_id}</a></td>
				<td>${dto.user_name}</td>
				<td>${dto.user_code}</td>
				<td><fmt:formatDate value="${dto.user_date}" pattern="yyyy년 MM월 dd일"/></td>
				
			</tr>
			</c:forEach>
			
		</table>
	</div>
</div>


<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>
//맨위에 헤더를 가져옴
$("#MMain").load("ManagerHome"); 
</script>
</body>
</html>