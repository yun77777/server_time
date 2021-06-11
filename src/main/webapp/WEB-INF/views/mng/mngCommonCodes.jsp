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

<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
<!-- Font Awesome icons (free version)-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value='/resources/css/styles.css'/>" rel="stylesheet" />
</head>
<body>

	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
	<%@ include file="/WEB-INF/views/common/popup/loginPopup.jsp"%> 
	
	<!-- Page content-->
	<section class="py-5">
		<div class="container">

				<!-- Page Heading/Breadcrumbs-->
				<h2>공통코드 관리</h2>

<!-- @@@ -->
		<form id="boardForm" method="post" enctype="multipart/form-data">

		<div id="container_box">
		<div class="inputArea mt-4 mb-4">
			<span id="total">전체: ${pg.totalRecordCount} 건</span>
				<button type="button" id="addCodeBtn" class="btn btn btn-info btn-sm float-right ml-1">추가</button>			
				<button type="button" onclick="" id="delete_btn" class="btn btn btn-danger btn-sm float-right ml-1">삭제</button>			
				<button type="button" id="insertBtn" onclick="" class="btn btn btn-secondary btn-sm float-right ml-1">저장</button>			
		
		</div>
			<input type="hidden" id="gdsNum" name="gdsNum">
			<input type="hidden" id="currentPageNo" name="currentPageNo" value="${pg.currentPageNo}"/>
			<input type="hidden" id="recordCountPerPage" name="recordCountPerPage" value="${pg.recordCountPerPage}"/>
				<!-- Page Heading/Breadcrumbs-->
				
          		
                
				<table class="table table-sm text-center">
					<colgroup>
						<col width="10%">
						<col width="20%">
						<col width="20%">
						<col width="20%">
						<col width="*">
					</colgroup>
					<thead class="thead-light">
						<tr>
						<th>
						<div class="allCheck">
			    			<span>
			    				<input type="checkbox" name="allCheck" id="allCheck" />
			    			</span>
		    			</div>
						</th>
							<th>공통코드번호</th>
							<th>대분류</th>
							<th>소분류</th>
							<th>이름</th>
							<th>상세</th>
						</tr>
					</thead>
					<tbody id="codesSection">
						<c:forEach var="result" items="${list}" varStatus="status">
							<tr>
							<th>
								<div class="checkBox">
									<input type="checkbox" name="chBox" class="chBox" data-cid="${result.CID}" />
									<script>
										$(".chBox").click(function(){
											$("#allCheck").prop("checked", false);
										});
									</script>
								</div>
							</th>
								<th><input type="text" name="CID" value="${result.CID}" readonly></th>
								<td><input type="text" name="L_CATEGORY" value="${result.L_CATEGORY}"></td>
								<td><input type="text" name="S_CATEGORY" value="${result.S_CATEGORY}"></td>
								<td><input type="text" name="NAME" value="${result.NAME}"></td>
								<td><input type="text" name="DESCRPT" value="${result.DESCRPT}"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<%@ include file="/WEB-INF/views/common/paging.jsp"%>
			
			</div>
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
		<!-- JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment-with-locales.min.js"></script>
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
    
    
   	$(".chBox").click(function(){
			$("#allCheck").prop("checked", false);
		});
   	
   	var maxNo=Number('${maxNo}');
   	var total=Number('${pg.totalRecordCount}');
   	var idx=0;
   	
    $("#addCodeBtn").on("click",function(e){
    	var row='<tr><th><div class="checkBox"><input type="checkbox" name="chBox" class="chBox" data-cid="'+(++maxNo)+'" /></div></th>';
    	row+='<th><input type="text" name="CID" value="'+(maxNo)+'" readonly></th>';
    	row+='<td><input type="text" name="L_CATEGORY" value=""></td>';
    	row+='<td><input type="text" name="S_CATEGORY" value=""></td>';
    	row+='<td><input type="text" name="NAME" value=""></td>';
    	row+='<td><input type="text" name="DESCRPT" value=""></td></tr>';
    	
    	$("#codesSection").append(row);
    	$("#total").html('전체: '+(total+(++idx))+' 건');
    });
    
    
    
    
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
    		
    		$.ajax({
    			url : "/mng/deleteCommonCodes.do",
    			type : "post",
    			data : { chbox : checkArr },
    			success : function(result){
    				
    				if(result == 1) {						
    					alert("삭제되었습니다.");
    					location.href = "/mng/mngCommonCodes.do";
    				} else {
    					alert("삭제실패했습니다.");
    				}
    			}
    		});
    	}
    });
   
    
	$(".chBox").click(function(){
		$("#allCheck").prop("checked", false);
	});
	
	$("#insertBtn").on("click",function(e){
		//var formData = $('#boardForm').serialize();
		var formData = new FormData($("#boardForm")[0]);
		var cidArr = new Array();
		var lCategoryArr = new Array();
		var sCategoryArr = new Array();
		var nameArr = new Array();
		var descrptArr = new Array();
		
		$("input[name=CID]").each(function(){
			cidArr.push($(this).val());
		});
		$("input[name=L_CATEGORY]").each(function(){
			lCategoryArr.push($(this).val());
		});
		$("input[name=S_CATEGORY]").each(function(){
			sCategoryArr.push($(this).val());
		});
		$("input[name=NAME]").each(function(){
			nameArr.push($(this).val());
		});
		$("input[name=DESCRPT]").each(function(){
			descrptArr.push($(this).val());
		});
		
		$.ajax({
			url : "/mng/insertCommonCodes.do",
			type : "post",
			data : { cidArr : cidArr ,lCategoryArr : lCategoryArr ,sCategoryArr : sCategoryArr ,
				nameArr : nameArr ,descrptArr : descrptArr ,},
			//processData : false,
			//contentType : false,
			success : function(result) {
				alert('저장되었습니다.')
				//fn_list();
			}, // success 

			error : function(xhr, status) {
				alert(xhr + " : " + status);
			}
		});
		
		
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
	window.location='<c:url value="/mng/mngCommonCodes.do"/>';
	
	/* $('#boardForm').attr({
		action : '<c:url value="/boardList.do"/>',
		target : '_self'
	}).submit(); */
};

function fn_insert() {
	//var formData = $('#boardForm').serialize();
	var formData = new FormData($("#boardForm")[0]);

	$.ajax({
		url : "/mng/insertCommonCodes.do",
		type : "post",
		data : formData,
		success : function(result) {
			//fn_list();
		}, // success 

		error : function(xhr, status) {
			alert(xhr + " : " + status);
		}
	});

}

</script>



</html>

