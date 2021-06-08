<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page session="false"%>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<!-- Modal -->
<div class="modal fade bd-example-modal-lg" id="exampleModalLong"
	tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle"
	aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLongTitle">상품 상세</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
			<form id="orderForm" method="post" enctype="multipart/form-data">
				<input type="hidden" name="userId" value="${member.ID}" />
				<input type="hidden" id="gdsNum" name="gdsNum" value="${detail.gdsNum}" />
				<input type="hidden" name="gdsPrice" value="${detail.gdsPrice}" />
				<input type="hidden" id="gdsStock" name="gdsStock" />
			

			<div class="table-responsive-lg">
				<table id="details" class="table">
<!-- 				<table id="details" class="table table-borderless"> -->
					<thead>
					</thead>
					<tbody>
					<colgroup>
						<col width="30%">
						<col width="*">
					</colgroup>
						<tr>
							<th>상품명</th>
							<td></td>
						</tr>
						<tr>
							<th>가격</th>
							<td>원</td>
						</tr>
						<tr>
							<th>재고</th>
							<td></td>
						</tr>
						<tr>
							<th>Total Price</th>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
			</form>
			</div>
			
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>