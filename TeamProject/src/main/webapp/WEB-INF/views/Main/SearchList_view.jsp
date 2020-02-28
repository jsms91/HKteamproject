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
/* 가게내용 */
.card {
	width : 450px;
	height : 150px; 
	margin : auto;
}
#card {
	display : table;
	height : 100%;
}
#text {
	text-align : center;
	display : table-cell;
    vertical-align : middle;	
}
</style>
</head>
<body>
<!-- header -->
<%@ include file="header.jsp" %>
<br/>

<!-- 가게주소검색 -->
<%@ include file="AddressSection.jsp" %>
<br/>

<!-- 카테고리바 -->
<%@ include file="CategoryBar.jsp" %>
<br/><br/>

<div id="Category1" class="content">
	<!-- 메인에서 검색 + 전체보기 카테고리 --> 
	<div class="container" style="height:1000px;">
		<div class="row">	
		<c:forEach items="${searchlist}" var="dto">	
			<div class="list col-6 pl-5 pr-5"> 	
				<div class="card row">
					<div class="col-4">
						<a href="SearchMenuList?sNo=${dto.sNo}">
							<img src="/image/Store/${dto.sImg}" style="width:100%;height:148px;">
						</a>
					</div>
					
					<div id="card" class="col-8">
						<div id="text" class="container">
							<h3 class="title">${dto.sName}</h3>
							<p>최소주문가격 : ${dto.mPrice}</p>
							<p>배달팁 : ${dto.sTip}</p>
						</div>
					</div>
				</div><br/><br/>
			</div>
		</c:forEach>
		</div>
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