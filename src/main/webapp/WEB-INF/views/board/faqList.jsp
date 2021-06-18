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
			<input type="hidden" id="B_TYPE" name="B_TYPE">
			<input type="hidden" id="no" name="no">
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="${pg.currentPageNo}"/>
			<input type="hidden" id="recordCountPerPage" name="recordCountPerPage" value="${pg.recordCountPerPage}"/>
				<!-- Page Heading/Breadcrumbs-->
				<h1 class="mt-4 mb-3">
					FAQ
				</h1>
				
			
			<div class="row">
				<div class="col-12">
					<button class="btn btn-info btn-sm float-right" onclick="fn_insert('${member.ID}','${B_TYPE}')" type="button">작성</button>
				</div>
			</div>
          		<span>총 <em>${pg.totalRecordCount}</em>건 </span>
                
				<table class="table table-sm text-center">
					<thead class="thead-light">
						<tr>
							<th scope="col">글번호</th>
							<th scope="col">제목</th>
							<th scope="col">아이디</th>
							<th scope="col">등록일자</th>
							<th scope="col">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="result" items="${list}" varStatus="status">
							<tr>
								<th scope="row">${result.B_NO}</th>
								<td><a href="#" onclick="fn_detail('${result.B_NO}','${result.id}','${B_TYPE}','${member.ID}');">${result.title}<c:if test="${result.RCNT>0}"><b class="text-danger">&nbsp;[${result.RCNT}]</b></c:if></a></td>
<%-- 								<td><a href="#" onclick="fn_detail('${result.B_NO}','${login.ID}');">${result.title}</a></td> --%>
								<td>${result.id}</td>
								<td>${result.input_dt}</td>
								<td>${result.cnt}</td>
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
				<button class="btn btn-secondary btn-sm float-right" onclick="fn_list('1',2)" type="submit">검색</button>
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

