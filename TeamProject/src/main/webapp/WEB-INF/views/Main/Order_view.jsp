<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
  padding: 0 16px;
}

#oContainer {
  background-color: #f2f2f2;
  border: 1px solid lightgrey;
  border-radius: 3px;
}

.col-50 input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

#oBtn {
  width: 100%;
  border-radius: 3px;
  font-size: 17px;
}

hr {
  border: 1px solid lightgrey;
}

span.price {
  float: right;
  color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  #oRow {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
}

</style>
</head>


<body>

<!-- 추가수정부분 로그인한 아이디 값 받기 -->
<div>
	<sec:authorize access="hasAnyRole('ROLE_USER','ROLE_BOSS' )">
		<sec:authentication var="logid" property="principal.username" />
		<input id="logid" type="hidden" value="${logid}" />
	</sec:authorize>
</div>

<div id="order_view" class="container mt-5 mb-5">
	<div id="oRow"><!-- 1 row -->
		<form id="OrderForm" action="../MenuOrder" method="post">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"/>
			<input type="hidden" id="user_id" name="user_id"/> <!-- 회원아이디 -->
					
			<!-- 최종 메뉴 담기 -->
			<div class="container">
				<div id="oContainer" class="border pl-3">
					<h2 >Menu <span class="price" style="color:black"><i class="fa fa-shopping-cart pr-3"></i></span></h2>
				</div>
				<input type="hidden" id="osName" name="osName" value="{{sname}}"/> <!-- 업체명 -->
				<input type="hidden" id="sNo" name="sNo" value="{{sNo}}"/> <!--업체코드 -->	
				<div ng-repeat="z in order" class="border">
					<p class="pt-3 display-5">
						<input type="hidden" value="{{z.code}}" id="omNo{{$index+1}}" name="omNo" /> <!-- 메뉴코드 -->
			  			<span ng-click="OrderremoveItem($index)" style="cursor:pointer;" class="far fa-times-circle pl-2"></span>&nbsp;&nbsp;
			  			<span><b>{{$index+1}}</b> | </span> 
			  			
			  			<!-- 메뉴이름 가격 개수 (주문상세테이블) -->
			  			<span id="omName{{$index+1}}">{{z.name}}</span> X <span id="omStock{{$index+1}}">{{z.count}}</span>
			  			<input type="hidden" name="omName" value="{{z.name}}" /> <!-- 메뉴 이름 -->
			  			<input type="hidden" name="omStock" value="{{z.count}}" /> <!-- 메뉴 개수 -->
		  				<span style="float:right;" class="pr-2"><b id="omPrice{{$index+1}}">{{z.tprice}}</b>원 </span>
		  				<input type="hidden" name="omPrice" value="{{z.tprice}}" /> <!-- 메뉴 가격 --> 
		  				<input id="orderlength" type="hidden" value="{{order.length}}"/> <!-- 주문시 메뉴담겨있는지 없는지 파악하기 위해 필요 -->
		  				
					</p>				
				</div>
				
				<div id="oContainer" class="border pt-3">
					<p style="font-size:25px;">
						<span class="pl-3">배달팁</span>
						<span style="float:right;" class="pr-3">  
							<b id="sTip">{{sTip}}</b> 원  
						</span>
					</p>
					<p style="font-size:25px;">
						<span class="pl-3">최소주문금액</span>
						<span style="float:right;" class="pr-3">  
							<b id="mPrice">{{mPrice}}</b> 원  
						</span>
					</p>
					<p style="font-size:25px;">
						<span class="pl-3">합계</span>
						<span style="float:right;" class="pr-3">  
							<b id="oAmount">{{OrderTotal()}}</b> 원  <!-- 주문테이블 총금액 -->
							<input type="hidden" name="oAmount" value="{{OrderTotal()}}"/> <!-- 주문 총 가격 -->
						</span>
					</p>
				</div>
				
			</div>
			
			<br/><br/>
			
			<!-- 주문상세 페이지 -->
	    	<div class="container">
      			
      			<!-- 주문 테이블 내용 + 메뉴항목에서 총금액포함 -->
        		<div id="oRow" class="row"><!-- 1-1 row -->
					<div class="col-50">
						<label for="fname"><i class="fa fa-user"></i> 받으시는 분</label>
						<input type="text" id="oName" name="oName" placeholder="홍길동" required/>
						<label for="adr"><i class='far fa-address-card'></i> 기본 주소</label>
						<input type="text" id="oAd1" name="oAd1" placeholder="서울시 강남구 ..." required readonly/>
						<label for="adr"><i class='far fa-address-card'></i> 상세내역</label>
						<input type="text" id="oAd2" name="oAd2" placeholder="(필수) 상제주소를 입력해주세요." required/>
						<label for="city"><i class="fa fa-phone"></i> 휴대전화</label>
						<input type="text" id="oPhone" name="oPhone" placeholder="010-0000-0000" required/>
          			</div>
	
          			<div class="col-50">
			            <label for="fname" class="far fa-edit"> 주문시 요청사항</label>			            
			            <textarea id="oText" name="oText" rows="15" class="border" style="width:100%;" placeholder="요청사항을 적어주세요" required></textarea>
			       	</div>
	          
        		</div> <!-- 1-1 row end -->
	        		
		        <label>
		          	<input type="checkbox" required> 위에 결제사항에 동의합니다.
		        </label>
	        		
        		<input id="oBtn" type="submit" value="주문" class="btn bg-danger text-white">
      			
    		</div>
    		
  		</form>
	</div> <!-- 1 row end -->
</div>


<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script>

jQuery(document).ready(function() { 
	
	var logid = $("#logid").val();
	$("#user_id").val(logid);
	
	var ad1 = JSON.parse(sessionStorage.getItem("address1"));
	$("#oAd1").val(ad1);
	
	$("#OrderForm").submit(function() { //주문하기 클릭
		
		var id = $("#user_id").val(); //회원아이디값
		
		if(id == "") {
			alert("로그인 후 주문해주세요.");
			location.href ="../login1?log=start";
			return false;
			
		}
		
		var length = $("#orderlength").val(); //메뉴 개수(길이)
		
		var total = parseInt($("#oAmount").text());
		var mprice = parseInt($("#mPrice").text());
		
		if(length == null) {
			console.log("메뉴 안담김");
			alert("메뉴를 먼저 담아주세요.");
			return false;
		}
		
		if(total < mprice) {
			console.log("최고주문금액에 못미침");
			alert("최소주문금액보다 부족합니다.");
			return false;
		}
			
		console.log("메뉴담김 주문시작");
		localStorage.removeItem("cartKey");
		localStorage.removeItem("sname");
		localStorage.removeItem("sTip");
		localStorage.removeItem("mPrice");
		localStorage.removeItem("sNo");
		
	});
	
});
</script>

</body>
</html>