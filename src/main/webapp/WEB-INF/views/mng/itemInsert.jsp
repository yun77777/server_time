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
				<h1>
					Item <small>insert</small>
				</h1>

<!-- @@@ -->
	<section id="container">
		<div id="container_box">
			<h2>상품 등록</h2>
			
<%-- 			<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">
 --%>			
			<div class="inputArea">	
				<label>1차 분류${category1}</label>
				<select name="cateCode" class="category1 form-control">
					<option value="">전체</option>
					<c:forEach var="result" items="${category1}">
						<option value="${result.S_CATEGORY}">${result.S_CATEGORY}</option>
					</c:forEach>
				</select>
			
				<label>2차 분류${category2}</label>
				<select class="category2 form-control" name="">
					<option value="">전체</option>
					<c:forEach var="result" items="${category2}">
						<option value="${result.S_CATEGORY}">${result.S_CATEGORY}</option>
					</c:forEach>
				</select>
			</div>
			
			<div class="inputArea">
				<label for="gdsName">gdsNum</label>
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
				
				<!-- <script>
					var ckeditor_config = {
							resize_enaleb : false,
							enterMode : CKEDITOR.ENTER_BR,
							shiftEnterMode : CKEDITOR.ENTER_P,
							filebrowserUploadUrl : "/admin/goods/ckUpload"
					};
					
					CKEDITOR.replace("gdsDes", ckeditor_config);
				</script>
				 -->
				
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
						<button type="submit" class="update_btn">저장</button>
						<button type="button" class="cancel_btn">취소</button>
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
		alert('f');
		var itemImg="#"+$(this).prev().attr("id");
		alert(itemImg);
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
	})
	
	
	$("#gdsImg").change(function(){
		alert('f');
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
});


function fn_valiChk(){
	var regForm = $("form[name='writeForm'] .chk").length;
	for(var i = 0; i<regForm; i++){
		if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
			alert($(".chk").eq(i).attr("title"));
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

	var category=$("#boardForm #category").val();
	var gdsNum=$("#boardForm #gdsNum").val();
	var gdsName=$("#boardForm #gdsName").val();
	var gdsPrice=$("#boardForm #gdsPrice").val();
	var gdsStock=$("#boardForm #gdsStock").val();
	var gdsDes=$("#boardForm #gdsDes").val();
	
	alert($("#gdsNum").val());
	
	formData.append("cateCode",category);
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
	
	
	
	alert('insert');
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


<script>
// 컨트롤러에서 데이터 받기
var jsonData = JSON.parse('${category}');
// 필요한 배열과 오브젝트 변수 생성
var cate1Arr = new Array();
var cate1Obj = new Object();
// 1차 분류 셀렉트 박스에 삽입할 데이터 준비
for(var i = 0; i < jsonData.length; i++) {
	
	if(jsonData[i].level == "1") {  // 레벨이 1인 데이터가 있다면 
		cate1Obj = new Object();  // 초기화
		
		// cate1Obj에 cateCode와 cateName를 저장
		cate1Obj.cateCode = jsonData[i].cateCode; 
		cate1Obj.cateName = jsonData[i].cateName;
		
		// cate1Obj에 저장된 값을 cate1Arr 배열에 저장
		cate1Arr.push(cate1Obj);
	}
}
// 1차 분류 셀렉트 박스에 데이터 삽입
var cate1Select = $("select.category1")
for(var i = 0; i < cate1Arr.length; i++) {
	// cate1Arr에 저장된 값을 cate1Select에 추가
	cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>"
						+ cate1Arr[i].cateName + "</option>");	
}
// 클래스가 category1인 select변수의 값이 바뀌었을 때 실행
$(document).on("change", "select.category1", function(){
	
	// 필요한 배열과 오브젝트 변수를 생성
	var cate2Arr = new Array();
	var cate2Obj = new Object();
	
	// 2차 분류 셀렉트 박스에 삽입할 데이터 준비
	for(var i = 0; i < jsonData.length; i++) {
		
		if(jsonData[i].level == "2") {  // 레빌이 2인 데이터가 있다면
			cate2Obj = new Object();  // 초기화
			
			// cate2Obj에 cateCode, cateName, cateCodeRef를 저장
			cate2Obj.cateCode = jsonData[i].cateCode;
			cate2Obj.cateName = jsonData[i].cateName;
			cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
			
			// cate2Obj에 저장된 값을 cate1Arr 배열에 저장
			cate2Arr.push(cate2Obj);
		} 
	}
	
	var cate2Select = $("select.category2");
	
	/*
	for(var i = 0; i < cate2Arr.length; i++) {
			cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
								+ cate2Arr[i].cateName + "</option>");
	}
	*/
	
	// cate2Select의 값을 제거함(초기화)
	cate2Select.children().remove();
 
	// cate1Select에서 선택한 값을 기준으로 cate2Select의 값을 조정
	$("option:selected", this).each(function(){
		
		var selectVal = $(this).val();  // 현재 선택한 cate1Select의 값을 저장
	
		cate2Select.append("<option value='" + selectVal + "'>전체</option>");  // cate2Select의 '전체'에 현재 선택한 cate1Select와 같은 값 부여
		
		// cate2Arr의 데이터를 cate2Select에 추가
		for(var i = 0; i < cate2Arr.length; i++) {
			
			// 현재 선택한 cate1Select의 값과 일치하는 cate2Arr의 데이터를 가져옴
			if(selectVal == cate2Arr[i].cateCodeRef) {
				cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>"
									+ cate2Arr[i].cateName + "</option>");
			}
		}		
	});
	
});
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

