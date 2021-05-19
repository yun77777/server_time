<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page session="false"%>
<!DOCTYPE html>
<html>
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
<body class="hold-transition login-page">
<%@ include file="/WEB-INF/views/common/nav.jsp"%>

<div class="login-box">
    <div class="login-logo">
        <a href="${path}/">
            <b>DoubleS</b>&nbsp MVC-BOARD
        </a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">로그인 페이지</p>
 		<form id="loginForm" method="post" enctype="multipart/form-data">
            <div class="form-group has-feedback">
                <input type="text" id="id" name="ID" class="form-control" placeholder="아아디">
                <span class="glyphicon glyphicon-exclamation-sign form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" id="pw" name="PW" class="form-control" placeholder="비밀번호">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <!-- <div class="col-xs-8">
                    <div class="checkbox icheck">
                        <label>
                            <input type="checkbox" name="useCookie"> 로그인유지
                        </label>
                    </div>
                </div> -->
                <!-- /.col -->
                <div class="col-xs-4">
                    <button type="submit" onclick="fn_sign_in()" class="btn btn-primary btn-block btn-flat">
                        <i class="fa fa-sign-in"></i> 로그인
                    </button>
                </div>
                <div class="col-xs-4">
					<input type="checkbox" name="useCookie"> 
					<i class="fa fa-sign-in"></i> 로그인유지
                </div>
                <!-- /.col -->
            </div>

        <div class="social-auth-links text-center">
            <p>- 또는 -</p>
            <a href="#" class="btn btn-block btn-social btn-facebook btn-flat">
                <i class="fa fa-facebook"></i> 페이스북으로 로그인
            </a>
            <a href="#" class="btn btn-block btn-social btn-google btn-flat">
                <i class="fa fa-google-plus"></i> 구글 계정으로 로그인
            </a>
        </div>
        <!-- /.social-auth-links -->

        <a href="#">비밀번호 찾기</a><br>
        <a href="${path}/user/register" class="text-center">회원가입</a>
	</form>
    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->
	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="<c:url value='/resources/js/scripts.js'/>"></script>
	
</body>


<script>

    var msg = "${msg}";
    if (msg === "REGISTERED") {
        alert("회원가입이 완료되었습니다. 로그인해주세요~");
    } else if (msg == "FAILURE") {
        alert("아이디와 비밀번호를 확인해주세요.");
    }

    $(function () {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });
    
    function fn_sign_in() {
    	//var formData = $('#boardForm').serialize();
    	$('#loginForm').attr({
    		action : '<c:url value="/user/loginPost.do"/>',
    		target : '_self'
    	}).submit();
    }

    
</script>
</html>
