<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 


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
<!-- Page Content-->
        <section id="container">
        <form id="itemForm" method="post" enctype="multipart/form-data">
		<input type="hidden" name="userId" value="${member.ID}" />
					
        
        
		<div id="container_box">
			<h2>상품 등록</h2>
			
<%-- 			<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">
 --%>			
			<div class="inputArea">	
				<label>1차 분류${category1}</label>
				<select name="cateCode" class="category1 form-control">
					<!-- <option value="">전체</option> -->
				<c:forEach var="result" items="${category1}">
					<option value="${result.S_CATEGORY}" <c:if test="${detail.cateCode eq result.L_CATEGORY}"> selected</c:if> >${result.S_CATEGORY}</option>
				</c:forEach>
				</select>
			
				<label>2차 분류${category2}</label>
				<select class="category2 form-control" value="${detail.category}" name="cateCode">
					<option value="2">2</option>
					<option value="">전체</option>
					<c:forEach var="result" items="${category2}">
						<option value="${result.S_CATEGORY}">${result.S_CATEGORY}</option>
					</c:forEach>
				</select>
			</div>
			
			<div class="inputArea">
				<label for="gdsName">gdsNum</label>
				<input type="text" id="gdsNum" name="gdsNum" value="${detail.gdsNum}" disabled class="form-control"/>
			</div>
			
			<div class="inputArea">
				<label for="gdsName">상품명</label>
				<input type="text" id="gdsName" name="gdsName" value="${detail.gdsName}" class="form-control"/>
			</div>
			
			<div class="inputArea">
				<label for="gdsPrice">상품가격</label>
				<input type="text" id="gdsPrice" name="gdsPrice" value="${detail.gdsPrice}" class="form-control"/>
			</div>
			
			<div class="inputArea">
				<label for="gdsStock">상품수량</label>
				<input type="text" id="gdsStock" name="gdsStock" value="${detail.gdsStock}" class="form-control"/>
			</div>
			<div class="inputArea">
				<label for="gdsDes">상품소개</label>
				<div class="jsx-2303464893 editor">
					<textarea rows="5" cols="50" id="gdsDes" name="gdsDes" class="form-control">${detail.gdsDes}</textarea>
				</div>
				
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
			
			
		
<%-- 				<%=request.getRealPath("/") %> 
 --%>				
<%--  <%=request.getSession().getServletContext().getRealPath("/") %>
 --%>
			</div>
			<div class="inputArea">
				<div class="col-lg-4 col-sm-6 mb-4">
                    <div class="card h-100">
<%-- 		            	<img class="card-img-top" src="<c:url value='/img/${detail.file}'/>" alt="no image" /></a>
 --%>                    
 				<label for="gdsImg">이미지</label>
				<c:forEach var="result" items="${imgList}" varStatus="status">
					<input type="hidden" id="idx" value="${status.index}">
					<label for="gdsImg${status.index}"><h3>${result.file}</h3></label>
			        <img class="card-img-top" name="itemImg${status.index}" id="itemImg${status.index}" src="<c:url value='/img/${result.file}'/>" alt="no image" />
					<input type="file" id="gdsImg${status.index}" name="file_${status.index}" value="${result.file}" class="form-control"/>
