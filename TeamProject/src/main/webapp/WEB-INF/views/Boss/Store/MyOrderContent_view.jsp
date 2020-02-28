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
</style>
</head>
<body>

<!-- header -->
<%@ include file="../BMain_view.jsp" %>
<br/>
 
<div> 
	<div class="container">      
		<h3 class="text-center"><b>오늘 매출</b></h3> 
		<!-- 전체이동 -->
		<sec:authentication var="logid" property="principal.username" /> 
		<a style="float:right;" href="AllOrderList?user_id=${logid}">
			<i class="fas fa-share text-danger" style="font-size:30px;"></i>
		</a>  
		<h2 id="TodayAmount" class="text-center text-primary pl-4"></h2>    
	</div>
</div>

<div>
	<div class="container"> 
		<div class="row">
			<sec:authentication var="logid" property="principal.username" /> 
			
			<div class="col-3 border" style="height:250px;"> 
					<h3 class="text-center pt-5">
						<a href="StatusOrderList?oStatus=주문처리중&user_id=${logid}"><b class="text-danger">새로운 주문</b></a>
					</h3> 
					<h2 id="NewOrder" class="text-center pt-3 text-danger"></h2>  
			</div>
			
			<div class="col-3 border" style="height:250px;">
				
					<h3 class="text-center pt-5">
						<a href="StatusOrderList?oStatus=준비중&user_id=${logid}"><b class="text-dark">준비중</b></a>
					</h3>
					<h2 id="ReadyOrder" class="text-center text-dark pt-3"></h2>
				
				
			</div>
			
			<div class="col-3 border" style="height:250px;">
				
					<h3 class="text-center pt-5 text-info">
						<a href="StatusOrderList?oStatus=배달중&user_id=${logid}"><b class="text-info">배달중</b></a>
					</h3> 
					<h2 id="DeliveryOrder" class="text-center pt-3 text-info"></h2>
							
			</div>
			
			<div class="col-3 border" style="height:250px;">
				
					<h3 class="text-center pt-5 text-success">
						<a href="StatusOrderList?oStatus=배달완료&user_id=${logid}"><b class="text-success">배달완료</b></a>
					</h3> 
					<h2 id="OrderEnd" class="text-center pt-3 text-success"></h2>
				
			</div>

		</div>
	</div>
</div>

<div>
	<div class="container">
		<table class="table table-bordered">
			<tr>
				<td>#</td>
				<td>주문번호</td>
				<td>주문자</td>
				<td>주문상태</td>
				<td>회원아이디</td>
				<td>총금액</td>
				<td>주문일</td>
			<tr>
			<c:set var = "total" value = "0" />
			<c:set var = "count" value = "0" />
			<c:forEach items="${MyStoreOrder}" var="dto" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td><a class="text-dark" href="OrderDetail?oNo=${dto.oNo}">${dto.oNo}</a></td>
				<td>${dto.oName}</td>
				<td id="Status${status.count}">${dto.oStatus}</td>
				<td>${dto.user_id}</td>
				<td>${dto.oAmount}</td>
				<!-- 날짜형식으로 인해서 fmt 사용 -->
				<td><fmt:formatDate value="${dto.oDate}" pattern="yyyy년 MM월 dd일"/></td>
			<tr>		
			
			<c:set var= "total" value="${total + dto.oAmount}"/>
			<c:set var= "count" value="${status.count}"/>
			</c:forEach>
			<input id="amount" type="hidden" value="<c:out value='${total}'/>"/>
			<input id="statuscount" type="hidden" value="<c:out value='${count}'/>"/>
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
$(document).ready(function() {
	//오늘 총 매출
	var amount = $("#amount").val();
	$("#TodayAmount").text(amount + " 원");
	
	//주문목록 길이
	var amount = $("#statuscount").val();
	console.log("길이 : " +amount);
	
	//주문처리 상태 개수 구하기
	var i;
	var a = 0;
	var b = 0;
	var c = 0; 
	var d = 0;
	
	for(i=1; i <= amount; i++) {
		
		if($("#Status"+i).text() == '주문처리중') {
			a++
			console.log("주문처리중 :  " + a);
		}
		if($("#Status"+ i).text() == '준비중') {
			b++
			console.log("준비중 :  " + b);
		}
		if($("#Status"+ i).text() == '배달중') {
			c++
		}
		if($("#Status"+ i).text() == '배달완료') {
			d++
		}
		
	} 
	
	$("#NewOrder").text(a); //새로운 주문
	$("#ReadyOrder").text(b); //준비중
	$("#DeliveryOrder").text(c); //배달중
	$("#OrderEnd").text(d); //배달완료
	
});
</script>
</body>
</html>