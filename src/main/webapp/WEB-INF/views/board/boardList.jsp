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
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link href="<c:url value='/resources/css/styles.css'/>" rel="stylesheet" />
</head>
<body>

	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
	<%@ include file="/WEB-INF/views/common/popup/loginPopup.jsp"%> 

    <form id="boardListForm" method="post">
    	<input type="hidden" id="B_TYPE" name="B_TYPE">
    </form>
    
	<!-- Page Content-->
	<section class="py-5">
		<div class="container">
				<nav>
				  <div class="nav nav-tabs" id="nav-tab" role="tablist">
				    <a class="nav-link <c:if test="${B_TYPE eq '1'}"> active </c:if>" id="nav-home-tab" onclick="fn_boardList(1,1)" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">Q&A</a>
				    <a class="nav-link <c:if test="${B_TYPE eq '2'}"> active </c:if>" id="nav-profile-tab" onclick="fn_boardList(2,1)" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">FAQ</a>
				    <a class="nav-link <c:if test="${B_TYPE eq '3'}"> active </c:if>" id="nav-contact-tab" onclick="fn_boardList(3,1)" data-toggle="tab" href="#nav-contact" role="tab" aria-controls="nav-contact" aria-selected="false">공지사항</a>
				  </div>
				</nav>
				<div class="tab-content" id="nav-tabContent">
				  <div class="tab-pane fade show <c:if test="${B_TYPE eq '1'}"> active </c:if>" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
					<%@ include file="/WEB-INF/views/board/qnaList.jsp"%>
				  </div>
				  <div class="tab-pane fade show <c:if test="${B_TYPE eq '2'}"> active </c:if>" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
				  	<%@ include file="/WEB-INF/views/board/faqList.jsp"%>
				  </div>
				  <div class="tab-pane fade show <c:if test="${B_TYPE eq '3'}"> active </c:if>" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
				  	<%@ include file="/WEB-INF/views/board/noticeList.jsp"%>
				  </div>
				</div>
			    
				<div class="row">
				
					<div class="col-lg-8 mb-4">
						<div id="success"></div>
				</div>
			</div>
                
   			
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
</body>

<script>
function fn_boardList(B_TYPE,no) {
	$('#B_TYPE').val(B_TYPE);
	$('#boardForm #currentPageNo').val(no);

	$('#boardListForm').attr({
		action : '<c:url value="/boardList.do"/>',
		target : '_self'
	}).submit();
}

function fn_list(no) {
/* function fn_list(no, B_TYPE) { */
	$('#boardForm #currentPageNo').val(no);
	$('#boardForm #B_TYPE').val('${B_TYPE}');
	
	$('#boardForm').attr({
		action : '<c:url value="/boardList.do"/>',
		target : '_self'
	}).submit();
};

function fn_insert(id, B_TYPE){
	$('#boardForm #B_TYPE').val(B_TYPE);

	if(id.length==0)
		alert('로그인 후 이용해주세요');
	else{
		$('#boardForm').attr({
			action : '<c:url value="/boardInsert.do" />',
			target : '_self'
		}).submit();
	}
	

}

function fn_detail(no,id,B_TYPE,M_ID){
	//var  formData= $('#boardForm').serialize();
	$('#boardForm #B_TYPE').val(B_TYPE);

	if(id.length==0)
		alert('로그인 후 이용해주세요');
	else{
		/* if(id!=M_ID){
			alert('게시물 확인 권한이 없습니다.');
		}else{
			$('#boardForm #no').val(no);
			$('#boardForm').attr({
				action : '<c:url value="/boardDetail.do" />',
				target : '_self'
			}).submit();
		} */
		
		$('#boardForm #no').val(no);
		$('#boardForm').attr({
			action : '<c:url value="/boardDetail.do" />',
			target : '_self'
		}).submit();
	}
}

</script>

</html>

