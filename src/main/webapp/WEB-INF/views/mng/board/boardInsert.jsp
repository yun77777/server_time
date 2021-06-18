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
<title>댕댕몰</title>
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
	<%@ include file="/WEB-INF/views/common/popup/loginPopup.jsp"%> 
	
	<section class="py-5">
            <div class="container">
                <!-- Page Heading/Breadcrumbs-->
                <h1>
                    게시글 상세
                </h1>
                        <form id="boardForm" name="sentMessage" novalidate>
                        	<input type="hidden" id="currentPageNo" name="currentPageNo" value="1"/>
                        	<input type="hidden" id="B_TYPE" name="B_TYPE" value="${paramMap.B_TYPE}"/>
                        	<input type="hidden" id="replyType" name="replyType" value="${paramMap.replyType}"/>
                        	<input type="hidden" id="originNo" name="originNo"
	                                    <c:if test='${empty paramMap.originNo}'>
	                                    value="${detail.originNo}"</c:if>
	                                    <c:if test='${!empty paramMap.originNo}'>
	                                    value="${paramMap.originNo}"</c:if>
                        	/>
                        	<input type="hidden" id="groupOrd" name="groupOrd"
                        	<c:if test='${empty paramMap.groupOrd}'>
	                                    value="${detail.groupOrd}"</c:if>
	                                    <c:if test='${!empty paramMap.groupOrd}'>
	                                    value="${paramMap.groupOrd}"</c:if>
                        	/>
                        	<input type="hidden" id="groupLayer" name="groupLayer"
                        	<c:if test='${empty paramMap.groupLayer}'>
	                                    value="${detail.groupLayer}"</c:if>
	                                    <c:if test='${!empty paramMap.groupLayer}'>
	                                    value="${paramMap.groupLayer}"</c:if>
                        	/>
                            <button class="btn btn-secondary btn-sm float-right" onclick="fn_list()" type="button">목록</button>
                            <table class="table">
                            <colgroup>
                            	<col width="15%">
                            	<col width="*">
                            </colgroup>
							  <thead>
							  </thead>
							  <tbody>
							    <tr>
							      <th scope="row">no</th>
							      <td>
							      	<div class="controls">
	                                    <input class="form-control" id="no" name="no" type="text" 
	                                    <c:if test='${empty paramMap.no}'>
	                                    value="${detail.B_NO}"</c:if>
	                                    <c:if test='${!empty paramMap.no}'>
	                                    value="${paramMap.no}"</c:if>
	                                    
	                                     readonly data-validation-required-message="Please enter your name." />
                                	</div>
							      </td>
							     </tr>
							     <tr>
							     <th scope="row">id</th>
							      <td>
							      	<div class="controls">
                                    <input class="form-control" id="id" name="id" type="text" readonly
	                                    value="${member.ID}" required data-validation-required-message="Please enter your phone number." />
                                	</div>
							      </td>
							      </tr>
							      <tr>
							      <th scope="row">title</th>
							      <td>
							      	<div class="controls">
                                    <input class="form-control" id="title" name="title" type="text" 
                                     <c:if test='${empty paramMap.title}'>
	                                    value="${detail.title}"</c:if>
	                                    <c:if test='${!empty paramMap.title}'>
                                      value="${paramMap.title}"</c:if>
                                     
                                     required data-validation-required-message="Please enter your email address." />
                                	</div>
							      </td>
							      </tr>
							      <tr>
							      <td></td>
							       <td>
							      	<div class="controls">
                                	<textarea rows="5" cols="100" id="content" name="content" class="form-control">${detail.content}</textarea>
                                	</div>
							      </td>
							    </tr>
							  </tbody>
							</table>
				</form>			
                <form id="writeForm" method="post" enctype="multipart/form-data">
					<input type="hidden" id="no" name="no" 
					<c:if test='${empty paramMap.no}'>
                    value="${detail.B_NO}"</c:if>
                    <c:if test='${!empty paramMap.no}'>
                    value="${paramMap.no}"</c:if> />
					<input type="hidden" id="fileNoDel" name="fileNoDel[]" value=""> 
					<input type="hidden" id="fileNameDel" name="fileNameDel[]" value=""> 
					<input type="hidden" id="type" name="type" value="save"> 
					
					<table id="fileIndex">
						<tbody>
						<colgroup>
                           	<col width="15%">
                           	<col width="*">
                        </colgroup>
							<tr>
								<td></td>
								<td>
									<c:forEach var="file" items="${fileList}" varStatus="var">
									<div>
										<img class="card-img-top" style="width:20%;height:auto" name="itemImg${var.index}" id="itemImg${var.index}" src="<c:url value='/img/${file.ORG_FILE_NAME}'/>" alt="no image" />
										<input type="hidden" class="FILE_NO" id="FILE_NO" name="FILE_NO_${var.index}" value="${file.FILE_NO}">
										<input type="hidden" id="FILE_NAME" name="FILE_NAME" value="FILE_NO_${var.index}">
										<a href="#" id="fileName" onclick="return false;">${file.ORG_FILE_NAME}</a>${file.FILE_NO}
										<button id="fileDelBtn" onclick="fn_del('${file.FILE_NO}','FILE_NO_${var.index}');" type="button">삭제</button><br>
									</div>
									</c:forEach>
								</td>
							</tr>
						</tbody>			
					</table>
					
				</form>
                <div>
					<button type="button" class="fileAdd_btn">파일추가</button>
				</div>        
                            
                            
                            <div id="success"></div>
                            
                            <div class="inputArea">
 
			</div>
                            
                            <!-- For success/fail messages-->
                        	<button class="btn btn-info btn-sm float-right" id="saveBtn" type="button">작성</button>
			                
                        
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
	})
	
});
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



