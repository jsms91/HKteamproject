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
}
img {
	width : 70px;
	height : 70px;
}
#title {
	font-weight : 200px;
} 
</style>
</head>
<body>
<h1>가게 이미지 수정</h1>

<div class="container">
	<h3>가게 정보</h3>
	<table class="table table-bordered">
		<thead>
			<c:forEach items="${Smodify}" var="dto">
				<tr>
					<th id="title">현 가게 이미지</th>
					<td><img class="img-thumbnail" src="/image/Store/${dto.sImg}"></td>
				</tr>
			</c:forEach>
		</thead>
	</table>

	<form action="ImgModify" method="post" enctype="multipart/form-data">
		<c:forEach items="${Smodify}" var="dto">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
			<!-- 업체코드는 숨기기 -->
			<input type="hidden" name="sNo" value="${dto.sNo}">
			
			<input type="text" name="dImg" value="${dto.sImg}"><!-- 기존 사진 삭제하기 위해 받아오기 -->
			
			<input type="file" name="sImg">
			<br/><br/>
			<input class="btn btn-danger text-white" type="submit" value="업로드">	
		</c:forEach>
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