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
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 가게 테이블 */
#store tr td {
	border : 1px solid #BDBDBD;
}
#div1 {
	width : 25%;
	float : left;
}
#div2 {
	width : 75%; 
	float : right; 
	padding : 50px 90px 50px 0px;
}
#div2 span {
	background-color : #FF5A5A;
	color : white; 
}

/* 스크롤 대표 메뉴 이미지*/
#Menu {
	
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

/* 메인, 사이드메뉴 판*/
#MainMenu,#SideMenu {
	background-color : #efefef;
	height : 50px;
	display : table;
	width : 100%;
	cursor: pointer; 
	border : 1px solid #BDBDBD; 
}
.cart {
	cursor: pointer;
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
<!-- header -->
<%@ include file="header.jsp" %>
<br/>

<!-- 가게주소검색 -->
<%@ include file="AddressSection.jsp" %>
<br/>

<!-- 카테고리바 -->
<%@ include file="CategoryBar.jsp" %>
<br/><br/>

<!-- 메뉴 카트 담는 모달 -->
<div id="MenuModal"></div>

<div class="container">
		
	<!-- 가게 정보 이미지 -->
	<div>
		<table id="store" style="width:70%;">
			<c:forEach items="${MySNo}" var="dto">
			<input type="hidden" id="sno" value="${dto.sNo}" />
			<tr>
				<td><font id="sName" size="5">${dto.sName}</font></td> 
			</tr>
			<tr>
				<td>
					<div id="div1">
						<img id="mImg" src="/image/Store/${dto.sImg}" style="width:150px;height:150px;">
					</div>
					<div id="div2">
						<font size="3"><b>대표 : ${dto.bName}</b></font><br/>
						<span>최소주문가격 : <b id="mP">${dto.mPrice}</b></span><br/>
						<span>배달 팁 : <b id="sTip">${dto.sTip}</b></span> 
					</div> 
				</td>
			</tr>
			</c:forEach>
		</table>
	
	</div> 
	
	<div id="Menu">
		<div id="row">		
			<c:forEach items="${MTList}" var="dto1">
			<div class="cart items">
				<input id="mNo" type="hidden" value="${dto1.mNo}"/>
				<img src="/image/Menu/${dto1.mImg}" style="width:150px;height:150px;">
		    	<p id="mName" class="card-title">${dto1.mName}</p>
		    	<p id="mPrice" class="card-text">${dto1.mPrice}</p>
		    	<input id="mImg" type="hidden" value="${dto1.mImg}"/>
			</div>
			</c:forEach>
		</div>
		
		
		<div id="MainMenu"><h5>메인메뉴</h5></div>
		<div id="mainmenu"> 
			<table id="menutable" style="width:100%">
				<c:forEach items="${MMList}" var="dto2">			 
				<tr id="tr" class="cart">	
					<td id="td1"> 
						<input id="mNo" type="hidden" value="${dto2.mNo}"/>
						<span><b id="mName">${dto2.mName}</b></span><br/>
						<span>${dto2.mInfo}</span><br/>
						<span id="mPrice">${dto2.mPrice}</span><br/>
						<input id="mImg" type="hidden" value="${dto2.mImg}"/>
					</td>					
					
					<td id="td2"><img id="mimg" src="/image/Menu/${dto2.mImg}"></td>				
				</tr>
				 </c:forEach>
			</table>
		</div>
		
		
		<div id="SideMenu"><h5>사이드메뉴</h5></div>
		<div id="sidemenu"> 
			<table id="menutable" style="width:100%">
				<c:forEach items="${MSList}" var="dto3">
				<tr id="tr" class="cart">
					<td id="td1">
						<input id="mNo" type="hidden" value="${dto3.mNo}"/>
						<span>a${status1.count}</span>
						<span><b id="mName">${dto3.mName}</b></span><br/>
						<span>${dto3.mInfo}</span><br/>
						<span id="mPrice">${dto3.mPrice}</span><br/>
						<input id="mImg" type="hidden" value="${dto3.mImg}"/>
					</td>				
						
					<td id="td2"><img id="mimg" src="/image/Menu/${dto3.mImg}"></td>
				</tr> 
				</c:forEach>
			</table>
		</div>
		
	</div>
	
	<br/><br/> 
	 
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

<script>
//메뉴카트에 담는 모달 창가져오기
$("#MenuModal").load("MModal");


$(document).ready(function(){
	
	$("#mainmenu").show();
	$("#sidemenu").hide();
	
	$("#MainMenu").click(function(){
    	$("#mainmenu").slideToggle("slow");
	});
	
	$("#SideMenu").click(function(){
    	$("#sidemenu").slideToggle("slow");
	});
		
	//메뉴담기
	$(".cart").click(function(){
		
		$("#MModal").modal();
		
		var sName = $("#sName").text();
		var mP = $("#mP").text();
		var sTip = $("#sTip").text();
		var sNo = $("#sno").val();
		
		var mNo =  $(this).find("#mNo").val();
	    var mName =  $(this).find("#mName").text();
	    var mPrice =  $(this).find("#mPrice").text();
	    var mImg = $(this).find("#mImg").val();
	    var count = 1;
	    var amount = mPrice * count;
	    
	    var imgurl = "/image/Menu/" + mImg //메뉴 모달에 사진이름 저장
	    
	    $("#Mno").val(mNo);
	    $("#Mimg").attr("src", imgurl); //메뉴 모달경로에 저장
	    $("#Mname").text(mName);
	    $("#Mprice").val(mPrice);
	    $("#Mcount").val(count);
	    $("#Tprice").val(amount);
	    
	    $("#sname").val(sName);
	    $("#stip").val(sTip);
	    $("#mprice").val(mP);
	    $("#sno1").val(sNo);
		
		/*
		var confirm_val = confirm("메뉴를 담으시겠습니까?");
	  
	 	if(confirm_val) { 
	 		
	 		//location.href ="html/cart.html";
	 		
	 		var mNo =  $(this).find("#mNo").val()
		    var mName =  $(this).find("#mName").text()
		    var mPrice =  $(this).find("#mPrice").text()
		    
		    var cartKey;
		    var value = {};
	 		var obj = []; 
	 		
	 		value = {
	 				code : mNo,
	 				name : mName,
	 				price : mPrice,
	 				count : 1
	 		}
	 		
	 		if(localStorage.getItem("cartKey") == null) {
	 			
				obj[0] = value;
				var y = JSON.stringify(obj);
				localStorage.setItem("cartKey",y);
			
			}
	 		
	 		else {
	 			
				var z= localStorage.getItem("cartKey"); //json string
				
				obj = JSON.parse(z); //array
				
				leng = obj.length;
				alert(leng);//배열의 원소개수
				
				obj[leng] = value;
				var a = JSON.stringify(obj);
				localStorage.setItem("cartKey",a);
	 			
	 		}
		    	    
	      	/*
	      	//배열선언
	     	var obj =[];
			var codeVal = [];
			var nameVal = [];
			var priceVal = [];
			var countVal = [];
	     	
			if(localStorage.length == 0) {
				
				codeVal[0] = mNo;
			    nameVal[0] = mName;
			    priceVal[0] = mPrice;
			    countVal[0] = 1;
			    console.log("localStorage.length : " + localStorage.length);
	    
			    obj[0] = {
			      'code':codeVal[0], 'name':nameVal[0], 'price':priceVal[0], 'count': countVal[0]
			     }
				
			}
	   
	   		else {
	   			
	   		    obj = JSON.parse(localStorage.getItem("menu"));
	   		    
	   		    //배열의 길이
	   		    var x = obj.length;
	   		    console.log("x: " + x);
	   		    
	   		    //x번째 색인번호인 배열에 값저장
	   		    codeVal[x] = mNo;
	   		    nameVal[x] = mName;
	   		    priceVal[x] = mPrice; 
	   		 	countVal[x] = 1;
	   		    
	   		    obj[x] = {
	   		      'code':codeVal[x], 'name':nameVal[x], 'price':priceVal[x], 'count':countVal[x]
	   		     }        
	   			
	   		}

			localStorage.setItem("menu", JSON.stringify(obj));
			
	 	}*/
	     
	 });

	
}); 
</script>
</body>
</html>