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
<style>
body {
    background-color: #f7f6f6
}

.card {
    border: none;
    /* box-shadow: 5px 6px 6px 2px #e9ecef; */
    border-radius: 4px
}

.dots {
    height: 4px;
    width: 4px;
    margin-bottom: 2px;
    background-color: #bbb;
    border-radius: 50%;
    display: inline-block
}

.badge {
    padding: 7px;
    padding-right: 9px;
    padding-left: 16px;
    /* box-shadow: 5px 6px 6px 2px #e9ecef */
}

.user-img {
    margin-top: 4px
}

.check-icon {
    font-size: 17px;
    color: #c3bfbf;
    top: 1px;
    position: relative;
    margin-left: 3px
}

.form-check-input {
    margin-top: 6px;
    margin-left: -24px !important;
    cursor: pointer
}

.form-check-input:focus {
    box-shadow: none
}

.icons i {
    margin-left: 8px
}

.reply {
    margin-left: 12px;
    margin-top: 20px; /* 21/06/03 added */
}

.reply small {
    color: #b7b4b4
}

.reply small:hover {
    color: green;
    cursor: pointer
}
</style>


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
	
<!-- Page Content-->
        <section class="py-5">
            <div class="container">
                <!-- Page Heading/Breadcrumbs-->
                <h1>
                    게시글 상세
                </h1>
                <!-- Content Row-->
                <!-- Contact Form-->
                <!-- In order to set the email address and subject line for the contact form go to the assets/mail/contact_me.php file.-->
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
                                    <c:if test='${empty paramMap.id}'>
	                                    value="${detail.id}"</c:if>
	                                    <c:if test='${!empty paramMap.id}'>
	                                    value="${member.ID}"</c:if>
                                    required data-validation-required-message="Please enter your phone number." />
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
                        	<button class="btn btn-secondary btn-sm float-right" id="sbumit" onclick="fn_reply('${detail.B_NO}')" type="submit">답글</button>
                        	<button class="btn btn-info btn-sm float-right" id="saveBtn" type="button">저장</button>
			                <button class="btn btn-danger btn-sm float-right" id="sendMessageButton" onclick="fn_delete()" type="button">삭제</button>
			                
			                <table class="table table-sm">
								<tbody>
									<tr>
										<th scope="row">이전글</th>
										<c:if test="${!empty list[0].B_NO}">
											<td><a href="#" onclick="fn_detail('${list[0].B_NO}');">${list[0].TITLE}</a></td>
										</c:if>
										<c:if test="${empty list[0].B_NO}">
											<td>이전글이 없습니다.</td>
										</c:if>
									</tr>
									<tr>
										<th scope="row">다음글</th>
										<c:if test="${!empty list[1].B_NO}">
											<td><a href="#" onclick="fn_detail('${list[1].B_NO}');">${list[1].TITLE}</a></td>
										</c:if>
										<c:if test="${empty list[1].B_NO}">
											<td>다음글이 없습니다.</td>
										</c:if>
									</tr>
								</tbody>
							</table>
                        
                    </div>
                </div>
            
            

<div class="container mt-5">
<h1>댓글</h1>
<h5 id="commentCnt">(${replyListLen})</h5>
    <div class="row d-flex justify-content-center">
    
        <div id="reply" class="col-md-8">
            <div class="headings d-flex justify-content-between align-items-center mb-3">
                
                <!-- <div class="buttons"> 
                <span class="badge bg-white d-flex flex-row align-items-center"> 
                <span class="text-primary">Comments "ON"</span>
                        <div class="form-check form-switch"> <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked> </div>
                </span> 
                </div> -->
            </div>
            
            <c:forEach var="result" items="${replyList}" varStatus="status">
             
			 <div class="card p-3 reply">
                <div class="d-flex justify-content-between align-items-center">
                    <div class="user d-flex flex-row align-items-center">
                     ${result.rno}
                     <span><small class="font-weight-bold text-primary">${result.writer}</small> <small class="font-weight-bold">${result.content}</small></span> </div> <small>2 days ago</small>
                </div>
                <div class="action d-flex justify-content-between mt-2 align-items-center">
                    <div class="reply px-4"> <small><a href="#" id="delete_btn">Remove</a></small>
                    	<input type="hidden" class="rno" value="${result.rno}">
                     <span class="dots"></span> <small>Reply</small> <span class="dots"></span> <small>Translate</small> </div>
                    <div class="icons align-items-center"> <i class="fa fa-star text-warning"></i> <i class="fa fa-check-circle-o check-icon"></i> </div>
                </div>
            </div>
		</c:forEach>
        </div>
    </div>
