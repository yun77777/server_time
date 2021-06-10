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
				
				<div class="row styling">
						<!-- <div class="card mb-4">
                            <h5 class="card-header">Search</h5>
                            <div class="card-body">
                                <div class="input-group">
                                    <input class="form-control" type="text" placeholder="Search for..." />
                                    <span class="inpug-group-append"><button class="btn btn-secondary" type="button">Go!</button></span>
                                </div>
                            </div>
                        </div> -->
						<div id="success"></div>
						<!-- //search-->
						<div class="row">
						<div class="col-12">
							<button type="button" onclick="" id="delete_btn" class="btn btn btn-info btn-sm float-right">발송</button>
							<button type="button" onclick="" id="cancel_btn" class="btn btn btn-danger btn-sm float-right">취소</button>
						</div>
					</div>
<%-- 						<button class="btn btn-primary" onclick="fn_insert('${login.ID}')" type="button">Insert</button> --%>
					</div>
				
          		<span>총 <em>${pg.totalRecordCount}</em>건 </span>
                
				<table class="table table-sm">
					<thead>
						<tr>
							<th scope="col">
								<div class="allCheck">
					    			<span>
					    				<input type="checkbox" name="allCheck" id="allCheck" />
					    			</span>
								</div>
							</th>
							<th scope="col">orderId</th>
							<th scope="col">gdsName</th>
							<th scope="col">gdsNum</th>
							<th scope="col">amount</th>
							<th scope="col">delivery</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="result" items="${list}" varStatus="status">
							<c:if test="${result.delivery eq '발송'}">
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
									<td><a href="#" onclick="fn_detail('${result.orderId}','${result.delivery}');">${result.gdsName} 외 ${result.cnt-1} 건</a></td>
									<td>${result.gdsNum}</td>
									<td>${result.amount}</td>
									<td>${result.delivery}</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</form>
			
   			<%@ include file="/WEB-INF/views/common/paging.jsp"%>
			<div class="row float-right">
				<div class="form-group row">
					<div class="col-xs-4">
						<label>id:</label> 
					</div>
				</div>
				<div class="form-group row">
					<div class="col-xs-4">
						<input class="form-control" id="searchId"
							name="searchId" type="text" value="${paramMap.searchId}" 
							data-validation-required-message="검색명 입력" />
					</div>
				</div>
				<div class="form-group row">
					<button class="btn btn-secondary btn-sm right" onclick="fn_list('1')" type="button">검색</button>
				</div>
			</div>
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

