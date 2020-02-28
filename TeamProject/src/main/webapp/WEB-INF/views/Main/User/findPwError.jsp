<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta id="_csrf" name="_csrf" content="${_csrf.token }"/>
<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>비밀번호 분실</title>
</head>
<body>

<form class="form-horizontal" id="frm1" action="findPwDo" method="post">
	<input type="hidden" name="${_csrf.parameterName}"	value="${_csrf.token}" /><br/>
	<label class="col-md-2 control-label">가입하실 때 사용한 아이디와 이메일을 입력해주세요</label>
    <div class="form-group" style="padding:3px;">    	
    	<div class="col-md-7">
           	<input type="text" class="form-control" id="userid" name="user_id" placeholder="아이디를 입력해주세요" required><br/>
        </div>
        <div class="col-md-7">
           	<input type="email" class="form-control" id="useremail" name="user_email" placeholder="이메일을 입력해주세요" required><br/>
           	<b><span style="color:red;">아이디 혹은 이메일을 확인해주세요</span></b>
        </div>
	</div>
	<div class="col-sm-3" style="text-align:center;">
		<input id="btn1" type="submit" class="btn btn-warning" value="다음" />
	</div>    
</form>



<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>