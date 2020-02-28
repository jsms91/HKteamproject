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
</head>
<style>
h1 { 
	text-align : center;
	margin-top : 20px;
}
.container {
	margin-top : 50px;
	margin-bottom : 50px; 
}
td {
	text-align : center;
}

#asName:hover {
	background-color : #EAEAEA;
}
</style>
<body>

<div id="MMain"></div>
<br/><br/>

<div id="MAList">
	<h1>전체 입점문의 목록</h1>
	
	<div class="container">
			<table class="table table-bordered">
				<tr>
					<td>#</td>
					<td>가게명</td>
					<td>카테고리</td>
					<td>등록일</td>
					<td>회원아이디</td>
					<td>처리상태</td>
				<tr>
				
				<c:forEach items="${applylist}" var="dto" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td id="asName"><a class="text-dark" href="ApplyDetail?asNo=${dto.asNo}">${dto.asName}</a></td>
					<td>${dto.asCategory}</td>
					<!-- 날짜형식으로 인해서 fmt 사용 -->
					<td><fmt:formatDate value="${dto.asDate}" pattern="yyyy년 MM월 dd일"/></td> 
					<td>${dto.user_id}</td>
					<td id="${status.count}">${dto.aStatus}</td>	
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
$("#MMain").load("ManagerHome"); 
</script>
</body>
</html>