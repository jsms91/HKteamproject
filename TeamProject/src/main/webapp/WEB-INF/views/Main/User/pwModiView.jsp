<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>비밀번호 변경</title>
</head>
<body>

<form class="form-horizontal" id="frm1" action="pwModiDo" method="post">
	<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" /><br/>
	<sec:authentication var="logid" property="principal.username"/>
	<input type="hidden" name="logid" value="${logid}" />   							
	<label class="col-md-2 control-label">변경하실 비밀번호를 입력해주세요</label>
    <div class="form-group" style="padding:3px;">    	
    	<div class="col-md-7">
           	<h5>새 비밀번호</h5>
			<input id="userpw1" class="form-control" type="password" name="user_pw" placeholder=" 비밀번호를 입력하세요."><br/>
        </div>
        <div class="col-md-7">
           	<h5>비밀번호확인</h5>
			<input id="userpw2" class="form-control" type="password" name="user_pw" placeholder=" 비밀번호를 입력하세요.">
        </div>
	</div>
	<div class="col-sm-3" style="text-align:center;">
		<input id="btn1" type="button" class="btn btn-warning" value="변경" />
	</div>    
</form>



<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
$(document).ready(function(){
	$("#btn1").click(function(){
		event.preventDefault();
		
		var pw1 = $("#userpw1").val();
		var pw2 = $("#userpw2").val();
		
		if(pw1 == pw2) {
			if(confirm("비밀번호를 변경하시겠습니까?")) {
				$("#frm1").submit();
				alert("변경되었습니다");
				window.close();			
			}
			else {
				return;
			}
		}
		else {
			alert("비밀번호가 일치하지 않습니다");
		}
	});
});
</script>

</body>
</html>