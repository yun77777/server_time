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
<title>Modern Business - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<style>
body {
    background-color: #f7f6f6
}

.card {
    border: none;
    box-shadow: 5px 6px 6px 2px #e9ecef;
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
    box-shadow: 5px 6px 6px 2px #e9ecef
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
    margin-left: 12px
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
<!-- Page Content-->
        <section class="py-5">
            <div class="container">
                <!-- Page Heading/Breadcrumbs-->
                <h1>
                    Board
                    <small>detail</small>
                </h1>
                <!-- Content Row-->
                <!-- Contact Form-->
                <!-- In order to set the email address and subject line for the contact form go to the assets/mail/contact_me.php file.-->
                <div class="row">
                    <div class="col-lg-8 mb-4">
                        <form id="boardForm" name="sentMessage" novalidate>
                        	<input type="hidden" id="currentPageNo" name="currentPageNo" value="1"/>
                            <button class="btn btn-secondary btn-sm float-right" id="sendMessageButton" onclick="fn_list()" type="button">Go to the list</button>
                            <table class="table">
							  <thead>
							  </thead>
							  <tbody>
							    <tr>
							      <th scope="row">no</th>
							      <td>
							      	<div class="controls">
	                                    <input class="form-control" id="no" name="no" type="text" value="${detail.B_NO}" disabled data-validation-required-message="Please enter your name." />
                                	</div>
							      </td>
							     </tr>
							     <tr>
							     <th scope="row">id</th>
							      <td>
							      	<div class="controls">
                                    <input class="form-control" id="id" name="id" type="text"  value="${detail.id}" required data-validation-required-message="Please enter your phone number." />
                                	</div>
							      </td>
							      </tr>
							      <tr>
							      <th scope="row">title</th>
							      <td>
							      	<div class="controls">
                                    <input class="form-control" id="title" name="title" type="text"  value="${detail.title}" required data-validation-required-message="Please enter your email address." />
                                	</div>
							      </td>
							      </tr>
							      <tr>
							      <th scope="row">file</th>
							      <td>
							      	<div class="controls">
                                     <input class="form-control" id="file" name="file" type="text"  value="${detail.file}" required data-validation-required-message="Please enter your email address." />
                                	</div>
							      </td>
							      </tr>
							      <tr>
							      <th scope="row"></th>
							      <td>
							      	<div class="controls">
                                	<textarea rows="5" cols="50" id="content" name="content" class="form-control">${detail.content}</textarea>
                                	</div>
							      </td>
							    </tr>
							  </tbody>
							</table>
                            
                            
                            
                            
                            <div id="success"></div>
                            
                            <div class="inputArea">
 
			</div>
                            
                            <!-- For success/fail messages-->
                            
                        	<button class="btn btn-info btn-sm float-right" id="submit" onclick="" type="button">Save</button>
			                <button class="btn btn-danger btn-sm float-right" id="sendMessageButton" onclick="fn_delete()" type="button">Delete</button>
			                
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
                        </form>
                    </div>
                </div>
            
            
            
<%--             
<div>
     <table id="replyTbl" class="table table-sm">
	<thead>
		<tr>
			<th scope="col">rno</th>
			<th scope="col">writer</th>
			<th scope="col">content</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="result" items="${replyList}" varStatus="status">
			<tr>
				<td>${result.rno}</td>
				<td>${result.writer}</td>
				<td>${result.content}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>      --%>  
            
            
          
   


<!-- <div id="replyList"></div> -->





<div class="container mt-5">
    <div class="row d-flex justify-content-center">
        <div id="reply" class="col-md-8">
            <div class="headings d-flex justify-content-between align-items-center mb-3">
                <h5 id="commentCnt">comment(${len})</h5>
                <div class="buttons"> <span class="badge bg-white d-flex flex-row align-items-center"> <span class="text-primary">Comments "ON"</span>
                        <div class="form-check form-switch"> <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked> </div>
                    </span> </div>
            </div>
            
            <c:forEach var="result" items="${replyList}" varStatus="status">
			 <div class="card p-3 reply">
                <div class="d-flex justify-content-between align-items-center">
                    <div class="user d-flex flex-row align-items-center">
                     ${result.rno}
                     <span><small class="font-weight-bold text-primary">${result.writer}</small> <small class="font-weight-bold">${result.content}</small></span> </div> <small>2 days ago</small>
                </div>
                <div class="action d-flex justify-content-between mt-2 align-items-center">
                    <div class="reply px-4"> <small>Remove</small> <span class="dots"></span> <small>Reply</small> <span class="dots"></span> <small>Translate</small> </div>
                    <div class="icons align-items-center"> <i class="fa fa-star text-warning"></i> <i class="fa fa-check-circle-o check-icon"></i> </div>
                </div>
            </div>
		</c:forEach>
        </div>
    </div>
</div>

   <form id="replyForm" method="post">
   
   
   <div class="row">
      	<table class="table">
      		<tr>
      			<td>댓글 작성자</td>
      			<td><input type="text" id="writer" name="writer" value="${member.ID}" readonly></td>
      		</tr>
      		<tr>
      			<td colspan="2">
      				<textarea rows="5" cols="50" id="content" name="content"></textarea>
      			</td>
      		</tr>
      	</table>
   </div>
	<input type="hidden" id="bno" name="bno" value="${detail.B_NO}">
	</form>
	<button type="submit" class="btn btn-info btn-sm float-right" onclick="fn_reply()">댓글 작성</button>
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
$(document).ready({
	
});

function fn_list(no) {
	//$('#currentPageNo').val(no);
	window.location='<c:url value="/boardList.do"/>';
	
	/* $('#boardForm').attr({
		action : '<c:url value="/boardList.do"/>',
		target : '_self'
	}).submit(); */
};

function fn_detail(no){
	//var  formData= $('#boardForm').serialize();
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
	var formData = new FormData($("#boardForm")[0]);
	$.ajax({
		url : "${pageContext.request.contextPath}/insertBoard.do",
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
	$("#submit").click(function() {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []); 
		//textarea의 id를 적어줍니다.

		var selcatd = $("#selcatd > option:selected").val();
		var title = $("#title").val();
		var content = document.getElementById("content").value;
		alert(content);
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

function fn_reply() {
	var formData = new FormData($("#replyForm")[0]);
	/* $('#replyForm').attr({
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
			alert(result.paramMap.bno);
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
			$("#commentCnt").html('comment('+result.len+')');
			
			
			
			
			$("#replyForm #content").val('');
			//fn_list();
		}, // success 

		error : function(xhr, status) {
			alert(xhr + " : " + status);
		}
	});
}
</script>

</html>