</div>

 
   
   
  
   <div class="container mt-5">
     
    <div class="row d-flex justify-content-center">
    
        <div id="reply" class="col-md-8">
          <form id="commentForm" method="post" enctype="multipart/form-data">
   <div class="card p-3 reply">
			 <table class="table table-borderless">
			 <%-- <colgroup>
				<col width="10%">
				<col width="*">
			</colgroup> --%>
			  <tbody>
			    <tr>
			      <th scope="row" colspan="2">${member.ID}</th>
			   </tr>
			   <tr>
			   	<td>
			   		<div class="d-flex justify-content-between align-items-center">
			             <div class="user d-flex flex-row align-items-center">
			              <textarea rows="5" cols="100" class="form-control" id="content" name="content"></textarea>
			              <span><small class="font-weight-bold text-primary">${result.writer}</small> <small class="font-weight-bold">${result.content}</small></span> </div> 
			         </div>
			   	</td>
			   </tr>
			   <tr>
			   	<td>
			   		<div class="action d-flex justify-content-between mt-2 align-items-center">
			             <div class="reply px-4"> <small>Remove</small> <span class="dots"></span> <small>Reply</small> <span class="dots"></span> <small>Translate</small> </div>
			             <div class="icons align-items-center"> <i class="fa fa-star text-warning"></i> <i class="fa fa-check-circle-o check-icon"></i> </div>
			         </div>
			         <button type="submit" class="btn btn-info btn-sm float-right" id="comment_btn">댓글 작성</button>
			         
			   	</td>
			   </tr>
			  </tbody>
			 </table>
     </div>
     <input type="hidden" id="bno" name="bno">
     <input type="hidden" id="writer" name="writer">
     <input type="hidden" id="rno" name="rno">
     <input type="hidden" id="B_TYPE" name="B_TYPE">
	</form>
