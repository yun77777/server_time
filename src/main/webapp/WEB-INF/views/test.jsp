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
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- Bootstrap core JS-->
<!-- 	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
 -->	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="<c:url value='/resources/js/scripts.js'/>"></script>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value='/resources/css/styles.css'/>" rel="stylesheet" />
</head>
<body>

	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
	
	<%@ include file="/WEB-INF/views/common/header.jsp"%>
	<form id="boardForm" method="post">
		<!-- <div id="floatMenu" class="floatMenu" style="position: absolute;
			width: 200px;
			height: 200px;
			right: 50px;
			top: 550px;
			background-color: #606060;
			color: #fff;">
			<span>최근에 본 상품</span>
		</div> -->
		<%@ include file="/WEB-INF/views/common/content.jsp"%>
	</form>
	
	<%-- <form id="pgForm" method="post">
	 <input type="hidden" id="currentPageNo" name="currentPageNo" value="${pg.currentPageNo}"/>
									<input type="hidden" id="recordCountPerPage" name="recordCountPerPage" value="${pg.recordCountPerPage}"/>
		                       
		<%@ include file="/WEB-INF/views/common/paging.jsp"%>
	</form> 
	--%>
	








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
		alert("saveBtn");
	/* 	var num = $(".numBox").val();
		var plusNum = Number(num) + 1;
		//var stock = ${view.gdsStock};
		var stock = $(".gdsStock_hidden");
		
		if(plusNum >= stock) {
			$(".numBox").val(num);
		} else {
			$(".numBox").val(plusNum);										
		} */
	});
	
	
	//var w = window.open("about:blank","_blank");
	
	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	var floatPosition = parseInt($(".floatMenu").css('top'));
	// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
	$(window).scroll(function() {
		// 현재 스크롤 위치를 가져온다.
		var scrollTop = $(window).scrollTop();
		var newPosition = scrollTop + floatPosition + "px";
 
		/* 애니메이션 없이 바로 따라감
		 $("#floatMenu").css('top', newPosition);
		 */
 
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
			alert('success');
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
	//$('.modal-body').append("afkjzxczxc"+$('#gdsNum').val());
	
	
	$.ajax({
		url : "${pageContext.request.contextPath}/itemDetailPopup.do",
		type : "post",
		data : { gdsNum : B_NO },
		success : function(result) {
						
		var obj=JSON.parse(result);
		var detail = obj.detail ; //java에서 정의한 ArrayList명을 적어준다.
		var imgList = obj.imgList ; //java에서 정의한 ArrayList명을 적어준다.
        $.each(detail, function( index, value ) {
   			$("#"+index+"").val(value);
   			//$("#pp").append(index+','+value+'<br>');
            console.log('element' ,index, value ); //Book.java 의 변수명을 써주면 된다.
            //console.log( index + " : " + value ); //Book.java 의 변수명을 써주면 된다.
         });
		
		 for (var i = 0; i <imgList.length; i++) {
			  console.log('element', i, imgList[i]);
			  console.log(imgList[i].gdsPrice);
			  //$("#pp").append(i+','+imgList[i]+'<br>');
			  //$("#pp").append(i+','+imgList[i].gdsPrice+'<br>');
			  
			 
			  $("#pp").append(i+','+imgList[i].file+'<br>');
			  
			var img=imgList[i].file;
			var image="<c:url value='/img/"+img+"'/>"; //상품 상세 이미지
			  $("#pp").append(i+"<img class='card-img-top scale' src="+image+"><br>");
			 
			  //$("#pp").append(i+','+imgList[i].gdsDes+'<br>');
			};
			
			
		//var representativ_file=detail.representative_file;
		//alert(representative_file);
		
		
		
		//상품상세설명
		$("#gdsName").parent().parent().find('td').append(detail.gdsName);
		//상품상세설명
		$("#gdsPrice").parent().parent().find('td').append(detail.gdsPrice);
		//상품상세설명
		$("#gdsStock").parent().parent().find('td').append(detail.gdsStock);
		//상품상세설명
		$("#totalPrice").parent().parent().find('td').append(detail.totalPrice);
		//상품상세설명
		$("#gdsDes").parent().parent().find('td').append(detail.gdsDes);
		
		//$("#gdsDes").val("새로운 값을 지정합니다.");  //텍스트 에어리어에 새로 값을 지정.
		
		$("#rpsnImg").attr("src","<c:url value='/img/"+img+"'/>");
		console.log('================================');
		
		//new2
		$("#create2").on("click",function(){ 
			alert($("#gdsPrice").val());
			var gdsNum=$('#gdsNum').val();

			//$(this).next().html("<button type='button' id='newButton'>ok</button>"); 
			
			fn_detail(gdsNum);
			
		   	alert("no");
			});
		
		
		//new
		$("#create").on("click",function(){ 
			
			var gdsNum = $("#gdsNum").val();
			var cartStock = 5
/* 			var cartStock = $(".numBox").val(); */
			
			var data = {
					gdsNum : gdsNum,
					cartStock : cartStock
					};
			
			var gdsNum = $("#gdsNum").val();
			var userId = $("#userId").val();
			var gdsStock = $(".numBox").val();
			$('#gdsStock').val(gdsStock);
			var data = {
					gdsNum : gdsNum,
					gdsStock : gdsStock,
					userId : userId
					};
			
			$.ajax({
				url : "/orderItem.do",
				type : "post",
				data : data,
				success : function(result){
					
					if(result == 1) {
					   	location.replace("cartList.do");

					/* 	$('#orderForm').attr({
							action : '<c:url value="/orderProcess.do"/>',
							target : '_self'
						}).submit(); 
						 */
						//$(".numBox").val("1");
					} else {
						alert("회원만 사용할 수 있습니다.")
						$(".numBox").val("1");
						window.location='<c:url value="/user/login.do"/>';

					}
				},
				error : function(){
					alert("실패");
				}
			});
			
			alert('finished');
			
			
			
			
		   	//location.replace("boardList.do");
			
			});
		
		
	/* 	$("#create").on("click", function(event){ 
			console.log("click");
			alert('x');
			});
 */

		
			//$('.modal-body').append(result+'ㅋㅌㅊㅋㅌㅊㅋㅌㅊㅋㅌㅊ'+result.detail.gdsPrice);
			//$('.modal-body').append(obj+result+JSON.parse(result).detail.gdsPrice);
			//alert(result.detail);
			var gdsNum=JSON.parse(result).detail.gdsNum;
			var gdsPrice=JSON.parse(result).detail.gdsPrice;
			var gdsDes=JSON.parse(result).detail.gdsDes;
			var gdsNum=JSON.parse(result).detail.gdsNum;
			var gdsStock=JSON.parse(result).detail.gdsStock;
			var gdsName=JSON.parse(result).detail.gdsName;
			var cateCode=JSON.parse(result).detail.cateCode; 
			var representativ_file=JSON.parse(result).detail.representative_file;

			//alert("result:"+result.detail.gdsPrice);
			
			//alert("result:"+JSON.parse(result).detail.gdsPrice);
			//alert("result:"+JSON.parse(result).imgList);
			
			//window.location='<c:url value="/test.do"/>';
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


function fn_list(no) {
	$('#currentPageNo').val(no);
	var currentPageNo=no;
	$('#boardForm').attr({
		action : '<c:url value="/test.do"/>',
		target : '_self'
	}).submit();
	
/* 	var formData = new FormData($("#pgForm")[0]); */

/* 	$.ajax({
		url : "${pageContext.request.contextPath}/testPg.do",
		type : "post",
		enctype: 'multipart/form-data',
 		/data : formData,
		processData : false,
		contentType : false,
		success : function(result) {
		}, // success 

		error : function(xhr, status) {
			alert(xhr + " : " + status);
		}
	}); */
}


</script>

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
figure.snip1384 {
  font-family: 'Raleway', Arial, sans-serif;
  position: relative;
  overflow: hidden;
  margin: 10px;
  min-width: 230px;
  max-width: 315px;
  width: 100%;
  color: #ffffff;
  text-align: left;
  font-size: 16px;
  background-color: #000000;
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
  background-color: rgba(0, 0, 0, 0.65);
  -webkit-transition: all 0.35s ease;
  transition: all 0.35s ease;
  opacity: 0;
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
</html>
