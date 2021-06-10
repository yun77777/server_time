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
				<div class="modal-header bg-whitesmoke">				
					<h4 class="modal-title">로그인</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">				
					<div class="form-group">
						<label>아이디</label>
		                <input type="text" id="id" name="ID" class="form-control" required="required" placeholder="ID">
			
					</div>
					<div class="form-group">
						<div class="clearfix">
							<label>비밀번호</label>
							<a href="#" class="pull-right text-muted"></a>
						</div>
						<input type="password" id="pw" name="PW"  class="form-control" required="required" placeholder="비밀번호">
					</div>
				</div>
		</form>
	<div class="modal-footer align-self-center bg-whitesmoke">
		<button type="submit" class="btn btn-primary pull-right" onclick="fn_sign_in()">로그인</button>
		<label class="checkbox-inline pull-left"><input type="checkbox" name="useCookie" value="Y">로그인 유지</label>
				
		<c:if test="${id eq null}">
		<div class="align-self-center mt-2">
			<span class="pull-right">
			      <a class="" href="https://kauth.kakao.com/oauth/authorize?client_id=8ec4c5e4b41aba30453d25fa8512e604&redirect_uri=http://localhost:8080/user/kakaoOauth.do&response_type=code">
			          <img height="53" src="<c:url value='/resources/img/btn_kakao.png'/>">
			      </a></span>
			 <span class="pull-left">     
			      <a onclick="fn_naverUrl()" class="ml-1" href="#">
			          <img height="53" src="<c:url value='/resources/img/btn_naver_green.png'/>">
			      </a>
		      </span>
			     <!--  <a href="javascript:void(0)" onclick="kakaoLogout();">
			          <span>카카오 로그아웃</span>
			      </a> -->
	      </div>
		</c:if>
		<div class="align-self-center mt-2" style="width:100%; word-break:break-all;word-wrap:break-word;">
				<a href="<c:url value='/signUp.do'/>" class="text-center">비밀번호 찾기</a> /
				<a href="<c:url value='/signUp.do'/>" class="text-center">회원가입</a>
		</div>
	</div>
			
		</div>
	</div>
</div>     

<%@ include file="/WEB-INF/views/common/commonFunction.jsp"%> 
