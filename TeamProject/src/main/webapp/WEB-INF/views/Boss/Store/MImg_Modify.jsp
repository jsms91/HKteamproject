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
img {
	width:250px; 
	height:250px;
} 
</style>
</head>

<body>
<div id="BMain"></div>
<br/><br/>

<div class="container form-group">
		<h3>현재이미지</h3>
		<div>
			<c:forEach items="${mImg}" var="dto">
		    <img src="/image/Menu/${dto.mImg}">
		    </c:forEach>
		</div>
	
		<form action="BMImgModify" method="post" enctype="multipart/form-data">
			<c:forEach items="${mImg}" var="dto">
				<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
				<input type="hidden" name="sNo" value="${dto.sNo}"/>
				
				<!-- 메뉴코드는 숨기기 -->
				<input type="hidden" name="mNo" value="${dto.mNo}">
				
				<input class="form-control" type="text" name="dImg" value="${dto.mImg}"><!-- 기존사진 삭제하기위해 받아오기 -->
				<br/>
				<input type="file" name="mImg">
				<br/><br/> 
				<input type="submit" class="btn btn-danger" value="수정">
			</c:forEach>
		</form>
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
	
	
	