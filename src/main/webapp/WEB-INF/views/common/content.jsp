<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page session="false"%>

<hr class="my-0" />


<!-- Portfolio Section-->
<!-- <section class="py-5 bg-light" style="float: left; width: 80%;">
	<article> -->
		<div class="container container-lg" >

			<%@ include file="/WEB-INF/views/common/slideImgs.jsp"%>

		</div>
<%-- 		<%@ include file="/WEB-INF/views/common/paging.jsp"%>
 --%>	
	
	<!--@@@@@@@@@@@@ 제품 상세 팝업 모달 popup in detail -->
<%@ include file="/WEB-INF/views/common/popup/orderPopup.jsp"%> 
	<!--// @@@@@@@@@@@@ 제품 상세 팝업 모달 popup in detail -->

	<!--@@@@@@@@@@@@ 로그인 상세 팝업 모달 popup in detail -->
<%@ include file="/WEB-INF/views/common/popup/loginPopup.jsp"%> 
	<!--@@@@@@@@@@@@ 로그인 상세 팝업 모달 popup in detail -->




<form id="orderForm" method="post" enctype="multipart/form-data">
									<input type="hidden" id="gdsNum" name="gdsNum" value="${detail.gdsNum}" />
									<input type="hidden" name="ID" value="${member.ID}" />
									<input type="hidden" id="userId" name="userId" value="${member.ID}" />
 									<input type="hidden" id="orderProcessDetail" name="orderProcessDetail" value="Y" />
<input type="hidden" id="gdsPrice" name="gdsPrice"/>
<input type="hidden" id="gdsStock" name="gdsStock" />
<input type="hidden" id="gdsName" name="gdsName" />
<input type="hidden" id="file" name="file" />
<input type="hidden" id="orderId" name="orderId" />
								
								</form>

<!-- <aside style="float: left; width: 20%">
	<h3>최근글</h3>
	<ul>
		<li>목록1</li>
		<li>목록2</li>
	</ul>

	<div id="floatMenu" class="floatMenu"
		style="position: absolute; width: 200px; height: 200px; right: 50px; top: 550px; background-color: #606060; color: #fff;">
		<span>최근에 본 상품</span>
	</div>
</aside> -->


<hr class="my-0" />

<!-- 메인 이미지 css -->
<style>
    body {
		font-family: 'Varela Round', sans-serif;
	}
	.modal-login {
		width: 320px;
		margin: 30px auto;
	}
	.modal-login .modal-content {
		border-radius: 1px;
		border: none;
	}
	.modal-login .modal-header {
        position: relative;
		justify-content: center;
        background: #f2f2f2;
	}
    .modal-login .modal-body {
        padding: 30px;
    }
    .modal-login .modal-footer {
        background: #f2f2f2;
    }
	.modal-login h4 {
		text-align: center;
		font-size: 26px;
	}
    .modal-login label {
        font-weight: normal;
        font-size: 13px;
    }
	.modal-login .form-control, .modal-login .btn {
		min-height: 38px;
		border-radius: 2px; 
	}
	.modal-login .hint-text {
		text-align: center;
	}
	.modal-login .close {
        position: absolute;
		top: 15px;
		right: 15px;
	}
    .modal-login .checkbox-inline {
        margin-top: 12px;
    }
    .modal-login input[type="checkbox"]{
        margin-top: 2px;
    }
	.modal-login .btn {
        min-width: 100px;
		background: #3498db;
		border: none;
		line-height: normal;
	}
	.modal-login .btn:hover, .modal-login .btn:focus {
		background: #248bd0;
	}
	.modal-login .hint-text a {
		color: #999;
	}
	.trigger-btn {
		display: inline-block;
		margin: 100px auto;
	}
</style>