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
		
		<div class="modal fade bd-example-modal-lg" id="exampleModalLong"
					tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLongTitle">Item Detail</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<form id="orderForm" method="post" enctype="multipart/form-data">
									<input type="hidden" name="gdsNum" value="${detail.gdsNum}" />
									<input type="hidden" name="ID" value="${member.ID}" />
									<input type="hidden" name="userId" value="${member.ID}" />
					<%-- <input type="hidden" id="gdsNum" name="gdsNum" value="${detail.gdsNum}" />
				<input type="hidden" name="gdsPrice" value="${detail.gdsPrice}" />
				<input type="hidden" id="gdsStock" name="gdsStock" /> --%>
								
								</form>

					
								<table class="table table-borderless">
									<thead>
									</thead>
									<tbody>
										<tr>
											<th></th>
											<td>
												<div class="col-md-8">
													<img id="rpsnImg" class="card-img-top" src=""
														alt="no image" />
<!-- 													<img id="rpsnImg" class="card-img-top scale" src=""
														alt="no image" /> -->
												</div>
											</td>
										</tr>
										<tr>
											<th>상품명</th>
											<td><input type="hidden" id="gdsName"></td>
										</tr>
										<tr>
											<th>가격</th>
											<td><input type="hidden" id="gdsPrice"></td>
										</tr>
										<tr>
											<th>재고</th>
											<td><input type="hidden" id="gdsStock"></td>
										</tr>
										<tr>
											<th>Total Price</th>
											<td><input type="hidden" id="totalPrice"></td>
										</tr>
										<tr>
											<th>gdsDes</th>
											<td><input type="hidden" id="gdsDes"></textArea>
										</tr>
									</tbody>
								</table>
							</div>

							<div id="pp"></div>
							
							<button type="submit" id="create">new</button>
							<button type="submit" id="create2">new2</button>
<!-- 							<button type="button" id="create">new</button> -->
							 <div></div>


							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
								<button type="button" id="saveBtn" class="btn btn-primary">Save
									changes</button>
							</div>
						</div>
					</div>
				</div>
	<!--// @@@@@@@@@@@@ 제품 상세 팝업 모달 popup in detail -->

	<!-- </article>
</section> -->


	<!--@@@@@@@@@@@@ 로그인 상세 팝업 모달 popup in detail -->
	
	
	<!-- <div class="text-center">
	Button HTML (to Trigger Modal)
	<a href="#myModal" class="trigger-btn" data-toggle="modal">Click to Open Login Modal</a>
</div> -->

<!-- Modal HTML -->
<%@ include file="/WEB-INF/views/common/popup/loginPopup.jsp"%> 

<%-- <div id="myModal" class="modal fade">
	<div class="modal-dialog modal-login">
		<div class="modal-content">
			<form action="/examples/actions/confirmation.php" method="post">
				<div class="modal-header">				
					<h4 class="modal-title">Login</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">				
					<div class="form-group">
						<label>Username</label>
						<input type="text" class="form-control" required="required">
					</div>
					<div class="form-group">
						<div class="clearfix">
							<label>Password</label>
							<a href="#" class="pull-right text-muted"><small>Forgot?</small></a>
						</div>
						
						<input type="password" class="form-control" required="required">
					</div>
				</div>
				<div class="modal-footer">
					<label class="checkbox-inline pull-left"><input type="checkbox"> Remember me</label>
					<input type="submit" class="btn btn-primary pull-right" value="Login">
				</div>
			</form>
		</div>
	</div>
</div> --%>

	
	<!--@@@@@@@@@@@@ 로그인 상세 팝업 모달 popup in detail -->






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