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
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript" src="<c:url value='/se2/js/HuskyEZCreator.js'/>" charset="utf-8"></script>

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

<!-- @@@ -->
	<section id="container">
		<div id="container_box">
			<h2>상품 등록</h2>
			
<%-- 			<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">
 --%>			
 
             <button class="btn btn-secondary btn-sm float-right" id="" onclick="fn_list()" type="button">목록</button>
 
			<div class="inputArea">	
				<label>1차 분류</label>
				<select id="cateCode1" name="cateCode1" class="category1 form-control">
					<option value="">전체</option>
					<c:forEach var="result" items="${category1}">
						<option value="${result.CID}">${result.NAME}</option>
					</c:forEach>
				</select>
			
				<label>2차 분류</label>
				<select id="cateCode2" name="cateCode2" class="category2 form-control" name="">
					<option value="">전체</option>
						<c:forEach var="result" items="${top}">
							<option class="topOpt" value="${result.CID}">${result.NAME}</option>
						</c:forEach>
					<c:forEach var="result" items="${bottom}">
						<option class="bottomOpt" value="${result.CID}">${result.NAME}</option>
					</c:forEach>
					<c:forEach var="result" items="${shoes}">
						<option class="shoesOpt" value="${result.CID}">${result.NAME}</option>
					</c:forEach>
					<c:forEach var="result" items="${pet}">
						<option class="petOpt" value="${result.CID}">${result.NAME}</option>
					</c:forEach>
				</select>
			</div>
			
			<div class="inputArea">
				<label for="gdsName">상품 번호</label>
				<input type="text" id="gdsNum" name="gdsNum" value="${paramMap.gdsNum}" disabled class="form-control"/>
			</div>
			<div class="inputArea">
				<label for="gdsName">상품명</label>
				<input type="text" id="gdsName" name="gdsName" class="form-control"/>
			</div>
			
			<div class="inputArea">
				<label for="gdsPrice">상품가격</label>
				<input type="text" id="gdsPrice" name="gdsPrice" class="form-control"/>
			</div>
			
			<div class="inputArea">
				<label for="gdsStock">상품수량</label>
				<input type="text" id="gdsStock" name="gdsStock" class="form-control"/>
			</div>
			
			<div class="inputArea">
				<label for="gdsDes">상품소개</label>
				<textarea rows="5" cols="50" id="gdsDes" name="gdsDes" class="form-control"></textarea>
				
			</div>
			
		</div>
	</section>
	<!-- //@@@ -->
			</form>
			
				<form id="writeForm" method="post" enctype="multipart/form-data">
		
					
					<input type="hidden" id="no" name="no" value="${detail.gdsNum}"/>
					<input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
					<input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 
					
					<table>
						<tbody>
							<tr>
								<td id="fileIndex">
								
									<c:forEach var="file" items="${imgList}" varStatus="var">
									<div>
										<img class="card-img-top" style="width:20%;height:auto" name="itemImg${var.index}" id="itemImg${var.index}" src="<c:url value='/img/${file.file}'/>" alt="no image" />
										<input type="hidden" class="FILE_NO" id="FILE_NO" name="FILE_NO_${var.index}" value="${file.file_no}">
										<input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FILE_NO_${var.index}">
										<a href="#" id="fileName" onclick="return false;">${file.file}</a>${file.file_no}
										<button id="fileDelBtn" onclick="fn_del('${file.file_no}','FILE_NO_${var.index}');" type="button">삭제</button><br>
									</div>
									</c:forEach>
									
								</td>
							</tr>
						</tbody>			
					</table>
					
				</form>
		<div>