<!-- 				<div class="select_img"><img src="" /></div>
 -->				
				</c:forEach>
				
				
				<input type="hidden" id="len" value="${len}">
				<div class="select_img"><img src="" /></div>
                <div id="fileDiv">
		            <p>
		                <!-- <input type="file" id="file" name="file_0"> -->
		                <a href="#this" class="btn" id="delete" name="delete">삭제</a>
		            </p>
		        </div>
		         
		        <br/><br/>
		        <a href="#this" class="btn" id="addFile">파일 추가</a>
			                    
                    </div>
                </div>
	                    
	                  
				
				<script>
				
					$("input[type=file]").change(function(){
						var gdsImg="#"+$(this).attr("id");
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
				</script>
			</div>
			</form>
			
		<div>
				<button class="btn btn-primary" id="saveBtn" type="button">Save</button>
                <button class="btn btn-primary" id="deleteBtn" onclick="fn_delete()" type="submit">Delete</button>
		</div>
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
 
/*  var gfv_count = Number($("#idx").val());  */
 
$(document).ready(function(){
	var gfv_count =Number($("#len").val());
	var gdsImg="#"+$(this).attr("id");
	var itemImg="#"+$(this).prev().attr("id");
	
	alert("len:"+gfv_count);
	
    $("#addFile").on("click", function(e){ //파일 추가 버튼
    	var gfv_count =Number($("#len").val());
        e.preventDefault();
        fn_addFile(gfv_count);
    	alert("gfv_count:+++"+gfv_count);
    	$("#len").val(++gfv_count);

    });
     
    $("a[name='delete']").on("click", function(e){ //삭제 버튼
        e.preventDefault();
        fn_deleteFile($(this));
    });
});

function fn_addFile(gfv_count){
	alert("gfv_count:"+gfv_count);

	
    var str = "<img class='card-img-top' name='itemImg"+gfv_count+"' id='itemImg"+gfv_count+"' src='' alt='no image' /><p><input type='file' id='gdsImg"+gfv_count+"' name='file_"+gfv_count+"' class='form-control'/><a href='#this' class='btn' name='delete'>삭제</a></p>";
    $("#fileDiv").append(str);
    $("a[name='delete']").on("click", function(e){ //삭제 버튼
        e.preventDefault();
        fn_deleteFile($(this));
    });
    
    
    var gdsImg="#gdsImg"+gfv_count
	var itemImg="#itemImg"+gfv_count;
    $(gdsImg).change(function(){
		
		alert("gdsImg:"+gdsImg);
		alert("v:"+$(gdsImg).val());
		alert(itemImg);
		if(this.files && this.files[0]) {
			var reader = new FileReader;
			reader.onload = function(data) {
				$(itemImg).attr("src", data.target.result).width(500);
				alert($(itemImg).attr("str"));
/* 								$(".select_img img").attr("src", data.target.result).width(500);								 */
			}
			reader.readAsDataURL(this.files[0]);
		}
	});
}
 
function fn_deleteFile(obj){
    obj.parent().remove();
}





function fn_list(no) {
	//$('#currentPageNo').val(no);
	window.location='<c:url value="/itemList.do"/>';
	
	/* $('#itemForm').attr({
		action : '<c:url value="/boardList.do"/>',
		target : '_self'
	}).submit(); */
};

function fn_detail(no){
	//var  formData= $('#itemForm').serialize();
	$('#itemForm #gdsNum').attr('disabled',false);
	$('#itemForm #gdsNum').val(no);
/* 	$('#itemForm #no').attr('disabled',false);
	$('#itemForm #no').val(no); */
	
	$('#itemForm').attr({
		action : '<c:url value="/itemDetail.do" />',
		target : '_self'
	}).submit();

}

function fn_btn(no){
	var  formData= $('#itemForm').serialize();
    $.ajax({
        cache : false,
        url : "${pageContext.request.contextPath}/itemDetail.do",
        type : 'POST', 
        data : formData, 
        success : function(data) {
        }, // success 

        error : function(xhr, status) {
            alert(xhr + " : " + status);
        }
    }); // $.ajax */

}

function fn_save() {
	$('#itemForm #gdsNum').attr('disabled',false);
	
	var formData = new FormData($("#itemForm")[0]);
	$.ajax({
		url : "${pageContext.request.contextPath}/updateItem.do",
		type : "post",
		enctype: 'multipart/form-data',
		data : formData,
		processData : false,
		contentType : false,
		success : function(result) {
			alert('success');
			fn_list();
		}, // success 

		error : function(xhr, status) {
			alert(xhr + " : " + status);
		}
	});
}

function fn_delete() {
	//var formData = $('#itemForm').serialize();
	$('#itemForm #gdsNum').attr('disabled',false);
/* 	$('#itemForm #no').attr('disabled',false); */
	var formData = new FormData($("#itemForm")[0]);
	$.ajax({
		url : "${pageContext.request.contextPath}/deleteItem.do",
		type : "post",
		enctype: 'multipart/form-data',
		data : formData,
		processData : false,
		contentType : false,
		success : function(result) {
			alert('success');
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
	sSkinURI : "se2/SmartEditor2Skin.html", //경로를 꼭 맞춰주세요!
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
	$("#saveBtn").click(function() {
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
/* 			$("#itemForm").submit();
 */			fn_save();
		}else{
			return;
		}
	});
});

</script>

</html>

