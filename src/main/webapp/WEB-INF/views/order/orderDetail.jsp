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
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.3/js/all.js"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript" src="<c:url value='/se2/js/HuskyEZCreator.js'/>" charset="utf-8"></script>

<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value='/resources/css/styles.css'/>" rel="stylesheet" />
<style> .centeringContainer { text-align: center; } .centered { display: table; margin-left: auto; margin-right: auto; display: inline-block; } </style>

</head>
<body>

	<%@ include file="/WEB-INF/views/common/nav.jsp"%>
<!-- Page Content-->
<%-- <section class="py-5 bg-light">
            <div class="container centeringContainer">
<!--             <span class="centered"> <span class="item" style="display:block">block item</span> </span>
 -->
                <div class="row">
                    <div class="col-lg-4 col-sm-6 mb-4">
                        <div class="card h-100">
                            <a href="#!">
                            	<img class="card-img-top" src="<c:url value='/img/${detail.file}'/>" alt="no image" /></a>
                            <div class="card-body">
                                <h4 class="card-title"><a href="#!">White Shirt</a></h4>
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
                            </div>
                        </div>
                	</div>
                	<div class="col-lg-4 col-sm-6 mb-4">
                        <div class="card h-100">
                            <div class="row">
		<!--                 	<button class="btn btn-primary" id="sendMessageButton" onclick="fn_list()" type="button">Go to the list</button>
		 -->                    <div class="col-lg-8 mb-4">
                             	<h2 class="mb-4">${detail.title}</h2>
								 <table class="table table-sm">
									<thead>
									</thead>
									<tbody>
										<tr>
											<th scope="row">Price</th>
											<td>${detail.input_dt}</td>
										</tr>
										<tr>
											<th scope="row">Color</th>
											<td>${detail.cnt}</td>
										</tr>
										<tr>
											<th scope="row">Total Price</th>
											<td>${detail.id}</td>
										</tr>
									</tbody>
								</table>
		                    </div>
		                    <div class="row">
								<button class="btn btn-primary" id="sendMessageButton" onclick="fn_list()" type="button">Order</button>
								<button class="btn btn-primary" id="sendMessageButton" onclick="fn_list()" type="button">Cart</button>
								<button class="btn btn-primary" id="sendMessageButton" onclick="fn_list()" type="button">Wish List</button>
							</div>
		                </div>
                       </div>
                    </div>
                	<div class="centered">
                        <h4 class="card-title item" style="display:block"><a href="#!">White Shirt</a></h4>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
                        <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
                    	<div class="card h-100">
                            <a href="#!">
                            	<img class="card-img-top" src="<c:url value='/img/${detail.file}'/>" alt="no image" /></a>
                            	<img class="card-img-top" src="<c:url value='/img/${detail.file}'/>" alt="no image" /></a>
                            	<img class="card-img-top" src="<c:url value='/img/${detail.file}'/>" alt="no image" /></a>
                            	<img class="card-img-top" src="<c:url value='/img/${detail.file}'/>" alt="no image" /></a>
                            	<img class="card-img-top" src="<c:url value='/img/${detail.file}'/>" alt="no image" /></a>
                            	<img class="card-img-top" src="<c:url value='/img/${detail.file}'/>" alt="no image" /></a>
                            	<img class="card-img-top" src="<c:url value='/img/${detail.file}'/>" alt="no image" /></a>
                            	<img class="card-img-top" src="<c:url value='/img/${detail.file}'/>" alt="no image" /></a>
                            	<img class="card-img-top" src="<c:url value='/img/${detail.file}'/>" alt="no image" /></a>
                            	<img class="card-img-top" src="<c:url value='/img/${detail.file}'/>" alt="no image" /></a>
                            	<img class="card-img-top" src="<c:url value='/img/${detail.file}'/>" alt="no image" /></a>
                            <div class="card-body">
                                <h4 class="card-title"><a href="#!">White Shirt</a></h4>
                                <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur eum quasi sapiente nesciunt? Voluptatibus sit, repellat sequi itaque deserunt, dolores in, nesciunt, illum tempora ex quae? Nihil, dolorem!</p>
                            </div>
                        </div>
                    
                    </div>
                	
                     <c:forEach var="result" items="${list}" varStatus="status">
	                   <div class="col-lg-4 col-sm-6 mb-4">
	                       <div class="card h-100">
	                           <a href="#!">
	                           <img class="card-img-top" src="<c:url value='/img/${result.file}'/>" alt="no image" /></a>
	                           <div class="card-body">
	                           <input type="hidden" id="id" name="B_NO" value="${result.B_NO}">
	                           <input type="hidden" id="B_TYPE" name="B_TYPE" value="${result.B_TYPE}">
	                           
	                               <h4 class="card-title"><a href="#!" onclick="fn_detail()">${result.title}</a></h4>
	                               <p class="card-text">${result.content}</p>
	                               <p class="card-text">${result.file}</p>
	                               <p class="card-text">${result.file_src}</p>
	                               <p class="card-text">${result.file_no}</p>
	                               <p class="card-text">${result.B_NO}</p>
	                           </div>
	                       </div>
	                   </div>
                    </c:forEach>
                </div>
            </div>
        </section> --%>
        