<!-- 						<button type="submit" class="update_btn">저장</button>
 -->						<button type="button" class="cancel_btn">취소</button>
						<button type="button" class="fileAdd_btn">파일추가</button>
		</div>
			
			
			
			
			
			
			<div class="inputArea">
				<button type="submit" id="register_Btn" class="btn btn-primary">등록</button>			
			</div>
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
	
	
	var formObj = $("form[name='writeForm']");
	/* $(".write_btn").on("click", function(){
		if(fn_valiChk()){
			return false;
		}
		formObj.attr("action", "/board/write");
		formObj.attr("method", "post");
		formObj.submit();
	}); */
	
	
	$("input[type=file]").change(function(){
		var itemImg="#"+$(this).prev().attr("id");
		if(this.files && this.files[0]) {
			var reader = new FileReader;
			reader.onload = function(data) {
				$(itemImg).attr("src", data.target.result).width(500);
				
/* 								$(".select_img img").attr("src", data.target.result).width(500);								 */
			}
			reader.readAsDataURL(this.files[0]);
		}
	});
	
	
	fn_addFile();
	$(".cancel_btn").on("click", function(){
		event.preventDefault();
		/* location.href = "/board/readView?bno=${update.bno}"
			   + "&page=${scri.page}"
			   + "&perPageNum=${scri.perPageNum}"
			   + "&searchType=${scri.searchType}"
			   + "&keyword=${scri.keyword}"; */
	})
	
	$(".update_btn").on("click", function(){
		if(fn_valiChk()){
			return false;
		}
		/* formObj.attr("action", "/mng/updateItem.do");
		formObj.attr("method", "post");
		formObj.submit(); */
		
		fn_insert();
	});
	
	
	$("#gdsImg").change(function(){
		   if(this.files && this.files[0]) {
		    var reader = new FileReader;
		    reader.onload = function(data) {
		     $(".select_img img").attr("src", data.target.result).width(500);        
		    }
		    reader.readAsDataURL(this.files[0]);
		   }
		  });
	
	
	/*  */
	
	
	
	
	
	
    $("#addFile").on("click", function(e){ //파일 추가 버튼
        e.preventDefault();
        fn_addFile();
    });
     
    $("a[name='delete']").on("click", function(e){ //삭제 버튼
        e.preventDefault();
        fn_deleteFile($(this));
    });
    
    $(".topOpt").hide();
	$(".bottomOpt").hide();
	$(".shoesOpt").hide();
	$(".petOpt").hide();
    
    $("#cateCode1").change(function(){
    	
    	if($(this).val()=='7'){
	    	$(".topOpt").show();
	    	$(".bottomOpt").hide();
	    	$(".shoesOpt").hide();
	    	$(".petOpt").hide();
   		} else if($(this).val()=='9'){
	    	$(".topOpt").hide();
	    	$(".bottomOpt").show();
	    	$(".shoesOpt").hide();
	    	$(".petOpt").hide();
   		} else if($(this).val()=='10'){
	    	$(".topOpt").hide();
	    	$(".bottomOpt").hide();
	    	$(".shoesOpt").show();
	    	$(".petOpt").hide();
   		} else if($(this).val()=='12'){
	    	$(".topOpt").hide();
	    	$(".bottomOpt").hide();
	    	$(".shoesOpt").hide();
	    	$(".petOpt").show();
   		} else{
   			$(".topOpt").hide();
	    	$(".bottomOpt").hide();
	    	$(".shoesOpt").hide();
	    	$(".petOpt").hide();
   		}
    	
    });
});


