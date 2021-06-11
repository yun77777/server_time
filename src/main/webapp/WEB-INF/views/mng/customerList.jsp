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
	<%@ include file="/WEB-INF/views/common/popup/loginPopup.jsp"%> 
	<%@ include file="/WEB-INF/views/common/popup/customerDetailPopup.jsp"%>
	
	<!-- Page Content-->
	<section class="py-5">
		<div class="container">
			<form id="boardForm" method="post">
			<input type="hidden" id="no" name="no">
			<input type="hidden" id="userId" name="userId">
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="${pg.currentPageNo}"/>
			<input type="hidden" id="recordCountPerPage" name="recordCountPerPage" value="${pg.recordCountPerPage}"/>
				<!-- Page Heading/Breadcrumbs-->
				<h1 class="mt-4 mb-3">
					고객 관리
				</h1>
			    
				<div class="row">
				
					<div class="col-lg-8 mb-4">
						<div id="success"></div>
						<!-- //search-->
					<div class="row">
						<div class="col-12">
							<button type="button" onclick="" id="delete_btn" class="btn btn btn-danger btn-sm float-right">삭제</button>
						</div>
					</div>
				</div>
			</div>
          		<span>총 <em>${pg.totalRecordCount}</em>건 </span>
                
				<table class="table table-sm text-center">
					<colgroup>
						<col width="10%">
						<col width="20%">
						<col width="20%">
						<col width="*">
					</colgroup>
					<thead class="thead-light">
						<tr>
							<th scope="col">
								<div class="allCheck">
					    			<span>
					    				<input type="checkbox" name="allCheck" id="allCheck" />
					    			</span>
								</div>
							</th>
							<!-- th scope="col">번호</th> -->
							<th scope="col">아이디</th>
							<th scope="col">이름</th>
							<th scope="col">가입일자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="result" items="${list}" varStatus="status">
							<tr>
								<th>
									<div class="checkBox">
										<input type="checkbox" name="chBox" class="chBox" data-cid="${result.ID}" />
										<script>
											$(".chBox").click(function(){
												$("#allCheck").prop("checked", false);
											});
										</script>
									</div>
								</th>
								<%-- <th scope="row">${status.index}</th> --%>
								<td>
									<a href="#" onclick="fn_customer_detail_pop('${member.ID}')"
													data-toggle="modal" data-target="#customerDetailPopup">${result.ID}
									</a>
								</td>
								<td>${result.NAME}</td>
								<td>${result.input_dt}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			
			
   			<%@ include file="/WEB-INF/views/common/paging.jsp"%>
   			
   			<div class="row">
				<div class="col-2 float-right">
				<input class="form-control float-right" id="searchId"
						name="searchId" type="text" value="${paramMap.searchId}" 
						data- validation-required-message="Please enter your phone number." />
				</div>
				<button class="btn btn-secondary btn-sm float-right" onclick="fn_list('1')" type="submit">검색</button>
			</div>
			</form>
		</div>
		<!-- //Container -->
	</section>
	

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
$(document).ready(function(){
	$("#allCheck").click(function(){
    	var chk = $("#allCheck").prop("checked");
    	
    	if(chk) {
    		$(".chBox").prop("checked", true);
    	} else {
    		$(".chBox").prop("checked", false);
    	}
    });	
	
 $("#delete_btn").on("click",function(e){

    	var confirm_val = confirm("정말 삭제하시겠습니까?");
    	
    	if(confirm_val) {
    		var checkArr = new Array();

    		// 체크된 체크박스의 갯수만큼 반복
    		$("input[class='chBox']:checked").each(function(){
    			checkArr.push($(this).attr("data-cid"));
    		});
    		
    		alert(checkArr);
    			
    		$.ajax({
    			url : "/mng/deleteCustomer.do",
    			type : "post",
    			data : { chbox : checkArr },
    			success : function(result){
    				if(result == 1) {						
    					alert("삭제 완료");
    					location.href = "/mng/customerList.do";
    				} else {
    					alert("삭제 실패");
    				}
    			}
    		});
    	}
    });
});
function fn_list(no) {
	$('#currentPageNo').val(no);
	
	$('#boardForm').attr({
		action : '<c:url value="/mng/customerList.do"/>',
		target : '_self'
	}).submit();
};

function fn_insert(id){
	if(id.length==0)
		alert("로그인 후 게시물 작성이 가능합니다.");
	else{
		$('#boardForm').attr({
			action : '<c:url value="/mng/boardInsert.do" />',
			target : '_self'
		}).submit();
	}
	

}

function fn_detail(id){
	//var  formData= $('#boardForm').serialize();
	
	if(id.length==0)
		alert("You need to log in first");
	else{
		$('#boardForm').attr({
			action : '<c:url value="/mng/boardDetail.do" />',
			target : '_self'
		}).submit();
	}
}

</script>

</html>

