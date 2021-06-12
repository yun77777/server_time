<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page session="false"%>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<div class="modal fade bd-example-modal-lg" id="reviewPopup"
					 style="display: none;">
					<!-- tabindex="-1" role="dialog" aria-labelledby="reviewPopupTitle" -->
					<div class="modal-dialog modal-lg" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="reviewPopupTitle">주문 상세</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>
							<div class="modal-body">
								<!-- <div id="kk"></div> -->
								<div id="itemDetail"></div>
								<div id="orderInfo"></div>
					
							</div>
							<div class="modal-footer">
								<<!-- button type="button" class="btn btn-danger"
									data-dismiss="modal">주문 취소</button>
									<button type="button" class="btn btn-secondary"
								data-dismiss="modal">확인</button> -->
							</div>
						</div>
					</div>
				</div>
				
				
