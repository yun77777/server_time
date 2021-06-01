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
<title>Modern Business - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value='/resources/css/styles.css'/>" rel="stylesheet" />
<style> .centeringContainer { text-align: center; } .centered { display: table; margin-left: auto; margin-right: auto; display: inline-block; } </style>

</head>
<body>

					<%@ include file="/WEB-INF/views/common/nav.jsp"%>
	
<!-- Page Content--><section id="container">
		
			<section id="content">
				<%@ include file="/WEB-INF/views/common/popup/orderPopup.jsp"%>
				<%@ include file="/WEB-INF/views/common/popup/orderDetailPopup.jsp"%>
			<form id="detailForm" method="post">
				<input type="hidden" id="orderId" name="orderId">
			</form>
		
				<div id="row">
				<ul class="orderList">
					<c:forEach items="${orderList}" var="orderList">
					<li>
					<div>
		 				<a href="#!" onclick="fn_detail_pop('${orderList.gdsNum}')" data-toggle="modal" data-target="#exampleModalLong">
					    	<img class="card-img-top" src="<c:url value='/img/${orderList.representative_file}'/>" style="width:100px" alt="no image" />
					    </a><br>
		 				<a href="#!" onclick="fn_order_detail_pop('${orderList.orderId}')" data-toggle="modal" data-target="#orderDetailPopup">
							상세주문내역
					    </a>
					    <br />
						<p><span>상세주문내역</span><button type="submit" onclick="fn_detail('${orderList.orderId}')">클릭</button></p>
						<p><span>주문번호</span><a href="/shop/orderView?n=${orderList.orderId}">${orderList.orderId}</a></p>
						<p><span>수령인</span>${orderList.orderRec}</p>
						<p><span>주소</span>(${orderList.userAddr1}) ${orderList.userAddr2} ${orderList.userAddr3}</p>
						<p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" /> 원</p>
						<p><span>상태</span>${orderList.delivery}</p>
						<p><span>주문수량</span>${orderList.cartStock}</p>
						<p><span>상품명</span>${orderList.gdsName}</p>
					</div>
					</li>
					</c:forEach>
				</ul>
				</div>
				<div id="row">
				<c:if test="${empty orderList}">
					<p><span>주문내역이 없습니다.</span></p>
				</c:if>
				</div>
			</section>
			
			<!-- <aside id="aside">
			</aside> -->
			
		
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

