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
/* 스크롤 대표 메뉴 이미지*/
#Menu {
	width : 100%;
	border : 1px solid #BDBDBD;
}
#row {
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


/* 메인, 사이드메뉴 판*/
#MainMenu,#SideMenu {
	background-color : #efefef;
	height : 50px;
	display : table;
	width : 100%;
	cursor: pointer;
	border : 1px solid #BDBDBD; 
}
h5 {
	display : table-cell;
    vertical-align : middle;
    padding : 0px 0px 0px 30px;
}
#mimg {
	width : 100px;
	height : 100px;
}
#tr {
	height:100px;
    vertical-align : middle;
    width : 100%;
    border : 1px solid #BDBDBD;
}
#td1{
	width : 70%;
	text-align : left;
	padding : 0px 0px 0px 30px;
}
#td2 {
	width : 30%;
	text-align : right;
	padding : 0px 30px 0px 0px;
}
</style> 
</head>

<body>
<div id="MMain"></div>
<br/><br/>

<div class="container">
	
	<div id="Menu">
		<div id="row">		
			<c:forEach items="${MTList}" var="dto1">
			<div class="items">
				<img id="mImg" src="/image/Menu/${dto1.mImg}">
		    	<p class="card-title">${dto1.mName}</p>
		    	<p class="card-text">${dto1.mPrice}</p>
		    	<p class="card-text">${dto1.mInfo}</p>
			</div>
			</c:forEach>
		</div>
		
		
		<div id="MainMenu"><h5>메인메뉴</h5></div>
		<div id="mainmenu"> 
			<table style="width:100%">
				<c:forEach items="${MMList}" var="dto2">
				<tr id="tr">
					<td id="td1">
						<font><b>${dto2.mName}</b></font><br/>
						${dto2.mInfo}<br/>
						${dto2.mPrice}
					</td>					
					<td id="td2"><img id="mimg" src="/image/Menu/${dto2.mImg}"></td>
				</tr> 
				</c:forEach>
			</table>
		</div>
		
		
		<div id="SideMenu"><h5>사이드메뉴</h5></div>
		<div id="sidemenu"> 
			<table style="width:100%">
				<c:forEach items="${MSList}" var="dto3">
				<tr id="tr">
					<td id="td1">
						<font><b>${dto3.mName}</b></font><br/>
						${dto3.mInfo}<br/>
						${dto3.mPrice}
					</td>					
					<td id="td2"><img id="mimg" src="/image/Menu/${dto3.mImg}"></td>
				</tr> 
				</c:forEach>
			</table>
		</div>
		
	</div>
	
	<br/><br/>
	
</div> 

<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
//맨위에 헤더를 가져옴
$("#MMain").load("ManagerHome");

$(document).ready(function(){
	
	$("#mainmenu").show();
	$("#sidemenu").hide();
	
	$("#MainMenu").click(function(){
    	$("#mainmenu").slideToggle("slow");
	});
	
	$("#SideMenu").click(function(){
    	$("#sidemenu").slideToggle("slow");
	});
});
</script>
</body>
</html>