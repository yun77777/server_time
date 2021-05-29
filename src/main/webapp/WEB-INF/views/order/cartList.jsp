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
			
			<div class="rorderOpne">
			<button type="button" class="orderBtn" onclick="fn_order()">주문확인</button>
				<script>
					$(".orderBtn").click(function(){
						$(".orderChk").slideDown();  // $(".orderInfo")를 나타내고
						//$(".orderOpne_bnt").slideUp();  // $(".orderOpne_bnt")를 숨김
					});						
				</script>
				
			</div>
			
			<div class="orderChk"></div>
			
			<div class="listResult">
				<div class="sum">
					총 합계 : <fmt:formatNumber pattern="###,###,###" value="${sum}" />원
				</div>
				<div class="rorderOpne">
					<button type="button" class="orderOpne_bnt">주문 정보 입력</button>
					
					<script>
						$(".orderOpne_bnt").click(function(){
							$(".orderInfo").slideDown();  // $(".orderInfo")를 나타내고
							$(".orderOpne_bnt").slideUp();  // $(".orderOpne_bnt")를 숨김
						});						
					</script>
					
				</div>
			</div>
			
			<div class="orderInfo">
<%-- 				<form role="form" method="post" autocomplete="off">
 --%>										
			<form id="boardForm" method="post" enctype="multipart/form-data">
					<input type="hidden" name="amount" value="${sum}" />
					<input type="hidden" id="userId" name="userId" value="${member.ID}" />
							
					<div class="inputArea">
						<label for="">수령인</label>
						<input type="text" name="orderRec" id="orderRec" required="required" />
					</div>
					
					<div class="inputArea">
						<label for="orderPhon">수령인 연락처</label>
						<input type="text" name="orderPhon" id="orderPhon" required="required" />
					</div>
					<!-- 
					<div class="inputArea">
						<label for="userAddr1">우편번호</label>
						<input type="text" name="userAddr1" id="userAddr1" required="required" />
					</div>
					
					<div class="inputArea">
						<label for="userAddr2">1차 주소</label>
						<input type="text" name="userAddr2" id="userAddr2" required="required" />
					</div>
					
					<div class="inputArea">
						<label for="userAddr3">2차 주소</label>
						<input type="text" name="userAddr3" id="userAddr3" required="required" />
					</div>
					-->
					<div class="inputArea">
					
						<p>
							<input type="text" id="sample2_postcode" placeholder="우편번호">
							<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기">
						</p>
						<p>
							<input type="text" name="userAddr1" id="sample2_address" placeholder="주소" >
							<input type="text" name="userAddr2" id="sample2_detailAddress" placeholder="상세주소">
							<input type="text" name="userAddr3" id="sample2_extraAddress" placeholder="참고항목">
						</p>
						
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
function fn_insert() {
	//var formData = $('#boardForm').serialize();
	$('#boardForm #no').attr('disabled',false);
	var formData = new FormData($("#boardForm")[0]);
	$.ajax({
		url : "${pageContext.request.contextPath}/insertBoard.do",
		type : "post",
		enctype: 'multipart/form-data',
		data : formData,
		processData : false,
		contentType : false,
		success : function(result) {
			alert('success');
			fn_list();
		}, // success 

		error : function(xhr, status) {
			alert(xhr + " : " + status);
		}
	});
}



function fn_delete() {
	//var formData = $('#boardForm').serialize();
	/* $('#boardForm #no').attr('disabled',false);
	var formData = new FormData($("#boardForm")[0]); */
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
			//processData : false,
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


/* 	$(".order_btn").click(function(){
		alert($('#boardForm #orderRec').val());
			$('#boardForm').attr({
				action : '<c:url value="/orderList.do"/>',
				target : '_self'
			}).submit(); 
	
		});	 */
		
function fn_order(){
			IMP.init('imp46639314');
		    IMP.request_pay({
		        pg : 'html5_inicis',
		        pay_method : 'card',
		        merchant_uid : 'merchant_' + new Date().getTime(),
		        name : '주문명:결제테스트',
		        amount : 0,
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
		        } else {
		            var msg = '결제에 실패하였습니다.';
		            msg += '에러내용 : ' + rsp.error_msg;
		        }

		        alert(msg);
		    });	
		    
		    
		    
	var formData = new FormData($("#boardForm")[0]);
	$.ajax({
		url : "${pageContext.request.contextPath}/orderList.do",
		type : "post",
		enctype: 'multipart/form-data',
		data : formData,
		processData : false,
		contentType : false,
		success : function(result) {
			fn_order_check();
		}, // success 

		error : function(xhr, status) {
			alert(xhr + " : " + status);
		}
	}); 
	
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

