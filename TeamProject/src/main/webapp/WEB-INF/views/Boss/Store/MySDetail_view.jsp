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
</style>
</head>

<body>
<div id="BMain"></div>
<br/><br/>

<div id="BSDetail" class="container">

  <form action="BSModify" method="post">
  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
  
  <c:forEach items="${MySDetail}" var="dto">
  <input type="hidden" name="sNo" value="${dto.sNo}">
  <input type="hidden" name="user_id" value="${dto.user_id}">
	<h3><b id="name">업체번호${dto.sNo}번 ${dto.sName}</b> 가게 상세정보</h3>
	<table class="table table-bordered">
		<thead>
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
					<td>
						<select name="sTip">
						    <option value="${dto.sTip}">배달팁</option>
						    <option value="0">없음</option>
						    <option value="1000">1000원</option>
						    <option value="2000">2000원</option>
						    <option value="3000">3000원</option>
						    <option value="4000">4000원</option>
						    <option value="5000">5000원</option>
						</select>
					</td>
				</tr>   
				
				<tr>
					<th id="title">최소주문금액</th><td>${dto.mPrice}</td>
					<td>
						<input type="number" name="mPrice" placeholder="최소주문가격(최대 3만원)" min="0" max="30000" step="1000" value="0">
					</td>
				</tr>   
				
				<tr>
					<th id="title">회원 아이디</th><td>${dto.user_id}</td>
				</tr>   
				
				<tr>
					<th id="title">등록일</th><td><fmt:formatDate value="${dto.sDate}" pattern="yyyy년 MM월 dd일 "/></td>
				</tr>   
				
		</thead>
	</table>

	<a class="btn btn-danger text-white" href="BMenuList?sNo=${dto.sNo}">메뉴</a>&nbsp;&nbsp;&nbsp;
	<input type="submit" class="btn btn-danger text-white" value="수정" />
		
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