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
	
	<!-- popup in detail -->
		
		<div class="modal fade bd-example-modal-lg" id="exampleModalLong"
					tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle"
					aria-hidden="true">
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLongTitle">Modal
									title</h5>
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

					
								<table class="table">
									<thead>
									</thead>
									<tbody>
										<tr>
											<th>상품명</th>
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

	<!-- </article>
</section> -->








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

