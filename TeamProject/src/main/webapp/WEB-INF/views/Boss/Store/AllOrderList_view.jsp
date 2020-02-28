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
<!-- datepicker -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.container {
	margin-top : 50px;
	margin-bottom : 50px; 
}
#datepicker, #datepicker1 {
	height : 40px; 
	text-align : center;
}
</style>

</head>
<body>

<!-- header -->
<%@ include file="../BMain_view.jsp" %>
<br/>

<div>
	<div id="ordercontainer" class="container">
		<!-- 날짜 조회 -->
		<form action="AllOrderCheck" method="post">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
			<sec:authentication var="logid" property="principal.username"/>
			<input type="hidden" name="user_id" value="${logid}" />
			<input type="text" name="oDate" id="datepicker" placeholder="날짜넣기" />
				<b class="mb-5" style="font-size:35px;">  ~  </b>  
			<input type="text" name="oDate1" id="datepicker1" placeholder="날짜넣기" />
			&nbsp;&nbsp;
			<input class="btn bg-danger text-white mb-1" type="submit" value="조회" style="height:40px;"/> 
		</form>
	</div>
	
	<div class="container">
		<table class="table table-bordered">
			<tr>
				<td>#</td>
				<td>주문번호</td>
				<td>총금액</td>
				<td>회원아이디</td>
				<td>처리상태</td>
				<td>주문일</td>
			<tr>
		
			<c:forEach items="${All}" var="dto" varStatus="status">
			<tr>
				<td>${status.count}</td>
				<td>${dto.oNo}</td>
				<td>${dto.oAmount}</td>
				<td>${dto.user_id}</td>
				<td>${dto.oStatus}</td>
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
<!-- datepicker -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$(document).ready(function() {
	var date = new Date(); 
	var year = date.getFullYear(); 
	var month = new String(date.getMonth()+1); 
	var day = new String(date.getDate()); 

	// 한자리수일 경우 0을 채워준다. 
	if(month.length == 1){ 
	  month = "0" + month; 
	} 
	if(day.length == 1){ 
	  day = "0" + day; 
	} 

	$("#datepicker").val(year + "-" + month + "-" + day);
	$("#datepicker1").val(year + "-" + month + "-" + day);
	
	$("#datepicker").datepicker({
		dateFormat:"yy-mm-dd"
	}); 
	$("#datepicker1").datepicker({
		dateFormat:"yy-mm-dd"
	});
	
});
</script>
</body>
</html>