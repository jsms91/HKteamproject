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
<title>회원정보변경</title>
</head>
<style>
.container {
	width : 800px;
	height : 1500px;
}
form {
	margin : auto; /*form위치를 컨테이너에서 가운데로*/
	margin-top : 100px;
	margin-bottom : 100px;
}
/*로고*/
#c1 {
	text-align : center;
}
#logo {
	font-size : 50px;
	color : #FF4848;
	font-weight : bolder; 
}

/*아이디,비밀번호...내용*/
#c2 {
	width : 450px;
	margin : auto;
}
#userid,#userpw,#userpw1,#name,#email,#phone,#text,#joinbtn {
	width : 450px;
	height : 50px;
}

textarea {
	width : 350px;
	margin : auto;
	border : 1px solid black;
}

/*필수,선택 이용약관*/
.article {
	width : 450px;
	margin : auto;
}
#a1 {
	width : 450px;
	height : 150px;
	overflow: auto;
	border : 1px solid gray;
}

a:hover,a:link,a:visited {
	 text-decoration: none; /*마우스 클릭, 갖다대기, 방문 등 효과 없애기 */
}
</style>
<body>

<div class="container">
	<form id="modForm" name="modForm" action="memberModiDo" method="post">
		<sec:authentication var="logid" property="principal.username"/>
		<input id="logid" type="hidden" name="logid" value="${logid}" />
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>	
			<div id="content">
				<c:forEach items="${ modi1 }" var="dto">
				<div id="c1">
					<a id="logo" href="home">회원정보수정</a><br/><br/>
				</div>
				<div id="c2">
					<h5>아이디</h5>
					<b><span id="idArea">
	   					${logid}
					</span></b>
				</div>
				
				<br/>
				
				<div id="c2">
					<input id="pwModi" type="button" name="pwModiBtn" value="비밀번호 변경"/><br/>
				</div>
				
				<br/>
				
				<div id="c2">
					<h5>이름</h5>
					<input id="name" type="text" name="user_name" placeholder=" 이름을 입력하세요." value="${ dto.user_name }"><br/>
					성별 <br/>
					<input type="hidden" id="user_sex" value="${ dto.user_sex }" />
					남  <input id="sex_male" type="checkbox" name="user_sex1" value="남" onclick="doOpenCheck(this)"> &nbsp; &nbsp; 
					여  <input id="sex_female" type="checkbox" name="user_sex1" value="여" onclick="doOpenCheck(this)"> <br/>
				</div>
				
				<br/>
				
				<div id="c2">
					<h5>이메일</h5>
					<input id="email" type="email" name="user_email" value="${ dto.user_email }" placeholder=" ex) ooooo@naver.com">
				</div>
				
				<br/>
				
				<div id="c2">
					<h5>전화번호</h5>
					<input type="tel" id="phone" name="user_phone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" value="${ dto.user_phone }" required placeholder="000-0000-0000">
				</div>
				
				<br/>
				
				<div id="c2">
					<h5>자기소개</h5>
					<textarea id="profile" name="user_profile" placeholder="100자이내로 작성해주세요." >${ dto.user_profile }</textarea>
				</div>
				<br/>
				<div id="c2">
					<input id="modbtn" class="mx mx-auto" type="submit" value="변경">	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a id="memDel" href="memDelView">탈퇴</a>		
				</div>
				</c:forEach>
				<br/><br/> 
			</div>
	</form>
</div>



<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
function doOpenCheck(chk){
    var obj = document.getElementsByName("user_sex");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
    }
}

$(document).ready(function() {
	var user_sex = $("#user_sex").val();

	if(user_sex == "남"){
		$("#sex_male").prop("checked", true);
	}
	else if(user_sex == "여"){
		$("#sex_female").prop("checked", true);
	}
	
	
	$("#modbtn").click(function() {
		event.preventDefault();
		
		if($("#modForm").submit()) {
			if($("#name").val() == null) {
				alert("이름을 입력하지 않았습니다.");
				$("#name").focus();
				return false;
			}
						
			if($("input:checkbox[name=user_sex1]").is(":checked") == false) { //체크박스 체크여부 (name만 바꿔주면된다.)
				alert("성별을 선택하지 않았습니다.");
				$("#sex_male").focus();
				return false;
			} 
			
			if($("#email").val() == null) {
				alert("이메일을 입력하지 않았습니다.");
				$("#email").focus();
				return false;
			}
			
			if($("#phone").val() == null) {
				alert("전화번호를 입력하지 않았습니다.");
				$("#phone").focus();
				return false;
			}
			if($("#profile").val() == null) { //비밀번호 입력여부
				alert("자기소개를 입력하지 않았습니다.");
				$("#profile").focus();
				return false;
			}
			else {
				if(confirm("회원정보를 변경하시겠습니까?")) {
					alert("변경되었습니다");	
					return true;
				}
				else {
					return;
				}				
			}			
		}
	});
	
	$("#pwModi").click(function(){
		
		var popUrl = "pwModiView";	//팝업창에 출력될 페이지 URL
		var popOption = "width=450, height=300, resizable=no, scrollbars=no, status=no;";    //팝업창 옵션(optoin)
		
		window.open(popUrl,"",popOption);
	});
	
	
});

</script>
</body>
</html>