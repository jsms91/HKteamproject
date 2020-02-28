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
#ft1,#ft2 {
	bottom : 0; 
	width: 100%;
}
/*footer 바닥글*/
#ft1 {
	border : 1px solid gray;
}
#ft1_1 {
	display : table;
	height : 60px;
}
#ft1_2 {
    list-style:none;
    -webkit-padding-start:0px; /*ul왼쪽 여백 없애기*/
    display : table-cell;
    vertical-align : middle; 
}	
#ft1_3 {
    float: left; /* 리스트 가로정렬 */
}
a:hover,a:link,a:visited {
	 text-decoration: none; /*마우스 클릭, 갖다대기, 방문 등 효과 없애기 */
}
</style>
</head>
<body>

<div id="ft1">
	<div id="ft1_1" class="container">
		<ul id="ft1_2">
			<li id="ft1_3">
				<a class="text-secondary" href="#">이용약관</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			</li>
			<li id="ft1_3">
				<a class="text-secondary" href="#">개인정보방침</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			</li>
			<li id="ft1_3">
				<a class="text-secondary" href="#">회원등급 정책</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			</li>
			<li id="ft1_3">
				<a class="text-secondary" href="#">회사소개</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			</li>
			<li id="ft1_3">
				<a class="text-secondary" href="#">요기요 사장님</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
			</li>
			<li id="ft1_3">
				<a class="fab fa-facebook text-secondary" href="#"> 페이스북</a>
			</li>		
		</ul>
	</div>
</div>

<br/>

<div id="ft2" class="container">
	<h6><b>(주)HK라이더스</b></h6>
	<p style="font-size:15px;" class="text-secondary">
		서울 영등포구 양산로 53 월드메르디앙비즈센터 | 대표자 : 김상우 김현중 정성민 | 
	      	사업자 등록번호 : 000-00-00000 | 전화번호 : 02-000-0000
	</p>
	<p style="font-size:15px;" class="text-secondary">
		주식회사 HK라이더스는 통신 판매중개자이며 통신판매의 당사자가 아닙니다.<br/>
	     	따라서 상품/ 거래정보 및 거래와 관련하여 요기요에 등록된 판매자의 고의 또는 과실로 소비자에게 발생하는 손해에 대해 당사는 책임을 지지 않습니다.<br/>
	      	상품 및 거래에 관하여 보다 정확한 정보는 해당 판매자에게 직접 확인하여 주시기 바랍니다.
	</p>
</div>


<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>