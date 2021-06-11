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
<link href="<c:url value='/resources/css/styles.css'/>" rel="stylesheet" />

<style>
    body {
		font-family: 'Varela Round', sans-serif;
	}
	.modal-login {
		width: 320px;
		margin: 30px auto;
	}
	.modal-login .modal-content {
		border-radius: 1px;
		border: none;
	}
	.modal-login .modal-header {
        position: relative;
		justify-content: center;
        background: #f2f2f2;
	}
    .modal-login .modal-body {
        padding: 30px;
    }
    .modal-login .modal-footer {
        background: #f2f2f2;
    }
	.modal-login h4 {
		text-align: center;
		font-size: 26px;
	}
    .modal-login label {
        font-weight: normal;
        font-size: 13px;
    }
	.modal-login .form-control, .modal-login .btn {
		min-height: 38px;
		border-radius: 2px; 
	}
	.modal-login .hint-text {
		text-align: center;
	}
	.modal-login .close {
        position: absolute;
		top: 15px;
		right: 15px;
	}
    .modal-login .checkbox-inline {
        margin-top: 12px;
    }
    .modal-login input[type="checkbox"]{
        margin-top: 2px;
    }
	.modal-login .btn {
        min-width: 100px;
		background: #3498db;
		border: none;
		line-height: normal;
	}
	.modal-login .btn:hover, .modal-login .btn:focus {
		background: #248bd0;
	}
	.modal-login .hint-text a {
		color: #999;
	}
	.trigger-btn {
		display: inline-block;
		margin: 100px auto;
	}
</style>
<style>
/* scale */
.scale {
  transform: scale(1);
  -webkit-transform: scale(1);
  -moz-transform: scale(1);
  -ms-transform: scale(1);
  -o-transform: scale(1);
  transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
}
.scale:hover {
  transform: scale(1.2);
  -webkit-transform: scale(1.2);
  -moz-transform: scale(1.2);
  -ms-transform: scale(1.2);
  -o-transform: scale(1.2);
}
.img {width:325px; height:280px; overflow:hidden }   /* 부모를 벗어나지 않고 내부 이미지만 확대 */

