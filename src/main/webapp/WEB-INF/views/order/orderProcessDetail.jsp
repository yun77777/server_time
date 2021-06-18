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
		<h3>주문 상품</h3>
			<div class="orderInfo">
			<form id="deleteForm" method="post" enctype="multipart/form-data">
				<c:set var="sum" value="0" />
				<c:forEach items="${cartList}" var="cartList">
					<div id="row">
						<div class="table-responsive-lg">
							<table class="table">
								<tr>
									<td></td><td><a href="#!"
										onclick="fn_detail_pop('${cartList.gdsNum}',1)"
										data-toggle="modal" data-target="#exampleModalLong">
		                           		<img class="card-img-top" src="<c:url value='/img/${cartList.representative_file}'/>" style="width:100px" alt="no image" /><br />
									</a>
									</td>
								</tr>
								<tr>
									<td>상품명</td>
									<td>${cartList.gdsName}</td>
								</tr>
								<tr>
									<td>가격</td>
									<td><fmt:formatNumber pattern="###,###,###" value="${cartList.gdsPrice}" /> 원</td>
								</tr>
								<tr>
									<td>수량</td>
									<td>${cartList.cartStock} 개
									</td>
								</tr>
						<%-- jsp상의 변수 선언 --%>
						<c:set var="sum" value="0" />
						<c:set var="sum" value="${sum + (cartList.gdsPrice * cartList.cartStock)}" />
					
								<tr>
									<td>총 합계</td>
									<td> <fmt:formatNumber pattern="###,###,###" value="${sum}" />원</td>
								</tr>
								<tr>
									<td>최종 가격</td>
									<td><fmt:formatNumber pattern="###,###,###" value="${cartList.cartStock * cartList.gdsPrice}" /> 원</td>
								</tr>
							</table>
						</div>
					</div>
				
					<c:set var="sum" value="${sum + (cartList.gdsPrice * cartList.cartStock)}" />
					</c:forEach>
				</form>

			
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
					<input type="hidden" id="imp_uid" name="imp_uid">	            
					<input type="hidden" id="merchant_uid" name="merchant_uid">	            
					<input type="hidden" id="paid_amount" name="paid_amount">	            
					<input type="hidden" id="apply_num" name="apply_num">	
					<input type="hidden" id="orderId" name="orderId" value="${paramMap.orderId}">	
					   		
					<br><br>
					   		<h3>주문 정보</h3>
					   	<table class="table">
							<tr>
								<td>수령인</td>
								<td colspan="2"><input type="text" name="orderRec" id="orderRec" required="required" /></td>
							</tr>
							<tr>
								<td>수령인 연락처</td>
								<td colspan="2"><input type="text" name="orderPhon" id="orderPhon" required="required" /></td>
							</tr>
							<tr>
								<td>주소</td>
								<td colspan="2"><input type="text" id="sample2_postcode" placeholder="우편번호" readonly>
								<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기" class="btn btn-secondary btn-sm"></td>
							</tr>
							<tr>
								<td></td>
								<td colspan="2"><input type="text" name="userAddr1" id="sample2_address" placeholder="주소" >
								<input type="text" name="userAddr2" id="sample2_detailAddress" placeholder="상세주소">
								<input type="text" name="userAddr3" id="sample2_extraAddress" placeholder="참고항목"></td>
							</tr>
						</table>
						
						<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
						<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
						</div>
						
						<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
						<script>
						    // 우편번호 찾기 화면을 넣을 element
						    var element_layer = document.getElementById('layer');
						
						    function closeDaumPostcode() {
						        // iframe을 넣은 element를 안보이게 한다.
						        element_layer.style.display = 'none';
						    }
						
						    function sample2_execDaumPostcode() {
						        new daum.Postcode({
						            oncomplete: function(data) {
						                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
						
						                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
						                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						                var addr = ''; // 주소 변수
						                var extraAddr = ''; // 참고항목 변수
						
						                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
						                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						                    addr = data.roadAddress;
						                } else { // 사용자가 지번 주소를 선택했을 경우(J)
						                    addr = data.jibunAddress;
						                }
						
						                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
						                if(data.userSelectedType === 'R'){
						                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
						                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						                        extraAddr += data.bname;
						                    }
						                    // 건물명이 있고, 공동주택일 경우 추가한다.
						                    if(data.buildingName !== '' && data.apartment === 'Y'){
						                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						                    }
						                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						                    if(extraAddr !== ''){
						                        extraAddr = ' (' + extraAddr + ')';
						                    }
						                    // 조합된 참고항목을 해당 필드에 넣는다.
						                    document.getElementById("sample2_extraAddress").value = extraAddr;
						                
						                } else {
						                    document.getElementById("sample2_extraAddress").value = '';
						                }
						
						                // 우편번호와 주소 정보를 해당 필드에 넣는다.
						                document.getElementById('sample2_postcode').value = data.zonecode;
						                document.getElementById("sample2_address").value = addr;
						                // 커서를 상세주소 필드로 이동한다.
						                document.getElementById("sample2_detailAddress").focus();
						
						                // iframe을 넣은 element를 안보이게 한다.
						                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
						                element_layer.style.display = 'none';
						            },
						            width : '100%',
						            height : '100%',
						            maxSuggestItems : 5
						        }).embed(element_layer);
						
						        // iframe을 넣은 element를 보이게 한다.
						        element_layer.style.display = 'block';
						
						        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
						        initLayerPosition();
						    }
						
						    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
						    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
						    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
						    function initLayerPosition(){
						        var width = 300; //우편번호서비스가 들어갈 element의 width
						        var height = 400; //우편번호서비스가 들어갈 element의 height
						        var borderWidth = 5; //샘플에서 사용하는 border의 두께
						
						        // 위에서 선언한 값들을 실제 element에 넣는다.
						        element_layer.style.width = width + 'px';
						        element_layer.style.height = height + 'px';
						        element_layer.style.border = borderWidth + 'px solid';
						        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
						        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
						        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
						    }
						</script>
					</div>
					</form>	
					<div class="inputArea">
						<button type="submit" onclick="fn_order()" class="order_btn btn btn-info btn-sm float-right ml-3">주문</button>
						<button type="button" class="cancel_btn btn btn-danger btn-sm float-right">취소</button>
						
						<script>
						$(".cancel_btn").click(function(){
							$(".orderInfo").slideUp();  // $(".orderInfo")를 숨기고
							$(".orderOpne_bnt").slideDown();  // $(".orderOpne_bnt")를 나타냄
						
							});						
						</script>
						
					</div>
					
				
			</div>
			

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<!-- Bootstrap core JS-->
<!-- 	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
 -->	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="<c:url value='/resources/js/scripts.js'/>"></script>
