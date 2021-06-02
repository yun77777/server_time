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
</head>
<body>

	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
	<!-- Page Content-->
	<section class="py-5">
		<div class="container">
			<form id="boardForm" method="post" enctype="multipart/form-data">

				<!-- Page Heading/Breadcrumbs-->
				<h1>
					Member <small>My Page</small>
				</h1>
				
				<div class="control-group form-group">
					<div class="controls">
						<label>
							<c:if test="${not empty member}">
<%-- 							<c:if test="${not empty login}"> --%>
		                    	<li class="nav-item"><p class="nav-link">Welcome <b>${member.ID}</b>!</p></li>
<%-- 		                    	<li class="nav-item"><p class="nav-link">Welcome <b>${login.ID}</b>!</p></li> --%>
						    </c:if>
						</label>
					</div>
				</div>
				
				<!-- Content Row-->
				<!-- Contact Form-->
				<!-- In order to set the email address and subject line for the contact form go to the assets/mail/contact_me.php file.-->
				<div class="row">
					<div class="col-lg-8 mb-4">
						<div class="control-group form-group">
							<div class="controls">
								<label>id:</label> <input class="form-control" id="id"
									name="ID" type="text" value="${member.ID}" disabled/>
<%-- 									name="ID" type="text" value="${login.ID}" disabled/> --%>
							</div>
						</div>
						
						<div class="control-group form-group">
		<c:if test="${empty member.k_userInfo}">	
							<div class="controls">
								<label>password:</label> <input class="form-control" id="pw"
									name="PW" type="text" value="${info.PW}" required
									data-validation-required-message="Please enter your email address." />
							</div>
							<div class="controls">
								<label>password check:</label> <input class="form-control" id="pwChk"
									name="pwChk" type="text" required
									data-validation-required-message="Please enter your email address." />
							</div>
		</c:if>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>name:</label> <input class="form-control" id="name"
									name="NAME" type="text" value="${info.NAME}" required
									data-validation-required-message="Please enter your email address." />
							</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>address:</label> 
								<input type="hidden" id="wholeAddress" name="ADDRESS">
								<input class="form-control" id="postalCode"
									name="postalCode" type="text" value="${info.ADDRESS}" required
									data-validation-required-message="Please enter your email address." />
									<button type="button" onclick="sample2_execDaumPostcode()">postal code check</button>
								<input class="form-control" id="address" value="${info.ADDRESS}"
									name="address" type="text" required
									data-validation-required-message="Please enter your email address." />
								<input class="form-control" id="addressDetail" value="${info.ADDRESS}"
									name="addressDetail" type="text" required
									data-validation-required-message="Please enter your email address." />
							</div>
							
							<p>
							<input type="text" id="sample2_postcode" placeholder="우편번호">
							<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기">
						</p>
						<p>
							<input type="text" name="postalCode" id="sample2_address" value="${info.ADDRESS}" placeholder="주소" >
							<input type="text" name="address" id="sample2_detailAddress" value="${info.ADDRESS}"  placeholder="상세주소">
							<input type="text" name="addressDetail" id="sample2_extraAddress" value="${info.ADDRESS}" placeholder="참고항목">
						</p>
						
						<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
						<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
						</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>contact:</label> 
								<input class="form-control" id="contact" value="${info.CONTACT}"
									name="CONTACT" type="text" required
									data-validation-required-message="Please enter your email address." />
							</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>phone:</label> <input class="form-control" id="phone"
									name="PHONE" type="text" required value="${info.PHONE}"
									data-validation-required-message="Please enter your email address." />
							</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>email:</label> <input class="form-control" id="email" value="${info.EMAIL}"
									name="EMAIL" type="text" required
									data-validation-required-message="Please enter your email address." />
							</div>
						</div>
						<div id="success"></div>
                        
					</div>
				</div>
			</form>
			<button class="btn btn-primary" onclick="fn_update()" type="submit">Update</button>
			<button class="btn btn-primary" onclick="" type="submit">Delete</button>
		</div>
	</section>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="<c:url value='/resources/js/scripts.js'/>"></script>
	
	
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<%@ include file="/WEB-INF/views/common/commonFunction.jsp"%>
</body>

<script>
$(document).ready(function(){
	var addressArr=$("#sample2_postcode").val().split(', ');

	$("#sample2_postcode").val(addressArr[0]);
	$("#sample2_address").val(addressArr[1]);
	$("#sample2_detailAddress").val(addressArr[2]);
var addressArr=$("#postalCode").val().split(', ');

	$("#postalCode").val(addressArr[0]);
	$("#address").val(addressArr[1]);
	$("#addressDetail").val(addressArr[2]);

});

function fn_list(no) {
	//$('#currentPageNo').val(no);
	window.location='<c:url value="/signIn.do"/>';
	
	/* $('#boardForm').attr({
		action : '<c:url value="/boardList.do"/>',
		target : '_self'
	}).submit(); */
};

function fn_sign_up() {
	//var formData = $('#boardForm').serialize();
	
	var wholeAddress=$("#sample2_postcode").val()+', '+$("#sample2_address").val()+', '+$("#sample2_detailAddress").val();
/* 	var wholeAddress=$("#postalCode").val()+', '+$("#address").val()+', '+$("#addressDetail").val(); */
	$("#wholeAddress").val(wholeAddress);
	var formData = new FormData($("#boardForm")[0]);

	alert(wholeAddress);
	$.ajax({
		url : "${pageContext.request.contextPath}/insertMember.do",
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



function fn_update() {
	//var formData = $('#boardForm').serialize();
	var wholeAddress=$("#sample2_postcode").val()+', '+$("#sample2_address").val()+', '+$("#sample2_detailAddress").val();
/* 	var wholeAddress=$("#postalCode").val()+', '+$("#address").val()+', '+$("#addressDetail").val(); */
	$("#wholeAddress").val(wholeAddress);
	alert('update');
	$('#boardForm #id').attr('disabled',false);
alert($('#id').val());
var formData = new FormData($("#boardForm")[0]);

$.ajax({
	url : "${pageContext.request.contextPath}/user/updateUser.do",
	type : "post",
	enctype: 'multipart/form-data',
	data : formData,
	processData : false,
	contentType : false,
	success : function(result) {
		alert('회원정보가 수정되었습니다.');
	}, // success 

	error : function(xhr, status) {
		alert(xhr + " : " + status);
	}
});



	/* $('#boardForm').attr({
		action : '<c:url value="/user/updateUser.do"/>',
		target : '_self'
	}).submit(); */
}

</script>

</html>