function fn_valiChk(){
	var regForm = $("form[name='writeForm'] .chk").length;
	for(var i = 0; i<regForm; i++){
		if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
			//alert($(".chk").eq(i).attr("title"));
			return true;
		}
	}
}
function fn_addFile(){
	var fileIndex = 1;
	$(".fileAdd_btn").on("click", function(){
		$("#fileIndex").append("<div><input type='file' style='float:left;' id='file_"+(fileIndex)+"' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
		//$("#fileIndex").append("<div><img class='card-img-top' style='width:20%;height:auto' name='itemImg$"+(fileIndex++)+"' id='itemImg"+(fileIndex++)+"' alt='no image' /><input type='file' style='float:left;' id='file_"+(fileIndex)+"' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div>");
	});
	 
	 
	  

	
	
	$(document).on("click","#fileDelBtn", function(){
		$(this).parent().remove();
		
	});
}

var fileNoArry = new Array();
var fileNameArry = new Array();

function fn_del(value, name){
	
	fileNoArry.push(value);
	fileNameArry.push(name);
	$("#fileNoDel").attr("value", fileNoArry);
	$("#fileNameDel").attr("value", fileNameArry);
}



/*  */


function fn_list(no) {
	//$('#currentPageNo').val(no);
	window.location='<c:url value="/mng/itemList.do"/>';
	
	/* $('#boardForm').attr({
		action : '<c:url value="/boardList.do"/>',
		target : '_self'
	}).submit(); */
};

function fn_insert() {
	//var formData = $('#boardForm').serialize();
	$('#boardForm #gdsNum').attr('disabled',false);
	//var formData = new FormData($("#boardForm")[0]);
	var  formData= new FormData($("#writeForm")[0]);

	var cateCode1=$("#boardForm #cateCode1").val();
	var cateCode2=$("#boardForm #cateCode2").val();
	var gdsNum=$("#boardForm #gdsNum").val();
	var gdsName=$("#boardForm #gdsName").val();
	var gdsPrice=$("#boardForm #gdsPrice").val();
	var gdsStock=$("#boardForm #gdsStock").val();
	var gdsDes=$("#boardForm #gdsDes").val();
	
	formData.append("cateCode1",cateCode1);
	formData.append("cateCode2",cateCode2);
	formData.append("gdsNum",gdsNum);
	formData.append("gdsName",gdsName);
	formData.append("gdsPrice",gdsPrice);
	formData.append("gdsStock",gdsStock);
	formData.append("gdsDes",gdsDes);


	var fileNoDel = new Array();
	var fileNameDel = new Array();
	var file = new Array();
	
	
	$(".FILE_NO").each(function(){
		fileNoDel.push($(this).val());
		fileNameDel.push($(this).next().val());
		//checkArr.push($(this).attr("data-cartNum"));  // 배열에 데이터 삽입
		
	});
	
	$("input[type=file]").each(function(){
		//alert('file:'+$(this).val());
		file.push($(this).val());
		
	}); 
	
	//alert($("input[type=file]").val());
	
	formData.append("fileNoDel",fileNoDel);
	formData.append("fileNameDel",fileNameDel);
	formData.append("no",$("#itemForm #gdsNum").val());
	formData.append("B_TYPE",4);
	formData.append("file",file);
	
	$.ajax({
		url : "${pageContext.request.contextPath}/mng/insertItem.do",
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

var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef : oEditors,
	elPlaceHolder : "gdsDes", //저는 textarea의 id와 똑같이 적어줬습니다.
	sSkinURI : "${pageContext.request.contextPath}/se2/SmartEditor2Skin.html", //경로를 꼭 맞춰주세요!
	fCreator : "createSEditor2",
	htParams : {
		// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseToolbar : true,

		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
		bUseVerticalResizer : false,

		// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
		bUseModeChanger : false
	}
});

$(function() {
	$("#register_Btn").click(function() { 
/* 	$("#submit").click(function() { */
		oEditors.getById["gdsDes"].exec("UPDATE_CONTENTS_FIELD", []); 

		//textarea의 id를 적어줍니다.

		var selcatd1 = $(".category1").val();
		var selcatd2 = $(".category2").val(); 
/* 		var selcatd = $("#selcatd > option:selected").val(); */
		//var gdsDes = document.getElementById("gdsDes").value;
		var gdsPrice = $("#gdsPrice").val();
		var gdsStock = $("#gdsStock").val();
		var gdsName = $("#gdsName").val();
		var gdsDes = $("#gdsDes").val();

		if (selcatd1 == "") {
			alert("카테고리를 선택해주세요.");
			$(".category1").focus();
			return;
		} 
		if (selcatd2 == "") {
			alert("카테고리를 선택해주세요.");
			$(".category2").focus();
			return;
		} 
		if (gdsName == null || gdsName == "") {
			alert("상품명을 입력해주세요.");
			$("#gdsName").focus();
			return;
		}
		
		if (gdsPrice == null || gdsPrice == "") {
			alert("상품가격을 입력해주세요.");
			$("#gdsPrice").focus();
			return;
		}
		
		if (gdsStock == null || gdsStock == "") {
			alert("상품수량을 입력해주세요.");
			$("#gdsStock").focus();
			return;
		}
		
		if(gdsDes == "" || gdsDes == null || gdsDes == '&nbsp;' || 
				gdsDes == '<br>' || gdsDes == '<br/>' || gdsDes == '<p>&nbsp;</p>'){
			alert("본문을 작성해주세요.");
			oEditors.getById["gdsDes"].exec("FOCUS"); //포커싱
			return;
		} //이 부분은 스마트에디터 유효성 검사 부분이니 참고하시길 바랍니다.
		
		var result = confirm("작성하시겠습니까?");
		
		if(result){
			alert("작성 완료!");
/* 			$("#boardForm").submit();
 */			fn_insert();
		}else{
			return;
		}
	});
})
</script>



<!-- <script>
var regExp = /[^0-9]/gi;
$("#gdsPrice").keyup(function(){ numCheck($(this)); });
$("#gdsStock").keyup(function(){ numCheck($(this)); });
function numCheck(selector) {
	var tempVal = selector.val();
	selector.val(tempVal.replace(regExp, ""));
}
</script> -->

</html>

