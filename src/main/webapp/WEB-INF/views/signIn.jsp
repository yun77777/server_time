<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
d
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
					Board <small>insert</small>
				</h1>
				<!-- Content Row-->
				<!-- Contact Form-->
				<!-- In order to set the email address and subject line for the contact form go to the assets/mail/contact_me.php file.-->
				<div class="row">
					<div class="col-lg-8 mb-4">
						<div class="control-group form-group">
							<div class="controls">
								<label>id:</label> <input class="form-control" id="id"
									name="ID" type="text" value="${detail.id}" required
									data-validation-required-message="Please enter your phone number." />
							</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>password:</label> <input class="form-control" id="pw"
									name="PW" type="text" value="" required
									data-validation-required-message="Please enter your email address." />
							</div>
						</div>
						<div id="success"></div>
						<!-- For success/fail messages-->
                        <button class="btn btn-primary" id="sendMessageButton" onclick="fn_list()" type="button">Go to the list</button>
<!-- 						<button class="btn btn-primary" onclick="fn_sign_in()" id="signIn" type="button">Sign In</button>
 -->						
 						<button class="btn btn-primary" id="sendMessageButton" onclick="fn_sign_up()" type="button">Sign Up</button>
						<a href="">Find id</a>
						<a href="">Find password</a>
						<button class="btn btn-primary" onclick="" id="submit" type="button">naver sign in</button>
						<button class="btn btn-primary" onclick="" id="submit" type="button">kakao sign in</button>
<!-- 						<button class="btn btn-primary" onclick="fn_sign_in2()" id="signIn" type="button">Sign In2</button>
 -->						
						<button class="btn btn-primary" onclick="fn_sign_in3()" id="signIn" type="submit">Sign In</button>
						
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
	window.location='<c:url value="/boardList.do"/>';
	
	/* $('#boardForm').attr({
		action : '<c:url value="/boardList.do"/>',
		target : '_self'
	}).submit(); */
};

function fn_sign_up() {
	//$('#currentPageNo').val(no);
	window.location='<c:url value="/signUp.do"/>';
	
	/* $('#boardForm').attr({
		action : '<c:url value="/boardList.do"/>',
		target : '_self'
	}).submit(); */
};

function fn_sign_in() {
	//var formData = $('#boardForm').serialize();
	var formData = new FormData($("#boardForm")[0]);
	
	$.ajax({
		url : "${pageContext.request.contextPath}/memberLogin.do",
		type : "post",
		enctype: 'multipart/form-data',
		data : formData,
		processData : false,
		contentType : false,
		success : function(result) {
			alert('result:'+result.result);
			if(result.result=='success')
				alert('successfully login');
			//fn_list();
		}, // success 

		error : function(xhr, status) {
			alert(xhr + " : " + status);
		}
	});

}

function fn_sign_in2() {
	//var formData = $('#boardForm').serialize();
	var formData = new FormData($("#boardForm")[0]);
	
	$.ajax({
		url : "${pageContext.request.contextPath}/user/loginPost.do",
		type : "post",
		enctype: 'multipart/form-data',
		data : formData,
		processData : false,
		contentType : false,
		success : function(result) {
			alert('result:'+result.result);
			if(result.result=='success')
				alert('successfully login');
			//fn_list();
		}, // success 

		error : function(xhr, status) {
			alert(xhr + " : " + status);
		}
	});

}

function fn_sign_in3() {
	//var formData = $('#boardForm').serialize();
	
	$('#boardForm').attr({
		action : '<c:url value="/user/register.do"/>',
		target : '_self'
	}).submit();
}

</script>

</html>

