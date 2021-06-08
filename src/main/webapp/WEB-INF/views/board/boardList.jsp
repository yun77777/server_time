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
					게시판
				</h1>
				
				<nav>
				  <div class="nav nav-tabs" id="nav-tab" role="tablist">
				    <a class="nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Q&A</a>
				    <a class="nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">FAQ</a>
				    <a class="nav-link" id="nav-contact-tab" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">공지사항</a>
				  </div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
				  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
					<%@ include file="/WEB-INF/views/board/qnaList.jsp"%>
				  </div>
				  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
				  	<%@ include file="/WEB-INF/views/board/faqList.jsp"%>
				  </div>
				  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
				  	<%@ include file="/WEB-INF/views/board/noticeList.jsp"%>
				  </div>
				</div>
				<%-- <div class="row styling">
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
			    </div><br> --%>
			    
				<div class="row">
				
					<div class="col-lg-8 mb-4">
						<%-- <div class="control-group form-group">
							<div class="controls">
								<label>title:</label> <input class="form-control" id="searchTitle"
									name="searchTitle" type="text" value="${paramMap.searchTitle}" 
									data-validation-required-message="Please enter your name." />
								<p class="help-block"></p>
							</div>
						</div> --%>
						
						
						<!-- <div class="form-group row"><div class="card mb-4">
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
				</div>
			</div>
                
   			
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
		alert('로그인 후 이용해주세요');
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
		alert('로그인 후 이용해주세요');
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

