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
    <%-- <div class="login-logo">
        <a href="${path}/">
            <b>userInfo</b> ${userInfo}
        </a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
    <c:if test="${not empty login}">
    	<p class="login-box-msg">member ${login.ID} login successfully</p>
    </c:if>
		<form id="loginForm" method="post" enctype="multipart/form-data">
	</form>
	 --%>
	
	
	
      <b>userInfo</b> ${userInfo}<br>
      <b>id</b> ${id}<br>
      <b>nickname</b> ${nickname}<br>
	
	<hr>
	
	
	
    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="<c:url value='/resources/js/scripts.js'/>"></script>
	
	
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	
</body>


<script>

</script>
</html>
