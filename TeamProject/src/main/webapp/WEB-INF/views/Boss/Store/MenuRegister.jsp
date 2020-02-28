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
</head> 
<body>
<div id="BMain"></div>
<br/><br/>

<div class="container">
	<form id="MRegister" action="MRegister" method="post" enctype="multipart/form-data"> 
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
	
	<c:forEach items="${sNo}" var="dto">
		<!-- 업체번호 받아서 자동입력 -->
		<input type="hidden" name="sNo" value="${dto.sNo}" />  
	</c:forEach>
	
	<div class="form-group"> 
		<label>이름</label>
	    <input type="text" class="form-control" name="mName"><br/>
	    
	    <label>가격</label>
	    <input type="text" class="form-control" name="mPrice"><br/>
	    
	    <label>사진</label><br/> 
	    <input type="file" name="mImg"><br/><br/> 
	    
	    <select name="mTitle1" class="form-control">
		    <option value="메인">메인</option>
		    <option value="사이드">사이드</option>
		</select>
		
		<br/><br/>
		
		<select name="mTitle2" class="form-control">
			<option value="">일반메뉴</option>
		    <option value="대표메뉴">대표메뉴</option>
		</select>
	    
	    <br/>
	    
		<label for="comment">설명</label>
		<textarea class="form-control" rows="3" name="mInfo"></textarea>
	</div>
	
	<input type="submit" class="btn btn-danger text-white" value="등록" />
	
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