<!-- @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
        <!-- Page Content-->
        <section class="py-5">
            <div class="container centeringContainer">
                <!-- Page Heading/Breadcrumbs-->
                <h1>
                    Item
                    <small>${detail.title}</small>
                </h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                    <li class="breadcrumb-item active">Item</li>
                </ol>
                <!-- Portfolio Item Row-->
	                  
		                
                <div class="row">
                    <div class="col-md-8"><img class="card-img-top" src="<c:url value='/img/${detail.file}'/>" alt="no image" /></div>
                    <div class="col-md-4">
                        <h3 class="my-3">${detail.title}</h3>
                       
                         <div class="col-lg-8 mb-4">
								 <table class="table table-sm">
									<thead>
									</thead>
									<tbody>
										<tr>
											<th scope="row">Price</th>
											<td>${detail.input_dt}</td>
										</tr>
										<tr>
											<th scope="row">Color</th>
											<td>${detail.cnt}</td>
										</tr>
										<tr>
											<th scope="row">Total Price</th>
											<td>${detail.id}</td>
										</tr>
									</tbody>
								</table>
		                    </div>
		                    
		                   
	                        
		                    <div class="row">
								<button class="btn btn-primary" id="sendMessageButton" onclick="fn_list()" type="button">Order</button>
								<button class="btn btn-primary" id="sendMessageButton" onclick="fn_list()" type="button">Cart</button>
								<button class="btn btn-primary" id="sendMessageButton" onclick="fn_list()" type="button">Wish List</button>
							</div>
							<br>
							<br>
	                        <h3 class="my-3">Project Details</h3>
	                        <ul>
	                            <li>Lorem Ipsum</li>
	                            <li>Dolor Sit Amet</li>
	                            <li>Consectetur</li>
	                            <li>Adipiscing Elit</li>
	                        </ul>
	                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae. Sed dui lorem, adipiscing in adipiscing et, interdum nec metus. Mauris ultricies, justo eu convallis placerat, felis enim.</p>
	                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae. Sed dui lorem, adipiscing in adipiscing et, interdum nec metus. Mauris ultricies, justo eu convallis placerat, felis enim.</p>
	                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae. Sed dui lorem, adipiscing in adipiscing et, interdum nec metus. Mauris ultricies, justo eu convallis placerat, felis enim.</p>
                    </div>
                    <div class="centered">
<!-- <span class="centered"> <span class="item" style="display:block">block item</span> </span> -->
                    <h3 class="my-3">Project Details</h3>
	                        <ul>
	                            <li><img class="card-img-top" src="<c:url value='/img/${detail.file}'/>" alt="no image" /></li>
	                            <li><img class="card-img-top" src="<c:url value='/img/${detail.file}'/>" alt="no image" /></li>
	                            <li><img class="card-img-top" src="<c:url value='/img/${detail.file}'/>" alt="no image" /></li>
	                            <li><img class="card-img-top" src="<c:url value='/img/${detail.file}'/>" alt="no image" /></li>
	                            <li><img class="card-img-top" src="<c:url value='/img/${detail.file}'/>" alt="no image" /></li>
	                            <li><img class="card-img-top" src="<c:url value='/img/${detail.file}'/>" alt="no image" /></li>
	                            <li><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae. Sed dui lorem, adipiscing in adipiscing et, interdum nec metus. Mauris ultricies, justo eu convallis placerat, felis enim.</p></li>
	                            <li><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae. Sed dui lorem, adipiscing in adipiscing et, interdum nec metus. Mauris ultricies, justo eu convallis placerat, felis enim.</p></li>
	                            <li><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae. Sed dui lorem, adipiscing in adipiscing et, interdum nec metus. Mauris ultricies, justo eu convallis placerat, felis enim.</p></li>
	                            <li><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae. Sed dui lorem, adipiscing in adipiscing et, interdum nec metus. Mauris ultricies, justo eu convallis placerat, felis enim.</p></li>
	                            <li><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae. Sed dui lorem, adipiscing in adipiscing et, interdum nec metus. Mauris ultricies, justo eu convallis placerat, felis enim.</p></li>
	                            <li><p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam viverra euismod odio, gravida pellentesque urna varius vitae. Sed dui lorem, adipiscing in adipiscing et, interdum nec metus. Mauris ultricies, justo eu convallis placerat, felis enim.</p></li>
	                        </ul>
                    </div>
                </div>
            </div>
        </section>
        <hr class="my-0" />
        <!-- Related Projects Section-->
        <section class="py-5 bg-light">
            <div class="container">
                <h2 class="mb-4">Related Projects</h2>
                
                <div class="row">
                	<c:forEach var="result" items="${list}" varStatus="status">
	                   
	                <div class="col-md-3 col-sm-6 mb-4">
                        <a href="#!"><img class="card-img-top" src="<c:url value='/img/${result.file}'/>" alt="no image" /></a>
                    </div>
                	</c:forEach>
                </div>
                
                <!-- <div class="row">
                    <div class="col-md-3 col-sm-6 mb-4">
                        <a href="#!"><img class="img-fluid" src="https://via.placeholder.com/500x300" alt="..." /></a>
                    </div>
                    <div class="col-md-3 col-sm-6 mb-4">
                        <a href="#!"><img class="img-fluid" src="https://via.placeholder.com/500x300" alt="..." /></a>
                    </div>
                    <div class="col-md-3 col-sm-6 mb-4">
                        <a href="#!"><img class="img-fluid" src="https://via.placeholder.com/500x300" alt="..." /></a>
                    </div>
                    <div class="col-md-3 col-sm-6 mb-4">
                        <a href="#!"><img class="img-fluid" src="https://via.placeholder.com/500x300" alt="..." /></a>
                    </div>
                </div> -->
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

</script>
</script>

</html>

