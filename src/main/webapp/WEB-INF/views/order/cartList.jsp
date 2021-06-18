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
	<%@ include file="/WEB-INF/views/common/popup/loginPopup.jsp"%> 
	<%@ include file="/WEB-INF/views/common/popup/orderPopup.jsp"%> 
	
<section class="py-5">
		<div class="container">
				<table class="table">
					<colgroup>
						<col width="30%">
						<col width="*">
					</colgroup>
				    <tr>
				    	<td>
				    		<div class="allCheck">
				    			<span>
				    				<input type="checkbox" name="allCheck" id="allCheck" /><label for="allCheck">모두 선택</label>
				    			</span>
								
							</div>
				    	</td>
				    	<td>
				    		<div class="allCheck">
				    			<span>
									<button type="submit" onclick="fn_delete()" class="selectDelete_btn btn btn-danger btn-sm float-right">선택 삭제</button>
								</span>
							</div>
				    	</td>
				    </tr>
			    <form id="deleteForm" method="post" enctype="multipart/form-data">
				    <c:forEach items="${cartList}" var="cartList" varStatus="status">
				    <th colspan="2" class="table-active">${status.index+1}</th>
						<tr>
							<td>
							<div class="checkBox">
								<input type="checkbox" name="chBox" class="chBox" data-cartNum="${cartList.cartNum}" />
								<input type="hidden" value="${cartList.gdsPrice}">
								<input type="hidden" value="${cartList.gdsPrice * cartList.cartStock}">
								<input type="hidden" value="${cartList.cartStock}">
								<script>
									$(".chBox").click(function(){
										$("#allCheck").prop("checked", false);
									});
								</script>
							</div>
							</td>
							<td>
								<!-- <div class="text-center"> -->
								<div class="">
									<a href="#!"
										onclick="fn_detail_pop('${cartList.gdsNum}')"
										data-toggle="modal" data-target="#exampleModalLong"> 
										<!-- <img class="card-img-top rounded" -->
										<img class="card-img-top"
											src="<c:url value='/img/${cartList.representative_file}'/>"
											style="height: 200px;width:auto" alt="no image" />
									</a>
								</div>
							</td>
						</tr>
						<tr>
							<td>
								상품명
							</td>
							<td>
								${cartList.gdsName}
							</td>
						</tr>
						<tr>
							<td>
								개당 가격
							</td>
							<td>
								<fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice}" /> 원
							</td>
						</tr>
						<tr>
							<td>
								구입 수량
							</td>
							<td>
								<c:if test="${view.gdsStock != 0}">
								<p class="cartStock">
									<button type="button" class="minus btn btn-secondary btn-sm">-</button>
									<input type="number" id="cartStock" name="cartStock" class="numBox" min="1" max="${view.gdsStock}" value="${cartList.cartStock}" readonly="readonly"/>
									<button type="button" class="plus btn btn-secondary btn-sm">+</button>
									<input type="hidden" value="${view.gdsStock}" class="gdsStock_hidden" /> 
									<input type="hidden" value="${cartList.gdsPrice * cartList.cartStock}" class="gdsPrice_hidden" /> 
								</p>
								</c:if>
								<c:if test="${view.gdsStock == 0}">
									<p>상품 수량이 부족합니다.</p>						
								</c:if>
							
							</td>
						</tr>
						<tr>
							<td>
								최종 가격
							</td>
							<td>
								<fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice * cartList.cartStock}" /> 원
							</td>
						</tr>
						<tr>
							<td>
							</td>
							<td>
								<div class="delete">
								<button type="button" class="delete_btn selectDelete_btn btn btn-danger btn-sm float-right" data-cartNum="${cartList.cartNum}">삭제</button>
							</div>
							</td>
						</tr>
							
							
					</c:forEach>
				</form>
			  </table>
						
			
			<div class="orderChk"></div>
			
			<div class="listResult">
				<div class="sum">
					총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원
				</div>
			</div>
			
			<div class="orderInfo">
			<form id="boardForm" method="post" enctype="multipart/form-data">
				<input type="hidden" name="amount" value="${sum}" />
				<input type="hidden" id="userId" name="userId" value="${member.ID}" />
				<input type="hidden" id="orderId" name="orderId" />
				<input type="hidden" id="type" name="cart" />
			</form>	
			<div class="inputArea">
				<button type="submit" onclick="fn_order()" class="order_btn selectDelete_btn btn btn-info btn-sm float-right">주문</button>
				<button type="button" class="cancel_btn selectDelete_btn btn btn-danger btn-sm float-right">취소</button>
				
				<script>
								
				</script>
				
			</div>
					
				
			</div>
			
				
			
			
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
$(document).ready(function(){
var sum=0;
$("input[class='chBox']").change(function(){
      if($(this).is(":checked")){
    	  sum+=Number($(this).next().next().val());
          //sum+=Number($(this).parent().parent().parent().find('.cartStock').find('.gdsPrice_hidden').val());  // 배열에 데이터 삽입
  		
      }else{
    	  sum-=Number($(this).next().next().val());
          //sum-=Number($(this).parent().parent().parent().find('.cartStock').find('.gdsPrice_hidden').val());  // 배열에 데이터 삽입
      }
      $(".listResult").html('총 합계: '+sum+'원'); 

  });
  
$("#allCheck").click(function(){
	var chk = $("#allCheck").prop("checked");
	
	if(chk) {
		$(".chBox").prop("checked", true);
		$("input[class='chBox']:checked").each(function(){
	          sum+=Number($(this).next().next().val());
		});
	} else {
		$(".chBox").prop("checked", false);
		sum=0;
	}
	

	// 체크된 체크박스의 갯수만큼 반복
	
	
    $(".listResult").html('총 합계: '+sum+'원'); 
	
});





//+ 버튼을 누르면 수량이 증가하되, 상품의 전체 수량보다 커지지 않음
$(".plus").click(function(){
	var num = $(this).prev().val();
	
	var plusNum = Number(num) + 1;
	var stock = $(".gdsStock_hidden");
	
	if(plusNum >= stock) {
		$(this).prev().val(num);
	} else {
		$(this).prev().val(plusNum);
	}
});


//- 버튼을 누르면 수량이 감소하되, 1보다 밑으로 감소하지 않음
$(".minus").click(function(){
	var num = $(this).next().val();
	var minusNum = Number(num) - 1; 
	
	if(minusNum <= 0) {
		$(this).next().val(num);
	} else {
		$(this).next().val(minusNum);
	}
});

$(".delete_btn").click(function(){
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

$(".cancel_btn").click(function(){
	window.location='<c:url value="/test.do"/>';
});		
});
//주문
function fn_order(){
	$(".orderChk *").remove();
	var checkArr = new Array();
	var cartStockArr = new Array();
	//var formData = new FormData($("#deleteForm")[0]);
	var userId=$('#userId').val();
	//var sum=0;
	// 체크된 체크박스의 갯수만큼 반복
	$("input[class='chBox']:checked").each(function(){
		checkArr.push($(this).attr("data-cartNum"));  // 배열에 데이터 삽입
		cartStockArr.push($(this).next().next().next().val());  // 배열에 데이터 삽입
		//cartStockArr.push($(this).parent().parent().find('.cartStock').find('#cartStock').val());  // 배열에 데이터 삽입
		
	});
	
	if(checkArr.length==0){
		alert('상품 선택 후 주문하세요');
	} else{
		/* var str = "<p>"+checkArr+"</p>";
	    $(".orderChk").append(str); */

	    $.ajax({
			//선택 후 orderProcess(주문) 페이지로 이동
			url : "/orderProcess.do",
			type : "post",
			data : { chbox : checkArr , userId : userId , cartStockArr : cartStockArr,},
			success : function(result){
				if(result) {
					$("#orderId").val(result.orderId);
					
					$('#boardForm').attr({
						action : '<c:url value="/orderProcessDetail.do"/>',
						target : '_self'
					}).submit();
					//location.href = "/orderList2.do";
				} else {
					alert("주문 오류가 발생했습니다.");
				}
			}
		});
	}
	
}



</script>

</html>