/*  */
@import url(https://fonts.googleapis.com/css?family=Raleway:300,700);
@import url(https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css);
figure.snip1384{
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  overflow: hidden;
  margin: 10px;
  min-width: 230px;
  max-width: 315px; 
  width: 100%;
  color: #000; /* color */
/*   color: #6495ED; /* color */ */
  text-align: left;
  font-size: 16px;
  background-color: #1fe0;
}

/* modified 21/05/30 */
figure.snip1384.firstRow{
  min-width: 180px;
  max-width: 315px; 
}
figure.snip1384 * {
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
}
figure.snip1384 img {
  max-width: 100%;
  backface-visibility: hidden;
  vertical-align: top;
}
figure.snip1384:after,
figure.snip1384 figcaption {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
}
figure.snip1384:after {
  content: '';
  background-color: #ffffff;
  background-color: rgba( 255, 255, 255, 0.5 );
  /*   background-color: rgba(0, 0, 0, 0.65); */
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
  opacity: 0;
/*   opacity: 0; */
}
figure.snip1384 figcaption {
  z-index: 1;
  padding: 40px;
}
figure.snip1384 h3,
figure.snip1384 .links {
  width: 100%;
  margin: 5px 0;
  padding: 0;
}
figure.snip1384 h3 {
  line-height: 1.1em;
  font-weight: 700;
  font-size: 1.4em;
  text-transform: uppercase;
  opacity: 0;
}
figure.snip1384 p {
  font-size: 0.8em;
  font-weight: 300;
  letter-spacing: 1px;
  opacity: 0;
  top: 50%;
  -webkit-transform: translateY(40px);
  transform: translateY(40px);
}
figure.snip1384 i {
  position: absolute;
  bottom: 10px;
  right: 10px;
  padding: 20px 25px;
  font-size: 34px;
  opacity: 0;
  -webkit-transform: translateX(-10px);
  transform: translateX(-10px);
}
figure.snip1384 a {
  position: absolute;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  z-index: 1;
}
figure.snip1384:hover img,
figure.snip1384.hover img {
  zoom: 1;
  filter: alpha(opacity=50);
  -webkit-opacity: 0.5;
  opacity: 0.5;
}
figure.snip1384:hover:after,
figure.snip1384.hover:after {
  opacity: 1;
  position: absolute;
  top: 10px;
  bottom: 10px;
  left: 10px;
  right: 10px;
}
figure.snip1384:hover h3,
figure.snip1384.hover h3,
figure.snip1384:hover p,
figure.snip1384.hover p,
figure.snip1384:hover i,
figure.snip1384.hover i {
  -webkit-transform: translate(0px, 0px);
  transform: translate(0px, 0px);
  opacity: 1;
}


/* @@@@@@@@@@@@ */

/* @@@@@@@@@@@@ */

</style>
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- Bootstrap core JS-->
<!-- 	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
 -->	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="<c:url value='/resources/js/scripts.js'/>"></script>
<!-- Core theme CSS (includes Bootstrap)-->

</head>
<body>


	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
	
	<%@ include file="/WEB-INF/views/common/content.jsp"%>
	
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	
	
</body>


<script>
$(document).ready(function() {
	/* Demo purposes only */
	$(".hover").mouseleave(
	  function () {
	    $(this).removeClass("hover");
	  }
	);
	
	
	$(".saveBtn2").click(function(){
		//alert("saveBtn");
	});
	
	
	var floatPosition = parseInt($(".floatMenu").css('top'));
	$(window).scroll(function() {
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";
 
		$(".floatMenu").stop().animate({
			"top" : newPosition
		}, 500);
 
	}).scroll();
 
});

function fn_detail(B_NO,B_TYPE){
	//var  formData= $('#boardForm').serialize();
	$('#gdsNum').val(B_NO);
/* 	$('#B_NO').val(B_NO); */
	$('#B_TYPE').val(B_TYPE);
	
	$('#boardForm').attr({
		action : '<c:url value="/orderDetail.do" />',
		target : '_self'
	}).submit();
}
function sampleModalPopup(){
    // 팝업 호출 url
    var url = "/WEB-INF/common/popup/itemDetailPopup.jsp";
	

    $.ajax({
		url : "${pageContext.request.contextPath}/itemDetailPopup.do",
		type : "post",
		enctype: 'multipart/form-data',
		data : { gdsNum : 1 },
		success : function(result) {
			//alert('success');
		}, // success 

		error : function(xhr, status) {
			alert(xhr + " : " + status);
		}
	});
    
    // 팝업 호출
    $("#sampleModalPopup > .modal-dialog").load(url, function() { 
        $("#sampleModalPopup").modal("show"); 
    });
}


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
		
		$("#pp").html("");
		
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
			 /*  $("#pp").append(i+','+imgList[i].file+'<br>'); */
			  
			var img=imgList[i].file;
			var file = $("#file").val(img);
			var image="<c:url value='/img/"+img+"'/>"; //상품 상세 이미지
			  $("#pp").append("<img class='card-img-top' src="+image+"><br><br>");
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
			var userId = '${member.ID}';
			if(userId.length==0){
				alert('로그인 후 이용해주세요');
			} else{
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
			}
			
		
			
			
			});
		// 주문
		
		}, // success 

		error : function(xhr, status) {
			alert(xhr + " : " + status);
		}
	});
	
}


function fn_list(no) {
	$('#currentPageNo').val(no);
	var currentPageNo=no;
	$('#boardForm').attr({
		action : '<c:url value="/test.do"/>',
		target : '_self'
	}).submit();
	
}

function fn_itemList(itemType) {
	$('#itemType').val(itemType);
	
	$('#navForm').attr({
		action : '<c:url value="/itemList.do"/>',
		target : '_self'
	}).submit();
	
}



$(".addCart_btn").click(function(){
	var userId = $("#userId").val();
	
	if(userId==""){
		alert('로그인 후 이용해주세요');
	}
	else{
		var gdsNum = $("#gdsNum").val();
		var cartStock = $(".numBox").val();
		var msg="장바구니로 이동하시겠습니까?";

		var data = {
				gdsNum : gdsNum,
				userId : userId,
				cartStock : cartStock
				};
		
		$.ajax({
			url : "/view/addCart.do",
			type : "post",
			data : data,
			success : function(result){
				
				if(result == 1) {
					//alert("카트 담기 성공");
					$(".numBox").val(1);
					
					var goToCart=confirm(msg);
	 				if(goToCart){
						window.location='<c:url value="/cartList.do"/>';
					}
	 
				} else {
					alert("회원만 사용할 수 있습니다.")
					window.location='<c:url value="/user/login.do"/>';

				}
			},
			error : function(){
				alert("카트 담기 실패");
			}
		});
	}
});

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
