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
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
			<input type="hidden" id="gdsNum" name="gdsNum">
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="${pg.currentPageNo}"/>
			<input type="hidden" id="recordCountPerPage" name="recordCountPerPage" value="${pg.recordCountPerPage}"/>
				<!-- Page Heading/Breadcrumbs-->
				<h1 class="mt-4 mb-3">
				상품 관리
				</h1>
			    
				<div class="row">
				
				<div class="col-lg-8 mb-4">
					<div class="control-group form-group">
						<div id="success"></div>
						<!-- //search-->
						<button type="button" onclick="" id="delete_btn" class="btn btn btn-danger btn-sm float-right">삭제</button>			
						<button class="btn btn btn-info btn-sm float-right mr-1" onclick="fn_insert('${member.ID}')" type="button">추가</button>
					</div>
				</div>
          		<span>전체: <em>${pg.totalRecordCount}</em> 건</span>
                
				<table class="table table-sm">
					<thead class="thead-light text-center">
						<tr>
							<th scope="col">
							<div class="allCheck">
				    			<span>
				    				<input type="checkbox" name="allCheck" id="allCheck" />
				    			</span>
							</div>
							</th>
							<th scope="col">상품번호</th>
							<th scope="col">이미지</th>
							<th scope="col">카테고리</th>
							<th scope="col">상품명</th>
							<th scope="col">재고</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="result" items="${list}" varStatus="status">
							<tr>
								<th>
									<div class="checkBox">
										<input type="checkbox" name="chBox" class="chBox" data-cid="${result.gdsNum}" />
										<script>
											$(".chBox").click(function(){
												$("#allCheck").prop("checked", false);
											});
										</script>
									</div>
								</th>
								<th scope="row">${result.gdsNum}</th>
								<td style="height:200px">
		                           <img class="card-img-top" src="<c:url value='/img/${result.representative_file}'/>" style="width:100px" alt="no image" />
								</td>
								<th scope="row">${result.cateCode}</th>
								<td><a href="#" onclick="fn_detail('${result.gdsNum}');">${result.gdsName}</a></td>
								<td>${result.gdsStock}</td>
								
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
					<div class="col-2 float-right">
						<input class="form-control float-right" id="searchId"
								name="searchId" type="text" value="${paramMap.searchId}" 
								data- validation-required-message="Please enter your phone number." />
					</div>
					<button class="btn btn-secondary btn-sm float-right" onclick="fn_list('1')" type="submit">검색</button>
				</div>
			</form>
			
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
<!-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.3/js/bootstrap-datetimepicker.min.js"></script>
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
    			url : "/mng/deleteItems.do",
    			type : "post",
    			data : { chbox : checkArr },
    			success : function(result){
    				
    				if(result == 1) {						
    					alert("삭제 완료");
    					location.href = "/mng/itemList.do";
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
		action : '<c:url value="/mng/itemList.do"/>',
		target : '_self'
	}).submit();
};

function fn_insert(id){
	if(id.length==0)
		alert("You need to log in first");
	else{
		$('#boardForm').attr({
			action : '<c:url value="/mng/itemInsert.do" />',
			target : '_self'
		}).submit();
	}
	

}

function fn_detail(gdsNum){
	//var  formData= $('#boardForm').serialize();
	
	/* if(id.length==0)
		alert("You need to log in first");
	else{ */
		$('#boardForm #gdsNum').val(gdsNum);
		
		$('#boardForm').attr({
			action : '<c:url value="/mng/itemDetail.do" />',
			target : '_self'
		}).submit();
	/* } */
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

