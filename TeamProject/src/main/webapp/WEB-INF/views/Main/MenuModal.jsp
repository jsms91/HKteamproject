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

<!--bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!--font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<title>Insert title here</title>
<style>
.modal-content {
	margin:auto;
}
.modal-title {
	margin:auto;
}
.modal-content div input {
	border-style:none;
	width:50%;
	height:45px;
	font-size:30px;
	padding:0px 0px 0px 0px;
}
.far {
	font-size:30px;
}

</style>
</head>

<body>
<!-- Modal -->
<div class="modal fade" id="MModal" role="dialog">

	<input id="sname" type="hidden" />
	<input id="stip" type="hidden" />
	<input id="mprice" type="hidden" />
	<input id="sno1" type="hidden" />
 	
 	<div class="modal-dialog">
 		
    	<!-- Modal content-->
	   	<div class="modal-content">
	    	<div class="modal-header border"> 
	      		<h3 class="modal-title">메뉴상세</h3>
	      	</div>
		    <input type="hidden" id="Mno"/> 	
	       	<!-- 메뉴 사진 -->
	      	<div class="border">
	      		<img id="Mimg" style="width:100%; height:350px;"/>
	      	</div>
	      	
	      	<!-- 메뉴이름 -->
	      	<div class="modal-header border"> 
	      		<h4 id="Mname" class="pt-3"></h4>
	      	</div>
	       	
	       	<!-- 메뉴가격 -->
	       	<div class="border">
       			<font size="6" style="float:left" class="pl-3">가격</font>
       			<input type="text" id="Mprice" style="float:right; text-align:right;" readonly/> 
       		</div>
		    
		    <!-- 메뉴수량 -->
	       	<div class="border">
       			<font size="6" style="float:left" class="pl-3">수량</font>
       			<div style="float:right;">
       				<b id="minus" class="far fa-minus-square"></b>&nbsp;
					<input id="Mcount" type="text" name="count" style="width:35px; text-align:center;" readonly> &nbsp;
					<b id="plus" class="far fa-plus-square"></b>
       			</div>
       		</div>
       		
       		<!-- 총결제 금액 -->
	       	<div class="border">
       			<font size="6" style="float:left" class="pl-3">결제 금액</font>
       			<input type="text" id="Tprice" style="float:right; text-align:right;" readonly/> 
       		</div>

	        <div class="modal-footer">
	        	<button id="cart" class="btn bg-danger text-white">cart</button>
	        	<button type="button" class="btn btn-default" data-dismiss="modal">close</button>
	        </div>
	    	
	      	
		</div><!-- modal-content -->
		
	</div>
 
</div><!-- Modal -->

<!--jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!--popper -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!--javascript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
$("#plus").click(function() {
	var p = $("#Mcount").val();
	var t =  $("#Tprice").val();
	var a =  $("#Tprice").val();
	a = parseInt(a);
	p = parseInt(p);
	t = parseInt(t);
	
	if(10 <= p) {
		alert("한번에 최대 10까지만 주문할 수 있습니다.");
	}
	else {
		$("#Mcount").val(p+1);
		a=a/p;
		$("#Tprice").val(t+a);
	}

});

$("#minus").click(function() {
	var p = $("#Mcount").val();
	var t =  $("#Tprice").val();
	var a =  $("#Tprice").val();
	a = parseInt(a);
	p = parseInt(p);
	t = parseInt(t);
	
	if(p > 1) {
		$("#Mcount").val(p-1);
		a=a/p;
		$("#Tprice").val(t-a);
	}
	else {
		alert("최소주문수량은 1개입니다.");
	}
	
});	


$(document).ready(function() {
	
	$("#cart").click(function() {
		
		
		var sName = $("#sname").val(); //업체명
		localStorage.setItem("sname",JSON.stringify(sName));
		
		var sTip = $("#stip").val(); //배달팁 
		localStorage.setItem("sTip", sTip);
		
		var mPrice = $("#mprice").val(); //최소주문금액 
		localStorage.setItem("mPrice", mPrice);
		
		var sNo = $("#sno1").val(); //업체코드
		localStorage.setItem("sNo", sNo);
		
		
 		var mNo =  $("#Mno").val()
	    var mName =  $("#Mname").text();
	    var mPrice =  $("#Mprice").val();
	    var tPrice = $("#Tprice").val();
	    var count = $("#Mcount").val();
	    
	    var cartKey;
	    var value = {};
 		var obj = []; 
 		
 		value = {
 				code : mNo,
 				name : mName,
 				price : mPrice,
 				tprice : tPrice,
 				count : count
 		}
 		
 		if(localStorage.getItem("cartKey") == null) {
 			
			obj[0] = value;
			var y = JSON.stringify(obj);
			localStorage.setItem("cartKey",y);
		
		}
 		
 		else { //여기서 앞에꺼하고 비교해서 이미 담겨져있으면 못담게 하던가 +시켜야한다(해보는중...)
 			   // 밑에 obj[leng]에서 obj[0]~[leng-1].code 값하고 지금 넣는 값 value.code 하고 비교해서 있으면 못담게하기
 			
			var z= localStorage.getItem("cartKey"); //json string
			obj = JSON.parse(z); //array
			
			leng = obj.length;
			//alert("leng : " + leng);//배열의 원소개수
			console.log("value : " + value.code); //지금 담는 메뉴코드라 value.code
			console.log("leng : " + obj[0].code); //obj[0]~[leng-1].code가 지금까지 담은 코드값
			obj[leng] = value;
			console.log("leng : " + obj[leng].code); //현재 만든 새로운 obj[leng]에 담은 메뉴값 value를 넣음
			var a = JSON.stringify(obj);
			localStorage.setItem("cartKey",a);
 			
 		}
 		
 		$("#MModal").modal('hide'); 
	
	});

});



</script>
</body>
</html>
	       		
	       		