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
	
	<button type="button" onclick="sampleModalPopup()">zxc</button>
	<div class="modal fade" id="sampleModalPopup" role="dialog" tabindex="-1">
    <div class="modal-dialog modal-dialog-width1000 modal-dialog-height800">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
        </div>
        <div class="modal-body">
        ${imgList}
        
        </div>
        <div class="modal-footer">
            <button type="button" name="button" class="btn btn-color2" data-dismiss="modal" >닫기</button>
        </div>
    </div>
</div>




<a data-toggle="modal" href="/testForm.do" data-target="#modal-testNew" role="button" data-backdrop="static">
 <span class="btn btn-xs btn-success">테스트 등록</span>
</a>
 
 
<div id="modal-testNew" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="" aria-describedby="">
    <div class="modal-dialog" style="width:1200px;height:700px">
        <div class="modal-content">
        </div>
    </div>
</div>




	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	
	
</body>


<script>
$(document).ready(function() {
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
	$('#gdsNum').val(1);

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
   			$("#pp").append(index+','+value+'<br>');
            console.log('element' ,index, value ); //Book.java 의 변수명을 써주면 된다.
            //console.log( index + " : " + value ); //Book.java 의 변수명을 써주면 된다.
         });
		console.log('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
$("#totalPrice").val(Number($("gdsPrice").val())*Number($("gdsStock").val()));
		console.log('@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
		
		
		 for (var i = 0; i <imgList.length; i++) {
			  console.log('element', i, imgList[i]);
			  console.log(imgList[i].gdsPrice);
			  $("#pp").append(i+','+imgList[i]+'<br>');
			  $("#pp").append(i+','+imgList[i].gdsPrice+'<br>');
			  $("#pp").append(i+','+imgList[i].file+'<br>');
			  var img=imgList[i].file;
			  $("#pp").append(i+','+imgList[i].gdsDes+'<br>');
			};
			
			
		//var representativ_file=detail.representative_file;
		//alert(representative_file);
		$("#rpsnImg").attr("src","<c:url value='/img/"+img+"'/>");
		console.log('================================');
		
		
		var btn="<button type='button' id='saveBtn2' class='btn btn-primary'>Save changes</button>";
		$("#pp").append(btn);
		
		
		$("#create").on("click",function(){ 
			alert($("#gdsPrice").val());
		   /*  window.opener.location.href='<c:url value="/boardList.do"/>';
		    window.location.href='<c:url value="/boardList.do"/>';
		    window.location='<c:url value="/boardList.do"/>';
		    opener.parent.location.replace("<c:url value='/boardList.do'/>");
		       self.close();
		       opener.parent.location="<c:url value='/boardList.do'/>"; 
		       opener.parent.location='/boardList.do'; 
		       opener.document.location.reload();

		       if ( window.location == "<c:url value='/tes.do'/>" ) {
		    	   window.location.href='http://www.codingfactory.net/';
		    	 }
		   	window.close();  */
		   	location.replace("boardList.do");
		   	alert("no");

			//$(this).next().html("<button type='button' id='newButton'>ok</button>"); 
			
			/* $('#orderForm').attr({
				action : '<c:url value="/boardList.do" />',
				target : '_self'
			}).submit(); */
			
			});
		
	/* 	$("#create").on("click", function(event){ 
			console.log("click");
			alert('x');
			});
 */

		
			//$('.modal-body').append(result+'ㅋㅌㅊㅋㅌㅊㅋㅌㅊㅋㅌㅊ'+result.detail.gdsPrice);
			$('.modal-body').append(obj+result+JSON.parse(result).detail.gdsPrice);
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


</html>
