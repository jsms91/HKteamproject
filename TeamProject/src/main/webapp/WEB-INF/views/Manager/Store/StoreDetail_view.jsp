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
h3 {
	margin-top : 35px;
}
#name {
	color : blue; 
}
table {
	margin-top : 40px;
}
td {
	text-align : center;
}
#title {
	font-weight : 200px;
} 
#link:hover {
	color :red;
}
a {
	color : black;
}
a:hover {
	text-decoration:none;
	color : black;
}
</style>
</head>

<body>
<div id="MMain"></div>
<br/><br/>

<div id="MSDetail" class="container">
  <c:forEach items="${StoreDetailList}" var="dto">
	<h3><b id="name">업체번호${dto.sNo}번 ${dto.sName}</b> 가게 상세정보</h3>
	<table class="table table-bordered">
		<thead>
				<!-- 파일삭제하기 위해 필요 -->
				<input type="hidden" name="sImg" value="${dto.sImg}">
				<tr>
					<th id="title">업체번호</th><td>${dto.sNo}</td>
				</tr>
				
				<tr>
					<th id="title">가게명</th><td>${dto.sName}</td>
				</tr>
				
				<tr>
					<th id="title">대표자</th><td>${dto.bName}</td>
				</tr>
				
				<tr>
					<th id="title">사업자번호</th><td>${dto.bNo}</td>
				</tr>  
				
				<tr>
					<th id="title">주소</th><td>${dto.sAd}</td>
				</tr>    
				
				<tr>
					<th id="title">가게전화번호</th><td>${dto.sPhone}</td>
				</tr>   
				
				<tr>
					<th id="title">카테고리</th><td>${dto.sCategory}</td>
				</tr>   
				
				<tr>
					<th id="title">배달팁</th><td>${dto.sTip}</td>
				</tr>   
				
				<tr>
					<th id="title">최소주문금액</th><td>${dto.mPrice}</td>
				</tr>   
				
				<tr>
					<th id="title">회원 아이디</th><td>${dto.user_id}</td>
				</tr>   
				
				<tr>
					<th id="title">등록일</th><td><fmt:formatDate value="${dto.sDate}" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초"/></td>
				</tr>   
		</thead>
	</table>

	<a class="btn btn-danger text-white" href="StoreMenu?sNo=${dto.sNo}">메뉴보기</a>&nbsp;&nbsp;&nbsp;
	<a class="btn btn-danger text-white" onclick='ModifyFunction(${dto.sNo})'>가게내용수정</a>&nbsp;&nbsp;&nbsp;
	<a class="btn btn-danger text-white" onclick='ImgModifyFunction(${dto.sNo})'>가게이미지수정</a>&nbsp;&nbsp;&nbsp;
	<a class="btn btn-danger text-white" href="StoreDelete?sNo=${dto.sNo}&sImg=${dto.sImg}">가게삭제</a>

		
  </c:forEach>
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

//가게수정
function ModifyFunction(dto) {
	console.log("dto : " + dto);
	$("#MSDetail").load("RegisterContent?sNo=" + dto);
}

//이미지 수정
function ImgModifyFunction(dto) {
	console.log("dto : " + dto);
	$("#MSDetail").load("RegisterImgContent?sNo=" + dto);
}

</script>
</body>
</html>