</div>
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
$(document).ready(function(){
var replyListLen=Number('${replyListLen}');
$("#commentCnt").html('('+replyListLen+')');

var formObj = $("form[name='writeForm']");
	
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
	
	$(".update_btn").on("click", function(){
		if(fn_valiChk()){
			return false;
		}
		/* formObj.attr("action", "/mng/updateItem.do");
		formObj.attr("method", "post");
		formObj.submit(); */
		
		fn_save();
	});
	
});
function fn_addFile(){
	var fileIndex = 1;
	$(".fileAdd_btn").on("click", function(){
		$("#fileIndex").append("<tr><td></td><td><div><input type='file' style='float:left;' id='file_"+(fileIndex)+"' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='float:right;' id='fileDelBtn'>"+"삭제"+"</button></div></td></tr>");
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

function fn_save() {
	$('#boardForm #no').attr('disabled',false);
	var  formData= new FormData($("#writeForm")[0]);

	
	var replyType=$("#boardForm #replyType").val();
	var originNo=$("#boardForm #originNo").val();
	var groupOrd=$("#boardForm #groupOrd").val();
	var groupLayer=$("#boardForm #groupLayer").val();
    	
	
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
	
	formData.append("replyType",replyType);
	formData.append("originNo",originNo);
	formData.append("groupOrd",groupOrd);
	formData.append("groupLayer",groupLayer);

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
		url : "${pageContext.request.contextPath}/updateBoard.do",
		type : "post",
		enctype: 'multipart/form-data',
		//data : {fileNoDel : fileNoDel ,fileNameDel : fileNameDel },
		data : formData,
/* 		data : {formData: formData, fileNoDel : fileNoDel ,fileNameDel : fileNameDel }, */
		processData : false,
		contentType : false,
		success : function(result) {
			//fn_list();
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
		url : "${pageContext.request.contextPath}/mng/deleteItem.do",
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






function fn_list() {
	$('#boardForm').attr({
		action : '<c:url value="/boardList.do"/>',
		target : '_self'
	}).submit();
};

function fn_detail(no){
	//var  formData= $('#boardForm').serialize();
	//$('#boardForm #replyType').val('N');

	$('#boardForm #no').attr('disabled',false);
	$('#boardForm #no').val(no);
	$('#boardForm').attr({
		action : '<c:url value="/boardDetail.do" />',
		target : '_self'
	}).submit();

}

function fn_btn(no){
	var  formData= $('#boardForm').serialize();
    $.ajax({
        cache : false,
        url : "${pageContext.request.contextPath}/boardDetail.do",
        type : 'POST', 
        data : formData, 
        success : function(data) {
        }, // success 

        error : function(xhr, status) {
            alert(xhr + " : " + status);
        }
    }); // $.ajax */

}

function fn_insert() {
	//var formData = $('#boardForm').serialize();
	$('#boardForm #no').attr('disabled',false);
	//$('#boardForm #replyType').val('N');

	var formData = new FormData($("#boardForm")[0]);
	$.ajax({
		url : "${pageContext.request.contextPath}/insertBoard.do",
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

function fn_delete() {
	//var formData = $('#boardForm').serialize();
	$('#boardForm #no').attr('disabled',false);
	var formData = new FormData($("#boardForm")[0]);
	$.ajax({
		url : "${pageContext.request.contextPath}/deleteBoard.do",
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
	elPlaceHolder : "content", //저는 textarea의 id와 똑같이 적어줬습니다.
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
 */			
			fn_save();
			/*  fn_insert(); */
		}else{
			return;
		}
	});
})

function fn_reply(no){
	//var  formData= $('#boardForm').serialize();
	
	//$('#boardForm #no').attr('disabled',false);
	var len=Number('${len}')+1;
	$('#boardForm #no').val(len);
/* 	$('#boardForm #no').val(${len}+1); */
/* 	$('#boardForm #no').val(Number(no)+1); */
	$('#boardForm #replyType').val('Y');
	//$('#boardForm #originNo').val(Number(no));
	//$('#boardForm #groupOrd').val(Number(no)+1);
	//$('#boardForm #groupLayer').val(Number(no)+1);

	$('#boardForm').attr({
		action : '<c:url value="/boardDetail.do" />',
		target : '_self'
	}).submit();

}

function fn_reply2() {
	$('#boardForm #no').attr('disabled',false);
	var formData = new FormData($("#boardForm")[0]);
	/* $("#no").val('');
	$("#id").val('');
	$("#title").val('');
	$("#file").val('');
	$("#content").html(''); */
	
	$.ajax({
		url : "${pageContext.request.contextPath}/insertReply.do",
		type : "post",
		//data : {bno:bno, writer:writer, content:content},
		enctype: 'multipart/form-data',
		data : formData,
		processData : false,
		contentType : false,
		success : function(result) {
			fn_detail(result.replyNo);
			
			//fn_list();
		}, // success 

		error : function(xhr, status) {
			alert(xhr + " : " + status);
		}
	});
}

$("#delete_btn").click(function(){
	var confirm_val = confirm("정말 삭제하시겠습니까?");
	$("#bno").val($("#boardForm #no").val());
	$("#writer").val($("#boardForm #id").val());
	$("#rno").val($(this).parent().parent().find(".rno").val());
	
	var formData = new FormData($("#commentForm")[0]);

	if(confirm_val) {
													
		$.ajax({
			url : "${pageContext.request.contextPath}/reply/delete.do",
			type : "post",
			enctype: 'multipart/form-data',
			data : formData,
			processData : false,
			contentType : false,
			success : function(result) {
				fn_detail($("#bno").val());
				alert("삭제되었습니다.");
			}
		});
	}	
});

$("#comment_btn").click(function() {
	$("#bno").val($("#boardForm #no").val());
	$("#writer").val($("#boardForm #id").val());
	$("#commentForm #B_TYPE").val($("#boardForm #B_TYPE").val());
	var formData = new FormData($("#commentForm")[0]);
	/* $('#commentForm').attr({
		action : '<c:url value="reply/write.do" />',
		target : '_self'
	}).submit(); */
	
/* 	var bno=$("#bno").val();
	var writer=$("#writer").val();
	var content=$("#content").val(); */
	$.ajax({
		url : "${pageContext.request.contextPath}/reply/write.do",
		type : "post",
		//data : {bno:bno, writer:writer, content:content},
		enctype: 'multipart/form-data',
		data : formData,
		processData : false,
		contentType : false,
		success : function(result) {
			/* $("#replyList").append(result.list);
			var content='<tr><td>'+(result.len)+'</td>'
			content+='<td>'+result.paramMap.writer+'</td>'
			content+='<td>'+result.paramMap.content+'</td>'
			content+='</tr>';
			$("#replyTbl").append(content); */
			
			var content='';
			content+='<div class="card p-3 reply">';
			content+='<div class="d-flex justify-content-between align-items-center">';
			content+='<div class="user d-flex flex-row align-items-center">'+(result.len);
			content+='<span><small class="font-weight-bold text-primary">'+(result.paramMap.writer)+'</small>';
           	content+='<small class="font-weight-bold">';
           	content+=(result.paramMap.content)+'</small></span> </div> <small>2 days ago</small></div>';
            content+='<div class="action d-flex justify-content-between mt-2 align-items-center">';
           	content+='<div class="reply px-4"> <small>Remove</small> <span class="dots"></span> <small>Reply</small> <span class="dots"></span> <small>Translate</small> </div>';
           	content+='<div class="icons align-items-center"> <i class="fa fa-star text-warning"></i> <i class="fa fa-check-circle-o check-icon"></i> </div></div></div>';
                
			$("#reply").append(content);
			$("#commentCnt").html('('+result.len+')');
			
			
			
		
			$("#commentForm #content").val('');
			//fn_list();
		}, // success 

		error : function(xhr, status) {
			alert(xhr + " : " + status);
		}
	});
});

</script>

</html>

