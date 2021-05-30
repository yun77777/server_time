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
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- Bootstrap core JS-->
<!-- 	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
 -->	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="<c:url value='/resources/js/scripts.js'/>"></script>
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value='/resources/css/styles.css'/>" rel="stylesheet" />
</head>
<body>

	<%@ include file="/WEB-INF/views/common/nav.jsp"%>

	<!-- Page Content-->
	<section class="py-5">
		<div class="container">
			<form id="boardForm" method="post">
			<input type="hidden" id="no" name="no">
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="${pg.currentPageNo}"/>
			<input type="hidden" id="recordCountPerPage" name="recordCountPerPage" value="${pg.recordCountPerPage}"/>
				<!-- Page Heading/Breadcrumbs-->
				<h1 class="mt-4 mb-3">
					Board <small>board</small>
				</h1>
				<div class="row styling">
				<div class="col-lg-8 mb-4">
					<div class="control-group form-group">
			          <div class='input-group date' id='datetimepicker1'>
			            <input type='text' class="form-control input-lg" id="searchStartDate" name="searchStartDate" value="${paramMap.searchStartDate}"/>
			            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
			          </div>
			        </div>
					<div class="control-group form-group">
			          <div class='input-group date' id='datetimepicker1'>
			            <input type='text' class="form-control input-lg" id="searchEndDate" name="searchEndDate" value="${paramMap.searchEndDate}"/>
			            <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span></span>
			          </div>
			        </div>
			      </div>
			    </div><br>
			    
				<div class="row">
				
					<div class="col-lg-8 mb-4">
						<div class="control-group form-group">
							<div class="controls">
								<label>title:</label> <input class="form-control" id="searchTitle"
									name="searchTitle" type="text" value="${paramMap.searchTitle}" 
									data-validation-required-message="Please enter your name." />
								<p class="help-block"></p>
							</div>
						</div>
						<div class="control-group form-group">
							<div class="controls">
								<label>id:</label> <input class="form-control" id="searchId"
									name="searchId" type="text" value="${paramMap.searchId}" 
									data-validation-required-message="Please enter your phone number." />
							</div>
						</div>
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
						<button class="btn btn-primary" onclick="fn_list('1')" type="button">Search</button>
						<br><br>
						<button class="btn btn-primary" onclick="fn_insert('${member.ID}')" type="button">Insert</button>
<%-- 						<button class="btn btn-primary" onclick="fn_insert('${login.ID}')" type="button">Insert</button> --%>
					</div>
				</div>
          		<span>총 <em>${pg.totalRecordCount}</em>건 </span>
                
				<table class="table table-sm">
					<thead>
						<tr>
							<th scope="col">no</th>
							<th scope="col">title</th>
							<th scope="col">id</th>
							<th scope="col">input_dt</th>
							<th scope="col">cnt</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="result" items="${list}" varStatus="status">
							<tr>
								<th scope="row">${result.B_NO}</th>
								<td><a href="#" onclick="fn_detail('${result.B_NO}','${member.ID}');">${result.title}</a></td>
<%-- 								<td><a href="#" onclick="fn_detail('${result.B_NO}','${login.ID}');">${result.title}</a></td> --%>
								<td>${result.id}</td>
								<td>${result.input_dt}</td>
								<td>${result.cnt}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</form>
			
			<!-- Pagination-->
            <!-- <ul class="pagination justify-content-center">
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true">«</span>
                        <span class="sr-only">Previous</span>
                    </a>
                </li>
                <li class="page-item"><a class="page-link" href="#!">1</a></li>
                <li class="page-item"><a class="page-link" href="#!">2</a></li>
                <li class="page-item"><a class="page-link" href="#!">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true">»</span>
                        <span class="sr-only">Next</span>
                    </a>
                </li>
            </ul> -->
   			<%@ include file="/WEB-INF/views/common/paging.jsp"%>
		</div>
		<!-- //Container -->
	</section>
	
	<%@ include file="/WEB-INF/views/common/popup/loginPopup.jsp"%> 

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

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

<script>
function fn_list(no) {
	$('#currentPageNo').val(no);
	
	$('#boardForm').attr({
		action : '<c:url value="/boardList.do"/>',
		target : '_self'
	}).submit();
};

function fn_insert(id){
	if(id.length==0)
		alert("You need to log in first");
	else{
		$('#boardForm').attr({
			action : '<c:url value="/boardInsert.do" />',
			target : '_self'
		}).submit();
	}
	

}

function fn_detail(no,id){
	//var  formData= $('#boardForm').serialize();
	
	if(id.length==0)
		alert("You need to log in first");
	else{
		$('#boardForm #no').val(no);
		
		$('#boardForm').attr({
			action : '<c:url value="/boardDetail.do" />',
			target : '_self'
		}).submit();
	}
}

$(function () {
	   var bindDatePicker = function() {
			$(".date").datetimepicker({
	        format:'YYYY-MM-DD',
				icons: {
					time: "fa fa-clock-o",
					date: "fa fa-calendar",
					up: "fa fa-arrow-up",
					down: "fa fa-arrow-down"
				}
			}).find('input:first').on("blur",function () {
				// check if the date is correct. We can accept dd-mm-yyyy and yyyy-mm-dd.
				// update the format if it's yyyy-mm-dd
				var date = parseDate($(this).val());

				if (! isValidDate(date)) {
					//create date based on momentjs (we have that)
					date = moment().format('YYYY-MM-DD');
				}

				$(this).val(date);
			});
		}
	   
	   var isValidDate = function(value, format) {
			format = format || false;
			// lets parse the date to the best of our knowledge
			if (format) {
				value = parseDate(value);
			}

			var timestamp = Date.parse(value);

			return isNaN(timestamp) == false;
	   }
	   
	   var parseDate = function(value) {
			var m = value.match(/^(\d{1,2})(\/|-)?(\d{1,2})(\/|-)?(\d{4})$/);
			if (m)
				value = m[5] + '-' + ("00" + m[3]).slice(-2) + '-' + ("00" + m[1]).slice(-2);

			return value;
	   }
	   
	   bindDatePicker();
	 });
</script>

</html>

