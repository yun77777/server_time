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
<!-- Page Content-->
        <section class="py-5">
        <section id="container">
		<div id="container_box">
			<h2>상품 등록</h2>
			
<%-- 			<form role="form" method="post" autocomplete="off" enctype="multipart/form-data">
 --%>			
			<div class="inputArea">	
				<label>1차 분류</label>
				<select class="category1 form-control" value="${detail.category}">
					<option value="">전체</option>
					<option value="1">1</option>
					<option value="2">2</option>
				</select>
			
				<label>2차 분류</label>
				<select class="category2 form-control" value="${detail.category}" name="cateCode">
					<option value="">전체</option>
					<option value="top">top</option>
					<option value="bottom">bottom</option>
				</select>
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
			
			<div class="inputArea">
				<label for="gdsImg">이미지</label>
				<input type="file" id="gdsImg" name="file" class="form-control"/>
				<div class="select_img"><img src="" /></div>
				
				<script>
					$("#gdsImg").change(function(){
						if(this.files && this.files[0]) {
							var reader = new FileReader;
							reader.onload = function(data) {
								$(".select_img img").attr("src", data.target.result).width(500);								
							}
							reader.readAsDataURL(this.files[0]);
						}
					});
				</script>
				<%=request.getRealPath("/") %> 
<%-- 				<%=request.getRealPath("/") %> 
 --%>				
<%--  <%=request.getSession().getServletContext().getRealPath("/") %>
 --%>
			</div>
			<div class="inputArea">
				<div class="col-lg-4 col-sm-6 mb-4">
                    <div class="card h-100">
		            	<img class="card-img-top" src="<c:url value='/img/${detail.gdsImg}'/>" alt="no image" /></a>
		            	<img class="card-img-top" src="<c:url value='/img/${detail.file}'/>" alt="no image" /></a>
                    </div>
                </div>
	                    
	                    
				<label for="gdsImg">이미지</label>
				<input type="file" id="gdsImg" name="file" class="form-control"/>
				<div class="select_img"><img src="" /></div>
				
				<script>
					$("#gdsImg").change(function(){
						if(this.files && this.files[0]) {
							var reader = new FileReader;
							reader.onload = function(data) {
								$(".select_img img").attr("src", data.target.result).width(500);								
							}
							reader.readAsDataURL(this.files[0]);
						}
					});
				</script>
			</div>
		</div>
	</section>
        
        
        
        
        
        
        
            <div class="container">
                <!-- Page Heading/Breadcrumbs-->
                <h1>
                    Item
                    <small>detail</small>
                </h1>
                <!-- Content Row-->
                <!-- Contact Form-->
                <!-- In order to set the email address and subject line for the contact form go to the assets/mail/contact_me.php file.-->
                <div class="row">
                	<button class="btn btn-primary" id="sendMessageButton" onclick="fn_list()" type="button">Go to the list</button>
                    <div class="col-lg-8 mb-4">
                        <form id="boardForm" name="sentMessage" novalidate>
                        	<input type="hidden" id="currentPageNo" name="currentPageNo" value="1"/>
                            <div class="control-group form-group">
                                <div class="controls">
                                    <label>no:</label>
                                    <input class="form-control" id="gdsNum" name="gdsNum" type="text" value="${detail.gdsNum}" disabled data-validation-required-message="Please enter your name." />
                                    <p class="help-block"></p>
                                </div>
                            </div>
                            <div class="control-group form-group">
                                <div class="controls">
                                    <label>title:</label>
                                    <input class="form-control" id="cateCode" name="cateCode" type="text"  value="${detail.cateCode}" required data-validation-required-message="Please enter your email address." />
                                </div>
                            </div>
                            <div class="control-group form-group">
                                <div class="controls">
                                    <label>id:</label>
                                    <input class="form-control" id="gdsName" name="gdsName" type="text"  value="${detail.gdsName}" required data-validation-required-message="Please enter your phone number." />
                                </div>
                            </div>
                            
                            <div class="control-group form-group">
                                <div class="controls">
                                    <label>files:</label>
                                     <input class="form-control" id="gdsPrice" name="gdsPrice" type="text"  value="${detail.gdsPrice}" required data-validation-required-message="Please enter your email address." />
                                </div>
                            </div>
                            
                            <div class="control-group form-group">
                                <div class="controls">
                                    <label>files:</label>
                                     <input class="form-control" id="gdsStock" name="gdsStock" type="text"  value="${detail.gdsStock}" required data-validation-required-message="Please enter your email address." />
                                </div>
                            </div>
                           <div class="inputArea">
								<label for="gdsDes">상품소개</label>
								<textarea rows="5" cols="50" id="gdsDes" name="gdsDes" class="form-control">${detail.gdsDes}</textarea>
				
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
                            <%-- <div class="control-group form-group">
                                <div class="controls">
                      				<%@ include file="/WEB-INF/views/common/smartEditor.jsp"%>
                                </div>
                                
                                
                            </div> --%>
                            <div id="success"></div>
                            
                            <!-- For success/fail messages-->
                        	<button class="btn btn-primary" id="submit" onclick="" type="button">Save</button>
			                <button class="btn btn-primary" id="sendMessageButton" onclick="fn_delete()" type="button">Delete</button>
			                
			                <table class="table table-sm">
								<tbody>
									<tr>
										<th scope="row">before</th>
										<td><a href="#" onclick="fn_detail('${list[0].B_NO}');">${list[0].TITLE}</a></td>
									</tr>
									<tr>
										<th scope="row">after</th>
										<td><a href="#" onclick="fn_detail('${list[1].B_NO}';">${list[1].TITLE}</a></td>
									</tr>
								</tbody>
							</table>
                        </form>
                    </div>
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
function fn_list(no) {
	//$('#currentPageNo').val(no);
	window.location='<c:url value="/itemList.do"/>';
	
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
		action : '<c:url value="/itemDetail.do" />',
		target : '_self'
	}).submit();

}

function fn_btn(no){
	var  formData= $('#boardForm').serialize();
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

function fn_insert() {
	//var formData = $('#boardForm').serialize();
	$('#boardForm #no').attr('disabled',false);
	var formData = new FormData($("#boardForm")[0]);
	$.ajax({
		url : "${pageContext.request.contextPath}/insertItem.do",
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

</script>

</html>

