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
<!-- <script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script> -->
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
                    <div class="col-md-8"><img class="card-img-top" src="<c:url value='/img/${detail.representative_file}'/>" alt="no image" /></div>
                    <div class="col-md-4">
                        <h3 class="my-3">${detail.title}</h3>
                       
                         <div class="col-lg-8 mb-4">
                   <%--  <form role="form" method="post">
						<input type="hidden" name="gdsNum" value="${view.gdsNum}" />
					
					</form> --%>
<form id="orderForm" method="post" enctype="multipart/form-data">
						<input type="hidden" name="userId" value="${member.ID}" />
						<input type="hidden" id="gdsNum" name="gdsNum" value="${detail.gdsNum}" />
						<input type="hidden" name="gdsPrice" value="${detail.gdsPrice}" />
						<input type="hidden" id="gdsStock" name="gdsStock" />
					
				<div class="goods">
					<div class="goodsImg">
						<img src="${view.gdsImg}">
					</div>
					
					<div class="goodsInfo">
						<table class="table table-sm">
							<thead>
							</thead>
							<tbody>
								<tr>
									<th scope="row">상품명</th>
									<td id="a">${detail.gdsName}</td>
								</tr>
								<tr>
									<th scope="row">가격</th>
									<td id="b"><fmt:formatNumber pattern="###,###,###" value="${detail.gdsPrice}" /> 원</td>
								</tr>
								<tr>
									<th scope="row">재고</th>
									<td id="c" ></span><fmt:formatNumber pattern="###,###,###" value="${detail.gdsStock}" /> EA</td>
								</tr>
								<tr>
									<th scope="row">Total Price</th>
									<td></span><fmt:formatNumber pattern="###,###,###" value="${detail.gdsStock}" /> EA</td>
								</tr>
								<tr>
									<th scope="row">구입 수량</th>
									<td>
										<c:if test="${view.gdsStock != 0}">
											<p class="cartStock">
												<button type="button" class="plus">+</button>
												<input type="number" id="stock" class="numBox" min="1" max="${view.gdsStock}" value="1" readonly="readonly"/>
												<button type="button" class="minus">-</button>
												<input type="hidden" value="${view.gdsStock}" class="gdsStock_hidden" /> 
											</p>
											<p class="addToCart">
												<button type="button" class="addCart_btn">카트에 담기</button>
											</p>
										</c:if>
										<c:if test="${view.gdsStock == 0}">
											<p>상품 수량이 부족합니다.</p>						
										</c:if>
									</td>
								</tr>
							</tbody>
						</table>
					<!-- @@@@@@@@@ -->
					
						<p class="gdsName"><span>상품명</span>${detail.gdsName}</p>
						
						<p class="gdsPrice">
							<span>가격 </span><fmt:formatNumber pattern="###,###,###" value="${detail.gdsPrice}" /> 원
						</p>
						
						<p class="gdsStock">
							<span>재고 </span><fmt:formatNumber pattern="###,###,###" value="${detail.gdsStock}" /> EA
						</p>
						
						<c:if test="${view.gdsStock != 0}">
						
						<p class="cartStock">
							<span>구입 수량</span>
							<button type="button" class="plus">+</button>
							<input type="number" id="stock" class="numBox" min="1" max="${view.gdsStock}" value="1" readonly="readonly"/>
							<button type="button" class="minus">-</button>
							<input type="hidden" value="${view.gdsStock}" class="gdsStock_hidden" /> 
							
													
							
						</p>
						
						<p class="addToCart">
							<button type="button" class="addCart_btn">카트에 담기</button>
							
						</p>
						
						</c:if>
						
						<c:if test="${view.gdsStock == 0}">
							<p>상품 수량이 부족합니다.</p>						
						</c:if>
					</div>
					
					<div class="gdsDes">${view.gdsDes}</div>
				</div>
			</form>
	                    </div>
		                    <!-- @@@@@@@@@@ -->
		                    <!-- @@@@@@@@@@ -->
		                   
	                        
		                    <div class="row">
								<button class="btn btn-primary" id="orderBtn" type="button">Order</button>
								<button class="btn btn-primary" id="sendMessageButton" onclick="fn_list()" type="submit">Cart</button>
								<button class="btn btn-primary" id="sendMessageButton" onclick="fn_list()" type="submit">Wish List</button>
							</div>
							<br>
							<br>
	                        <h3 class="my-3">Project Details</h3>
	                        <ul>
	                            <li>${detail.gdsDes}</li>
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
	                        <c:forEach var="result" items="${imgList}" varStatus="status">
					            	<li><img class="card-img-top" src="<c:url value='/img/${result.file}'/>" alt="no image" /></li>
							</c:forEach>
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
$(document).ready(function(){              
	//$('#gdsStock').val($(".numBox").val());
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

	$('#boardForm').attr({
		action : '<c:url value="/orderView.do"/>',
		target : '_self'
	}).submit(); 
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


$(".modal_modify_btn").click(function(){
	var modifyConfirm = confirm("정말로 수정하시겠습니까?");
	
	if(modifyConfirm) {
		var data = {
					repNum : $(this).attr("data-repNum"),
					repCon : $(".modal_repCon").val()
				};  // ReplyVO 형태로 데이터 생성
		
		$.ajax({
			url : "/shop/view/modifyReply",
			type : "post",
			data : data,
			success : function(result){
				
				if(result == 1) {
					replyList();
					$(".replyModal").fadeOut(200);
				} else {
					alert("작성자 본인만 할 수 있습니다.");							
				}
			},
			error : function(){
				alert("로그인하셔야합니다.")
			}
		});
	}
	
});

$(".modal_cancel").click(function(){
	//$(".replyModal").attr("style", "display:none;");
	$(".replyModal").fadeOut(200);
});

	$(".addCart_btn").click(function(){
		
		var gdsNum = $("#gdsNum").val();
		var cartStock = $(".numBox").val();
		
		var data = {
				gdsNum : gdsNum,
				cartStock : cartStock
				};
		
		$.ajax({
			url : "/view/addCart.do",
			type : "post",
			data : data,
			success : function(result){
				
				if(result == 1) {
					alert("카트 담기 성공");
					$(".numBox").val("1");

				} else {
					alert("회원만 사용할 수 있습니다.")
					$(".numBox").val("1");
					window.location='<c:url value="/user/login.do"/>';

				}
			},
			error : function(){
				alert("카트 담기 실패");
			}
		});
	});
	
	// + 버튼을 누르면 수량이 증가하되, 상품의 전체 수량보다 커지지 않음
	$(".plus").click(function(){
		var num = $(".numBox").val();
		var plusNum = Number(num) + 1;
		//var stock = ${view.gdsStock};
		var stock = $(".gdsStock_hidden");
		
		if(plusNum >= stock) {
			$(".numBox").val(num);
		} else {
			$(".numBox").val(plusNum);										
		}
	});


	// - 버튼을 누르면 수량이 감소하되, 1보다 밑으로 감소하지 않음
	$(".minus").click(function(){
		var num = $(".numBox").val();
		var minusNum = Number(num) - 1; 
		
		if(minusNum <= 0) {
			$(".numBox").val(num);
		} else {
			$(".numBox").val(minusNum);										
		}
	});
	
	


	
$("#orderBtn").click(function(){
		
		var gdsNum = $("#gdsNum").val();
		var gdsStock = $(".numBox").val();
		$('#gdsStock').val(gdsStock);
		var data = {
				gdsNum : gdsNum,
				gdsStock : gdsStock
				};
		
		$.ajax({
			url : "/orderItem.do",
			type : "post",
			data : data,
			success : function(result){
				
				if(result == 1) {
					$('#orderForm').attr({
						action : '<c:url value="/orderProcess.do"/>',
						target : '_self'
					}).submit(); 
					
					//$(".numBox").val("1");
				} else {
					alert("회원만 사용할 수 있습니다.")
					$(".numBox").val("1");
					window.location='<c:url value="/user/login.do"/>';

				}
			},
			error : function(){
				alert("실패");
			}
		});
	});
</script>
</html>