</body>

<script>
function fn_list(no) {
	//$('#currentPageNo').val(no);
	window.location='<c:url value="/boardList.do"/>';
	
	/* $('#boardForm').attr({
		action : '<c:url value="/boardList.do"/>',
		target : '_self'
	}).submit(); */
};

function fn_detail(no){
	//var  formData= $('#boardForm').serialize();
	$('#boardForm #no').attr('disabled',false);
	$('#boardForm #no').val(no);
	
	$('#boardForm').attr({
		action : '<c:url value="/boardDetail.do" />',
		target : '_self'
	}).submit();

}

function fn_btn(no){
	var  formData= $('#boardForm').serialize();
    $.ajax({
        cache : false,
        url : "${pageContext.request.contextPath}/boardDetail.do",
        type : 'POST', 
        data : formData, 
        success : function(data) {
        }, // success 

        error : function(xhr, status) {
            alert(xhr + " : " + status);
        }
    }); // $.ajax */

}
//orderChkBtn
function fn_order_check() {
	$(".orderChk *").remove();
	var checkArr = new Array();
	var cartStockArr = new Array();
	//var formData = new FormData($("#deleteForm")[0]);
	var userId=$('#userId').val();

	// 체크된 체크박스의 갯수만큼 반복
	$("input[class='chBox']:checked").each(function(){
		checkArr.push($(this).attr("data-cartNum"));  // 배열에 데이터 삽입
		alert($(this).parent().parent().find('.cartStock').find('#cartStock').val());	
		cartStockArr.push($(this).parent().parent().find('.cartStock').find('#cartStock').val());  // 배열에 데이터 삽입
	});
	
	
	alert(checkArr);
	if(checkArr.length==0){
		alert('상품 선택 후 주문하세요');
	} else{
		//orderChk
		var str = "<p>"+checkArr+"</p>";
	    $(".orderChk").append(str);
		
		
		$.ajax({
			url : "/orderChk.do",
			type : "post",
			//processData : false,
			data : { chbox : checkArr , userId : userId , cartStockArr : cartStockArr},
			success : function(result){
				
				if(result == 1) {						
					alert("chk 완료");
					location.href = "/orderList2.do";
				} else {
					alert("chk 실패");
				}
			}
		});
	}

}



		
function fn_order(){
	var formData = new FormData($("#boardForm")[0]);
	$.ajax({
		url : "${pageContext.request.contextPath}/orderList.do",
		type : "post",
		enctype: 'multipart/form-data',
		data : formData,
		processData : false,
		contentType : false,
		success : function(result) {
			alert('주문이 완료되었습니다.');
		   	location.replace("/orderList2.do");
			
		}, // success 

		error : function(xhr, status) {
			alert(xhr + " : " + status);
		}
	}); 
			/* IMP.init('imp46639314');
		    IMP.request_pay({
		        pg : 'html5_inicis',
		        pay_method : 'card',
		        merchant_uid : 'merchant_' + new Date().getTime(),
		        name : '주문명:결제테스트',
		        amount : 100,
		        buyer_email : 'iamport@siot.do',
		        buyer_name : '구매자이름',
		        buyer_tel : '010-1234-5678',
		        buyer_addr : '서울특별시 강남구 삼성동',
		        buyer_postcode : '123-456'
		    }, function(rsp) {
		        if ( rsp.success ) {
		            var msg = '결제가 완료되었습니다.';
		            msg += '고유ID : ' + rsp.imp_uid;
		            msg += '상점 거래ID : ' + rsp.merchant_uid;
		            msg += '결제 금액 : ' + rsp.paid_amount;
		            msg += '카드 승인번호 : ' + rsp.apply_num;
		            
		            $("#imp_uid").value(rsp.imp_uid);
		            $("#merchant_uid").value(rsp.merchant_uid);
		            $("#paid_amount").value(rsp.paid_amount);
		            $("#apply_num").value(rsp.apply_num);
	         
		            var formData = new FormData($("#boardForm")[0]);
		        	$.ajax({
		        		url : "${pageContext.request.contextPath}/orderList.do",
		        		type : "post",
		        		enctype: 'multipart/form-data',
		        		data : formData,
		        		processData : false,
		        		contentType : false,
		        		success : function(result) {
		        			alert('주문이 완료되었습니다.');
		        		}, // success 

		        		error : function(xhr, status) {
		        			alert(xhr + " : " + status);
		        		}
		        	}); 
		            
		        } else {
		            var msg = '결제에 실패하였습니다.';
		            msg += '에러내용 : ' + rsp.error_msg;
		        }

		        alert(msg);
		    });	 */
		    
		    
		    
	
	
}
		
</script>

</html>

