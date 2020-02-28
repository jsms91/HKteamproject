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
<!-- datepicker -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<title>Insert title here</title>
<style>
#ordercard {
	width:50%;  
	margin-top : 30px;
}
#ordercontainer {
	margin-top : 50px;
	margin-bottom : 250px;
}
#datepicker, #datepicker1 {
	height : 40px; 
	text-align : center;
}
</style>
</head>

<body>
<!-- header -->
<%@ include file="header.jsp" %>
<br/>

<h2 class="text-center mt-5 text-danger">주문 내역</h2>
 
<div>
	<div id="ordercontainer" class="container">
		<!-- 날짜 조회 -->
		<form action="OrderDcheck" method="post">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
			<sec:authentication var="logid" property="principal.username"/>
			<input type="hidden" name="user_id" value="${logid}" />
			<input type="text" name="oDate" id="datepicker" placeholder="날짜넣기" />
				<b class="mb-5" style="font-size:35px;">  ~  </b>  
			<input type="text" name="oDate1" id="datepicker1" placeholder="날짜넣기" />
			&nbsp;&nbsp;
			<input class="btn bg-danger text-white mb-1" type="submit" value="조회" style="height:40px;"/> 
		</form>
		
		<c:forEach items="${MyOrderInfo}" var="dto" varStatus="status">
		<div id="ordercard" class="card">
    		<div class="card-body"> 
      			<p class="card-title"><b>주  문  일 :</b> <fmt:formatDate value="${dto.oDate}" pattern="yyyy년 MM월 dd일"/></p>
      			<p class="card-text"><b>주문번호 : </b>${dto.oNo}</p>
      			<p class="card-text"><b>주문처리상태 : </b>${dto.oStatus}</p>
      			<p class="card-text"><b>주문 총 금액 : </b>${dto.oAmount} 원</p>
      			<a class="btn bg-danger text-white" href="MyOrderInfoDetail?oNo=${dto.oNo}" style="float:right;">상세보기</a> 
			</div>
		</div> 
		</c:forEach>
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