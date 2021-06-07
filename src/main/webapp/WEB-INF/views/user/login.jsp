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
<!-- LOGIN API -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>


<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value='/resources/css/styles.css'/>" rel="stylesheet" />
</head>
<body class="hold-transition login-page">
<%@ include file="/WEB-INF/views/common/nav.jsp"%>

<div class="login-box">
    <div class="login-logo">
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

	<c:if test="${id eq null}">
<%-- 	<c:if test="${userId eq null}"> --%>
		      <a class="nav-link" href="https://kauth.kakao.com/oauth/authorize?client_id=8ec4c5e4b41aba30453d25fa8512e604&redirect_uri=http://localhost:8080/user/kakaoOauth.do&response_type=code">
		          <span><img height="53" src="<c:url value='/resources/img/btn_kakao.png'/>"></span>
		      </a>
			<%-- <li onclick="kakaoLogin();">
		      <a href="javascript:void(0)">
		          <span><img height="53" src="<c:url value='/resources/img/btn_kakao.png'/>"></span>
		      </a>
			</li> --%>
		      <!-- <a href="javascript:void(0)" onclick="kakaoLogout();">
		          <span>카카오 로그아웃</span>
		      </a> -->
	</c:if>

        <!-- /.social-auth-links -->

        <!-- <a href="#">비밀번호 찾기</a><br> -->
        <a href="<c:url value='/signUp.do'/>" class="text-center">회원가입</a>
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
        alert("회원가입이 완료되었습니다. 로그인해주세요");
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
<script>
Kakao.init('0280f7076bc693fac40abb703230b06b'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
	window.Kakao.Auth.login({
       // scope: 'profile, account_email, gender, age_range, birthday', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
        success: function(response) {
            console.log(response); // 로그인 성공하면 받아오는 데이터
            console.log(response.access_token);
            
            window.Kakao.API.request({ // 사용자 정보 가져오기 
                url: '/v2/user/me',
                success: function(response) {
                    console.log(response);
                    const kakao_account=response.kakao_account;
                    console.log(kakao_account);

                },
                fail: function(error) {
                    console.log(error);
                }
            });
/*            window.location.href= '<c:url value="/user/kakaoOauth.do"/>';
 */            // window.location.href='/ex/kakao_login.html' //리다이렉트 되는 코드
        },
        fail: function(error) {
            console.log(error);
        }
    });
  }
  
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    } else{
    	//window.location.href= '<c:url value="/user/logout.do"/>';

    	
    }
  }  
</script>
</html>
