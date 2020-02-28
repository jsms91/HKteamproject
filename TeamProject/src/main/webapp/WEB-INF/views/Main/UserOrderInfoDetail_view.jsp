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
#ordercontainer {
	margin-top : 50px;
	margin-bottom : 250px;
}
</style>
</head>
<body>
<!-- header -->
<%@ include file="header.jsp" %>
<br/>

<h2 class="text-center mt-5 text-danger">주문 상세 내역</h2>
 
<div>
	<div id="ordercontainer" class="container">
		
		<h3>기본주문정보</h3>
		<table class="table table-bordered">
			<c:forEach items="${MyOrderInfoDetail}" var="dto">
				<thead>
					<tr>
						<th id="title">주문번호</th><td>${dto.oNo}</td>
					</tr>
					
					<tr>
						<!-- 날짜형식으로 인해서 fmt 사용 -->
						<th id="title">주  문  일</th><td><fmt:formatDate value="${dto.oDate}" pattern="yyyy년 MM월 dd일 "/></td>
					</tr>	
					
					<tr>
						<th id="title">총 주문 금액</th><td>${dto.oAmount}</td>
					</tr>	
					
					<tr>
						<th id="title">가게이름</th><td>${dto.osName}</td>
					</tr>
					
					<tr>
						<th id="title">주문자</th><td>${dto.oName}</td>
					</tr>
					
					<tr>
						<th id="title">기본주소</th><td>${dto.oAd1}</td>
					</tr>  
					
					<tr>
						<th id="title">상세주소</th><td>${dto.oAd2}</td>
					</tr>   
					
					<tr>
						<th id="title">전화번호</th><td>${dto.oPhone}</td>
					</tr>  
					
					<tr>
						<th id="title">요청사항</th><td>${dto.oText}</td>
					</tr>
					
					<tr>
						<th id="title">주문처리상태</th><td class="text-danger">${dto.oStatus}</td>
					</tr>	
				</thead>
			</c:forEach>
		</table>
		
		<br/><br/>
		
		<h3>주문 메뉴 상세 내역</h3>
		
		<table class="table table-bordered">
			
				<tr>
					<td id="title">#</td>
					<td id="title">메뉴이름</td>
					<td id="title">주문개수</td>
					<td id="title">가격</td>
				<tr>
				
				<c:forEach items="${MyOrderInfoDetail1}" var="dto" varStatus="status">
				<tr>
					<td>${status.count}</td>
					<td>${dto.omName}</td>
					<td>${dto.omStock}</td>
					<td>${dto.omPrice}</td>
				<tr>
				</c:forEach>
		</table>
	</div>
</div>

<!-- footer -->
<%@ include file="footer.jsp" %>
<br/><br/>
<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>