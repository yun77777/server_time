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
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<!-- API -->
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>

<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value='/resources/css/styles.css'/>" rel="stylesheet" />
<style> .centeringContainer { text-align: center; } .centered { display: table; margin-left: auto; margin-right: auto; display: inline-block; } </style>

</head>
<body>

	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
<section id="container">
		<div id="container_box">
		
			<section id="content">
					
				<ul>
					<li>
						<div class="allCheck">
							<input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label>
							
							<script>
							$("#allCheck").click(function(){
								var chk = $("#allCheck").prop("checked");
								if(chk) {
									$(".chBox").prop("checked", true);
								} else {
									$(".chBox").prop("checked", false);
								}
							});
							</script>
							
						</div>
						
						<div class="delBtn">
							<button type="submit" onclick="fn_delete()" class="selectDelete_btn">선택 삭제</button>
							
							<script>
								/* $(".selectDelete_btn").click(function(){
									var confirm_val = confirm("정말 삭제하시겠습니까?");
									
									if(confirm_val) {
										var checkArr = new Array();
										//var formData = new FormData($("#deleteForm")[0]);
										var userId=$('#userId').val();

										// 체크된 체크박스의 갯수만큼 반복
										$("input[class='chBox']:checked").each(function(){
											checkArr.push($(this).attr("data-cartNum"));  // 배열에 데이터 삽입
										});
										
										alert(checkArr);
											
										$.ajax({
											url : "/deleteCart.do",
											type : "post",
											data : { chbox : checkArr , userId : userId },
											success : function(result){
												
												if(result == 1) {												
													location.href = "/cartList.do";
												} else {
													alert("삭제 실패");
												}
											}
										});
									}	
								}); */
							</script>
							
						</div>
						
					</li>
				
					<%-- jsp상의 변수 선언 --%>
					<c:set var="sum" value="0" />
				<form id="deleteForm" method="post" enctype="multipart/form-data">
				
				
				
					<c:forEach items="${cartList}" var="cartList">
					<li>
						<div class="checkBox">
							<input type="checkbox" name="chBox" class="chBox" data-cartNum="${cartList.cartNum}" />
							<script>
								$(".chBox").click(function(){
									$("#allCheck").prop("checked", false);
								});
							</script>
						</div>
					
						<div class="thumb">
							<img src="${cartList.gdsThumbImg}" />
						</div>
						<div class="gdsInfo">
							<p>
                           		<img class="card-img-top" src="<c:url value='/img/${cartList.representative_file}'/>" style="width:100px" alt="no image" /><br />
								<span>상품명</span>${cartList.gdsName}<br />
								<span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice}" /> 원<br />
								<span>구입 수량</span>${cartList.cartStock} 개<br />
								<span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice * cartList.cartStock}" /> 원
							</p>
							
							<p class="gdsStock">
								<span>구입 수량 </span><fmt:formatNumber pattern="###,###,###" value="${cartList.cartStock}" /> EA
							</p>
						
							<c:if test="${view.gdsStock != 0}">
								<p class="cartStock">
									<button type="button" class="plus">+</button>
									<input type="number" id="cartStock" name="cartStock" class="numBox" min="1" max="${view.gdsStock}" value="${cartList.cartStock}" readonly="readonly"/>
									<button type="button" class="minus">-</button>
									<input type="hidden" value="${view.gdsStock}" class="gdsStock_hidden" /> 
								</p>
								<p class="addToCart">
									<button type="button" class="addCart_btn">카트에 담기</button>
								</p>
							</c:if>
							<c:if test="${view.gdsStock == 0}">
								<p>상품 수량이 부족합니다.</p>						
							</c:if>
							
							
							
							<div class="delete">
								<button type="button" class="delete_${cartList.cartNum}_btn" data-cartNum="${cartList.cartNum}">삭제</button>
								
								<script>
									$(".delete_${cartList.cartNum}_btn").click(function(){
										var confirm_val = confirm("정말 삭제하시겠습니까?");
										var userId=$('#userId').val();
										
										if(confirm_val) {
											var checkArr = new Array();
											
											checkArr.push($(this).attr("data-cartNum"));
																						
											$.ajax({
												url : "/deleteCart.do",
												type : "post",
												data : { chbox : checkArr , userId : userId},
												success : function(result){
													if(result == 1) {												
														location.href = "/cartList.do";
													} else {
														alert("삭제 실패");
													}
												}
											});
										}	
									});
								</script>
							</div>
						</div>			
					</li>
					
					<%-- 반복할 때마다 sum에 상품 가격(gdsPrice)*상품 갯수(cartStock)만큼을 더함 --%>
					<c:set var="sum" value="${sum + (cartList.gdsPrice * cartList.cartStock)}" />
					
					</c:forEach>
				</form>
				</ul>
			
			<div class="orderChk"></div>
			
			<div class="listResult">
				<div class="sum">
					총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원
				</div>
			</div>
			
			<div class="orderInfo">
