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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container {
	width : 800px;
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
#userid,#userpw,#name,#email,#phone,#text,#joinbtn {
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
</head>
<body>
<div class="container">
	<form id="joinForm" name="Form" action="join" method="post">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
		<div id="content">
		
			<div id="c1">
				<a id="logo" href="home">HK라이더스</a><br/><br/>
			</div>
			
			<div id="c2">
				<h5>아이디</h5>
				<input id="userid" type="text" name="user_id" placeholder=" 아이디를 입력하세요."><br/>
				<b><span id="userid1"></span></b>
			</div>
			
			<br/>
			
			<div id="c2">
				<h5>비밀번호</h5>
				<input id="userpw" type="password" name="user_pw" placeholder=" 비밀번호를 입력하세요."><br/>
			</div>
			
			<br/>
			
			<div id="c2">
				<h5>이름</h5>
				<input id="name" type="text" name="user_name" placeholder=" 이름을 입력하세요."><br/>
				성별 <br/> 
				남  <input id="sex" type="checkbox" name="user_sex" value="남" onclick="doOpenCheck(this)"> &nbsp; &nbsp; 
				여  <input id="sex" type="checkbox" name="user_sex" value="여" onclick="doOpenCheck(this)"> <br/>
			</div>
			
			<br/>
			
			<div id="c2">
				<h5>이메일</h5>
				<input id="email" type="email" name="user_email" required placeholder=" ex) ooooo@naver.com">
			</div>
			
			<br/>
			
			<div id="c2">
				<h5>전화번호</h5>
				<input type="tel" id="phone" name="user_phone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required placeholder="000-0000-0000">
			</div>
			
			<br/>
			
			<div id="c2">
				<h5>자기소개</h5>
				<textarea id="text" name="user_profile" placeholder="100자이내로 작성해주세요." ></textarea>
			</div>
						
			
			<br/><br/>
			
			<div class="article">
				<input id="ag1" type="checkbox" name="user_ag1" value="ok">라이더스 이용약관 동의(필수)<br/>
  				<div id="a1">
					<p class="article_title">회원가입하시는 여러분을 환영합니다.</p>
					<p class="article_text">
					라이더스는 수시로 본 약관, 계정 및 게시물 운영정책을 개정할 수 있습니다만, 관련 법령을 위배하지 않는 범위 내에서 개정할 것이며,
	     			사전에 그 개정 이유와 적용 일자를 서비스 내에 알리도록 하겠습니다. 또한 여러분에게 불리할 수 있는 중대한 내용의 약관 변경의 경우에는
	     			최소 30일 이전에 해당 서비스 내 공지하고 별도의 전자적 수단(전자메일, 서비스 내 알림 등)을 통해 개별적으로 알릴 것입니다.
					</p>
				</div>
				
				<br/>
				
				<input id="ag2" type="checkbox" name="user_ag2" value="ok">위치서비스 이용약관 동의(선택)<br/>
  				<div id="a1">
					<p class="article_title">위치서비스 이용약관 안내.</p>
					<p class="article_text">
					라이더스는 수시로 본 약관, 계정 및 게시물 운영정책을 개정할 수 있습니다만, 관련 법령을 위배하지 않는 범위 내에서 개정할 것이며,
	     			사전에 그 개정 이유와 적용 일자를 서비스 내에 알리도록 하겠습니다. 또한 여러분에게 불리할 수 있는 중대한 내용의 약관 변경의 경우에는
	     			최소 30일 이전에 해당 서비스 내 공지하고 별도의 전자적 수단(전자메일, 서비스 내 알림 등)을 통해 개별적으로 알릴 것입니다.
					</p>
				</div>
				
			</div>

			<br/><br/>
			
			<div id="c2">
				일반고객  <input id="code" type="checkbox" name="user_code" value="CUSTOM" onclick="doOpenCheck1(this)"> &nbsp; &nbsp; 
				사장고객 <input id="code" type="checkbox" name="user_code" value="BOSS" onclick="doOpenCheck1(this)"> <br/>
				<input id="joinbtn" class="mx mx-auto" type="button" value="가입">
			</div>
			<br/><br/> 
		
		</div>
	</form>
</div>


<!-- footer -->
<footer id="footer"></footer>
<br/><br/>

<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- 주소 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
//footer 가져오기
$("#footer").load("footer");


//성별 체크박스
function doOpenCheck(chk){
    var obj = document.getElementsByName("user_sex");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
    }
}

