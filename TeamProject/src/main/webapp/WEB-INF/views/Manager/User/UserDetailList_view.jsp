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
</style>
</head>
<body>
<div id="MMain"></div>
<br/><br/>

<div class="container">
<c:forEach items="${UserDetail}" var="dto">
	<h3><b id="name">${dto.user_name}</b> 회원 상세정보</h3>
	<table class="table table-bordered">
		<thead>

				<tr>
					<th id="title">회원번호</th><td>${dto.user_no}</td>
				</tr>
				
				<tr>
					<th id="title">아이디</th><td>${dto.user_id}</td>
				</tr>
				
				<tr>
					<th id="title">이름</th><td>${dto.user_name}</td>
				</tr>
				
				<tr>
					<th id="title">성별</th><td>${dto.user_sex}</td>
				</tr>   
				
				<tr>
					<th id="title">이메일</th><td>${dto.user_email}</td>
				</tr>  
				
				<tr>
					<th id="title">전화번호</th><td>${dto.user_phone}</td>
				</tr>    
				
				<tr>
					<th id="title">자기소개</th><td>${dto.user_profile}</td>
				</tr>   
				
				<tr>
					<th id="title">필수동의여부</th><td>${dto.user_ag1}</td>
				</tr>   
				
				<tr>
					<th id="title">선택동의여부</th><td>${dto.user_ag2}</td>
				</tr>    
				
				<tr>
					<th id="title">가입일</th><td><fmt:formatDate value="${dto.user_date}" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초"/></td>
				</tr>
				
				<tr>
					
					<th id="title"> 회원코드</th>
					<td>${dto.user_code}</td>
				</tr> 

		</thead>
	</table>
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
</script>
</body>
</html>