function fn_list() {
	$('#boardForm #B_TYPE').val('${B_TYPE}');

	$('#boardForm').attr({
		action : '<c:url value="/mng/boardList.do" />',
		target : '_self'
	}).submit();
};

function fn_insert() {
	$('#boardForm #no').attr('disabled',false);
	var  formData= new FormData($("#writeForm")[0]);

	var no=$("#boardForm #no").val();
	var id=$("#boardForm #id").val();
	var title=$("#boardForm #title").val();
	var content=$("#boardForm #content").val();
	var B_TYPE=$("#boardForm #B_TYPE").val();
	
	formData.append("no",no);
	formData.append("id",id);
	formData.append("title",title);
	formData.append("content",content);
	formData.append("B_TYPE",B_TYPE);

	var fileNoDel = new Array();
	var fileNameDel = new Array();
	var file = new Array();
	
	$(".FILE_NO").each(function(){
		fileNoDel.push($(this).val());
		fileNameDel.push($(this).next().val());
		//checkArr.push($(this).attr("data-cartNum"));  // 배열에 데이터 삽입
		
	});
	
	$("input[type=file]").each(function(){
		file.push($(this).val());
		
	}); 
	
	formData.append("fileNoDel",fileNoDel);
	formData.append("fileNameDel",fileNameDel);
	//formData.append("no",$("#boardForm #no").val());
	formData.append("file",file);
	
	$.ajax({
		url : "${pageContext.request.contextPath}/mng/insertBoard.do",
		type : "post",
		enctype: 'multipart/form-data',
		//data : {fileNoDel : fileNoDel ,fileNameDel : fileNameDel },
		data : formData,
/* 		data : {formData: formData, fileNoDel : fileNoDel ,fileNameDel : fileNameDel }, */
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
	elPlaceHolder : "content", //저는 textarea의 id와 똑같이 적어줬습니다.
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
	$("#saveBtn").click(function() {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []); 
		//textarea의 id를 적어줍니다.

		var selcatd = $("#selcatd > option:selected").val();
		var title = $("#title").val();
		var content = document.getElementById("content").value;
		
		if (selcatd == "") {
			alert("카테고리를 선택해주세요.");
			return;
		}
		if (title == null || title == "") {
			alert("제목을 입력해주세요.");
			$("#title").focus();
			return;
		}
		if(content == "" || content == null || content == '&nbsp;' || 
				content == '<br>' || content == '<br/>' || content == '<p>&nbsp;</p>'){
			alert("본문을 작성해주세요.");
			oEditors.getById["content"].exec("FOCUS"); //포커싱
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

</html>

