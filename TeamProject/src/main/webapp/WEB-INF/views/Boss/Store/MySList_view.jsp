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
h1 { 
	text-align : center;
	margin-top : 20px;
}
.container {
	margin-top : 50px;
	margin-bottom : 100px; 
}
td {
	text-align : center;
}
img {
	width : 100px;
	height : 100px; 
}
#sName:hover {
	background-color : #EAEAEA;
}
</style>
</head>

<body>
<div id="BMain"></div>
<br/><br/>

<div id="BSList">
	<h1>가게 목록</h1>
	
	<div class="container">
	
		<table class="table table-bordered">
			<tr>
				<td>번호</td>
				<td>가게명</td>
				<td>이미지</td>
				<td>등록일</td>
			<tr>
			
			<c:forEach items="${MySList}" var="dto">
			<tr>
				<td>${dto.sNo}</td>
				<!-- 가게 정보 상세보기 -->
				<td id="sName"><a class="text-dark" href="MySDetail?sNo=${dto.sNo}">${dto.sName}</a></td>
				
				<td><img class="img-thumbnail" src="/image/Store/${dto.sImg}"></td>
				<td>${dto.sDate}</td>
			<tr>
			 
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
$("#BMain").load("BossHome");
</script>

</body>
</html>