//이용자 유형 체크박스
function doOpenCheck1(chk){
    var obj = document.getElementsByName("user_code");
    for(var i=0; i<obj.length; i++){
        if(obj[i] != chk){
            obj[i].checked = false;
        }
    }
}

var join = false;//가입버튼누를떄 바로 submit하는거 막음

$(document).ready(function() {
	 
    
	$("#joinbtn").click(function() {
	
		if(join) {
			
			if(!document.Form.user_pw.value) { //비밀번호 입력여부
				alert("비밀번호를 입력하지 않았습니다.");
				$("#userpw").focus();
				return false;
			}
			
			if(!document.Form.user_name.value) { //비밀번호 입력여부
				alert("이름을 입력하지 않았습니다.");
				$("#name").focus();
				return false;
			}
			
			if($("input:checkbox[name=user_sex]").is(":checked") == false) { //체크박스 체크여부 (name만 바꿔주면된다.)
				alert("성별을 선택하지 않았습니다.");
				$("#sex").focus();
				return false;
			} 
			
			if(!document.Form.user_email.value) { //비밀번호 입력여부
				alert("이메일을 입력하지 않았습니다.");
				$("#email").focus();
				return false;
			}
			
			if(!document.Form.user_phone.value) { //비밀번호 입력여부
				alert("전화번호를 입력하지 않았습니다.");
				$("#phone").focus();
				return false;
			}
			if(!document.Form.user_profile.value) { //비밀번호 입력여부
				alert("자기소개를 입력하지 않았습니다.");
				$("#text").focus();
				return false;
			}
			
			if($("input:checkbox[name=user_code]").is(":checked") == false) { //체크박스 체크여부 (name만 바꿔주면된다.)
				alert("이용자 유형을 선택하지 않았습니다.");
				$("#code").focus();
				return false;
			} 
			
			if($("input:checkbox[name=user_ag1]").is(":checked") == false) { //체크박스 체크여부 (name만 바꿔주면된다.)
				alert("필수항목은 반드시 체크해야 합니다.");
				return false;
			}   
			
			else {
				if($("input:checkbox[name=user_ag2]").is(":checked") == false) {
					$("input:checkbox[name=user_ag2]").val("no");
					$("input:checkbox[name=user_ag2]").prop("checked", true);
					
					$("#joinForm").submit();
				} 
				else {
					$("#joinForm").submit();
				}
				
			}
			
		}
		
		if(!join) {
			alert("아이디 중복체크를 해주세요."); //아이디중복체크를 하지 않는이상 가입이 되지 않는다.
			$("#userid").focus();
			return false;
		}
		
	});
	
	//아이디 중복체크 버튼없이 아이디 중복 알려주는거
	$("#userid").blur(function() {
		
		if(!document.Form.user_id.value) { //아이디 중복체크시 아이디 값이 없으면 중복체크 불가능하게 함
			$("#userid1").css("color","red");
			$("#userid1").html("아이디를 입력하지 않았습니다.");
			$("#userid").focus();
			return false;
		}
		
		$.ajax({
			
			url:"IdCheck",
			type:"post",
			data:{
				user_id:$("#userid").val()
			},
			
			beforeSend : function(xhr, settings) { //xhr은 XmlHttpRequest객체
	            xhr.setRequestHeader("X-CSRF-TOKEN", $("meta[name='_csrf']").attr('content'));
	         },
		
			success:function(data) {
				if(data=="ok") {
					
					$("#userid1").css("color","green");
					$("#userid1").html("사용가능한 아이디입니다.");//모달로 띄어도 상관없음
					//$("#userid").attr("readonly",true); //아이디 중복확인시 아이디 재입력 되지 않게하기 
					join = true;//join을 true로 해서 submit가 가능하게함
				}
				if(data=="no") {
					$("#userid1").css("color","red");
					$("#userid1").html("이미 사용중인 아이디입니다.");
					join = false;
					$("#userid").val("");
					$("#userid").focus();
				}
				
			}
			
		});
		
		
	}); //아이디 중복체크 ajax
	
});

</script>
</body>
</html>