<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page session="false"%>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<div class="modal fade bd-example-modal-lg" id="orderPopup"
					
					style="display: none; ">
					<!-- tabindex="-1" role="dialog" aria-labelledby="orderPopupTitle" -->
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="orderPopupTitle">상품 상세</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<!-- <span aria-hidden="true">&times;</span> -->
								</button>
							</div>
							<div class="modal-body">
								
<div class="table-responsive-lg">
				<table id="details" class="table">
								<!-- <table class="table table-borderless"> -->
									<thead>
									</thead>
									<tbody>
									<colgroup>
										<col width="30%">
										<col width="*">
									</colgroup>
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
										<td id="name"><input type="hidden" id="gdsName"></td>
									</tr>
									<tr>
										<th>가격</th>
										<td id="price"><input type="hidden" id="gdsPrice"></td>
									</tr>
									<tr>
									<th scope="row">구입 수량</th>
									<td>
										<c:if test="${view.gdsStock != 0}">
											<p class="cartStock">
												<button type="button" class="minus btn btn-secondary btn-sm">-</button>
												<input type="number" id="stock" name="cartStock" class="numBox" min="1" max="${view.gdsStock}" value="1" readonly="readonly"/>
												<button type="button" class="plus btn btn-secondary btn-sm">+</button>
												<input type="hidden" value="${view.gdsStock}" class="gdsStock_hidden" /> 
											</p>
											<p class="addToCart">
												<button type="button" class="addCart_btn btn btn-info btn-sm float-right">카트에 담기</button>
											</p>
										</c:if>
										<c:if test="${view.gdsStock == 0}">
											<p>상품 수량이 부족합니다.</p>						
										</c:if>
									</td>
								</tr>
										<tr>
											<th>상품설명</th>
											<td id="des"><input type="hidden" id="gdsDes"></textArea>
										</tr>
									</tbody>
								</table>
								</div>
								
								<hr>
							</div>

							<div id="pp"></div>
							
							<div class="modal-footer">
							<!-- 1. 맨위로 -->
							<!-- 2. 리뷰 -->
							<!-- 3. Q&A -->
			        		<div id="reviewDiv"></div>
							
							<!-- <button type="submit" id="create2">상품상세(기존)</button> -->
							<button type="submit" id="create" class="btn btn-info">주문</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">닫기</button>
							</div>
						</div>
					</div>
				</div>
				
				