<%-- 				<form role="form" method="post" autocomplete="off">
 --%>										
			<form id="boardForm" method="post" enctype="multipart/form-data">
					<input type="hidden" name="amount" value="${sum}" />
					<input type="hidden" id="userId" name="userId" value="${member.ID}" />
				</form>	
			<div class="inputArea">
				<button type="submit" onclick="fn_order()" class="order_btn">주문</button>
				<button type="button" class="cancel_btn">취소</button>
				
				<script>
				$(".cancel_btn").click(function(){
					$(".orderInfo").slideUp();  // $(".orderInfo")를 숨기고
					$(".orderOpne_bnt").slideDown();  // $(".orderOpne_bnt")를 나타냄
				
					});						
				</script>
				
			</div>
					
				
			</div>
			
				
			</section>
			
			
		</div>
<%-- 			<%@ include file="/WEB-INF/views/common/popup/loginPopup.jsp"%> 
 --%>		
	</section>        

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<!-- Bootstrap core JS-->
<!-- 	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
 -->	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="<c:url value='/resources/js/scripts.js'/>"></script>
</body>

<script>
//카트삭제
function fn_delete() {
	var confirm_val = confirm("정말 삭제하시겠습니까?");
	
	if(confirm_val) {
		var checkArr = new Array();
		var userId=$('#userId').val();

		// 체크된 체크박스의 갯수만큼 반복
		$("input[class='chBox']:checked").each(function(){
			checkArr.push($(this).attr("data-cartNum"));  // 배열에 데이터 삽입
		});
		
		alert(checkArr);
			
		$.ajax({
			url : "/deleteCart.do",
			type : "post",
			data : { chbox : checkArr , userId : userId },
			success : function(result){
				
				if(result == 1) {						
					alert("삭제 완료");
					location.href = "/cartList.do";
				} else {
					alert("삭제 실패");
				}
			}
		});
	}
}


//주문
function fn_order(){
	$(".orderChk *").remove();
	var checkArr = new Array();
	var cartStockArr = new Array();
	//var formData = new FormData($("#deleteForm")[0]);
	var userId=$('#userId').val();

	// 체크된 체크박스의 갯수만큼 반복
	$("input[class='chBox']:checked").each(function(){
		checkArr.push($(this).attr("data-cartNum"));  // 배열에 데이터 삽입
		//alert($(this).parent().parent().find('.cartStock').find('#cartStock').val());	
		cartStockArr.push($(this).parent().parent().find('.cartStock').find('#cartStock').val());  // 배열에 데이터 삽입
	});
	
	
	alert("checkArr:"+checkArr);
	alert("cartStockArr:"+cartStockArr);
	
	if(checkArr.length==0){
		alert('상품 선택 후 주문하세요');
	} else{
		var str = "<p>"+checkArr+"</p>";
	    $(".orderChk").append(str);
		
		$.ajax({
			//선택 후 orderProcess(주문) 페이지로 이동
			url : "/orderProcess.do",
			//url : "/orderChk.do",
			type : "post",
			data : { chbox : checkArr , userId : userId , cartStockArr : cartStockArr,},
			success : function(result){
				
				if(result == 1) {	
					$('#boardForm').attr({
						action : '<c:url value="/orderProcessDetail.do"/>',
						target : '_self'
					}).submit(); 
					//location.href = "/orderList2.do";
				} else {
					alert("chk 실패");
				}
			}
		});
	}
	
}
		
// + 버튼을 누르면 수량이 증가하되, 상품의 전체 수량보다 커지지 않음
$(".plus").click(function(){
	var num = $(".numBox").val();
	var plusNum = Number(num) + 1;
	//var stock = ${view.gdsStock};
	var stock = $(".gdsStock_hidden");
	
	if(plusNum >= stock) {
		$(".numBox").val(num);
	} else {
		$(".numBox").val(plusNum);										
	}
});


// - 버튼을 누르면 수량이 감소하되, 1보다 밑으로 감소하지 않음
$(".minus").click(function(){
	var num = $(".numBox").val();
	var minusNum = Number(num) - 1; 
	
	if(minusNum <= 0) {
		$(".numBox").val(num);
	} else {
		$(".numBox").val(minusNum);										
	}
});
		
</script>

</html>

