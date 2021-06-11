<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<!-- Font Awesome icons (free version)-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- Bootstrap core JS-->
<!-- 	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
 -->	
<!--  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
 -->	
	<!-- Core theme JS-->
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value='/resources/css/styles.css'/>" rel="stylesheet" />
</head>
<body>

	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
	<%@ include file="/WEB-INF/views/common/popup/loginPopup.jsp"%> 
	<%@ include file="/WEB-INF/views/common/popup/orderDetailPopup.jsp"%>
	
	<form id="boardListForm" method="post">
    	<input type="hidden" id="delivery" name="delivery">
    </form>
    
	<!-- Page Content-->
	<section class="py-5">
		<div class="container">
			
				<!-- Page Heading/Breadcrumbs-->
				<h1 class="mt-4 mb-3">
					주문 내역 관리
				</h1>
				<nav>
				  <div class="nav nav-tabs" id="nav-tab" role="tablist">
				  <a class="nav-link <c:if test="${delivery eq 'all'}"> active </c:if>" id="nav-home-tab" onclick="fn_boardList('all',1)" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">전체</a>
				  <a class="nav-link <c:if test="${delivery eq 'D1'}"> active </c:if>" id="nav-home-tab" onclick="fn_boardList('D1',1)" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">주문완료</a>
				  <a class="nav-link <c:if test="${delivery eq 'D2'}"> active </c:if>" id="nav-contact-tab" onclick="fn_boardList('D2',1)" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">발송</a>
				  <a class="nav-link <c:if test="${delivery eq 'D3'}"> active </c:if>" id="nav-profile-tab" onclick="fn_boardList('D3',1)" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">취소</a>
				  
				  </div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
				  <div class="tab-pane fade show <c:if test="${delivery eq 'all'}"> active </c:if>" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
					<%@ include file="/WEB-INF/views/mng/orderAllList.jsp"%>
				  </div>
				  <div class="tab-pane fade show <c:if test="${delivery eq 'D1'}"> active </c:if>" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
					<%@ include file="/WEB-INF/views/mng/orderCompleteList.jsp"%>
				  </div>
				  <div class="tab-pane fade show <c:if test="${delivery eq 'D2'}"> active </c:if>" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
				  	<%@ include file="/WEB-INF/views/mng/orderDeliveryList.jsp"%>
				  </div>
				  <div class="tab-pane fade show <c:if test="${delivery eq 'D3'}"> active </c:if>" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
				  	<%@ include file="/WEB-INF/views/mng/orderCancelList.jsp"%>
				  </div>
				  
				</div>
				
				
		</div>
		<!-- //Container -->
	</section>
	

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<!-- Bootstrap core JS-->
<!-- 	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
 -->	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="<c:url value='/resources/js/scripts.js'/>"></script>
	
	<!-- JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<!-- 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 -->	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.min.js"></script>
<!-- 	
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.3/js/bootstrap-datetimepicker.min.js"></script>
 -->	
</body>

<script>
$(document).ready(function(){
	$("#allCheck").click(function(){
    	var chk = $("#allCheck").prop("checked");
    	
    	if(chk) {
    		$(".chBox").prop("checked", true);
    	} else {
    		$(".chBox").prop("checked", false);
    	}
    });	
});
	
 
function fn_cancel(orderId){
	var confirm_val = confirm("취소하시겠습니까?");
	var cnt=0;
	if(confirm_val) {
		var checkArr = new Array();
		
   		checkArr.push(orderId);

		// 체크된 체크박스의 갯수만큼 반복
		$("input[class='chBox']:checked").each(function(){
			if($(this).next().val()!='취소'){
				checkArr.push($(this).attr("data-cid"));
			} else
				cnt++;
		});
		
		if(checkArr.length==0){
			if(cnt>0)
				alert('이미 취소된 주문입니다.');
			else
				alert('취소할 상품을 선택해주세요.');
		} else{
			$.ajax({
    			url : "/mng/cancelItems.do",
    			type : "post",
    			data : { chbox : checkArr },
    			success : function(result){
    				
    				if(result == 1) {						
    					alert("취소 완료");
    					fn_list('1');
    				} else {
    					alert("취소 실패");
    				}
    			}
    		});
		}
			
	}
}
 
function fn_deliver(orderId){
	var confirm_val = confirm("발송처리하시겠습니까?");
		var cnt=0;
   	if(confirm_val) {
   		var checkArr = new Array();
   		
   		checkArr.push(orderId);
		
   		// 체크된 체크박스의 갯수만큼 반복
   		$("input[class='chBox']:checked").each(function(){
   			if($(this).next().val()!='발송')
   				checkArr.push($(this).attr("data-cid"));
   			else
   				cnt++;
   		});
   		
   		if(checkArr.length==0){
   			if(cnt>0)
   				alert('이미 발송완료된 상품입니다.');
   			else
   				alert('발송처리할 상품을 선택해주세요.');
		} else{
    		$.ajax({
    			url : "/mng/deliverItems.do",
    			type : "post",
    			data : { chbox : checkArr },
    			success : function(result){
    				
    				if(result == 1) {						
    					alert("발송처리 완료");
    					fn_list('1');
    				} else {
    					alert("발송처리 실패");
    				}
    			}
    		});
		}
	}
}
	
function fn_boardList(delivery, no) {
	$('#delivery').val(delivery);
	$('#boardForm #currentPageNo').val(no);
	
	$('#boardListForm').attr({
		action : '<c:url value="/mng/orderList.do"/>',
		target : '_self'
	}).submit();
};

function fn_list(no) {
	$('#boardForm #currentPageNo').val(no);
	$('#boardForm #delivery').val('${delivery}');
	
	$('#boardForm').attr({
		action : '<c:url value="/mng/orderList.do"/>',
		target : '_self'
	}).submit();
}


function fn_detail(orderId,delivery){
	//var  formData= $('#boardForm').serialize();
	
	$('#boardForm #orderId').val(orderId);
	$('#boardForm #delivery').val(delivery);
	
	$('#boardForm').attr({
		action : '<c:url value="/mng/orderDetail.do" />',
		target : '_self'
	}).submit();
}

</script>

</html>

