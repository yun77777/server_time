<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page session="false"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<div id="myModal" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
 		<form id="loginForm" method="post" enctype="">
				<div class="modal-header">				
					<h4 class="modal-title">Login</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">				
					<div class="form-group">
						<label>ID</label>
		                <input type="text" id="id" name="ID" class="form-control" required="required" placeholder="ID">
			
					</div>
					<div class="form-group">
						<div class="clearfix">
							<label>PASSWORD</label>
							<a href="#" class="pull-right text-muted"><small>Forgot?</small></a>
						</div>
						<input type="password" id="pw" name="PW"  class="form-control" required="required" placeholder="비밀번호">
					</div>
				</div>
		</form>
				<div class="modal-footer">
					<label class="checkbox-inline pull-left"><input type="checkbox" name="useCookie" value="Y"> Remember me</label>
					<button type="submit" class="btn btn-primary pull-right" onclick="fn_sign_in()">Login</button>
				
				
				</div>
				
				
	<c:if test="${id eq null}">
		      <a class="nav-link" href="https://kauth.kakao.com/oauth/authorize?client_id=8ec4c5e4b41aba30453d25fa8512e604&redirect_uri=http://localhost:8080/user/kakaoOauth.do&response_type=code">
		          <span><img height="53" src="<c:url value='/resources/img/btn_kakao.png'/>"></span>
		      </a>
		     <!--  <a href="javascript:void(0)" onclick="kakaoLogout();">
		          <span>카카오 로그아웃</span>
		      </a> -->
	</c:if>
			
	        <a href="<c:url value='/signUp.do'/>" class="text-center">회원가입</a>
		</div>
	</div>
</div>     

<%@ include file="/WEB-INF/views/common/commonFunction.jsp"%> 
