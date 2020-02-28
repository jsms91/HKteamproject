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

<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container {
	margin-top : 50px;
	margin-bottom : 50px; 
}
td {
	text-align : center;
}

#OrderNo:hover {
	background-color : #EAEAEA;
}
</style>
</head>
<body>

<!-- header -->
<%@ include file="../BMain_view.jsp" %>
<br/>



<div>
	<div class="container">
			
		<table class="table table-bordered">
			<tr>
				<td>#</td>
				<td>주문번호</td>
				<td>주문상태</td>
				<td>총금액</td>
				<td>주문일</td>
			<tr>
			<c:forEach items="${StatusOrderList}" var="dto" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td id="OrderNo"><a class="text-dark" href="OrderDetail?oNo=${dto.oNo}">${dto.oNo}</a></td>
				<td id="Status${status.count}">${dto.oStatus}</td>
				<td>${dto.oAmount}</td>
				<!-- 날짜형식으로 인해서 fmt 사용 -->
				<td><fmt:formatDate value="${dto.oDate}" pattern="yyyy년 MM월 dd일"/></td>
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
</body>
</html>