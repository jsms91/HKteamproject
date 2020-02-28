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
form {
	border:1px solid gray;
	text-align : center;
}
input {
	text-align : center;
}
#row {
	margin : auto;
	border : 2px solid red;
    white-space: nowrap;/* 가로스크롤시 중요한 속성 */
    overflow-x: auto;
    overflow-y: hidden;
    padding: 10px 10px 5px;
    background: #efefef;
}
#row .items {
	display: inline-block;
	margin-left: 10px;
    width: 150px;
}
#mImg {
	width: 150px;
	height : 150px;
}
</style> 
</head>

<body>
<div id="BMain"></div> 
<br/><br/>

<div>
	<!-- 대표메뉴 리스트 -->
	<h3 style="text-align:center;">대표메뉴</h3>
	<br/>
	
	<div id="row" class="container">
		<c:forEach items="${MTList}" var="dto1">
		<div class="items">
			<img id="mImg" src="/image/Menu/${dto1.mImg}">
	    	<p class="card-title">${dto1.mName}</p>
	    	<p class="card-text">${dto1.mPrice}</p>
	    	<p class="card-text">${dto1.mInfo}</p>
		</div>
		</c:forEach>
	</div>
</div> 
<br/><br/>
<div>
	<div class="container">
		<table class="table table-bordered">
	
			<tr>
				<td class="bg-danger text-center text-white">메인메뉴</td>
				<td class="bg-danger text-center text-white">사이드메뉴</td> 
			</tr>
			 
			<tr style="border:1px solid blue;">
				<!-- 메인메뉴 리스트 -->
				<td>
				<c:forEach items="${MMList}" var="dto2">
					<form class="form-group" action="MenuModify" method="post">
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
						<input type="hidden" name="mNo" value="${dto2.mNo}" />
						<input class="form-control" type="text" name="mName" value="${dto2.mName}"/>
						<input class="form-control" type="text" name="mPrice" value="${dto2.mPrice}"/>
		 				<textarea class="form-control" name="mInfo" rows="3">${dto2.mInfo}</textarea>
						
						<a href="MImgModify?mNo=${dto2.mNo}">
							<img id="mImg" class="img-thumbnail" src="/image/Menu/${dto2.mImg}">
						</a><b>이미지 클릭</b><br/><br/>
						
						<input type="hidden" name="sNo" value="${dto2.sNo}"/>
	 					<input type="submit" class="btn btn-danger text-white" value="수정"/>&nbsp;&nbsp;
						<a id="Menubtn" class="btn btn-danger text-white" href="MenuDelete?mNo=${dto2.mNo}&mImg=${dto2.mImg}">삭제</a>
				
					</form> 
					</c:forEach> 
				</td> 
				
				<!-- 사이드 메뉴 리스트 --> 
				<td>
					<c:forEach items="${MSList}" var="dto3">
					<form class="form-group" action="MenuModify" method="post">
					
						<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
						<input type="hidden" name="mNo" value="${dto3.mNo}" />
						<input class="form-control" type="text" name="mName" value="${dto3.mName}"/>
						<input class="form-control" type="text" name="mPrice" value="${dto3.mPrice}"/>
						<textarea class="form-control" name="mInfo" rows="3">${dto3.mInfo}</textarea>
						
						<a href="MImgModify?mNo=${dto3.mNo}">
							<img id="mImg" class="img-thumbnail" src="/image/Menu/${dto3.mImg}">
						</a><b>이미지 클릭</b><br/><br/>
						
						<input type="hidden" name="sNo" value="${dto3.sNo}"/>
						<input type="submit" class="btn btn-danger text-white" value="수정"/>&nbsp;&nbsp;
						<a id="Menubtn" class="btn btn-danger text-white" href="MenuDelete?mNo=${dto3.mNo}&mImg=${dto3.mImg}">삭제</a>
						
					</form>
					</c:forEach>
				</td>
				
			</tr>

		</table>
		
		<c:forEach items="${MySNo}" var="dto">
			<input type="hidden" value="${dto.sNo}"/>
			<a class="btn btn-danger text-white" href="MenuRegister?sNo=${dto.sNo}">메뉴등록</a>&nbsp;&nbsp;&nbsp;
		</c:forEach>
		 
	</div>
</div>
<br/><br/>
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