function fn_detail(orderId){
	$('#detailForm #orderId').val(orderId);
	
	$('#detailForm').attr({
		action : '<c:url value="/orderDetailView.do" />',
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
	$('#boardForm #no').attr('disabled',false);
	var formData = new FormData($("#boardForm")[0]);
	$.ajax({
		url : "${pageContext.request.contextPath}/deleteBoard.do",
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

$(function() {
	$("#submit").click(function() {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []); 
		//textarea의 id를 적어줍니다.

		var selcatd = $("#selcatd > option:selected").val();
		var title = $("#title").val();
		var content = document.getElementById("content").value;
		alert(content);
		if (selcatd == "") {
			alert("카테고리를 선택해주세요.");
			return;
		}
		if (title == null || title == "") {
			alert("제목을 입력해주세요.");
			$("#title").focus();
			return;
		}
		if(content == "" || content == null || content == '&nbsp;' || 
				content == '<br>' || content == '<br/>' || content == '<p>&nbsp;</p>'){
			alert("본문을 작성해주세요.");
			oEditors.getById["content"].exec("FOCUS"); //포커싱
			return;
		} //이 부분은 스마트에디터 유효성 검사 부분이니 참고하시길 바랍니다.
		
		var result = confirm("작성하시겠습니까?");
		
		if(result){
			alert("작성 완료!");
/* 			$("#boardForm").submit();
 */			fn_insert();
		}else{
			return;
		}
	});
})


function fn_detail_pop(B_NO,B_TYPE){
	$('#gdsNum').val(B_NO);
	$('#B_TYPE').val(B_TYPE);
	//itemDetailPopup
	var  formData= $('#boardForm').serialize();
	//alert(B_NO);
/* 	$('.modal-body').append("afkjzxczxc"+$('#gdsNum').val());
 */	
	
	$.ajax({
		url : "${pageContext.request.contextPath}/itemDetailPopup.do",
		type : "post",
		data : { gdsNum : B_NO },
		success : function(result) {
						
		var obj=JSON.parse(result);
		var detail = obj.detail ;
		var imgList = obj.imgList ;
        $.each(detail, function( index, value ) {
   			$("#"+index+"").val(value);
   			//$("#pp").append(index+','+value+'<br>');
            console.log('element' ,index, value ); 
         });
		
		 for (var i = 0; i <imgList.length; i++) {
			  console.log('element', i, imgList[i]);
			  console.log(imgList[i].gdsPrice);
			  //$("#pp").append(i+','+imgList[i]+'<br>');
			  //$("#pp").append(i+','+imgList[i].gdsPrice+'<br>');
			  
			  // #pp: 상세이미지 imgList div 영역
			  $("#pp").append(i+','+imgList[i].file+'<br>');
			  
			var img=imgList[i].file;
			var file = $("#file").val(img);
			var image="<c:url value='/img/"+img+"'/>"; //상품 상세 이미지
			  $("#pp").append(i+"<img class='card-img-top' src="+image+"><br>");
/* 			  $("#pp").append(i+"<img class='card-img-top scale' src="+image+"><br>"); */
			 
			};
			
		
		//상품상세설명
		$("#name").html(detail.gdsName);
		//상품상세설명
		$("#price").html(detail.gdsPrice);
		//상품상세설명
/* 		$("#gdsStock").parent().parent().find('td').append(detail.gdsStock);
 */		//상품상세설명
		//상품상세설명
		$("#des").html(detail.gdsDes);
		
		$("#orderForm #gdsName").val(detail.gdsName);
		$("#orderForm #gdsPrice").val(detail.gdsPrice);
		$("#orderForm #gdsStock").val(detail.gdsStock);
/* 		$("#gdsStock").val(detail.gdsStock); */
		$("#orderForm #totalPrice").val(detail.totalPrice);
		$("#orderForm #gdsDes").val(detail.gdsDes);
		
		//$("#gdsDes").val("새로운 값을 지정합니다.");  //텍스트 에어리어에 새로 값을 지정.
		
		$("#rpsnImg").attr("src","<c:url value='/img/"+img+"'/>");
		console.log('================================');
		
		//제품상세(기존)
		$("#create2").on("click",function(){ 
			var gdsNum=$('#gdsNum').val();

			//$(this).next().html("<button type='button' id='newButton'>ok</button>"); 
			
			fn_detail(gdsNum);
			
			});
		
		
		//주문
		$("#create").on("click",function(){ 
			
			var gdsNum = $("#gdsNum").val();
			var cartStock = 5;
/* 			var cartStock = $(".numBox").val(); */
			//alert('gdsNum:'+gdsNum);
			
			var gdsNum = $("#gdsNum").val();
			var userId = $("#userId").val();
			var gdsName = $("#gdsName").val();
			var gdsPrice = $("#gdsPrice").val();
			var cartStock = $("#stock").val();
			var gdsStock = cartStock;
/* 			var gdsStock = $(".numBox").val(); */
			$('#gdsStock').val(gdsStock);
			
			var data = {
					gdsNum : gdsNum,
					gdsStock : gdsStock,
					cartStock : cartStock,
					gdsName : gdsName,
					gdsPrice : gdsPrice,
					orderProcessDetail : 'Y',
					userId : userId ,
					};
			
		$.ajax({
				url : "/directOrderProcess.do",
				type : "post",
				data : data,
				success : function(result){
					$("#orderId").val(result.orderId);
					
					$('#orderForm').attr({
/* 					$('#boardForm').attr({ */
						action : '<c:url value="/directOrderProcessDetail.do"/>',
						target : '_self'
					}).submit(); 
				   	//location.replace("/directOrderProcessDetail.do");
				},
				error : function(){
					alert("주문 실패");
				}
			});
		
			
			
			});
		// 주문
		
		}, // success 

		error : function(xhr, status) {
			alert(xhr + " : " + status);
		}
	});
	
	/* $.ajax({
		url: '<c:url value="/test.do" />',
		method:"POST",
		data:formData,
		dataType:"html",
		success: eventSuccess,
		error: function(xhr, status, error) {alert(error);}
	}); */
}
	
function fn_order_detail_pop(orderId){
	$('#orderId').val(orderId);
	
	$.ajax({
		url : "${pageContext.request.contextPath}/orderDetailViewPopup.do",
		type : "post",
		data : { orderId : orderId },
		success : function(result) {
		var obj=JSON.parse(result);
		//var detail = obj.detail ;
		var detailList = obj.detailList ;
     /*    $.each(detail, function( index, value ) {
   			$("#"+index+"").val(value);
   			//$("#pp").append(index+','+value+'<br>');
            console.log('element' ,index, value ); 
         }); */
		
		 for (var i = 0; i <detailList.length; i++) {
			  console.log('element', i, detailList[i]);
			  console.log(detailList[i].gdsName);
			  //$("#pp").append(i+','+imgList[i]+'<br>');
			  //$("#pp").append(i+','+imgList[i].gdsPrice+'<br>');
			  var image="<c:url value='/img/"+detailList[i].representative_file+"'/>";
			  // #pp: 상세이미지 imgList div 영역
			  $("#kk").append('<b>'+(i+1)+'</b>. '+detailList[i].gdsName+'<br>');
			  $("#kk").append(''+"<img class='card-img-top' src="+image+" style='width:20%;height:auto'><br>");
			  $("#kk").append('cartStock: '+detailList[i].cartStock+'<br>');
			  $("#kk").append('gdsPrice: '+detailList[i].amount+'<br>');

			}
         
         $("#kk").append('<hr>');
		  $("#kk").append('orderId: '+detailList[0].orderId+'<br>');
		  $("#kk").append('userId: '+detailList[0].userId+'<br>');
		  $("#kk").append('orderPhon: '+detailList[0].orderPhon+'<br>');
		 $("#kk").append('userAddr: '+detailList[0].userAddr1
				 +', '+detailList[0].userAddr2
				 +', '+detailList[0].userAddr3
				 +'<br>');

		//$("#rpsnImg").attr("src","<c:url value='/img/"+img+"'/>");
		
		}
	});
}
</script>

</html>

