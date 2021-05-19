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
						<label>id:</label>
						<label>
							<c:if test="${not empty login}">
		                    	<li class="nav-item"><p class="nav-link">Welcome <b>${login.ID}</b>!</p></li>
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
									name="ID" type="text" value="${login.ID}" disabled/>
							</div>
						</div>
						
						
						<div class="control-group form-group">
							<div class="controls">
								<label>password:</label> <input class="form-control" id="pw"
									name="PW" type="text" required
									data-validation-required-message="Please enter your email address." />
							</div>
							<div class="controls">
								<label>password check:</label> <input class="form-control" id="pwChk"
									name="pwChk" type="text" required
									data-validation-required-message="Please enter your email address." />
							</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>name:</label> <input class="form-control" id="name"
									name="NAME" type="text" required
									data-validation-required-message="Please enter your email address." />
							</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>address:</label> 
								<input type="hidden" id="wholeAddress" name="ADDRESS">
								<input class="form-control" id="postalCode"
									name="postalCode" type="text" required
									data-validation-required-message="Please enter your email address." />
									<button type="button" onclick="fn_dp_chk()">postal code check</button>
								<input class="form-control" id="address"
									name="address" type="text" required
									data-validation-required-message="Please enter your email address." />
								<input class="form-control" id="addressDetail"
									name="addressDetail" type="text" required
									data-validation-required-message="Please enter your email address." />
							</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>contact:</label> 
								<input class="form-control" id="contact"
									name="CONTACT" type="text" required
									data-validation-required-message="Please enter your email address." />
							</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>phone:</label> <input class="form-control" id="phone"
									name="PHONE" type="text" required
									data-validation-required-message="Please enter your email address." />
							</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>email:</label> <input class="form-control" id="email"
									name="EMAIL" type="text" required
									data-validation-required-message="Please enter your email address." />
							</div>
						</div>
						<div id="success"></div>
						<!-- For success/fail messages-->
                        <button class="btn btn-primary" id="sendMessageButton" onclick="fn_list()" type="button">Go to the list</button>
<!-- 						<button class="btn btn-primary" id="sendMessageButton" onclick="fn_sign_up()" type="button">SignUp</button>
 -->						<button class="btn btn-primary" onclick="fn_sign_up2()" id="signIn" type="submit">Update</button>
							<button class="btn btn-primary" onclick="" id="" type="submit">Delete</button>
						
<!-- 						<button class="btn btn-primary" onclick="fn_insert()" id="submit" type="button">submit</button> -->
					</div>
				</div>
			</form>
		</div>
	</section>

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="<c:url value='/resources/js/scripts.js'/>"></script>
	
</body>

<script>
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
	var wholeAddress=$("#postalCode").val()+', '+$("#address").val()+', '+$("#addressDetail").val();
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



function fn_sign_up2() {
	//var formData = $('#boardForm').serialize();
	var wholeAddress=$("#postalCode").val()+', '+$("#address").val()+', '+$("#addressDetail").val();
	$("#wholeAddress").val(wholeAddress);
	
	$('#boardForm #id').attr('disabled',false);

	$('#boardForm').attr({
		action : '<c:url value="/user/register.do"/>',
		target : '_self'
	}).submit();
}

</script>

</html>

