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
			<input type="hidden" name="ADDRESS">
				<!-- Page Heading/Breadcrumbs-->
				<h1> 회원 정보 관리 </h1>
				
				<div class="row">
					<div class="col-lg-8 mb-4">
						
				<div class="control-group form-group">
		
			</div>
			<table class="table">
				<tr>
					<td>아이디</td>
					<td colspan="2"><input class="form-control" id="id"
									name="ID" type="text" value="${member.ID}" disabled/></td>
				</tr>
				<c:if test="${empty member.k_userInfo and member.u_userInfo}">	
				<tr>
					<td>비밀번호</td>
					<td colspan="2"><input class="form-control" id="pw"
									name="PW" type="text" value="${info.PW}" required
									data-validation-required-message="Please enter your email address." /></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
					<td colspan="2"><input class="form-control" id="pwChk"
									name="pwChk" type="text" required
									data-validation-required-message="Please enter your email address." /></td>
				</tr>
		</c:if>
				<tr>
					<td rowspan="2">주소</td>
					<td colspan="2">
							<input type="text" class="form-control-sm" id="sample2_postcode" placeholder="우편번호">
							<input type="button" onclick="sample2_execDaumPostcode()" class="btn btn-info btn-sm" value="우편번호 찾기">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="text" name="postalCode" id="sample2_address" value="${info.ADDRESS}" placeholder="주소" >
						<input type="text" name="address2" id="sample2_detailAddress" value="${info.ADDRESS}"  placeholder="상세주소">
						<input type="text" name="addressDetail" id="sample2_extraAddress" value="${info.ADDRESS}" placeholder="참고항목">
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td colspan="2"><input class="form-control" id="name"
									name="NAME" type="text" value="${info.NAME}" required
									data-validation-required-message="Please enter your email address." /></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td colspan="2"><input class="form-control" id="contact" value="${info.CONTACT}"
									name="CONTACT" type="text" required
									data-validation-required-message="Please enter your email address." /></td>
				</tr>
				<tr>
					<td>휴대폰 번호</td>
					<td colspan="2"><input class="form-control" id="phone"
									name="PHONE" type="text" required value="${info.PHONE}"
									data-validation-required-message="Please enter your email address." /></td>
				</tr>
				<tr>
					<td>이메일 주소</td>
					<td colspan="2"><input class="form-control" id="email" value="${info.EMAIL}"
									name="EMAIL" type="text" required
									data-validation-required-message="Please enter your email address." /></td>
				</tr>
				
				
			</table>
			
			
			
			
						<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
						<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
						<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
						</div>
						<div id="success"></div>
                        
					</div>
				</div>
			</form>
			<button class="btn selectDelete_btn btn-info btn-sm float-right" onclick="fn_update()" type="submit">수정</button>
			<button class="btn selectDelete_btn btn-danger btn-sm float-right" onclick="" type="submit">탈퇴</button>
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
	var addressArr=$("#sample2_detailAddress").val().split(', ');

	$("#sample2_postcode").val(addressArr[0]);
	$("#sample2_address").val(addressArr[1]);
	$("#sample2_extraAddress").val(addressArr[2]);
	$("#sample2_detailAddress").val(addressArr[3]);


});

function fn_list(no) {
	//$('#currentPageNo').val(no);
	window.location='<c:url value="/signIn.do"/>';
	
	/* $('#boardForm').attr({
		action : '<c:url value="/boardList.do"/>',
		target : '_self'
	}).submit(); */
};


function fn_update() {
	//var formData = $('#boardForm').serialize();
	var wholeAddress=$("#sample2_postcode").val()+', '+$("#sample2_address").val()
	+', '+$("#sample2_extraAddress").val()
	+', '+$("#sample2_detailAddress").val();
/* 	var wholeAddress=$("#postalCode").val()+', '+$("#address").val()+', '+$("#addressDetail").val(); */
	$("#wholeAddress").val(wholeAddress);
	alert('update');
	$('#boardForm #id').attr('disabled',false);
	$("input[name=ADDRESS]").val(wholeAddress);
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

