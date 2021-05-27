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
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value='/resources/css/styles.css'/>" rel="stylesheet" />
</head>
<body>

	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
	<!-- Page content-->
	<section class="py-5">
		<div class="container">
			<form id="boardForm" method="post" enctype="multipart/form-data">

				<!-- Page Heading/Breadcrumbs-->
				<h2>Manage Common Codes</h2>

<!-- @@@ -->
	<section id="container">
		<div id="container_box">
			<form id="boardForm" method="post">
			<input type="hidden" id="gdsNum" name="gdsNum">
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="${pg.currentPageNo}"/>
			<input type="hidden" id="recordCountPerPage" name="recordCountPerPage" value="${pg.recordCountPerPage}"/>
				<!-- Page Heading/Breadcrumbs-->
				<div class="inputArea">
					<button type="submit" id="" class="btn btn-primary">추가</button>			
					<button type="submit" id="" class="btn btn-primary">삭제</button>			
					<button type="submit" id="register_Btn" class="btn btn-primary">저장</button>			
				</div>
          		<span>Total: <em>${pg.totalRecordCount}</em> </span>
                
				<table class="table table-sm">
					<colgroup>
						<col width="10%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
						<col width="*">
					</colgroup>
					<thead>
						<tr>
							<th>CID</th>
							<th>L_CATEGORY</th>
							<th>S_CATEGORY</th>
							<th>NAME</th>
							<th>DESCRPT</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="result" items="${list}" varStatus="status">
							<tr>
								<th><input type="text" name=CID value="${result.CID}"></th>
								<td><input type="text" name=L_CATEGORY value="${result.L_CATEGORY}"></td>
								<td><input type="text" name="S_CATEGORY" value="${result.S_CATEGORY}"></td>
								<td><input type="text" name="NAME" value="${result.NAME}"></td>
								<td><input type="text" name="DESCRPT" value="${result.DESCRPT}"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<%@ include file="/WEB-INF/views/common/paging.jsp"%>
			</form>
			
			</div>
	</section>
	<!-- //@@@ -->



			</form>
			
		</div>
	</section>
	
	
	

	<%@ include file="/WEB-INF/views/common/footer.jsp"%>

	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="<c:url value='/resources/js/scripts.js'/>"></script>
	
</body>

<script>
var gfv_count = 1;
$(document).ready(function(){
    $("#addFile").on("click", function(e){ //파일 추가 버튼
        e.preventDefault();
        fn_addFile();
    });
     
    $("a[name='delete']").on("click", function(e){ //삭제 버튼
        e.preventDefault();
        fn_deleteFile($(this));
    });
});

function fn_addFile(){
    var str = "<p><input type='file' name='file_"+(gfv_count++)+"'><a href='#this' class='btn' name='delete'>삭제</a></p>";
    $("#fileDiv").append(str);
    $("a[name='delete']").on("click", function(e){ //삭제 버튼
        e.preventDefault();
        fn_deleteFile($(this));
    });
}
 
function fn_deleteFile(obj){
    obj.parent().remove();
}



function fn_list(no) {
	//$('#currentPageNo').val(no);
	window.location='<c:url value="/itemList.do"/>';
	
	/* $('#boardForm').attr({
		action : '<c:url value="/boardList.do"/>',
		target : '_self'
	}).submit(); */
};

function fn_insert() {
	//var formData = $('#boardForm').serialize();
	$('#boardForm #gdsNum').attr('disabled',false);
	var formData = new FormData($("#boardForm")[0]);
	alert('insert');
	$.ajax({
		url : "${pageContext.request.contextPath}/insertItem.do",
		type : "post",
		enctype: 'multipart/form-data',
		data : formData,
		processData : false,
		contentType : false,
		success : function(result) {
			fn_list();
		}, // success 

		error : function(xhr, status) {
			alert(xhr + " : " + status);
		}
	});

}

</script>



</html>

