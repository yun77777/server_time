<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<%@ page session="false"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<!-- Font Awesome icons (free version)-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />

<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- Bootstrap core JS-->
<!-- 	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
 -->	
<!--  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
 -->	
	<!-- Core theme JS-->
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value='/resources/css/styles.css'/>" rel="stylesheet" />
</head>
<body>


	<!-- Page Content-->
	<section class="py-5">
		<div class="container">
			<form id="boardForm" method="post">
			<input type="hidden" id="orderId" name="orderId">
			<input type="hidden" id="delivery" name="delivery">
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="${pg.currentPageNo}"/>
			<input type="hidden" id="recordCountPerPage" name="recordCountPerPage" value="${pg.recordCountPerPage}"/>
				<!-- Page Heading/Breadcrumbs-->
					<div class="row">
						<div class="col-12">
							<button type="button" onclick="fn_deliver()" id="" class="btn btn btn-info btn-sm float-right ml-1">발송</button>
							<button type="button" onclick="fn_cancel()" id="" class="btn btn btn-danger btn-sm float-right">취소</button>
						</div>
					</div>
<%-- 						<button class="btn btn-primary" onclick="fn_insert('${login.ID}')" type="button">Insert</button> --%>
				
          		<span>총 <em>${pg.totalRecordCount}</em>건 </span>
                
				<table class="table table-sm text-center">
					<thead class="thead-light">
						<tr>
							<th scope="col">
								<div class="allCheck">
					    			<span>
					    				<input type="checkbox" name="allCheck" id="allCheck" />
					    			</span>
								</div>
							</th>
							<th scope="col">주문번호</th>
							<th scope="col">상품명</th>
							<th scope="col">상품번호</th>
							<th scope="col">주문금액</th>
							<th scope="col">주문일자</th>
							<th scope="col">주문상태</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="result" items="${list}" varStatus="status">
							<tr>
								<th>
									<div class="checkBox">
										<input type="checkbox" name="chBox" class="chBox" data-cid="${result.orderId}" />
										<script>
											$(".chBox").click(function(){
												$("#allCheck").prop("checked", false);
											});
										</script>
									</div>
								</th>
								<th scope="row">${result.orderId}</th>
								<td>
									<a href="#" onclick="fn_order_detail_pop('${result.orderId}','orderMng')"
													data-toggle="modal" data-target="#orderDetailPopup">
										${result.gdsName} <c:if test="${result.cnt eq 1}"> 1</c:if><c:if test="${result.cnt ne 1}">외 ${result.cnt-1}</c:if> 건</a>
								</td>
								<%-- <td><a href="#" onclick="fn_detail('${result.orderId}','${result.delivery}');">${result.gdsName} 외 ${result.cnt-1} 건</a></td> --%>
								<td>${result.gdsNum}</td>
								<td>${result.amount}</td>
								<td>${result.orderDate}</td>
								<td>${result.delivery}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			<div class="row">
				<div class="col-2 float-right">
				<input class="form-control float-right" id="searchId"
						name="searchId" type="text" value="${paramMap.searchId}" 
						data- validation-required-message="Please enter your phone number." />
				</div>
				<button class="btn btn-secondary btn-sm float-right" onclick="fn_list('1','D1')" type="submit">검색</button>
			</div>
			</form>
			
   			<%@ include file="/WEB-INF/views/common/paging.jsp"%>
		</div>
		<!-- //Container -->
	</section>

	<!-- Bootstrap core JS-->
<!-- 	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
 -->	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="<c:url value='/resources/js/scripts.js'/>"></script>
	
	<!-- JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<!-- 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 -->	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.min.js"></script>
<!-- 	
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.3/js/bootstrap-datetimepicker.min.js"></script>
 -->	
</body>

</html>

